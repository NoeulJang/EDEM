package com.team2.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.team2.dto.MemberDTO;
import com.team2.mapper.MemberMapper;
import com.team2.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberMapper memberMapper;

	@Override
	public void register(MemberVO vo) throws Exception {
		System.out.println("registerService");
		memberMapper.selectMemberList(vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		return memberMapper.idChk(vo);
	}

	// 비밀번호 찾기 이메일발송
	@Override
	public int checkMember(MemberVO vo) throws Exception {
		return memberMapper.checkMember(vo);
	}

	@Override
	public void SearchPw(HttpServletResponse resp, MemberVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void findPw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
	}
	@Override
	public void  changePwd(MemberDTO dto)throws Exception{
		memberMapper.changePwd(dto);
	
	}

	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// TODO Auto-generated method stub
		
	}

}