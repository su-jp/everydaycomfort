package com.sujin.eComfort.config.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.config.oauth.provider.GoogleUserInfo;
import com.sujin.eComfort.config.oauth.provider.KakaoUserInfo;
import com.sujin.eComfort.config.oauth.provider.OAuth2UserInfo;
import com.sujin.eComfort.controller.api.ApiKey;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.UserRepository;
import com.sujin.eComfort.service.UserService;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserService userService;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("=========================================111111");
		OAuth2User oAuth2User = super.loadUser(userRequest);
		
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
		} else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
		}
		System.out.println("=========================================222222");
		System.out.println(oAuth2UserInfo);
		
		String providerId = oAuth2UserInfo.getProviderId();
		String provider = oAuth2UserInfo.getProvider();
		String password = bCryptPasswordEncoder.encode("password");
		String username = provider + "_" + providerId;
		String role = "ROLE_USER";
		
		
		User userEntity = userService.findUser(username);
		
		if(userEntity == null) {
			userEntity = User.builder()
					.email(username)
					.password(password)
					.role(role)
					.oauth(provider)
					.build();
			userRepository.save(userEntity);
		}
		System.out.println("=========================================333333");
		System.out.println(userEntity);
		return new PrincipalDetail(userEntity, oAuth2User.getAttributes());
	}
}
