package com.sujin.eComfort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public void join(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		user.setPoint(5000);
		userRepository.save(user);
	}
	
	@Transactional
	public User findUser(String email) {
		User user = userRepository.findByEmail(email).orElseGet(() -> {
			return null;
		});
		return user;
	}
	
	@Transactional
	public void update(User user) {
		User persistance = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("회원을 찾을 수 없습니다.");
		});
		persistance.setPhonenum(user.getPhonenum());
		persistance.setAddress(user.getAddress());
	}
	
}
