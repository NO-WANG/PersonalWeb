package com.bravewang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bravewang.dao.UserDao;
import com.bravewang.model.User;

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String schUserName = req.getParameter("schUsername");
		
		UserDao userDao = new UserDao();
		
		List<User> list = userDao.schUser(schUserName);
		
		req.setAttribute("userList", list);
		req.getRequestDispatcher("admin/adminindex.jsp").forward(req, resp);

	}
}
