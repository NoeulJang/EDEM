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

import com.team2.domain.CommentsVO;
import com.team2.domain.PageCriteria;
import com.team2.domain.PageMaker;
import com.team2.domain.UserVO;
import com.team2.dto.CommentsDTO;
import com.team2.service.CommentsService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/comments")
public class CommentsController {
	
	  @Inject 
	  private CommentsService commentsService;
	  
	  
	  
	@RequestMapping(value = "", method = RequestMethod.POST) //댓글쓰기
	public ResponseEntity<String> register(@RequestBody CommentsVO vo, HttpSession session) {
		
		UserVO userVO = (UserVO)session.getAttribute("member");
		
		//vo.setComDate(new Date());
		vo.setMemNo(userVO.getMemno());
		vo.setId(userVO.getId());
		
		//System.out.println("**CommentsVO toString : " + vo.toString());
		log.info("**CommentsVO toString : " + vo.toString() );
		
	    ResponseEntity<String> entity = null;
	    
	    try {
	    	commentsService.addComments(vo);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  } 

	
	@RequestMapping(value = "/{postNo}/{pageNo}", method = RequestMethod.GET) //댓글조회
	  public ResponseEntity<Map<String, Object>> listPage(@PathVariable("postNo") int postNo, @PathVariable("pageNo") int pageNo) {
			
		
		log.info("댓글창 조회 시작.. ");
		ResponseEntity<Map<String, Object>> entity = null;
		    
		    try {
		      PageCriteria cri = new PageCriteria();
		      log.info("postNo : " + postNo);  //확인46
		      cri.setPageNo(pageNo);
		      log.info("**pageNo : " + cri.getPageNo());  //확인1
		      log.info("cri.toString() : " + cri.toString()); 
		      

		      PageMaker pageMaker = new PageMaker();
		      
		      pageMaker.setPageCriteria(cri);
		      //pageMaker.setPageNo(pageNo);
		      int commentsCount = commentsService.commentsCount(postNo);
		      pageMaker.setTotal(commentsCount);
		      
		      log.info("pageMaker.toString() : " + pageMaker.toString()); //토탈 개수까지 들어감. 확인
		      //PageCriteria [pageNo=1, perPageNum=10] NewsfeedPage [total=2, totalPages=1 startPage 1 endPage 1 memNo 0 prev false next false]

		      Map<String, Object> map = new HashMap<String, Object>();
		      List<CommentsDTO> list = commentsService.listCommentsPage(postNo, pageMaker);
		      
		      log.info("list : " + list);

		      map.put("list", list);
		      map.put("pageMaker", pageMaker);

		      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		    }
		    log.info("entity send Success... ");
		    return entity;
		  }
	
	
	
	@RequestMapping(value = "/{comNo}", method = {RequestMethod.PUT, RequestMethod.PATCH}) //댓글수정
	  public ResponseEntity<String> modComments(@PathVariable("comNo") int comNo, @RequestBody CommentsVO vo) {

		    ResponseEntity<String> entity = null;
		    try {
		      vo.setComNo(comNo);
		      log.info("CommentsVO toString : " + vo.toString());
		      commentsService.modifyComments(vo);

		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }
		    log.info("comments modify entity send Success... ");
		    return entity;
		  }
	
	
	@RequestMapping(value = "/{comNo}", method = {RequestMethod.DELETE}) //댓글삭제
	  public ResponseEntity<String> delComments(@PathVariable("comNo") int comNo) {
			
			log.info("comments delete start...");
			
		    ResponseEntity<String> entity = null;
		    try {
		     // vo.setComNo(comNo);
		     // log.info("CommentsVO toString : " + vo.toString());
		      commentsService.delComments(comNo);

		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }
		    log.info("comments modify entity send Success... ");
		    return entity;
		  }
		
	
	
	
	  	
	
		


		
	}////////////////////////////
