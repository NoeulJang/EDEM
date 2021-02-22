package com.team2.mapper;

import java.util.Date;

import com.team2.domain.UserVO;
import com.team2.dto.LoginDTO;

public interface UserMapper {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	
	public UserVO checkUserWithSessionKey(String value);

	public Integer countMyFollowers(Integer memno);
	
}
