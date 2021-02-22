
package com.team2.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.domain.QNAPageMaker;
import com.team2.domain.QNASearchCriteria;
import com.team2.domain.QnaVO;
import com.team2.domain.UserVO;
import com.team2.service.QnaService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping(value = "/qna")
public class QnaController {

	@Inject
	private QnaService qnaService;

	
	//게시판 목록
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String list(@ModelAttribute("scri") QNASearchCriteria scri, Model model) throws Exception {

		log.info(scri.toString());
		
		log.info(qnaService.listSearchCriteria(scri));
		
		model.addAttribute("list", qnaService.listSearchCriteria(scri));
		
		QNAPageMaker pageMaker = new QNAPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaService.listCountCriteria(scri));
			
		log.info(pageMaker.getTotalCount());
		model.addAttribute("pageMaker", pageMaker);
		

		return "qna/qnaList";
	}

	// 게시글 조회
	@RequestMapping(value = "/qnaRead", method = RequestMethod.GET)
	public String read(QnaVO qna,@ModelAttribute("scri") QNASearchCriteria scri,Model model) throws Exception {

		log.info("read...");

		model.addAttribute("read", qnaService.read(qna.getAnswerNo()));
		model.addAttribute("scri", scri);
		
		
		return "qna/qnaRead";
	}
	
	

	// 게시판 글 작성 화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(QnaVO qna, Model model) {

		log.info("write.........");

	}

	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(HttpSession session,QnaVO qna, RedirectAttributes redirectAttributes) throws Exception {

		UserVO vo = (UserVO) session.getAttribute("member");
		qna.setMemno(vo.getMemno());
		log.info("write");
		log.info(qna.toString());
		qnaService.write(qna);

		redirectAttributes.addFlashAttribute("msg", "regSuccess");

		log.info("write success..........");

		return "redirect:/qna/qnaList";
	}

//	// 게시물 수정 화면
//	@RequestMapping(value = "/qnaModify", method = RequestMethod.GET)
//	public void getModify(@RequestParam("answerNo") int answerNo, Model model) throws Exception {
//
//		QnaVO qna = qnaService.read(answerNo);
//
//		model.addAttribute("read", qna);
//	}
//
//	// 게시물 수정
//	@RequestMapping(value = "/qnaModify", method = RequestMethod.POST)
//	public String postModify(QnaVO qna, Model model) throws Exception {
//
//		qnaService.update(qna);
//
//		log.info("update success..........");
//		model.addAttribute("answerNo", qna.getAnswerNo());
//		return "redirect:/qna/qnaRead";
//	}
	
	// 게시판 수정뷰
		@RequestMapping(value = "/qnaModify", method = RequestMethod.GET)
		public void updateView(QnaVO qna, @ModelAttribute("scri") QNASearchCriteria scri, Model model) throws Exception{
			log.info("updateView");
			
			model.addAttribute("update",qnaService.read(qna.getAnswerNo()));
			model.addAttribute("scri", scri);
			model.addAttribute("read", qna);
		}
		
		// 게시판 수정
		@RequestMapping(value = "/qnaModify", method = RequestMethod.POST)
		public String update(QnaVO qna, @ModelAttribute("scri") QNASearchCriteria scri, RedirectAttributes rttr) throws Exception{
			log.info("update");
			
			qnaService.update(qna);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			rttr.addFlashAttribute("msg", "SUCCESS");
			
			return "redirect:/qna/qnaList";
		}
	
	
	

//	// 게시물 삭제
//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
//	public String getDelete(@RequestParam("answerNo") int answerNo) throws Exception {
//
//		qnaService.delete(answerNo);
//
//		log.info("delete success..........");
//
//		return "redirect:/qna/qnaList";
//	}
		
		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(QnaVO qna,@ModelAttribute("scri") QNASearchCriteria scri, RedirectAttributes rttr) throws Exception{
			
			log.info("delete");
			
			qnaService.delete(qna.getAnswerNo());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			rttr.addFlashAttribute("msg", "SUCCESS");
			
			return "redirect:/qna/qnaList";
		}
		
		
		

}
