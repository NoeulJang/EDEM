package com.team2.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.team2.domain.UserVO;
import com.team2.dto.LoginDTO;
import com.team2.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/main")
public class UserController {

	@Inject
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		log.info("get..usercontroller..");
		return "/main/index";
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = service.login(dto);
		log.info("login..! get userInfo... : " + dto.toString());

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (vo == null)
			errors.put("idOrPwNotMatch", Boolean.TRUE);
		if (dto.getId() == null || dto.getId().isEmpty())
			errors.put("id", Boolean.TRUE);
		if (dto.getPw() == null || dto.getPw().isEmpty())
			errors.put("pw", Boolean.TRUE);
		if (!errors.isEmpty()) {
			return "/main/index";
		}
		
		vo.setFollowers(service.countMyFollowers(vo.getMemno()));
		
		session.setAttribute("member", vo);
		model.addAttribute("userVO", vo);
		
		return "/newsfeed/newsfeedList";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("member");

		if (obj != null) {
			session.removeAttribute("member");
			session.invalidate();
		}

		log.info("logout end...");
		return "/main/index";
	}
}
