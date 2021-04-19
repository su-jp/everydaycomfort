package com.sujin.eComfort.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.UserRepository;


@Service
public class PrincipalDetailService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User principal = userRepository.findByEmail(email)
				.orElseThrow(()->{
					return new UsernameNotFoundException("아이디를 찾을 수 없습니다.");
				});
		return new PrincipalDetail(principal);
	}
	
}
