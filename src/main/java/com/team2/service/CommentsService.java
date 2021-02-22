package com.team2.service;

import java.util.List;

import com.team2.domain.CommentsVO;
import com.team2.domain.PageMaker;
import com.team2.dto.CommentsDTO;


public interface CommentsService {
	
	public void addComments(CommentsVO vo) throws Exception;
	
	public int commentsCount(int postNo) throws Exception;
	
	public List<CommentsDTO> listCommentsPage(int postNo, PageMaker pageMaker) throws Exception;
	
	public void modifyComments(CommentsVO vo) throws Exception; 
	
	public void delComments(int comNo) throws Exception; 
	
}
