package com.bravewang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.bravewang.dao.UserDao;
import com.bravewang.model.Comment;
import com.bravewang.model.Product;
import com.bravewang.model.Shop;
import com.bravewang.model.User;
import com.bravewang.util.DbUtil;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 4330354917038349691L;
	private UserDao userDao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if ("login".equals(action)) {
			login(req, resp);
		} else if ("addShop".equals(action)) {
			addShop(req, resp);
		} else if ("schProduct".equals(action)) {
			schProduct(req, resp);
		} else if ("schComment".equals(action)) {
			schComment(req, resp);
		} else if ("schShop".equals(action)) {
			schShop(req, resp);
		} else if ("schUser".equals(action)) {
			schUser(req, resp);
		} else if ("showAllShop".equals(action)) {
			showAllShop(req, resp);
		} else if ("showAllProduct".equals(action)) {
			showAllProduct(req, resp);
		} else if ("showAllUser".equals(action)) {
			showAllUser(req, resp);
		} else if ("initpersonEditUser".equals(action)) {
			initpersonEditUser(req, resp);
		} else if ("personeditUser".equals(action)) {
			personeditUser(req, resp);
		} else if ("initEditUser".equals(action)) {
			initEditUser(req, resp);
		} else if ("initEditProduct".equals(action)) {
			initEditProduct(req, resp);
		} else if ("editProduct".equals(action)) {
			editProduct(req, resp);
		} else if ("addUser".equals(action)) {
			addUser(req, resp);
		} else if ("editUser".equals(action)) {
			editUser(req, resp);
		} else if ("editUserpwd".equals(action)) {
			editUserpwd(req, resp);
		} else if ("initEditUserpwd".equals(action)) {
			initEditUserpwd(req, resp);
		}  else if ("delShop".equals(action)) {
			delShop(req, resp);
		} else if ("delProduct".equals(action)) {
			delProduct(req, resp);
		} else if ("delComment".equals(action)) {
			delComment(req, resp);
		} else if ("delUser".equals(action)) {
			delUser(req, resp);
		} else if ("logout".equals(action)) {
			req.getSession().invalidate();
			resp.sendRedirect("default.jsp");
		} else if ("reg".equals(action)) {
			reg(req, resp);
		} else if ("checkname".equals(action)) {
			checkname(req, resp);
		} else if ("checkUname".equals(action)) {
			checkUname(req, resp);
		} else if ("delUsers".equals(action)) {
			String[] ids = req.getParameterValues("ids");

			for (String id : ids) {
				System.out.println(id);
			}

			schUser(req, resp);
		}
	}

	/**
	 * 查询用户是否存在
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkUname(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname = req.getParameter("uname");
		UserDao userDao = new UserDao();
		boolean flag = userDao.checkUn(uname);

		String msg = "";

		if (flag) {
			msg = "{\"msg_code\":\"1\",\"msg\":\"用户名已存在！\"}";
		} else {
			msg = "{\"msg_code\":\"0\",\"msg\":\"用户可注册！\",\"userList\":[{\"uname\":\"admin\",\"upwd\":\"123\"},{\"uname\":\"123\",\"upwd\":\"111\"}]}";
		}

		PrintWriter out = resp.getWriter();
		out.print(msg);
	}

	/**
	 * 查询用户是否存在
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public boolean checkname(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname = req.getParameter("uname");
		UserDao userDao = new UserDao();
		boolean flag = userDao.checkUn(uname);
		return flag;
	}

	/**
	 * 注册功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void reg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求的用户名称和密码
		String uname = req.getParameter("uname");
		String upwd = req.getParameter("upwd");
		String usex = req.getParameter("usex");
		String uemail = req.getParameter("uemail");

		// 实例化user，进行数据封装
		User user = new User();
		user.setUname(uname);
		user.setUpwd(upwd);
		user.setUsex(usex);
		user.setUemail(uemail);

		if (userDao.regUser(user)) {
			// 这里是cookie
			Cookie ucookie = new Cookie("cuname", uname);
			Cookie pcookie = new Cookie("cupwd", upwd);

			resp.addCookie(ucookie);
			resp.addCookie(pcookie);
			req.getRequestDispatcher("register_ok.jsp").forward(req, resp);
		} else {
			// 重定向
			resp.sendRedirect("test.jsp");
		}
	}

	/**
	 * 添加产品进入购物车
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addShop(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求的用户名称和密码
		System.out.println("加入购物车操作");
		String sid = req.getParameter("sid");
		String spname = req.getParameter("spname");
		String sprice = req.getParameter("sprice");
		String snum = req.getParameter("snum");

		// 实例化user，进行数据封装
		Shop shop = new Shop();
		shop.setSid(Integer.parseInt(sid));
		shop.setSpname(spname);
		shop.setSprice(Integer.parseInt(sprice));
		shop.setSnum(Integer.parseInt(snum));

		if (userDao.toShop(shop)) {
			req.getRequestDispatcher("Mall.jsp").forward(req, resp);
		} else {
			String data = "未添加成功";
			resp.getWriter().print(data);
		}
		// resp.sendRedirect("adminIndex.jsp");
	}

	/**
	 * 添加用户功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求的用户名称和密码
		String uname = req.getParameter("uname");
		String upwd = req.getParameter("upwd");
		String usex = req.getParameter("usex");
		String uemail = req.getParameter("uemail");

		// 实例化user，进行数据封装
		User user = new User();
		user.setUname(uname);
		user.setUpwd(upwd);
		user.setUsex(usex);
		user.setUemail(uemail);

		if (userDao.regUser(user)) {
			String data = "添加成功";
			resp.getWriter().print(data);
		} else {
			String data = "未添加成功";
			resp.getWriter().print(data);
		}
		// resp.sendRedirect("adminIndex.jsp");
	}

	/**
	 * 删除用户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		System.out.println(uid);

		userDao.delUser(Integer.parseInt(uid));
		System.out.println("删除成功！");
		schUser(req, resp);

	}

	/**
	 * 删除产品
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		System.out.println(pid);
		userDao.delProduct(Integer.parseInt(pid));
		System.out.println("删除成功！");
		schProduct(req, resp);
	}
	
	/**
	 * 删除购物车
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delShop(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sid = req.getParameter("sid");
		System.out.println(sid);
		userDao.delShop(Integer.parseInt(sid));
		System.out.println("删除成功！");
		schShop(req, resp);
	}

	/**
	 * 删除评论
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String commentid = req.getParameter("commentid");
		System.out.println(commentid);

		userDao.delComment(Integer.parseInt(commentid));
		System.out.println("删除成功！");
		schComment(req, resp);

	}

	/**
	 * 修改用户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String uname = req.getParameter("uname");
		String upwd = req.getParameter("upwd");
		String usex = req.getParameter("usex");
		String uemail = req.getParameter("uemail");

		// 实例化User，进行数据封装
		User user = new User();
		user.setUid(Integer.parseInt(uid));
		user.setUname(uname);
		user.setUpwd(upwd);
		user.setUsex(usex);
		user.setUemail(uemail);

		if (userDao.editUser(user)) {
			schUser(req, resp);
			// req.getRequestDispatcher("admin/userManage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("test.jsp");
		}
	}

	/**
	 * 初始化用户修改
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void initEditUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		User user = userDao.getUserById(Integer.parseInt(uid));
		req.setAttribute("user", user);
		System.out.println("即将跳转修改界面");
		req.getRequestDispatcher("admin/editUser.jsp").forward(req, resp);
	}

	/**
	 * 初始化个人中心用户修改
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void initpersonEditUser(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String uname = req.getParameter("uname");
		User user = userDao.getUserByName(uname);
		req.setAttribute("user", user);
		System.out.println("即将跳转修改界面");
		req.getRequestDispatcher("personeditUser.jsp").forward(req, resp);
	}

	/**
	 * 个人中心修改用户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void personeditUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String uname = req.getParameter("uname");
		String upwd = req.getParameter("upwd");
		String usex = req.getParameter("usex");
		String uemail = req.getParameter("uemail");

		// 实例化User，进行数据封装
		User user = new User();
		user.setUid(Integer.parseInt(uid));
		user.setUname(uname);
		user.setUpwd(upwd);
		user.setUsex(usex);
		user.setUemail(uemail);

		if (userDao.editUser(user)) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("test.jsp");
		}
	}

	/**
	 * 初始化产品修改
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void initEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  pid=req.getParameter("pid");
		Product product=userDao.getProductById(Integer.parseInt(pid));
		System.out.println("跳转修改");
		req.setAttribute("product", product);
		req.getRequestDispatcher("admin/editProduct.jsp").forward(req, resp);
	}

	/**
	 * 修改产品
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		String pname = req.getParameter("pname");
		String price = req.getParameter("price");
		String pnum = req.getParameter("pnum");

		// 实例化User，进行数据封装
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		product.setPname(pname);
		product.setPrice(Integer.parseInt(price));
		product.setPnum(Integer.parseInt(pnum));

		if (userDao.editProduct(product)) {
			schProduct(req, resp);
			// req.getRequestDispatcher("admin/userManage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("test.jsp");
		}

	}

	/**
	 * 修改用户密码
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editUserpwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String upwd = req.getParameter("upwd");

		// 实例化User，进行数据封装
		User user = new User();
		user.setUid(Integer.parseInt(uid));
		user.setUpwd(upwd);

		userDao.editUserpwd(user);

		schUser(req, resp);
	}

	/**
	 * 初始化用户密码修改
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void initEditUserpwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		User user = userDao.getUserById(Integer.parseInt(uid));
		req.setAttribute("user", user);
		req.getRequestDispatcher("change_password.jsp").forward(req, resp);
	}

	/**
	 * 显示所有用户
	 * 
	 * @param schUserName
	 * @return
	 */
	public void showAllUser(HttpServletRequest req, HttpServletResponse resp) {
		List<User> users = userDao.showAllUser(null);
		ObjectMapper mapper = new ObjectMapper();
		String jsonlist;
		try {
			jsonlist = mapper.writeValueAsString(users);
			System.out.println(jsonlist);
			resp.getWriter().print(jsonlist);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	/**
	 * 显示所有商品
	 * 
	 * @param schUserName
	 * @return
	 */
	public void showAllProduct(HttpServletRequest req, HttpServletResponse resp) {
		List<Product> products = userDao.showAllProduct(null);
		ObjectMapper mapper = new ObjectMapper();
		String jsonlist;
		try {
			jsonlist = mapper.writeValueAsString(products);
			System.out.println(jsonlist);
			resp.getWriter().print(jsonlist);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	/**
	 * 显示所有购物车信息
	 * 
	 * @param schUserName
	 * @return
	 */
	public void showAllShop(HttpServletRequest req, HttpServletResponse resp) {
		List<Shop> shops = userDao.showAllShop(null);
		ObjectMapper mapper = new ObjectMapper();
		String jsonlist;
		try {
			jsonlist = mapper.writeValueAsString(shops);
			System.out.println(jsonlist);
			resp.getWriter().print(jsonlist);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	/**
	 * 查询用户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void schUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("进入用户数据查找");
		String schUserName = req.getParameter("schUserName");
		System.out.println(schUserName);
		String currPage = req.getParameter("currPage");
		if (currPage == null) {
			currPage = "1";
		}

		int page = Integer.parseInt(currPage);

		List<User> list = userDao.schUser(schUserName);

		// 总条数
		int total = list.size();

		// 每一页多少
		int pageSize = 5;

		// 获取总页数
		int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total / pageSize;

		if (page > totalPage) {
			page = totalPage;
		}

		if (page < 1) {
			page = 1;
		}

		// 查询数据的开始索引号
		int start = (page - 1) * pageSize;

		List<User> userList = userDao.getUserByPage(schUserName, start, pageSize);
		System.out.println("获取用户集合");
		req.setAttribute("userList", userList);
		req.setAttribute("currPage", page);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("admin/userManage.jsp").forward(req, resp);
	}

	/**
	 * 查询购物车商品信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void schShop(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("进入购物车数据查找");
		String schShopinfo = req.getParameter("schShopinfo");
		System.out.println(schShopinfo);
		String currPage = req.getParameter("currPage");
		if (currPage == null) {
			currPage = "1";
		}

		int page = Integer.parseInt(currPage);

		List<Shop> list = userDao.schShop(schShopinfo);

		// 总条数
		int total = list.size();

		// 每一页多少
		int pageSize = 5;

		// 获取总页数
		int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total / pageSize;

		if (page > totalPage) {
			page = totalPage;
		}

		if (page < 1) {
			page = 1;
		}

		// 查询数据的开始索引号
		int start = (page - 1) * pageSize;

		List<Shop> shopList = userDao.getShopByPage(schShopinfo, start, pageSize);
		System.out.println("获取购物车集合");
		req.setAttribute("shopList", shopList);
		req.setAttribute("currPage", page);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("user.jsp").forward(req, resp);
	}

	/**
	 * 查询评论
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void schComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("进入评论数据查找");
		String schComment = req.getParameter("schComment");
		String currPage = req.getParameter("currPage");
		if (currPage == null) {
			currPage = "1";
		}
		int page = Integer.parseInt(currPage);
		List<Comment> list = userDao.schComment(schComment);
		// 总条数
		int total = list.size();
		// 每一页多少
		int pageSize = 5;
		// 获取总页数
		int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total / pageSize;
		if (page > totalPage) {
			page = totalPage;
		}
		if (page < 1) {
			page = 1;
		}
		// 查询数据的开始索引号
		int start = (page - 1) * pageSize;
		// 查询出评论之后，发送到评论里面
		List<Comment> commentList = userDao.getCommentByPage(schComment, start, pageSize);
		req.setAttribute("commentList", commentList);
		req.setAttribute("currPage", page);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("admin/commentManage.jsp").forward(req, resp);
	}

	/**
	 * 查询产品
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void schProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("进入产品数据查找");
		String schProduct = req.getParameter("schProduct");
		String currPage = req.getParameter("currPage");
		if (currPage == null) {
			currPage = "1";
		}
		int page = Integer.parseInt(currPage);
		List<Product> list = userDao.schProduct(schProduct);
		// 总条数
		int total = list.size();
		// 每一页多少
		int pageSize = 5;
		// 获取总页数
		int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total / pageSize;
		if (page > totalPage) {
			page = totalPage;
		}
		if (page < 1) {
			page = 1;
		}
		// 查询数据的开始索引号
		int start = (page - 1) * pageSize;
		// 查询出评论之后，发送到评论里面
		List<Product> productList = userDao.getProductByPage(schProduct, start, pageSize);
		req.setAttribute("productList", productList);
		req.setAttribute("currPage", page);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("admin/productManage.jsp").forward(req, resp);
	}

	/**
	 * 用户登录
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求的用户名和密码
		String uname = req.getParameter("uname");
		String upwd = req.getParameter("upwd");
		String jzmm = req.getParameter("jzmm");

		// 实例化User，进行数据的封装
		User user = new User();
		user.setUname(uname);
		user.setUpwd(upwd);

		// 实例化数据处理层
		if (userDao.login(user)) {

			HttpSession session = req.getSession();
			session.setAttribute("username", uname);
			String sessionId = session.getId();
			if (session.isNew()) {
				System.out.println("session创建成功，session的id是：" + sessionId);
			} else {
				System.out.println("服务器已经存在该session了，session的id是：" + sessionId);
			}

			// 这里是cookie
			Cookie ucookie = new Cookie("cuname", uname);
			Cookie pcookie = new Cookie("cupwd", upwd);
			if ("1".equals(jzmm)) {
				ucookie.setMaxAge(60 * 60 * 24 * 7);
				pcookie.setMaxAge(60 * 60 * 24 * 7);

			} else {
				ucookie.setMaxAge(0);
				pcookie.setMaxAge(0);
			}
			resp.addCookie(ucookie);
			resp.addCookie(pcookie);
			// resp.
			// 请求转发
			// resp.sendRedirect("default.jsp");
			req.getRequestDispatcher("default.jsp").forward(req, resp);
		} else {
			// 重定向
			// req.getRequestDispatcher("test.jsp").forward(req, resp);
			resp.sendRedirect("usererror.jsp");
		}
	}
}
