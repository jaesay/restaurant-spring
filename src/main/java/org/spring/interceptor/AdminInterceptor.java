package org.spring.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.service.UserService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	private static final String LOGIN ="login";
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle(...................");
		
		HttpSession session = request.getSession();
		Cookie cookie = WebUtils.getCookie(request, "loginCookie");
		if(cookie != null){
			UserVO uvo = service.checkLoginBefore(cookie.getValue());
			if(uvo.getU_email().equals("admin@songjjuzip.com")){
				return true;
			}
		}
		
		if(session.getAttribute(LOGIN) != null){
			if(((UserVO)session.getAttribute(LOGIN)).getU_email().equals("admin@songjjuzip.com")){
				return true;
			}
		}
		
		response.sendRedirect("/user/adminError");
		return false;
	}

}

