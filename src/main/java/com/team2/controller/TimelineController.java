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
import com.team2.domain.TimelinePageMaker;
import com.team2.domain.TimelineSearchCriteria;
import com.team2.domain.TimelineVO;
import com.team2.domain.UserVO;
import com.team2.dto.TimelineDTO;
import com.team2.service.FollowService;
import com.team2.service.TimelineService;
import com.team2.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/timeline")
public class TimelineController {

	
	@Inject
	private TimelineService service;
	@Inject 
	private FollowService followService;
	@Inject
	private UserService uservice;

	@RequestMapping(value = "/timelineList", method = RequestMethod.GET)
	public void read(UserVO vo, TimelineSearchCriteria cri, HttpSession session, Model model) throws Exception {
		log.info("list get ...........");

		vo = (UserVO) session.getAttribute("member");
		log.info(vo.toString());

		TimelineDTO dto = new TimelineDTO();
		dto.setKeyword(cri.getKeyword());
		dto.setMemno(vo.getMemno());
		dto.setStartPage(cri.getPage() - 1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());
		log.info(dto.toString());
		
		log.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(dto));
		model.addAttribute("member", vo);

		TimelinePageMaker pageMaker = new TimelinePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("postNo") int postNo, TimelineVO timeline, @ModelAttribute("cri") SearchCriteria cri,
			Model model, UserVO user, HttpSession session) throws Exception {

		user = (UserVO) session.getAttribute("member");
		timeline.setMemno(user.getMemno());
		timeline.setPostNo(postNo);
		model.addAttribute(service.read(postNo));
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(UserVO vo, HttpSession session, TimelineVO timeline, Model model) throws Exception {

		vo = (UserVO) session.getAttribute("member");
		log.info("Write post ...........");

		timeline.setMemno(vo.getMemno());
		log.info(timeline.toString());

		service.insert(timeline);

		log.info("write end..");
		
		
		return "redirect:/timeline/timelineList";
	}
	
	@RequestMapping(value = "/timelinemodify", method = RequestMethod.GET)
	public void update(@RequestParam("postNo") int postNo, UserVO vo, @ModelAttribute("cri") SearchCriteria cri,
			Model model, HttpSession session) throws Exception {
		log.info("modify get Start");
		log.info("postNo????" + postNo);

		session.setAttribute("postNo", postNo);
		vo = (UserVO) session.getAttribute("member");
		TimelineVO timeline = new TimelineVO();
		timeline.setMemno(vo.getMemno());
		model.addAttribute("list", service.read(postNo));
		model.addAttribute("member", vo);

		log.info("modify get end..");
	}

	@RequestMapping(value = "/timelinemodify", method = RequestMethod.POST)
	public String update(UserVO vo, TimelineVO timeline, SearchCriteria cri, HttpSession session, Model model)
			throws Exception {

		vo = (UserVO) session.getAttribute("member");
		int postNo = (int) session.getAttribute("postNo");

		timeline.setPostNo(postNo);
		timeline.setMemno(vo.getMemno());

		log.info("update post ...........");
		log.info(timeline.toString());

		service.update(timeline);

		log.info(timeline.toString());
		log.info("update end ...........");

		return "redirect:/timeline/timelineList";
	}
	
	@RequestMapping(value = "/timelinedelete", method = RequestMethod.POST)
	public String delete(@RequestParam("postNo") int postNo, UserVO vo, TimelineVO timeline, SearchCriteria cri,
			HttpSession session, Model model) throws Exception {
		vo = (UserVO) session.getAttribute("member");

		timeline.setPostNo(postNo);
		timeline.setMemno(vo.getMemno());

		log.info("delete post ...........");
		log.info(timeline.toString());

		service.delete(timeline);

		log.info(timeline.toString());
		log.info("delete end ...........");

		return "redirect:/timeline/timelineList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchFollowing/{memno}/{keyword}/{pageNo}", method = RequestMethod.GET) 
	public ResponseEntity<Map<String, Object>>searchFollowingList(HttpSession session, UserVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		/* @RequestParam(required = false) String keyword */
		
		log.info("팔로잉목록 키워드검색 조회 시작.. ");
		
		ResponseEntity<Map<String, Object>> entity = null;

		log.info("해당 멤버 번호 : " + vo.getMemno());
		log.info("검색어 : " + cri.getKeyword());
		log.info("페이지넘버 : " + cri.getPageNo());

		
		try {
			if(cri.getKeyword().equals("not match")) {
				log.info("키워드 없음.. " + cri.getKeyword());
				List<UserVO> list = followService.followingListPage(vo, cri);
				log.info("list : " + list);
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setPageCriteria(cri);	
				pageMaker.setTotal(followService.followingCount(vo, cri));
				log.info("@3 search total ... : " + pageMaker.getTotal());
				
				map.put("list", list);
				map.put("pageMaker", pageMaker);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				log.info("키워드 있음.. " + cri.getKeyword());
				List<UserVO> list = followService.searchFollowingListPage(vo, cri);
				log.info("list : " + list);
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setPageCriteria(cri);	
				pageMaker.setTotal(followService.followingCount(vo, cri));
				log.info("@3 search total ... : " + pageMaker.getTotal());
				
				map.put("list", list);
				map.put("pageMaker", pageMaker);
				map.put("check", pageMaker.getTotal());
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
		
    	} catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    log.info(" search followingList entity send Success... ");
	    return entity;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/searchFollower/{memno}/{keyword}/{pageNo}", method = RequestMethod.GET) 
	public ResponseEntity<Map<String, Object>> searchFollowerList(UserVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		log.info("팔로워목록 키워드검색 조회 시작.. ");
		ResponseEntity<Map<String, Object>> entity = null;
		
		log.info("해당 멤버 번호 : " + vo.getMemno());
		log.info("검색어 : " + cri.getKeyword());
		log.info("페이지넘버 : " + cri.getPageNo());
		
		try {
			if(cri.getKeyword().equals("not match")) {
				log.info("키워드 없음.. " + cri.getKeyword());
				List<UserVO> list = followService.followerListPage(vo, cri);
				log.info("list : " + list);
			
				Map<String, Object> map = new HashMap<String, Object>();
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setPageCriteria(cri);	
				pageMaker.setTotal(followService.followerCount(vo, cri));
				log.info("@3 search total ... : " + pageMaker.getTotal());
				
				map.put("list", list);
				map.put("pageMaker", pageMaker);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				log.info("키워드 있음.. " + cri.getKeyword());
				List<UserVO> list = followService.searchFollowerListPage(vo, cri);
				log.info("list : " + list);
			
				Map<String, Object> map = new HashMap<String, Object>();
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setPageCriteria(cri);	
				pageMaker.setTotal(followService.followerCount(vo, cri));
				log.info("@3 search total ... : " + pageMaker.getTotal());
								
				map.put("list", list);
				map.put("pageMaker", pageMaker);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
	
    	} catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    log.info(" search followerList entity send Success... ");
	    return entity;
	}
	
	@RequestMapping(value = "/timelineList/{memno}", method = RequestMethod.GET)
	public String read(@PathVariable("memno") int memno, TimelineSearchCriteria cri, HttpSession session, Model model) throws Exception {
		
		log.info("user timeLine list get controller...........");
		
		UserVO vo = new UserVO();
		
		vo.setMemno(memno);	
		vo = (UserVO)service.userInfo(memno);
		vo.setFollowers(uservice.countMyFollowers(vo.getMemno()));

		log.info(vo.toString());

		TimelineDTO dto = new TimelineDTO();
		dto.setKeyword(cri.getKeyword());
		dto.setMemno(vo.getMemno());
		dto.setStartPage((cri.getPage()-1) * 10 +1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());
		log.info(dto.toString());
		
		log.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(dto));
		model.addAttribute("userInfo", vo);

		TimelinePageMaker pageMaker = new TimelinePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.flistSearchCount(dto));

		model.addAttribute("pageMaker", pageMaker);
		
		log.info(pageMaker);
		
		UserVO myMemNo = (UserVO)session.getAttribute("member");
		int myno = myMemNo.getMemno();
		int followBtn = service.followBtn(myno, memno);
		
		model.addAttribute("followBtn", followBtn);
		
		return "/timeline/friendTimelineList";

	}
	
	/*
	@RequestMapping(value = "/timelineList2", method = RequestMethod.POST)
	public String readt(UserVO vo, TimelineSearchCriteria cri, HttpSession session, Model model) throws Exception {
		log.info("user timeLine list get controller...........");
		
		
		
		//UserVO vo = new UserVO();
		
		//vo.setMemno(memno);	
		log.info("vo.getMemNo" + vo.getMemno());
		int memno = vo.getMemno();
		
		vo = (UserVO)service.userInfo(memno);
		vo.setFollowers(uservice.countMyFollowers(vo.getMemno()));

		log.info(vo.toString());

		TimelineDTO dto = new TimelineDTO();
		dto.setKeyword(cri.getKeyword());
		dto.setMemno(vo.getMemno());
		dto.setStartPage((cri.getPage()-1) * 10 +1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());
		log.info(dto.toString());
		
		log.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(dto));
		model.addAttribute("userInfo", vo);

		TimelinePageMaker pageMaker = new TimelinePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.flistSearchCount(dto));

		model.addAttribute("pageMaker", pageMaker);
		
		log.info(pageMaker);
		
		UserVO myMemNo = (UserVO)session.getAttribute("member");
		int myno = myMemNo.getMemno();
		int followBtn = service.followBtn(myno, memno);
		
		model.addAttribute("followBtn", followBtn);
		
		return "/timeline/friendTimelineList";

	}
	*/
	
	@RequestMapping(value = "/follow/{memno}", method = RequestMethod.GET)
	public String follow(@PathVariable("memno") int memno, TimelineSearchCriteria cri, HttpSession session, Model model) throws Exception {
		
		UserVO vo = (UserVO)session.getAttribute("member");
		int myno = vo.getMemno();
		int followBtnVal = service.followBtn(myno, memno);
		if(followBtnVal==1) {
			service.deleteFollow(myno, memno);
		}else {
			service.insertFollow(myno, memno);
		}
			
		return "redirect:/timeline/timelineList/{memno}";

	}

}
