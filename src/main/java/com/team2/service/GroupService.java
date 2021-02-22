package com.team2.service;

import java.util.List;

import com.team2.domain.GroupCriteria;
import com.team2.domain.GroupJoinVO;
import com.team2.domain.GroupMemberVO;
import com.team2.domain.GroupNewsfeedVO;
import com.team2.domain.GroupVO;
import com.team2.domain.UserVO;
import com.team2.dto.GroupDTO;

public interface GroupService {

	public void registerGroup(GroupVO vo) throws Exception;
	
	public List<GroupVO> listGroup(GroupDTO dto) throws Exception;
	
	public List<GroupVO> listMyGroup(GroupDTO dto) throws Exception;
	
	public int count(GroupDTO dto) throws Exception;
	
	public int myCount(GroupDTO dto) throws Exception;
	
	public int canReadGroup(GroupVO groupVO) throws Exception;
	
	public GroupVO groupOne(GroupVO groupVO) throws Exception;
	
	public int joiningGroup(GroupVO groupVO) throws Exception;
	
	public void joinGroup(GroupJoinVO vo) throws Exception;
	
	public String groupMemAuth(GroupDTO dto) throws Exception;
	
	
	public List<GroupMemberVO> listGroupAddMember(GroupDTO dto) throws Exception;
	
	public List<GroupMemberVO> listGroupMemberAdmin(GroupDTO dto) throws Exception;
	
	public int countAddMember(GroupVO vo) throws Exception;
	
	public int countGroupMemberAdmin(GroupVO vo) throws Exception;

	
	public void addMember(GroupVO groupVO) throws Exception;
	
	public void rejectAddMember(GroupVO groupVO) throws Exception;
	
	public void removeMember(GroupVO groupVO) throws Exception;
	
	public void removeGroup(GroupVO groupVO) throws Exception;
	
	//public List<GroupNewsfeedVO> groupNewsfeed(GroupCriteria cri) throws Exception;
	
	public List<GroupNewsfeedVO> groupNewsfeed(GroupDTO dto) throws Exception;
	
	public int countGroupNewsfeed (GroupDTO dto) throws Exception;
	
	public void groupNewsfeedWrite(GroupNewsfeedVO vo) throws Exception;
}
