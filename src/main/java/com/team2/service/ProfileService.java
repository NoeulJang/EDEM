package com.team2.service;


import com.team2.domain.UserVO;
import com.team2.dto.UserDTO;


public interface ProfileService {

	public UserVO read(int memno) throws Exception;
	
	public UserDTO modify(UserVO vo) throws Exception;
	
	public void password(UserVO vo) throws Exception;

	public void delete(UserVO vo) throws Exception;
}
