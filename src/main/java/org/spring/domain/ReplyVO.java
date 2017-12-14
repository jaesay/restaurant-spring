package org.spring.domain;

import java.util.Date;

public class ReplyVO {
	private Integer rno;
	private Integer m_id;
	private String replytext;
	private String replyer;
	private Double rating;
	private Date regdate;
	private Date updatedate;
	private MenuVO mvo;
	
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public MenuVO getMvo() {
		return mvo;
	}
	public void setMvo(MenuVO mvo) {
		this.mvo = mvo;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", m_id=" + m_id + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", rating=" + rating + ", regdate=" + regdate + ", updatedate=" + updatedate + ", mvo=" + mvo + "]";
	}
	
}
