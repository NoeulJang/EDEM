package com.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.QNACriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.QreplyVO;
import com.team2.domain.QNASearchCriteria;
import com.team2.mapper.QnaMapper;
import com.team2.mapper.QreplyMapper;

@Service
public class QreplyServiceImpl implements QreplyService {

	@Inject
	private QreplyMapper qreply;

	
	@Override
	public List<QreplyVO> read(Integer answerNo) throws Exception {
		
		return qreply.read(answerNo);
	
		}

	@Override
	public void write(QreplyVO qvo) throws Exception {
		qreply.write(qvo);
		
	}

	@Override
	public void update(QreplyVO qvo) throws Exception {
		qreply.update(qvo);
		
	}

	@Override
	public void delete(Integer rno) throws Exception {
		qreply.delete(rno);
		
	}

	
	@Override
	public List<QreplyVO> getRepliesPaging(Integer answerNo, QNACriteria cri) throws Exception {
	    return qreply.listPaging(answerNo, cri);
	}

	@Override
	public int countreply(Integer answerNo) throws Exception {
	    return qreply.countreply(answerNo);
	
	}
	
}