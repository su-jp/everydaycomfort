package com.sujin.eComfort.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sujin.eComfort.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping({"","/"})
	public String index(Model model,
			@PageableDefault(size = 6, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list("qna", pageable));
		model.addAttribute("boardCode", "qna");
		return "index";
	}
	
	@GetMapping("/brandstory")
	public String openBrandstory() {
		return "pages/brandFullPage";
	}
	
	@GetMapping("/interior")
	public String openInterior() {
		return "pages/interiorFullPage";
	}

	@GetMapping("/promotion")
	public String openPromotion() {
		return "pages/promoPage";
	}
	
	@GetMapping("/shop")
	public String openCategories() {
		return "pages/categoryPage";
	}
	
	@GetMapping("/counsel")
	public String openCounselBoard(Model model,
			@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list("counsel", pageable));
		model.addAttribute("boardCode", "counsel");
		return "board/boardList";
	}
	
	@GetMapping("/user/write/counsel")
	public String writeCounsel(Model model) {
		model.addAttribute("boardCode", "counsel");
		return "board/boardForm";
	}
	
	@GetMapping("/notice")
	public String openNoticeBoard(Model model,
			@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list("notice", pageable));
		model.addAttribute("boardCode", "notice");
		return "board/boardList";
	}
	
	@GetMapping("/admin/write/notice")
	public String writeNotice(Model model) {
		model.addAttribute("boardCode", "notice");
		return "board/boardForm";
	}
	
	@GetMapping("/qna")
	public String openQnaBoard(Model model,
			@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list("qna", pageable));
		model.addAttribute("boardCode", "qna");
		return "board/boardList";
	}
	
	@GetMapping("/user/write/qna")
	public String writeQna(Model model) {
		model.addAttribute("boardCode", "qna");
		return "board/boardForm";
	}
	
	@GetMapping("/inquiry")
	public String openInquiryBoard(Model model,
			@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list("inquiry", pageable));
		model.addAttribute("boardCode", "inquiry");
		return "board/boardList";
	}
	
	@GetMapping("/user/write/inquiry")
	public String writeInquiry(Model model) {
		model.addAttribute("boardCode", "inquiry");
		return "board/boardForm";
	}
	
	@GetMapping("/board/{boardId}")
	public String findById(@PathVariable int boardId, Model model) {
		boardService.count(boardId);
		model.addAttribute("board", boardService.read(boardId));
		return "board/boardDetail";
	}
	
	@GetMapping("/api/board/{boardId}/updateForm")
	public String updateForm(@PathVariable int boardId, Model model) {
		System.out.println("id :: "+boardId);
		model.addAttribute("board", boardService.read(boardId));
		return "board/updateForm";
	}
	
}
