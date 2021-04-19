package com.sujin.eComfort.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{
	Page<Board> findAllByBoard(String board, Pageable pageable);
}