package com.team2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.domain.CommentsVO;
import com.team2.domain.PageMaker;
import com.team2.dto.CommentsDTO;
import com.team2.mapper.CommentsMapper;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	private CommentsMapper commentsMapper;
	
	/*
	 * @Inject private SqlSession session;
	 */
	public void addComments(CommentsVO vo) throws Exception {
		log.warn("... addCommentsService Start ...");
		System.out.println("... addCommentsService Start ...");
		commentsMapper.addComments(vo);
		
		
	}
	
	 
	public int commentsCount(int postNo) throws Exception{
		log.warn("..... commentsCount Start .....");
		return commentsMapper.commentsCount(postNo);
	}
	 
	
	public List<CommentsDTO> listCommentsPage(int postNo, PageMaker pageMaker) throws Exception {
		log.warn("..... check listCommentsPage .....");
		List<CommentsDTO> dto = commentsMapper.listCommentsPage(postNo, pageMaker);
		/*
		 Map<String, Object> paramMap = new HashMap<>();  
		 paramMap.put("postNo", postNo); 
		 paramMap.put("pageMaker", pageMaker);
		 */
		
		return dto;
	}
	
	
	public void modifyComments(CommentsVO vo) throws Exception {
		log.warn("..... check modifyCommentsPage .....");
		commentsMapper.modifyComments(vo);
	}
	
	public void delComments(int comNo) throws Exception {
		log.warn("..... check modifyCommentsPage .....");
		commentsMapper.delComments(comNo);
	}
	
	
	
}
