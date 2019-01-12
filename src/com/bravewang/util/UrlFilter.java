package com.bravewang.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UrlFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("UrlFilter销毁");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		Object obj = session.getAttribute("suser");

		String path = req.getServletPath();
		System.out.println("请求地址" + path);

		String action = req.getParameter("action");
		System.out.println("动作请求" + action);
           //如果要过滤特定页面，可以用|| "/register.jsp".equals(path)
		if (obj != null ||  path.endsWith(".jsp") || "login".equals(action) || "reg".equals(action)
				|| "managelogin".equals(action) || "checkUname".equals(action) || path.endsWith(".js")|| "showAllUser".equals(action)
				|| path.endsWith(".css") || path.endsWith(".jpg") || path.endsWith(".png") || path.endsWith(".gif")
				|| path.endsWith(".mp4")) {
			chain.doFilter(req, resp);
			System.out.println("进入过滤器过滤");
		} else {
			PrintWriter out = resp.getWriter();
			System.out.println("meiyou");
			out.print("<script type='text/javascript'>top.location.href='test.jsp'</script>");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
