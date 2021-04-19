package com.sujin.eComfort.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
}
