package com.sujin.eComfort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.dto.CommentSaveRequestDTO;
import com.sujin.eComfort.model.Board;
import com.sujin.eComfort.model.Comment;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.BoardRepository;
import com.sujin.eComfort.repository.CommentRepository;
import com.sujin.eComfort.repository.UserRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CommentRepository commentRepository;
	
	@Transactional
	public void write(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
	@Transactional
	public Page<Board> list(String board, Pageable pageable) {
		return boardRepository.findAllByBoard(board, pageable);
	}
	
	@Transactional(readOnly = true)
	public Board read(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 불러오기 실패 : 글 번호를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void addComment(CommentSaveRequestDTO commentSaveRequestDTO) {
		System.out.println("보드서비스 어드코멘트 호출");
		User user = userRepository.findById(commentSaveRequestDTO.getUserId())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 작성자 정보를 찾을 수 없습니다.");
				});
		
		Board board = boardRepository.findById(commentSaveRequestDTO.getBoardId())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 게시글 번호를 찾을 수 없습니다.");
				});
		
		Comment commentId = null;
		if (commentSaveRequestDTO.getCommentId() != 0) {
			commentId = commentRepository.findById(commentSaveRequestDTO.getCommentId())
					.orElseThrow(()->{
						return new IllegalArgumentException("대댓글 작성 실패 : 원 댓글을 찾을 수 없습니다.");
					});
		}
				
		Comment comment = Comment.builder()
				.user(user)
				.board(board)
				.content(commentSaveRequestDTO.getContent())
				.comment(commentId)
				.build();
		
		commentRepository.save(comment);
	}
}
