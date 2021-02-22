package com.team2.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.warn("LoginIntercept_preHandle!!");
		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			log.warn("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		log.warn("LoginIntercept_postHandle!!");
		
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVO = modelMap.get("userVO");

		if (userVO != null) {

			log.warn("new login success");
			session.setAttribute(LOGIN, userVO);

			if (request.getParameter("useCookie") != null) {

				log.warn("remember me................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			
			// response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			log.warn("LoginIntercept_SendRedirect!!");
			// response.sendRedirect(dest != null ? (String) dest : "/");
			response.sendRedirect(dest != null ? (String) dest : "/newsfeed/newsfeedList");
		}
		
	}

}
