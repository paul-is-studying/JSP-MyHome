package login;

public class LoginCheck {
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public int loginCheck(String result) {
		if (result == null) {
			return NOT_ID;
		}else {
			if (result.equals(passwd)) {
				return OK;
			}
		}
		return NOT_PW;
	}
}









