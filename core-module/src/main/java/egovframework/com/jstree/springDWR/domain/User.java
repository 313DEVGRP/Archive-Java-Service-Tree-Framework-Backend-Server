package egovframework.com.jstree.springDWR.domain;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class User implements Serializable{

	private static final long serialVersionUID = -5830203631667372978L;
	private String name;
	private String time;

	public User() {
		super();
	}

	public User(String name) {
		super();
		this.name = name;
	}

	public User(String name, String time) {
		super();
		this.name = name;
		this.time = time;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", time=" + time + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
