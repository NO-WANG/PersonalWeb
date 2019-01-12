package com.bravewang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bravewang.model.Manage;
import com.bravewang.model.User;
import com.bravewang.util.DbUtil;

public class ManageDao {	
	
	/**
	 * 登录功能
	 * 
	 * @param user
	 *            传递参数
	 * @return true:成功 false:失败
	 */
	public boolean login(Manage manage) {
		boolean flag = false;
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_manage WHERE mname = ? AND mpwd = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, manage.getMname());
			psmt.setString(2, manage.getMpwd());
			rs = psmt.executeQuery();
			while (rs.next()) {
				flag = true;
				System.out.println("账号密码校验成功");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return flag;
		
	}
	
	/**
	 * 根据用户id查询用户信息
	 * 
	 * @param uid
	 * @return
	 */
	public Manage getManageById(int mid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_manage WHERE mid = ?";

		Manage manage = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				manage = new Manage();
				manage.setMid(rs.getInt("mid"));
				manage.setMname(rs.getString("mname"));
				manage.setMpwd(rs.getString("mpwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return manage;
	}

}
