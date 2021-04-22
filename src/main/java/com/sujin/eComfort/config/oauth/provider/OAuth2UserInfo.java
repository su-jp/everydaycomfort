package com.sujin.eComfort.config.oauth.provider;

public interface OAuth2UserInfo {
	String getProvider();
	String getEmail();
	String getName();
}
