package com.sujin.eComfort.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.dto.CommentSaveRequestDTO;
import com.sujin.eComfort.dto.ResponseDTO;
import com.sujin.eComfort.model.Board;
import com.sujin.eComfort.model.Comment;
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
	
	@PutMapping("/api/board/{boardId}")
	public ResponseDTO<Integer> update(@PathVariable int boardId, @RequestBody Board board) {
		boardService.update(boardId, board);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/board/{boardId}")
	public ResponseDTO<Integer> deleteById(@PathVariable int boardId) {
		boardService.delete(boardId);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("api/board/comment")
	public ResponseDTO<Integer> commentWrite(@RequestBody CommentSaveRequestDTO commentSaveRequestDTO) {
		boardService.addComment(commentSaveRequestDTO);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/api/board/comment/{commentId}")
	public ResponseDTO<Integer> commentUpdate(@PathVariable int commentId, @RequestBody Comment comment) {
		boardService.updateComment(commentId, comment);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
}
