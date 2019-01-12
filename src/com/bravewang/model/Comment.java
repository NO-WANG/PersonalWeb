package com.bravewang.model;

import java.util.Date;

public class Comment {

	/**
	 * 评论id
	 */
	private int commentid;
	/**
	 * 评论用户名
	 */
	private String commentuser;
	/**
	 * 评论内容
	 */
	private String commentword;
	/**
	 * 评论时间
	 */
	private Date commentdate;

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public String getCommentuser() {
		return commentuser;
	}

	public void setCommentuser(String commentuser) {
		this.commentuser = commentuser;
	}

	public String getCommentword() {
		return commentword;
	}

	public void setCommentword(String commentword) {
		this.commentword = commentword;
	}

	public Date getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}

}
