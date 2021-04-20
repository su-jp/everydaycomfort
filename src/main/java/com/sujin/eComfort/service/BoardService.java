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
	private BoardRepository boardRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Transactional
	public void write(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
	@Transactional
	public void update(int id, Board requestBoard) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 글 번호를 찾을 수 없습니다.");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}
	
	@Transactional
	public void delete(int id) {
		boardRepository.deleteById(id);
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
		User user = userRepository.findById(commentSaveRequestDTO.getUserId())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 작성자 정보를 찾을 수 없습니다.");
				});
		
		Board board = boardRepository.findById(commentSaveRequestDTO.getBoardId())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 게시글 번호를 찾을 수 없습니다.");
				});
		
		Comment comment = Comment.builder()
				.user(user)
				.board(board)
				.content(commentSaveRequestDTO.getContent())
				.build();
		
		commentRepository.save(comment);
	}
	
	@Transactional
	public void updateComment(int commentId, Comment requestComment) {
		Comment comment = commentRepository.findById(commentId)
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 수정 실패 : 댓글을 찾을 수 없습니다.");
				});
		comment.setContent(requestComment.getContent());
	}
}
