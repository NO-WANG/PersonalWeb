package com.bravewang.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineCountListener implements HttpSessionListener {
	
	public OnlineCountListener() {
		System.out.println("监听器实例化....");
	}
	
	private int num = 0;

	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		hse.getSession().getServletContext().setAttribute("onlineUserNum", ++num);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		hse.getSession().getServletContext().setAttribute("onlineUserNum", --num);
	}

}