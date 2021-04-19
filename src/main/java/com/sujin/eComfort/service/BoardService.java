package com.sujin.eComfort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.model.Board;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
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
}
