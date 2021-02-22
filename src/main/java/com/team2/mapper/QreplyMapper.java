package com.team2.mapper;

import java.util.List;

import com.team2.domain.QNACriteria;
import com.team2.domain.QreplyVO;

public interface QreplyMapper {

   //댓글 페이지
	List<QreplyVO> listPaging(Integer answerNo, QNACriteria cri) throws Exception;

	int countreply(Integer answerNo) throws Exception;
 
    // 댓글 목록
    public List<QreplyVO> read(Integer answerNo) throws Exception;
 
    // 댓글 작성
    public int write(QreplyVO qvo) throws Exception;
    
    // 댓글 수정
    public int update(QreplyVO qvo) throws Exception;
 
    // 댓글 삭제
    public int delete(int rno) throws Exception;



	
	
	
}









