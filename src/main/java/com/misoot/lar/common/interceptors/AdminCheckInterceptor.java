package com.misoot.lar.common.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.misoot.lar.user.model.vo.User;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(AdminCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		User session_user = (User)session.getAttribute("session_user");
		
		if (session_user == null || !session_user.getUser_type().equals("admin") ) {
			if (isAjaxRequest(request)) {
				response.sendError(400);
				return false;
			} else {
				String href = "";
				String message = "올바르지 않은 접근입니다.";
				
				request.setAttribute("href", href);
				request.setAttribute("message", message);
				
				request.getRequestDispatcher("/WEB-INF/views/common/_message.jsp").forward(request, response);
				
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
	
	public boolean isAjaxRequest(HttpServletRequest request) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	}
}
