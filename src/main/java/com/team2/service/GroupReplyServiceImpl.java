package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.domain.Criteria;
import com.team2.domain.GroupReplyVO;
import com.team2.mapper.GroupReplyMapper;

@Service
public class GroupReplyServiceImpl implements GroupReplyService {

	@Autowired
	private GroupReplyMapper groupReplyMapper;
	
	@Override
	public int replyCount(GroupReplyVO vo) throws Exception{
		return groupReplyMapper.replyCount(vo);
	}

	@Override
	public List<GroupReplyVO> listReply(GroupReplyVO vo) throws Exception {
		return groupReplyMapper.listReply(vo);
	}
	
	@Override
	public void addReply(GroupReplyVO vo) throws Exception{
		groupReplyMapper.addReply(vo);
	}


	@Override
	public void modifyReply(GroupReplyVO vo) throws Exception {
		groupReplyMapper.modifyReply(vo);
		
	}

	@Override
	public void delete(Integer rno) throws Exception {
		groupReplyMapper.delete(rno);
	}
}
