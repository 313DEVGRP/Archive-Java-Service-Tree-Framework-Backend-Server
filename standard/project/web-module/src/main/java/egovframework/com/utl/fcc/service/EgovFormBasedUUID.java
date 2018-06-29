package egovframework.com.utl.fcc.service;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

@SuppressWarnings("serial")
public class EgovFormBasedUUID implements Serializable {
    /*
     * The most significant 64 bits of this UUID.
     *
     * @serial
     */
    private final long mostSigBits;

    /*
     * The least significant 64 bits of this UUID.
     *
     * @serial
     */
    private final long leastSigBits;

    /*
     * The version number associated with this UUID. Computed on demand.
     */
    private transient int version = -1;

    /*
     * The variant number associated with this UUID. Computed on demand.
     */
    private transient int variant = -1;

    /*
     * The timestamp associated with this UUID. Computed on demand.
     */
    private transient volatile long timestamp = -1;

    /*
     * The clock sequence associated with this UUID. Computed on demand.
     */
    private transient int sequence = -1;

    /*
     * The node number associated with this UUID. Computed on demand.
     */
    private transient long node = -1;

    /*
     * The hashcode of this UUID. Computed on demand.
     */
    private transient int hashCode = -1;

    /*
     * The random number generator used by this class to create random based
     * UUIDs.
     */
    private static volatile SecureRandom numberGenerator = null;

    // Constructors and Factories

    /*
     * Private constructor which uses a byte array to construct the new UUID.
     */
    private EgovFormBasedUUID(byte[] data) {
        long msb = 0;
        long lsb = 0;
        for (int i = 0; i < 8; i++)
            msb = (msb << 8) | (data[i] & 0xff);
        for (int i = 8; i < 16; i++)
            lsb = (lsb << 8) | (data[i] & 0xff);
        this.mostSigBits = msb;
        this.leastSigBits = lsb;
    }

    public EgovFormBasedUUID(long mostSigBits, long leastSigBits) {
        this.mostSigBits = mostSigBits;
        this.leastSigBits = leastSigBits;
    }

    public static EgovFormBasedUUID randomUUID() {
        SecureRandom ng = numberGenerator;
        if (ng == null) {
            numberGenerator = ng = new SecureRandom();
        }

        byte[] randomBytes = new byte[16];
        ng.nextBytes(randomBytes);
        randomBytes[6] &= 0x0f; /* clear version */
        randomBytes[6] |= 0x40; /* set to version 4 */
        randomBytes[8] &= 0x3f; /* clear variant */
        randomBytes[8] |= 0x80; /* set to IETF variant */

        return new EgovFormBasedUUID(randomBytes);
    }

    public static EgovFormBasedUUID nameUUIDFromBytes(byte[] name) {
        MessageDigest md;
        try {
        	// 2011.10.10 보안점검 후속조치 암호화 알고리즘 변경(MD5 -> SHA-256)
        	//md = MessageDigest.getInstance("MD5");
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException nsae) {
        	//throw new InternalError("MD5 not supported");
            throw new InternalError("SHA-256 not supported");
        }
        // 2011.10.10 보안점검 후속조치
        if (md == null) {
            throw new RuntimeException("MessageDigest is null!!");
        }
        // 2014.09.20 보안점검 후속 조치
        // Random 방식의 salt 추가
        SecureRandom ng = new SecureRandom();
        byte[] randomBytes = new byte[16];
        ng.nextBytes(randomBytes);

        md.reset();
        md.update(randomBytes);
        byte[] sha = md.digest(name);


        byte[] md5Bytes = new byte[8];
        System.arraycopy(sha, 0, md5Bytes, 0, 8);
        //2011.10.10 보안점검 후속조치 끝

        md5Bytes[6] &= 0x0f; /* clear version */
        md5Bytes[6] |= 0x30; /* set to version 3 */
        md5Bytes[8] &= 0x3f; /* clear variant */
        md5Bytes[8] |= 0x80; /* set to IETF variant */

        return new EgovFormBasedUUID(md5Bytes);
    }

