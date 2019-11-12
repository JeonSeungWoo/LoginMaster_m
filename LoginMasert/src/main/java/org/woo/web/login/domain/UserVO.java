package org.woo.web.login.domain;

public class UserVO {
	private String userid;
	private String userpw;
	private String usernm;
	private String email;
	private String address;
	private String phonenumber;
	
	
	

	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", usernm=" + usernm + ", email=" + email
				+ ", address=" + address + ", phonenumber=" + phonenumber + "]";
	}


	
}
