package com.sujin.eComfort.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.dto.CommentSaveRequestDTO;
import com.sujin.eComfort.dto.ResponseDTO;
import com.sujin.eComfort.model.Board;
import com.sujin.eComfort.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDTO<Integer> write(@RequestBody Board board,
			@AuthenticationPrincipal PrincipalDetail principal) {
		boardService.write(board, principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("api/board/comment")
	public ResponseDTO<Integer> commentSave(@RequestBody CommentSaveRequestDTO commentSaveRequestDTO) {
		System.out.println("보드에이피아이컨트롤러 코멘트세이브 호출");
		boardService.addComment(commentSaveRequestDTO);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
}
