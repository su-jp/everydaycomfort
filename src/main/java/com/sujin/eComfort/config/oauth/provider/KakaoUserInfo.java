package com.sujin.eComfort.config.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo {
	
	private Map<String, Object> attributes;
	
	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	@Override
	public String getProvider() {
		return "kakao";
	}

	@Override
	public String getEmail() {
		Map<String, Object> temp = (Map) attributes.get("kakao_account");
		return String.valueOf(temp.get("email"));
	}

	@Override
	public String getName() {
		Map<String, Object> temp = (Map) attributes.get("properties");
		return (String) temp.get("nickname");
	}
	
}
