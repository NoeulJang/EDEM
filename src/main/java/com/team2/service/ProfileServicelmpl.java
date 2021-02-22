package com.team2.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.UserVO;
import com.team2.dto.UserDTO;
import com.team2.mapper.ProfileMapper;

@Service
public class ProfileServicelmpl implements ProfileService {

	@Autowired
	private ProfileMapper profilemapper;

	@Override
	public UserVO read(int memno) throws Exception {

		return profilemapper.read(memno);
	}

	@Override
	public UserDTO modify(UserVO vo) throws Exception {

		System.out.println("modify service start.. ");
		return profilemapper.modify(vo);

	}

	@Override
	public void password(UserVO vo) throws Exception {
		System.out.println("패스워드 서비스 시작");
		profilemapper.password(vo);

	}

	@Override
	public void delete(UserVO vo) throws Exception {

		System.out.println("서비스시작" + vo);
		profilemapper.delete(vo);
		 System.out.println("서비스종료");

	}
}
