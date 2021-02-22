package com.team2.mapper;

import java.util.List;

import com.team2.domain.QNACriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.QNASearchCriteria;

public interface QnaMapper {

	
    // 게시물 리스트
	
	public List<QnaVO> list() throws Exception;
    
    public List<QnaVO> listPage(int page) throws Exception;
   
    public int countPaging(QNASearchCriteria scri) throws Exception;
    
    //게시물 검색
    
    public List<QnaVO> listSearchCriteria(QNASearchCriteria scri)throws Exception;
    
    public int listSearchCount(QNASearchCriteria scri)throws Exception;
    
    
    // 게시물 등록
    public void write(QnaVO qna) throws Exception;
    
    // 게시물 수정
    public void update(QnaVO qna) throws Exception;
    
    // 게시물 삭제
    public void delete(Integer answerNo) throws Exception;

	// 게시물 읽기
    public QnaVO read(Integer answerNo) throws Exception;
    
    // 게시물 조회수
    public void count(int answerNo) throws Exception;



	

}
