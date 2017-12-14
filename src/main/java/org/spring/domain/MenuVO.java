package org.spring.domain;

import java.util.Date;

public class MenuVO {
	private int m_id;
	private String m_category;
	private String m_name;
	private String m_content;
	private int m_price;
	private int m_hit;
	private Date m_rdate;
	private String m_img;
	private int replycnt;
	private Double m_rating;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_category() {
		return m_category;
	}
	public void setM_category(String m_category) {
		this.m_category = m_category;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	public int getM_hit() {
		return m_hit;
	}
	public void setM_hit(int m_hit) {
		this.m_hit = m_hit;
	}
	public Date getM_rdate() {
		return m_rdate;
	}
	public void setM_rdate(Date m_rdate) {
		this.m_rdate = m_rdate;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public Double getM_rating() {
		return m_rating;
	}
	public void setM_rating(Double m_rating) {
		this.m_rating = m_rating;
	}
	@Override
	public String toString() {
		return "MenuVO [m_id=" + m_id + ", m_category=" + m_category + ", m_name=" + m_name + ", m_content=" + m_content
				+ ", m_price=" + m_price + ", m_hit=" + m_hit + ", m_rdate=" + m_rdate + ", m_img=" + m_img
				+ ", replycnt=" + replycnt + ", m_rating=" + m_rating + "]";
	}
	

	
}
