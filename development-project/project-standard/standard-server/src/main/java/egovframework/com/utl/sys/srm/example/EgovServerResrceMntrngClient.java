package egovframework.com.utl.sys.srm.example;

import java.io.IOException;

import javax.management.MBeanAttributeInfo;
import javax.management.MBeanInfo;
import javax.management.MBeanServerConnection;
import javax.management.ObjectName;
import javax.management.remote.JMXConnector;
import javax.management.remote.JMXConnectorFactory;
import javax.management.remote.JMXServiceURL;

public class EgovServerResrceMntrngClient {
	private JMXServiceURL address = null;
    private JMXConnector connector = null;
    private MBeanServerConnection mbs = null;
    private ObjectName name = null;
    private MBeanInfo mBeanInfo = null;
    private MBeanAttributeInfo[] attrInfos = null;
    
	public void connect() {
		try {
    		address = new JMXServiceURL("service:jmx:rmi://127.0.0.1:9999/jndi/rmi://127.0.0.1:9999/server");
    		connector = JMXConnectorFactory.connect(address);

            mbs = connector.getMBeanServerConnection();

            name = new ObjectName("egovframework.com.utl.sys.srm.service:type=EgovServerResrceMntrng");

            mBeanInfo = mbs.getMBeanInfo(name);
            attrInfos = mBeanInfo.getAttributes();
            
            System.out.println("MBean info : " + mBeanInfo.getClassName());

            for (MBeanAttributeInfo attrInfo : attrInfos) {
            	if (attrInfo.getName().equals("CpuUsage")) {
            		System.out.println("CPU : " + mbs.getAttribute(name, attrInfo.getName()).toString());
            	} else if (attrInfo.getName().equals("MemoryUsage")){ 
            		System.out.println("Memory : " + mbs.getAttribute(name, attrInfo.getName()).toString());
            	
            	} else {
            		System.out.println(attrInfo.getName() + " = " + mbs.getAttribute(name, attrInfo.getName()));
            	}
            }
            
    	} catch (Exception ex) {
    		ex.printStackTrace();
    		
    		throw new RuntimeException(ex);
    	} finally {
            if (connector != null)
            	try { 
            		connector.close();
            	} catch(IOException ignore) {
            		// no-op
            	}
        }
	}
	
	public static void main(String[] args) {
		EgovServerResrceMntrngClient client = new EgovServerResrceMntrngClient();
		
		client.connect();
	}
}
