package com.bravewang.model;

public class User {
	/**
	 * 用户id
	 */
	private int uid;
	/**
	 * 用户名
	 */
	private String uname;
	/**
	 * 用户密码
	 */
	private String upwd;
	/**
	 * 用户性别
	 */
	private String usex;
	/**
	 * 用户性别
	 */
	private String uemail;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
}
