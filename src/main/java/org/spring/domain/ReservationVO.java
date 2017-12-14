package org.spring.domain;

public class ReservationVO {
	private int r_id;
	private String r_email;
	private String r_name;
	private String r_phone;
	private String r_message;
	private String r_date;
	private int r_time;
	private int r_people;
	private String r_state;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_email() {
		return r_email;
	}
	public void setR_email(String r_email) {
		this.r_email = r_email;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_phone() {
		return r_phone;
	}
	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}
	public String getR_message() {
		return r_message;
	}
	public void setR_message(String r_message) {
		this.r_message = r_message;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getR_time() {
		return r_time;
	}
	public void setR_time(int r_time) {
		this.r_time = r_time;
	}
	public int getR_people() {
		return r_people;
	}
	public void setR_people(int r_people) {
		this.r_people = r_people;
	}
	public String getR_state() {
		return r_state;
	}
	public void setR_state(String r_state) {
		this.r_state = r_state;
	}
	@Override
	public String toString() {
		return "ReservationVO [r_id=" + r_id + ", r_email=" + r_email + ", r_name=" + r_name + ", r_phone=" + r_phone
				+ ", r_message=" + r_message + ", r_date=" + r_date + ", r_time=" + r_time + ", r_people=" + r_people
				+ ", r_state=" + r_state + "]";
	}
	
}

