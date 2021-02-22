package com.team2.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.domain.GroupCriteria;
import com.team2.domain.GroupJoinVO;
import com.team2.domain.GroupMemberVO;
import com.team2.domain.GroupNewsfeedVO;
import com.team2.domain.GroupPageMaker;
import com.team2.domain.GroupVO;
import com.team2.domain.UserVO;
import com.team2.dto.GroupDTO;
import com.team2.service.GroupService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/group/*")
public class GroupController {

	@Inject
	private GroupService service;

	@RequestMapping(value = "/groupIndex")
	public void groupIndex(HttpSession session, @RequestParam(required = false) String keyword,
			@RequestParam(required = false) String type) throws Exception {
		log.info("getGroupIndex!");
		log.info("Firestkeyword" + keyword);
		session.setAttribute("keyword", keyword);
		session.setAttribute("type", type);
	}

	@ResponseBody
	@RequestMapping(value = "/groupIndex/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> groupIndexGet(HttpSession session, @PathVariable("page") Integer page) {

		String keyword = (String) session.getAttribute("keyword");

		log.info("controll!");
		log.info("keyword!" + keyword);

		GroupCriteria cri = new GroupCriteria();
		GroupDTO dto = new GroupDTO();
		GroupPageMaker pageMaker = new GroupPageMaker();

		cri.setPage(page);

		dto.setKeyword("%" + keyword + "%");
		dto.setPageStart(((cri.getPage() - 1) * cri.getPerPageNum()) + 1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());

		log.info("getPageStart : " + dto.getPageStart() + "getSize : " + dto.getSize());

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<GroupVO> list = service.listGroup(dto);

			map.put("list", list);

			// map.put("check", check);

			// 필요없는 로직이지만 확인에 필요start

			pageMaker.setCri(cri);

			int groupCount = service.count(dto);
			log.info("IndexCount" + groupCount);

			pageMaker.setTotalCount(groupCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/groupMyIndex/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> groupMyIndexGet(HttpSession session,
			@PathVariable("page") Integer page) {
		String keyword = (String) session.getAttribute("keyword");
		UserVO user = (UserVO) session.getAttribute("member");

		log.info("MyIndexControll!");
		log.info("keyword!" + keyword);
		log.info("UserVo!!" + user.toString());

		GroupCriteria cri = new GroupCriteria();
		GroupDTO dto = new GroupDTO();

		cri.setPage(page);
		dto.setMemno(user.getMemno());
		dto.setKeyword("%" + keyword + "%");
		dto.setPageStart(((cri.getPage() - 1) * cri.getPerPageNum()) + 1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());

		log.info("getPageStart : " + dto.getPageStart() + "getSize : " + dto.getSize());

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<GroupVO> list = service.listMyGroup(dto);

			map.put("list", list);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/groupRegister", method = RequestMethod.GET)
	public void groupRegistGet() throws Exception {
		log.info("GetRegist Group...!");
	}

	@RequestMapping(value = "/groupRegister", method = RequestMethod.POST)
	public String groupRegistPOST(HttpSession session, Model model, UserVO userVO, GroupVO groupVO) {

		log.info("POSTRegist Group...!");
		userVO = (UserVO) session.getAttribute("member");
		log.info(userVO.toString());

		groupVO.setMemno(userVO.getMemno());
		log.info(groupVO.toString());

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		model.addAttribute("joinModel", groupVO);

		if (groupVO.getGrname() == null || groupVO.getGrname().isEmpty())
			errors.put("grname", Boolean.TRUE);
		if (groupVO.getGrci() == null || groupVO.getGrci().isEmpty())
			errors.put("grci", Boolean.TRUE);
		if (groupVO.getGrintro() == null || groupVO.getGrintro().isEmpty())
			errors.put("grintro", Boolean.TRUE);
		if (!errors.isEmpty()) {
			return "/group/groupRegister";
		}

		try {
			service.registerGroup(groupVO);
			String message = "그룹 생성에 성공하였습니다!";
			String location = "/group/groupIndex";
			model.addAttribute("message", message);
			model.addAttribute("location", location);
			return "/group/groupResult";
		} catch (Exception e) {
			return "/group/groupRegister";
		}
	}

	@RequestMapping(value = "/confirmGroup", method = RequestMethod.GET)
	public String confirmGroup(HttpSession session, GroupVO groupVO, Model model) throws Exception {

		log.info("startConfirmGroup");
		UserVO userVO = (UserVO) session.getAttribute("member");
		groupVO.setMemno(userVO.getMemno());
		log.info(groupVO.toString());

		session.setAttribute("groupInfo", groupVO);

		if (service.joiningGroup(groupVO) == 1) {
			String message = "가입진행중인 그룹입니다!";
			String location = "/group/groupIndex";
			model.addAttribute("message", message);
			model.addAttribute("location", location);
			return "/group/groupResult";
		}
		if (service.canReadGroup(groupVO) == 0) {
			return "/group/groupJoinCheck";
		}
		return "redirect:groupNewsfeed";
	}

	@RequestMapping(value = "/groupJoin", method = RequestMethod.GET)
	public void groupJoinGet(HttpSession session, GroupVO groupVO, Model model) throws Exception {
		log.info("GetGroupJoin...!");
		groupVO = (GroupVO) session.getAttribute("groupInfo");
		log.info("before groupVO" + groupVO);

		groupVO = service.groupOne(groupVO);
		log.info("after groupVO" + groupVO);

		model.addAttribute("Intro", groupVO);

	}

	@RequestMapping(value = "/groupJoin", method = RequestMethod.POST)
	public String groupJoinPost(HttpSession session, GroupJoinVO vo, Model model) throws Exception {
		log.info("PostGroupJoin...!");
		UserVO userVO = (UserVO) session.getAttribute("member");
		vo.setSubcmemno(userVO.getMemno());
		log.info(vo.toString());
		service.joinGroup(vo);

		String message = "가입신청 되었습니다!";
		String location = "/group/groupIndex";
		model.addAttribute("message", message);
		model.addAttribute("location", location);

		return "/group/groupResult";
	}

	// 그룹 뉴스피드 첫 화면에 멤버권한과 게시물 갯수를 띄우기 위함
	@RequestMapping(value = "/groupNewsfeed", method = RequestMethod.GET)
	public void groupNewsfeed(HttpSession session, GroupVO vo, Model model, GroupCriteria cri) throws Exception {
		log.info("GetGroupNewsfeed...!");
		UserVO userVO = (UserVO) session.getAttribute("member");
		vo = (GroupVO) session.getAttribute("groupInfo");

		vo = service.groupOne(vo);

		model.addAttribute("Intro", vo);

		GroupDTO dto = new GroupDTO();
		dto.setGrno(vo.getGrno());
		dto.setMemno(userVO.getMemno());

		String auth = service.groupMemAuth(dto);
		if (auth.equals("관리자")) {
			model.addAttribute("auth", "관리자");
		} else if (auth.equals("일반회원")) {
			model.addAttribute("auth", "일반회원");
		}

		int totalCount = service.countGroupNewsfeed(dto);

		model.addAttribute("totalCount", totalCount);
	}

	// 뉴스피드 띄우기
	@ResponseBody
	@RequestMapping(value = "/groupNewsfeedGet", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> groupNewsfeedGet(HttpSession session, GroupCriteria cri)
			throws Exception {

		log.info("responseEntity!");
		GroupDTO dto = new GroupDTO();
		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");

		dto.setGrno(vo.getGrno());
		dto.setPageStart(((cri.getPage() - 1) * cri.getPerPageNum()) + 1);
		dto.setSize(cri.getPage() * cri.getPerPageNum());

		log.info(dto.toString());
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();

			List<GroupNewsfeedVO> list = service.groupNewsfeed(dto);

			log.info("list : " + list.toString());
			map.put("list", list);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 뷰 페이지를 띄우고 가입 신청한 멤버가 있는지 없는지
	@RequestMapping(value = "/groupAddMember", method = RequestMethod.GET)
	public void groupAddMember(HttpSession session, Model model) throws Exception {
		log.info("getGroupAddmember!");
		GroupVO groupVO = (GroupVO) session.getAttribute("groupInfo");

		model.addAttribute("addMemberCount", service.countAddMember(groupVO));
	}

	// 가입되어 있는 멤버의 수를 세고 뷰페이지를 띄움
	@RequestMapping(value = "/groupMemberAdmin", method = RequestMethod.GET)
	public void groupMemberAdmin(HttpSession session, Model model) throws Exception {
		log.info("getgroupMemberAdmin!");
		GroupVO groupVO = (GroupVO) session.getAttribute("groupInfo");

		model.addAttribute("memberAdminCount", service.countGroupMemberAdmin(groupVO));
	}

	@ResponseBody
	@RequestMapping(value = "/groupAddMemberList", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> groupAddMemberGet(HttpSession session, GroupCriteria cri)
			throws Exception {

		log.info("getGroupMemberAdminList!");
		GroupDTO dto = new GroupDTO();
		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");

		dto.setGrno(vo.getGrno());
		dto.setPageStart(((cri.getPage() - 1) * (cri.getPerPageNum() - 1)) + 1);
		dto.setSize(cri.getPage() * (cri.getPerPageNum() - 1));

		log.info(dto.toString());

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();

			List<GroupMemberVO> list = service.listGroupAddMember(dto);

			map.put("list", list);

			log.info("list : " + list.toString());

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/groupMemberAdminList", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> groupMemberAdminGet(HttpSession session, GroupCriteria cri)
			throws Exception {

		log.info("getGroupMemberAdminList!");
		GroupDTO dto = new GroupDTO();
		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");

		dto.setGrno(vo.getGrno());
		dto.setPageStart(((cri.getPage() - 1) * (cri.getPerPageNum() - 1)) + 1);
		dto.setSize(cri.getPage() * (cri.getPerPageNum() - 1));

		log.info(dto.toString());

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();

			List<GroupMemberVO> list = service.listGroupMemberAdmin(dto);

			map.put("list", list);

			log.info("list : " + list.toString());

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * @RequestMapping(value = "/groupAddMember", method = RequestMethod.GET) public
	 * void groupAddMemberGet(HttpSession session, GroupCriteria cri, Model model)
	 * throws Exception { log.info("getGroupMemberAdmin!"); GroupVO groupVO =
	 * (GroupVO) session.getAttribute("groupInfo"); UserVO user = (UserVO)
	 * session.getAttribute("member");
	 * 
	 * GroupDTO dto = new GroupDTO(); GroupPageMaker pageMaker = new
	 * GroupPageMaker();
	 * 
	 * dto.setMemno(user.getMemno()); dto.setGrno(groupVO.getGrno());
	 * dto.setPageStart(((cri.getPage() - 1) * (cri.getPerPageNum() + 3)) + 1);
	 * dto.setSize(cri.getPage() * (cri.getPerPageNum() + 3));
	 * 
	 * List<GroupMemberVO> list = service.listGroupAddMember(dto);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * pageMaker.setCri(cri);
	 * 
	 * int groupCount = service.countAddMember(dto); log.info("IndexCount" +
	 * groupCount);
	 * 
	 * pageMaker.setTotalCount(groupCount);
	 * 
	 * model.addAttribute("pageMaker", pageMaker); }
	 */

	/*
	 * @RequestMapping(value = "/groupMemberAdmin", method = RequestMethod.GET)
	 * public void groupMemberAdminGet(HttpSession session, GroupCriteria cri, Model
	 * model) throws Exception { log.info("GETgroupMemberAdmin!"); GroupVO groupVO =
	 * (GroupVO) session.getAttribute("groupInfo");
	 * 
	 * GroupDTO dto = new GroupDTO(); GroupPageMaker pageMaker = new
	 * GroupPageMaker();
	 * 
	 * dto.setGrno(groupVO.getGrno()); dto.setPageStart(((cri.getPage() - 1) *
	 * (cri.getPerPageNum() + 3)) + 1); dto.setSize(cri.getPage() *
	 * (cri.getPerPageNum() + 3));
	 * 
	 * List<GroupMemberVO> list = service.listGroupMemberAdmin(dto);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * pageMaker.setCri(cri);
	 * 
	 * int groupCount = service.countGroupMemberAdmin(dto);
	 * 
	 * log.info("IndexCount" + groupCount);
	 * 
	 * pageMaker.setTotalCount(groupCount);
	 * 
	 * model.addAttribute("pageMaker", pageMaker); }
	 */

	@ResponseBody
	@RequestMapping(value = "/addMember/{memno}", method = RequestMethod.GET)
	public ResponseEntity<String> addMember(HttpSession session, @PathVariable("memno") int memno) {

		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");
		System.out.println("addMember memno : " + memno);
		vo.setMemno(memno);
		log.info("gropmemberVO" + vo.toString());
		ResponseEntity<String> entity = null;

		try {
			service.addMember(vo);
			System.out.println("success");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/rejectAddMember/{memno}", method = RequestMethod.GET)
	public ResponseEntity<String> rejectAddMember(HttpSession session, @PathVariable("memno") int memno) {

		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");
		System.out.println("rejectAddMember memno : " + memno);
		vo.setMemno(memno);
		log.info("gropmemberVO" + vo.toString());
		ResponseEntity<String> entity = null;

		try {
			service.rejectAddMember(vo);
			System.out.println("success");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 멤버가 직접 탈퇴
	@RequestMapping(value = "/removeMember", method = RequestMethod.GET)
	public String removeMember(HttpSession session) throws Exception {

		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");
		UserVO user = (UserVO) session.getAttribute("member");
		vo.setMemno(user.getMemno());
		log.info("gropmemberVO" + vo.toString());
		service.removeMember(vo);
		return "/group/groupIndex";
	}

	// 그룹장이 탈퇴시킴
	@ResponseBody
	@RequestMapping(value = "/removeMember/{memno}", method = RequestMethod.GET)
	public ResponseEntity<String> removeMember(HttpSession session, @PathVariable("memno") int memno) {

		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");
		System.out.println("rejectAddMember memno : " + memno);
		vo.setMemno(memno);
		log.info("gropmemberVO" + vo.toString());
		ResponseEntity<String> entity = null;

		try {
			service.removeMember(vo);
			System.out.println("success");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/removeGroup", method = RequestMethod.GET)
	public String removeGroup(HttpSession session) throws Exception {

		GroupVO vo = (GroupVO) session.getAttribute("groupInfo");
		log.info("gropmemberVO" + vo.toString());

		service.removeGroup(vo);
		return "/group/groupIndex";
	}

	@RequestMapping(value = "/groupNewsfeedWrite", method = RequestMethod.GET)
	public void groupNewsfeedWriteGet(HttpSession session, GroupNewsfeedVO vo) throws Exception {
		log.info(vo.toString());
		session.getAttribute("groupInfo");
		session.setAttribute("write", vo);
	}

	@RequestMapping(value = "/groupNewsfeedWrite", method = RequestMethod.POST)
	public String groupNewsfeedWritePost(Model model, GroupNewsfeedVO vo) throws Exception {
		log.info(vo.toString());
		service.groupNewsfeedWrite(vo);
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		if (vo.getGrpocon() == null || vo.getGrpocon().isEmpty())
			errors.put("grpostcon", Boolean.TRUE);
		if (!errors.isEmpty()) {
			return "/group/groupNewsfeedWrite";
		}
		return "redirect:groupNewsfeed";
	}
	
}
