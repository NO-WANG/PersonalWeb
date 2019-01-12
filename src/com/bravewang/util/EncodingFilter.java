package com.bravewang.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	
	private String encoding = "";
	private String contenttype = "";
	
	public EncodingFilter() {
		System.out.println("EncodingFilter实例化......");
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("EncodingFilter初始化.....");
		this.encoding = config.getInitParameter("Encoding");
		contenttype = config.getInitParameter("ContentType");
		//打印编码格式
		System.out.println(encoding);
		System.out.println(contenttype);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(encoding==null) {
			encoding="utf-8";
		}
		//设置请求的编码
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		response.setContentType(contenttype);
		//过滤传递
		chain.doFilter(request, response);
		System.out.println("EncodingFilter具体操作.....");
	}

	@Override
	public void destroy() {
		this.encoding=null;
		System.out.println("EncodingFilter销毁.....");

	}
}
