package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.domain.CommentsVO;
import com.team2.domain.PageMaker;
import com.team2.dto.CommentsDTO;

public interface CommentsMapper {
	
	
	public void addComments(CommentsVO vo) throws Exception;
	
	public List<CommentsDTO> listCommentsPage(@Param("postNo") int postNo, @Param("pageMaker") PageMaker pageMaker) throws Exception;
	
	public int commentsCount(int postNo) throws Exception;
	
	public void modifyComments(CommentsVO vo) throws Exception; 
	
	public void delComments(int comNo) throws Exception; 
	
}
