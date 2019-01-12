package com.bravewang.model;

public class Product {

	/**
	 * 商品id
	 */
	private int pid;
	/**
	 * 商品名
	 */
	private String pname;
	/**
	 * 商品价格
	 */
	private int price;
	/**
	 * 商品数量
	 */
	private int pnum;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

}
