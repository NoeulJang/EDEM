package com.team2.controller;

import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.dto.MemberDTO;
import com.team2.service.MemberService;
import com.team2.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/main/*")
public class MemberController {

	@Inject
	MemberService service;

	// 회원가입 get
	@RequestMapping(value = "/indexRegister", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		log.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/indexRegister", method = RequestMethod.POST) // 포스트 전달경로
	public String postRegister(MemberVO vo) throws Exception {

		log.info("post register");
		vo.setMemimg("/0000/00/00/s_unnamed.jpg");
		vo.setCovimg("/0000/00/00/s_unnamedcov.png");
		log.info(vo.toString());

		String year = vo.getYear();

		String month = vo.getMonth();
		int monthSize = month.length();
		if (monthSize == 1) {
			month = "0" + month;
		}

		String day = vo.getDay();
		int daySize = day.length();
		if (daySize == 1) {
			day = "0" + day;
		}

		String dateBirth = year + month + day;
		vo.setBirth(dateBirth);

		log.info(vo.toString());

		service.register(vo);

		return "/main/index";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(@RequestParam String id,MemberVO vo) throws Exception {
		vo.getId();
		return service.idChk(vo);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/indexSearchingPwd", method = RequestMethod.GET)
	public void indexSearchingPwdGET() throws Exception {
	}

	@RequestMapping(value = "/indexSearchingPwd", method = RequestMethod.POST)
	public String indexSearchingPwdPOST(@ModelAttribute MemberVO vo, HttpServletRequest response, HttpSession sessionA) throws Exception {
		/* response.setContentType("text/html;charset=utf-8"); */

		int check = service.checkMember(vo);
		log.info(vo.toString());

		if (check == 0) {
			System.out.println("dddd");
		}

		System.out.println("mail Send Start!!");
		// mail server 설정
		String host = "smtp.naver.com";
		String user = "noeul0913@naver.com";
		String password = "wkd13124!";// 자신의 네이버 패스워드

		// 메일 받을 주소
		// SMTP 서버 정보를 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465); //숫자 : 해당 이메일 서비스 회사 고정 번호?
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		log.info("email : " + vo.getEmail());
		// email 전송

		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "bootstrap"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));
			// msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 메일 제목
			msg.setSubject("Every Day Every Moment 비밀번호 인증메일입니다.");
			// 메일 내용
			msg.setText("인증번호:" + temp);
			Transport.send(msg);
			System.out.println("이메일 전송");
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpSession saveKey = response.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		String id = vo.getId();
		log.info("id : " + id);
		sessionA.setAttribute("ChangeUserId", id);

		return "/main/indexChangePwd";
	}
	/*
	 * @RequestMapping(value = "/indexChangePwd", method = RequestMethod.GET) public
	 * void indexChangePwdGET() throws Exception {
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/indexChangePwd", method = RequestMethod.POST)
	public String indexChangePwdPOST(HttpSession session, MemberDTO dto) throws Exception {

		log.info(dto);
		String ChangeUserId = (String) session.getAttribute("ChangeUserId");
		String AuthenticationKey = (String) session.getAttribute("AuthenticationKey");
		
		System.out.println("pwd...." + AuthenticationKey + "userId...." + ChangeUserId);
		
		dto.setId(ChangeUserId);
		
		/*
		 * Map<String, Boolean> errors = new HashMap<>();
		 * 
		 * req.setAttribute("errors", errors);
		 * 
		 * if (!password.equals(repassword)) errors.put("passEquals", Boolean.TRUE); if
		 * (!AuthenticationUser.equals(AuthenticationKey)) errors.put("keyEquals",
		 * Boolean.TRUE); if (!errors.isEmpty()) { return "/indexChangePwd"; }
		 */
		
		System.out.println("StartChangePwdService....");
		service.changePwd(dto);
		System.out.println("endChangePwdService....");
		
		return "/main/indexChangePwdSuccess";

		}

	// 비밀번호 변경 성공
	@RequestMapping(value = "/indexChangePwdSuccess", method = RequestMethod.POST)
	public void indexChangePwdSuccessGET() throws Exception {
	}

	// service.findPw(response, vo);
}
