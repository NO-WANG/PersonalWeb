package com.bravewang.util;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class AttrListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		String key = se.getName();
		Object value = se.getValue();
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		System.out.println("Test2");
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		System.out.println("Test3");
	}

}
