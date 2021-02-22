package com.team2.mapper;

import java.util.List;

import com.team2.domain.GroupReplyVO;

public interface GroupReplyMapper {

	public int replyCount(GroupReplyVO vo) throws Exception;

	public List<GroupReplyVO> listReply(GroupReplyVO vo) throws Exception;
	
	public void addReply(GroupReplyVO vo) throws Exception;
	
	public void modifyReply(GroupReplyVO vo) throws Exception;

	public void delete(int rno) throws Exception;
	
}









