package com.kh.animall.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.animall.users.member.model.vo.Member;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("-------start-----------");
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후 이용해 주세요.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}

		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		System.out.println("-------view---------");
	}

}
