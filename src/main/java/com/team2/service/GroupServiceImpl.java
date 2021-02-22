package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.GroupCriteria;
import com.team2.domain.GroupJoinVO;
import com.team2.domain.GroupMemberVO;
import com.team2.domain.GroupNewsfeedVO;
import com.team2.domain.GroupVO;
import com.team2.dto.GroupDTO;
import com.team2.mapper.GroupMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupMapper groupMapper;

	@Transactional
	@Override
	public void registerGroup(GroupVO vo) throws Exception {

		System.out.println("StartRegisterService");
		// log.info("StartRegisterService"+vo.toString());
		groupMapper.registerGroup(vo);
		
		groupMapper.registerGroupMember(vo);
		String[] files = vo.getFiles();

		if (files == null) {
			groupMapper.addDefaultAttach();
		} else {
			for (String fileName : files) {
				groupMapper.addAttach(fileName);
			}
		}
	}

	@Override
	public List<GroupVO> listGroup(GroupDTO dto) throws Exception {
		return groupMapper.listGroup(dto);
	}
	
	@Override
	public List<GroupVO> listMyGroup(GroupDTO dto) throws Exception {
		System.out.println("MyListService");
		return groupMapper.listMyGroup(dto);
	}
	
	@Override
	public int count(GroupDTO dto) throws Exception {
		return groupMapper.count(dto);
	}
	
	@Override
	public int myCount(GroupDTO dto) throws Exception {
		System.out.println("MyCountService");
		return groupMapper.myCount(dto);
	}
	
	@Override
	public int canReadGroup(GroupVO groupVO) throws Exception {
		return groupMapper.canReadGroup(groupVO);
	}
	
	@Override
	public GroupVO groupOne(GroupVO groupVO) throws Exception{
		return groupMapper.groupOne(groupVO);
	}
	@Override
	public int joiningGroup(GroupVO groupVO) throws Exception {
		return groupMapper.joiningGroup(groupVO);
	}
	
	@Override
	public void joinGroup(GroupJoinVO vo)throws Exception {
		groupMapper.joinGroup(vo);
	}
	
	@Override
	public String groupMemAuth(GroupDTO dto) throws Exception {
		return groupMapper.groupMemAuth(dto);
	}

	
	@Override
	public List<GroupMemberVO> listGroupAddMember(GroupDTO dto)throws Exception {
		return groupMapper.listGroupAddMember(dto);
	}
	
	@Override
	public List<GroupMemberVO> listGroupMemberAdmin(GroupDTO dto) throws Exception{
		return groupMapper.listGroupMemberAdmin(dto);
	}
	
	@Override
	public int countAddMember(GroupVO vo) throws Exception{
		return groupMapper.countAddMember(vo);
	}
	
	@Override
	public int countGroupMemberAdmin(GroupVO vo) throws Exception{
		return groupMapper.countGroupMemberAdmin(vo);
	}
	
	
	@Transactional
	@Override
	public void addMember(GroupVO vo) throws Exception{
		groupMapper.addMember(vo);
		groupMapper.removeAddMember(vo);
	}
	
	@Override
	public void rejectAddMember(GroupVO vo) throws Exception{
		groupMapper.removeAddMember(vo);
	}
	
	@Override
	public void removeMember(GroupVO vo) throws Exception{
		groupMapper.removeMember(vo);
	}
	
	@Override
	public void removeGroup(GroupVO vo) throws Exception{
		groupMapper.removeGroup(vo);
	}
	
	/*
	 * @Override public List<GroupNewsfeedVO> groupNewsfeed(GroupCriteria cri)
	 * throws Exception{ return groupMapper.groupNewsfeed(cri); }
	 */
	
	@Override
	public List<GroupNewsfeedVO> groupNewsfeed(GroupDTO dto) throws Exception{
		return groupMapper.groupNewsfeed(dto);
	}
	
	@Override
	public int countGroupNewsfeed(GroupDTO dto) throws Exception{
		return groupMapper.countGroupNewsfeed(dto);
	}
	
	@Transactional
	@Override
	public void groupNewsfeedWrite(GroupNewsfeedVO vo) throws Exception{
		groupMapper.groupNewsfeedWrite(vo);
		
		System.out.println("StartGroupNewsfeedWriteService");
		
		String[] files = vo.getFiles();
		log.info(vo.toString());

		if (files == null) {
			System.out.println("DefaultGroupNewsfeedAttach");
			groupMapper.defaultGroupNewsfeedAttach(vo);
		} else {
			for (String fileName : files) {
				groupMapper.groupNewsfeedAttach(fileName);
			}
		}
	}
}
