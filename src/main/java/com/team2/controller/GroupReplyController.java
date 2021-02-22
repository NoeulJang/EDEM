package com.team2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team2.domain.GroupReplyVO;
import com.team2.domain.PageCriteria;
import com.team2.domain.PageMaker;
import com.team2.domain.UserVO;
import com.team2.service.GroupReplyService;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/reply")
public class GroupReplyController {

	@Inject
	private GroupReplyService service;

	@RequestMapping(value = "addReply/", method = RequestMethod.POST)
	public ResponseEntity<String> addReply(@RequestBody GroupReplyVO vo, HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("member");
		vo.setMemno(userVO.getMemno());

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "listReply/{grpostno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReply(@PathVariable("grpostno") int grpostno,
			@PathVariable("page") int page) {

		GroupReplyVO vo = new GroupReplyVO();
		vo.setGrpostno(grpostno);
		vo.setPage(page);
		log.info("listReply Start....vo? : " + vo.toString());

		PageCriteria cri = new PageCriteria();
		PageMaker pageMaker = new PageMaker();

		cri.setPageNo(vo.getPage());
		pageMaker.setPageCriteria(cri);
		log.info(cri.toString());

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();

			int commentsCount = service.replyCount(vo);
			pageMaker.setTotal(commentsCount);

			List<GroupReplyVO> list = service.listReply(vo);

			map.put("pageMaker", pageMaker);
			map.put("list", list);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "modify/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> modify(@PathVariable("rno") Integer rno, @RequestBody GroupReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "delete/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {

		ResponseEntity<String> entity = null;
		try {
			service.delete(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
