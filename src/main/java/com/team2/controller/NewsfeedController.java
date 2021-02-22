package com.team2.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.service.NewsfeedService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/newsfeed/*")
public class NewsfeedController {

	@Inject
	private NewsfeedService newsfeedService;

	@RequestMapping(value = "/newsfeedList", method = RequestMethod.GET)
	public void searchNewsfeed(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session)
			throws Exception {

		log.info("@1 : " + cri.toString());

		log.info(cri.getKeyword());

		UserVO userVO = (UserVO) session.getAttribute("member");
		log.info(userVO.toString());
		int memNo = userVO.getMemno();
		log.info("memNo..." + memNo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageCriteria(cri);
		log.info("@2");
		pageMaker.setTotal(newsfeedService.searchCount(cri, userVO));
		log.info("@3 search total ... : " + pageMaker.getTotal());
		pageMaker.setMemNo(memNo);
		
		log.info("listCri...."+cri.toString());

		model.addAttribute("newsfeed", newsfeedService.searchList(cri, pageMaker));
		log.info("@4 search list service success ... ");
		model.addAttribute("pageMaker", pageMaker);
	}

	/*
	 * @RequestMapping(value = "/newsfeedList/{pageNo}", method = RequestMethod.GET)
	 * public String searchNewsfeedPage(@ModelAttribute("cri") SearchCriteria cri,
	 * Model model, HttpSession session) throws Exception {
	 * 
	 * log.info("@@1 : " + cri.toString());
	 * 
	 * log.info(cri.getKeyword());
	 * 
	 * UserVO userVO = (UserVO)session.getAttribute("member");
	 * log.info(userVO.toString()); int memNo = userVO.getMemno();
	 * log.info("memNo..."+memNo);
	 * 
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setPageCriteria(cri);
	 * log.info("@@2"); pageMaker.setTotal(newsfeedService.searchCount(cri,
	 * userVO)); log.info("@@3 search total ... : " + pageMaker.getTotal());
	 * pageMaker.setMemNo(memNo);
	 * 
	 * 
	 * model.addAttribute("newsfeed", newsfeedService.searchList(cri, pageMaker));
	 * log.info("@@4 search list service success ... ");
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "newsfeed/newsfeedList"; }
	 */

}////////////////////////////////////////////////
