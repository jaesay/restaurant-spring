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

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	private static final String LOGIN ="login";
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle(...................");
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null){
			logger.info("User is not logined");
			String go = request.getParameter("go");
			saveDest(request);
			
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			if(cookie != null){
				UserVO uvo = service.checkLoginBefore(cookie.getValue());
				if(uvo != null){
					session.setAttribute("login", uvo);
					return true;
				}
			}
			
			response.sendRedirect("/user/login?go="+go);
			return false;
		}
		
		return true;
	}

	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")){
			query ="";
		}else{
			query ="?" +query;
		}
		
		if(request.getMethod().equals("GET")){
			logger.info("dest: " + (uri + query));
			request.getSession().setAttribute("destination", uri+query);
		}
	}
}

