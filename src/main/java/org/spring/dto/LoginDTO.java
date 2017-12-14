package org.spring.dto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginDTO {
	private static final Logger logger = LoggerFactory.getLogger(LoginDTO.class);
	
	private String u_email;
	private String u_pwd;
	private boolean useCookie;
		
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [u_email=" + u_email + ", u_pwd=" + u_pwd + ", useCookie=" + useCookie + "]";
	}
	
}
