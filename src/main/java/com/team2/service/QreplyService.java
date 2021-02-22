package com.team2.service;

import java.util.List;

import com.team2.domain.QNACriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.QreplyVO;
import com.team2.domain.QNASearchCriteria;

public interface QreplyService {

	//댓글 조회
	public List<QreplyVO> read(Integer answerNo) throws Exception;

	//댓글 작성
	public void write(QreplyVO qvo) throws Exception;
	
	//댓글수정
	public void update(QreplyVO qvo) throws Exception;

	//댓글삭제
	public void delete(Integer rno) throws Exception;

	//댓글페이징
	List<QreplyVO> getRepliesPaging(Integer answerNo, QNACriteria criteria) throws Exception;

	int countreply(Integer answerNo) throws Exception;

	
	
	

 
	



	
}
