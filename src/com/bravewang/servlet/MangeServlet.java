package com.bravewang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bravewang.dao.ManageDao;
import com.bravewang.model.Manage;
import com.bravewang.model.User;

@WebServlet("/ManageServlet")
public class MangeServlet extends HttpServlet {

	private static final long serialVersionUID = 4330354917038349691L;
	private ManageDao manageDao = new ManageDao();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if ("managelogin".equals(action)) {
			login(req, resp);
		} else if ("managelogout".equals(action)) {
			req.getSession().invalidate();
			resp.sendRedirect("admin/managelogin.jsp");
		}

	}

	/**
	 * 管理员登录
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求的管理员账号和密码
		String mname = req.getParameter("mname");
		String mpwd = req.getParameter("mpwd");

		// 实例化Manage，进行数据的封装
		Manage manage = new Manage();
		manage.setMname(mname);
		manage.setMpwd(mpwd);

		// 实例化数据处理层
		if (manageDao.login(manage)) {
			HttpSession session = req.getSession();
			session.setAttribute("mamagename", mname);
			String sessionId = session.getId();
			if (session.isNew()) {
				System.out.println("session创建成功，session的id是：" + sessionId);
			} else {
				System.out.println("服务器已经存在该session了，session的id是：" + sessionId);
			}
			// resp.
			// 请求转发
			// resp.sendRedirect("default.jsp");
			req.getRequestDispatcher("admin/adminIndex.jsp").forward(req, resp);
		} else {
			// 重定向
			System.out.println("失败");
			resp.sendRedirect("/user.jsp");
		}
	}
	
	
	/**
	 * 初始化用户密码修改
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void initEditManagepwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid = req.getParameter("mid");
		Manage manage = manageDao.getManageById(Integer.parseInt(mid));
		req.setAttribute("manage", manage);
		req.getRequestDispatcher("admin/managelogin.jsp").forward(req, resp);
	}
}
