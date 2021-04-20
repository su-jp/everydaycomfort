package com.sujin.eComfort.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

}
