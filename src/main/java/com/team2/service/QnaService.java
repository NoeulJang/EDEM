package com.team2.service;

import java.util.List;

import com.team2.domain.QNACriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.QNASearchCriteria;

public interface QnaService {

	public List<QnaVO> list()throws Exception;
	
    public int listCountCriteria(QNASearchCriteria scri) throws Exception;
	
    public List<QnaVO> listSearchCriteria(QNASearchCriteria scri) throws Exception;

    public int listSearchCount(QNASearchCriteria scri) throws Exception;
     
    public void write(QnaVO qna) throws Exception;
   
    public QnaVO read(Integer answerno) throws Exception;
    
    public void delete(Integer answerno) throws Exception;
    
    public void update(QnaVO qna) throws Exception;

	
	
	

	
	
	

    

    

	



	
}
