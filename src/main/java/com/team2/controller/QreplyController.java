
package com.team2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team2.domain.QNACriteria;
import com.team2.domain.QNAPageMaker;
import com.team2.domain.QreplyVO;
import com.team2.service.QreplyService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@RestController
@RequestMapping("/reply")

public class QreplyController {

	private QreplyService qreplyService;

	@Inject
	public QreplyController(QreplyService qreplyService) {
		this.qreplyService = qreplyService;
	}

	 //댓글 등록
	 @RequestMapping(value = "", method = RequestMethod.POST)

	 public ResponseEntity<String> write(@RequestBody QreplyVO qvo) {
	 
		 log.info("글쓰기@@@@@@@@@@@@@@ : " + 23);
		 
		 ResponseEntity<String> entity = null; 
	 
		 try { 
		 
			 qreplyService.write(qvo);
	     
			 entity = new ResponseEntity<String>("regSuccess", HttpStatus.OK); 
	     
		 } catch (Exception e) { 
	    	 e.printStackTrace(); entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); } 
		 
		 return entity; 
	 
	 } 
	 
	 //댓글 읽기
     @RequestMapping(value ="/read/{answerNo}", method =RequestMethod.GET) 
     public ResponseEntity<List<QreplyVO>>read(@PathVariable("answerNo") Integer answerNo) {
	 
    	 log.info("@@@@@@@@@@#$%#$@@@@@@ : " + answerNo);
    	 
    	 
    	 ResponseEntity<List<QreplyVO>> entity = null; 
	 
    	 try { 
		entity = new ResponseEntity<List<QreplyVO>>(qreplyService.read(answerNo), HttpStatus.OK);
	 
    	 } 
	 
	 catch (Exception e) { e.printStackTrace(); 
	 entity = new ResponseEntity<List<QreplyVO>>  (HttpStatus.BAD_REQUEST); } 
	
	 return entity; 
	 
     }

     //댓글 수정
     @RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
     public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody QreplyVO qvo) {
         ResponseEntity<String> entity = null;
         try {
             qvo.setRno(rno);
             qreplyService.update(qvo);
             entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
         } catch (Exception e) {
             e.printStackTrace();
             entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
         }
         return entity;
     }
      
     //댓글 삭제
     @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
     public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {
         ResponseEntity<String> entity = null;
         try {
             qreplyService.delete(rno);
             entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
         } catch (Exception e) {
             e.printStackTrace();
             entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
         }
         return entity;
     }
     
     //댓글 페이징
     @RequestMapping(value = "/{answerNo}/{page}", method = RequestMethod.GET)
     public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("answerNo") Integer answerNo,
                                                           @PathVariable("page") Integer page) {

         ResponseEntity<Map<String, Object>> entity = null;

         try {

             QNACriteria cri = new QNACriteria();
             cri.setPage(page);

             List<QreplyVO> reply = qreplyService.getRepliesPaging(answerNo, cri);
             int countreply = qreplyService.countreply(answerNo);

             QNAPageMaker pageMaker = new QNAPageMaker();
             pageMaker.setCri(cri);
             pageMaker.setTotalCount(countreply);

             Map<String, Object> map = new HashMap<>();
             map.put("reply", reply);
             map.put("pageMake", pageMaker);

             entity = new ResponseEntity<>(map, HttpStatus.OK);

         } catch (Exception e) {

             e.printStackTrace();
             entity = new ResponseEntity<>(HttpStatus.OK);

         }

         return entity;
     }
     
     
     
     
     
     
}
