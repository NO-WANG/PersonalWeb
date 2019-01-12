package com.bravewang.model;

public class Shop {

	/**
	 * 购物车id
	 */
	private int sid;
	/**
	 * 商品名
	 */
	private String spname;
	/**
	 * 商品价格
	 */
	private int sprice;
	/**
	 * 商品数量
	 */
	private int snum;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public int getSprice() {
		return sprice;
	}

	public void setSprice(int sprice) {
		this.sprice = sprice;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

}
