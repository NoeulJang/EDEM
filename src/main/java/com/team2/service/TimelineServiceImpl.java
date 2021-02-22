package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.TimelineSearchCriteria;
import com.team2.domain.TimelineVO;
import com.team2.domain.UserVO;
import com.team2.dto.TimelineDTO;
import com.team2.mapper.TimelineMapper;


@Service
public class TimelineServiceImpl implements TimelineService {
	

	@Autowired
	private TimelineMapper timelineMapper;
	
	@Override
	public UserVO userInfo(int memno) throws Exception{
		return timelineMapper.userInfo(memno);
	}

	@Transactional
	@Override
	public List<TimelineVO> listSearchCriteria(TimelineDTO dto) throws Exception {

		return timelineMapper.listSearchCriteria(dto);
	}

	
	@Override
	public TimelineVO read(Integer postNo) throws Exception{
		return timelineMapper.read(postNo);
	}
	
	@Override
	public TimelineVO read(TimelineVO timelineVO) throws Exception{
		return timelineMapper.read(timelineVO);
	}

	@Override
	public int listSearchCount(TimelineSearchCriteria cri) throws Exception {

		return timelineMapper.listSearchCount(cri);
	}
	
	@Override
	public int flistSearchCount(TimelineDTO dto) throws Exception {

		return timelineMapper.flistSearchCount(dto);
	}

	@Transactional
	@Override
	public void insert(TimelineVO timeline) throws Exception {

		timelineMapper.insert(timeline);

		String[] files = timeline.getFiles();

		if (files == null) {
			
		    timelineMapper.nullAttach(files);
			return;
		}

		for (String fileName : files) {
			timelineMapper.addAttach(fileName);
		}
		System.out.println(files);

	}

	@Override
	public void update(TimelineVO timeline) throws Exception {
		timelineMapper.update(timeline);
		
		Integer postNo = timeline.getPostNo();
		
		String[] files = timeline.getFiles();

		if (files == null) {
			System.out.println("aaaaa");
			return;
		}

		for (String fileName : files) {
			timelineMapper.deleteAttach(postNo);
			System.out.println("첨부파일 딜리트 성공");
			timelineMapper.replaceAttach(fileName);
		}
		System.out.println(files);
		
	}

	@Transactional
	@Override
	public void delete(TimelineVO timeline) throws Exception {
		timelineMapper.delete(timeline);
	}
	
	@Override
	public int followBtn(int myno, int memno) throws Exception {
		return timelineMapper.followBtn(myno, memno);
	}
	
	@Transactional
	@Override
	public void deleteFollow(int myno, int memno) throws Exception{
		timelineMapper.deleteFollowing(myno, memno);
		timelineMapper.deleteFollower(myno, memno);
	}
	
	@Transactional
	@Override
	public void insertFollow(int myno, int memno) throws Exception{
		timelineMapper.insertFollow(myno, memno);
	}


}
