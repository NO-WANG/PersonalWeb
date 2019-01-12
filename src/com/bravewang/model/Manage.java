package com.bravewang.model;

public class Manage {
	/**
	 * 管理员id
	 */
	private int mid;
	/**
	 * 管理员账号
	 */
	private String mname;
	/**
	 * 管理员密码
	 */
	private String mpwd;
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
}
