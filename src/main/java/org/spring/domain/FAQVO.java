package org.spring.domain;

import java.util.Date;

public class FAQVO {
	private int f_id;
	private String f_writer;
	private String f_question;
	private String f_answer;
	private Date f_rdate;
	private Date f_udate;
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getF_writer() {
		return f_writer;
	}
	public void setF_writer(String f_writer) {
		this.f_writer = f_writer;
	}
	public String getF_question() {
		return f_question;
	}
	public void setF_question(String f_question) {
		this.f_question = f_question;
	}
	public String getF_answer() {
		return f_answer;
	}
	public void setF_answer(String f_answer) {
		this.f_answer = f_answer;
	}
	public Date getF_rdate() {
		return f_rdate;
	}
	public void setF_rdate(Date f_rdate) {
		this.f_rdate = f_rdate;
	}
	public Date getF_udate() {
		return f_udate;
	}
	public void setF_udate(Date f_udate) {
		this.f_udate = f_udate;
	}
	@Override
	public String toString() {
		return "faq [f_id=" + f_id + ", f_writer=" + f_writer + ", f_question=" + f_question + ", f_answer=" + f_answer
				+ ", f_rdate=" + f_rdate + ", f_udate=" + f_udate + "]";
	}
	
	
}
