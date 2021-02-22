package com.team2.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.domain.SearchCriteria;
import com.team2.domain.TimelineVO;
import com.team2.domain.UserVO;
import com.team2.dto.LoginDTO;
import com.team2.dto.UserDTO;
import com.team2.service.ProfileService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

	@Inject
	private ProfileService service;

	@RequestMapping(value = "/profilebasic", method = RequestMethod.GET)
	public void read(UserVO vo, HttpSession session, Model model) throws Exception {

		log.info("profile get ...........");
		vo = (UserVO) session.getAttribute("member");
		model.addAttribute("member", service.read(vo.getMemno()));

	}

	@RequestMapping(value = "/profilemodify", method = RequestMethod.GET)
	public void modify(UserVO vo, HttpSession session, Model model) throws Exception {

		log.info("profile get ...........");
		vo = (UserVO) session.getAttribute("member");
		service.read(vo.getMemno());

		
		log.info("profile get end.." + vo.toString());

	}

	@RequestMapping(value = "/profilemodify", method = RequestMethod.POST)
	public String modify(UserDTO dto,UserVO vo, HttpSession session) throws Exception {

		log.info("profile post ...........");

		log.info("dto???" + dto.toString());
        vo = (UserVO) session.getAttribute("member");
        
        vo.setName(dto.getName());
		vo.setPh(dto.getPh());
		vo.setEmail(dto.getEmail());
		vo.setLoc(dto.getLoc());
		vo.setJob(dto.getJob());
		vo.setMemimg(dto.getMemimg());
		vo.setCovimg(dto.getCovimg());
		log.info("vo????" + vo.toString());

		service.modify(vo);
		

		return "/profile/profilebasic";
	}

	@RequestMapping(value = "/profilepassword", method = RequestMethod.GET)
	public void password(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		model.addAttribute(dto);

	}

	@RequestMapping(value = "/profilepassword", method = RequestMethod.POST)
	public String password(LoginDTO dto, UserVO vo, HttpSession session, Model model) throws Exception {
		
		vo = (UserVO) session.getAttribute("member");
		
		vo.setPw(dto.getPw());
		
		log.info("패스워드 시작 " + vo.toString());
		service.password(vo);
		log.info("패스워드 끝 " + vo.toString());
		
		return "/profile/profilebasic";

	}
	
	@RequestMapping(value = "/profiledelete", method = RequestMethod.GET)
	public void delete(UserVO vo, HttpSession session, Model model) throws Exception {
		
		
		vo = (UserVO) session.getAttribute("member");

	}
	
	@RequestMapping(value = "/profiledelete", method = RequestMethod.POST)
	public String delete(@RequestParam("pw") String pw,@RequestParam("id") String id,UserVO vo, HttpSession session,HttpServletRequest req,Model model) throws Exception {
		
		vo = (UserVO) session.getAttribute("member");

		System.out.println(pw);
		System.out.println(vo.getPw());
		
		if (pw.equals(vo.getPw())) {
			 log.info("딜리트 시작"  + vo.toString());
			service.delete(vo);
			log.info("딜리트 종료");
		} else {
			System.out.println("딜리트 실패");
			return null;
		}
	  
		return "main/index";
		
	}

}
