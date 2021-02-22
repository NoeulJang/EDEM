package com.team2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.service.FollowService;
import com.team2.service.SearchService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/search/*")
public class SearchUserController {
	
	@Inject
	SearchService search;
	@Inject 
	private FollowService followService;

	
	@RequestMapping(value = "/{type}", method = RequestMethod.POST)
	public String searchUser(@PathVariable("type") String searchType, HttpSession session, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		String type = searchType;
		session.setAttribute("searchType", type);
		session.setAttribute("sessionKeyword", cri.getKeyword());
		log.info("sessionKeyword : "+cri.getKeyword());
		log.info("searchType : "+type);
		
		UserVO vo = (UserVO)session.getAttribute("member");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setMemNo(vo.getMemno());
				
		int searchNumCheck = search.searchUserCount(cri, pageMaker);
		log.info("searchNumCheck : " + searchNumCheck);
		
		if(searchNumCheck < 1) {
			model.addAttribute("searchNumCheck", 0);
		}else {
			model.addAttribute("searchNumCheck", searchNumCheck);
		}
		return "/searchUser/searchUserList";
	}

	
	@ResponseBody
	@RequestMapping(value="/{keyword}/{pageNo}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> searchUserList(HttpSession session, @ModelAttribute("cri") SearchCriteria cri) 
			throws Exception {
		
		log.info("search list start....................");
		ResponseEntity<Map<String, Object>> entity = null;
		
		//세션해당 유저 제외하고 검색하기 위해 세션값 조회
		UserVO vo = (UserVO)session.getAttribute("member");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setMemNo(vo.getMemno());
		
		//검색 키워드
		log.info("**searchUser Controller Start...keyword : " + cri.getKeyword());		
		if(cri.getKeyword().equals("not match")) {
			cri.setKeyword("");
		}		
		log.info("****searchUser Controller Start...keyword : " + cri.getKeyword());
		
		//검색 결과 유무 조회
		int searchNumCheck = search.searchUserCount(cri, pageMaker);
		log.info("searchNumCheck : " + searchNumCheck);
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<UserVO> list = (List<UserVO>) search.searchUserList(cri, pageMaker);	
		map.put("list", list);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);

		pageMaker.setPageCriteria(cri);
		log.info("searchNumCheck : " + searchNumCheck);
		pageMaker.setTotal(searchNumCheck);

		log.info("listCri...."+cri.toString());		
		log.info(" Search List : " + list);
		
		return entity;
	}
	
	

	
	
	
	
	
}
