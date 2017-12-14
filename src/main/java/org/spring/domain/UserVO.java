package org.spring.domain;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserVO {
	private static final Logger logger = LoggerFactory.getLogger(UserVO.class);
	
	private String u_email;
	private String u_name;
	private String u_pwd;
	private Date u_rdate;
	private String sessionkey;
	private Date sessionlimit;
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public Date getU_rdate() {
		return u_rdate;
	}
	public void setU_rdate(Date u_rdate) {
		this.u_rdate = u_rdate;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public Date getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(Date sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	@Override
	public String toString() {
		return "UserVO [u_email=" + u_email + ", u_name=" + u_name + ", u_pwd=" + u_pwd
				+ ", u_rdate=" + u_rdate + ", sessionkey=" + sessionkey + ", sessionlimit=" + sessionlimit + "]";
	}
	
	
}
