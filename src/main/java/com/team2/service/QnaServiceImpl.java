package com.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.QNACriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.QNASearchCriteria;
import com.team2.mapper.QnaMapper;

import jdk.internal.org.jline.utils.Log;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaMapper qnaMapper;

	@Override
	public List<QnaVO> list() throws Exception{
		
		return qnaMapper.list();
	}

	
	@Override
	public int listCountCriteria(QNASearchCriteria scri) throws Exception {
		
		return qnaMapper.countPaging(scri);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnaVO read(Integer answerno) throws Exception {
		
		qnaMapper.count(answerno);
		return qnaMapper.read(answerno);
	}
	
		
	@Override
	public void write(QnaVO qna) throws Exception {
		qnaMapper.write(qna);
		
	}
			
	@Override
	public void delete(Integer answerno) throws Exception {
		qnaMapper.delete(answerno);
		
	}

	@Override
	public void update(QnaVO qna) throws Exception {
		qnaMapper.update(qna);
		
	}

	@Override
	public List<QnaVO> listSearchCriteria(QNASearchCriteria scri) throws Exception {
		
		return qnaMapper.listSearchCriteria(scri);
	}

	@Override
	public int listSearchCount(QNASearchCriteria scri) throws Exception {
		
		return qnaMapper.listSearchCount(scri);
	}

	

	

}	
	
