package com.team2.service;


import java.util.List;

import com.team2.domain.TimelineSearchCriteria;
import com.team2.domain.TimelineVO;
import com.team2.domain.UserVO;
import com.team2.dto.TimelineDTO;

public interface TimelineService {

	public UserVO userInfo(int memno) throws Exception;

	public List<TimelineVO> listSearchCriteria(TimelineDTO dto)  throws Exception;
	
  public int listSearchCount(TimelineSearchCriteria cri) throws Exception;
  
  public int flistSearchCount(TimelineDTO dto) throws Exception;
  
  public void insert(TimelineVO timeline) throws Exception;
  
  public void update(TimelineVO timeline) throws Exception; 
 
  public void delete(TimelineVO timeline) throws Exception;
  
  public TimelineVO read(Integer postNo) throws Exception;
  
  public TimelineVO read(TimelineVO timelineVO) throws Exception;
  
  public int followBtn(int myno, int memno) throws Exception;
  
  public void deleteFollow(int myno, int memno) throws Exception;
  
  public void insertFollow(int myno, int memno) throws Exception;
  
  
}