    public static EgovFormBasedUUID fromString(String name) {
        String[] components = name.split("-");
        if (components.length != 5)
            throw new IllegalArgumentException("Invalid UUID string: " + name);
        for (int i = 0; i < 5; i++)
            components[i] = "0x" + components[i];

        long mostSigBits = Long.decode(components[0]).longValue();
        mostSigBits <<= 16;
        mostSigBits |= Long.decode(components[1]).longValue();
        mostSigBits <<= 16;
        mostSigBits |= Long.decode(components[2]).longValue();

        long leastSigBits = Long.decode(components[3]).longValue();
        leastSigBits <<= 48;
        leastSigBits |= Long.decode(components[4]).longValue();

        return new EgovFormBasedUUID(mostSigBits, leastSigBits);
    }

    // Field Accessor Methods

    public long getLeastSignificantBits() {
        return leastSigBits;
    }

    public long getMostSignificantBits() {
        return mostSigBits;
    }

    public int version() {
        if (version < 0) {
            // Version is bits masked by 0x000000000000F000 in MS long
            version = (int) ((mostSigBits >> 12) & 0x0f);
        }
        return version;
    }

    public int variant() {
        if (variant < 0) {
            // This field is composed of a varying number of bits
            if ((leastSigBits >>> 63) == 0) {
                variant = 0;
            } else if ((leastSigBits >>> 62) == 2) {
                variant = 2;
            } else {
                variant = (int) (leastSigBits >>> 61);
            }
        }
        return variant;
    }

    public long timestamp() {
        if (version() != 1) {
            throw new UnsupportedOperationException("Not a time-based UUID");
        }
        long result = timestamp;
        if (result < 0) {
            result = (mostSigBits & 0x0000000000000FFFL) << 48;
            result |= ((mostSigBits >> 16) & 0xFFFFL) << 32;
            result |= mostSigBits >>> 32;
            timestamp = result;
        }
        return result;
    }

    public int clockSequence() {
        if (version() != 1) {
            throw new UnsupportedOperationException("Not a time-based UUID");
        }
        if (sequence < 0) {
            sequence = (int) ((leastSigBits & 0x3FFF000000000000L) >>> 48);
        }
        return sequence;
    }

    public long node() {
        if (version() != 1) {
            throw new UnsupportedOperationException("Not a time-based UUID");
        }
        if (node < 0) {
            node = leastSigBits & 0x0000FFFFFFFFFFFFL;
        }
        return node;
    }

    // Object Inherited Methods

    @Override
	public String toString() {
        return (digits(mostSigBits >> 32, 8) + "-"
                + digits(mostSigBits >> 16, 4) + "-" + digits(mostSigBits, 4)
                + "-" + digits(leastSigBits >> 48, 4) + "-" + digits(
                leastSigBits, 12));
    }

    /** Returns val represented by the specified number of hex digits. */
    private static String digits(long val, int digits) {
        long hi = 1L << (digits * 4);
        return Long.toHexString(hi | (val & (hi - 1))).substring(1);
    }

    @Override
	public int hashCode() {
        if (hashCode == -1) {
            hashCode = (int) ((mostSigBits >> 32) ^ mostSigBits
                    ^ (leastSigBits >> 32) ^ leastSigBits);
        }
        return hashCode;
    }

    @Override
	public boolean equals(Object obj) {
        // 보안 취약점 점검 지적사항 반영 시작
    	if (obj == null)
        	return false;
    	// 보안 취약점 점검 지적사항 반영 시작 끝
    	if (!(obj instanceof EgovFormBasedUUID))
            return false;
        if (((EgovFormBasedUUID) obj).variant() != this.variant())
            return false;
        EgovFormBasedUUID id = (EgovFormBasedUUID) obj;
        return (mostSigBits == id.mostSigBits && leastSigBits == id.leastSigBits);
    }

    // Comparison Operations
    public int compareTo(EgovFormBasedUUID val) {
        // The ordering is intentionally set up so that the UUIDs
        // can simply be numerically compared as two numbers
        return (this.mostSigBits < val.mostSigBits ? -1
                : (this.mostSigBits > val.mostSigBits ? 1
                        : (this.leastSigBits < val.leastSigBits ? -1
                                : (this.leastSigBits > val.leastSigBits ? 1 : 0))));
    }

    private void readObject(java.io.ObjectInputStream in)
            throws java.io.IOException, ClassNotFoundException {

        in.defaultReadObject();

        // Set "cached computation" fields to their initial values
        version = -1;
        variant = -1;
        timestamp = -1;
        sequence = -1;
        node = -1;
        hashCode = -1;
    }
}