package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.domain.TimelineSearchCriteria;
import com.team2.domain.TimelineVO;
import com.team2.domain.UserVO;
import com.team2.dto.TimelineDTO;

public interface TimelineMapper {

	/* void list(TimelineVO timeline) throws Exception; */
	
	public UserVO userInfo(int memno) throws Exception;

	public List<TimelineVO> listSearchCriteria(TimelineDTO dto) throws Exception;

	public TimelineVO read(Integer postNo) throws Exception;

	public TimelineVO read(TimelineVO timelineVO) throws Exception;

	public int listSearchCount(TimelineSearchCriteria cri) throws Exception;
	
	public int flistSearchCount(TimelineDTO dto) throws Exception;

	public void insert(TimelineVO timeline) throws Exception;

	public void update(TimelineVO timeline) throws Exception;

	public void delete(TimelineVO timeline) throws Exception;

	public void addAttach(String fullName) throws Exception;

	public void deleteAttach(Integer postNo) throws Exception;

	public void replaceAttach(String fullName) throws Exception;

	public void nullAttach(String[] files) throws Exception;
	
	public int followBtn(@Param("myno") int myno, @Param("memno")int memno) throws Exception;
	
	public void deleteFollowing(@Param("myno") int myno, @Param("memno")int memno) throws Exception;
	
	public void deleteFollower(@Param("myno") int myno, @Param("memno")int memno) throws Exception;
	  
	public void insertFollow(@Param("myno") int myno, @Param("memno")int memno) throws Exception;

	
}
