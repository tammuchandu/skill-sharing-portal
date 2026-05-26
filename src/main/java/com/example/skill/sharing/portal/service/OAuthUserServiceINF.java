package com.example.skill.sharing.portal.service;

import org.springframework.security.oauth2.core.user.OAuth2User;

import com.example.skill.sharing.portal.model.SkillsPeople;

public interface OAuthUserServiceINF {

    SkillsPeople processOAuthUser(
            OAuth2User oauthUser);
}