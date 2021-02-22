package com.team2.service;

import java.util.List;

import com.team2.domain.Criteria;
import com.team2.domain.GroupReplyVO;

public interface GroupReplyService {

  public int replyCount(GroupReplyVO vo) throws Exception;

  public List<GroupReplyVO> listReply(GroupReplyVO vo) throws Exception;

  public void addReply(GroupReplyVO vo) throws Exception;

  public void modifyReply(GroupReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;
}
