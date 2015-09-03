package com.indiapost;

public class ScheduleUserDetails {
	private int scheduleId;
	private int userId;
	private String date;
	private String time;
	private String approximateweight;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getApproximateweight() {
		return approximateweight;
	}

	public void setApproximateweight(String approximateweight) {
		this.approximateweight = approximateweight;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;

	}

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

}
