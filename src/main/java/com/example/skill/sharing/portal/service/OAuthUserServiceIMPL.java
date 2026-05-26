package com.example.skill.sharing.portal.service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.repo.OAuth2UserRepo;

@Service
public class OAuthUserServiceIMPL
        implements OAuthUserServiceINF {

    @Autowired
    private OAuth2UserRepo userRepo;

    @Override
    public SkillsPeople processOAuthUser(
            OAuth2User oauthUser) {

        // GOOGLE DETAILS
        String googleId =
                oauthUser.getAttribute("sub");

        String fullName =
                oauthUser.getAttribute("name");

        String email =
                oauthUser.getAttribute("email");

        // CHECK EXISTING USER
        Optional<SkillsPeople> existingUser =
                userRepo.findByEmail(email);

        // USER EXISTS
        if (existingUser.isPresent()) {

            return existingUser.get();
        }

        // CREATE NEW USER
        SkillsPeople user =
                new SkillsPeople();

        user.setFullName(fullName);

        user.setEmail(email);

        user.setProvider("GOOGLE");

        user.setProviderId(googleId);

        // RANDOM USERNAME
        String username =
                "USR" +
                UUID.randomUUID()
                        .toString()
                        .replace("-", "")
                        .substring(0, 8)
                        .toUpperCase();

        user.setUsername(username);

        // ACCOUNT ID
        user.setAccountId(email);

        // DUMMY PASSWORD
        user.setPassword("GOOGLE_LOGIN");

        // DEFAULT PHONE
        user.setPhone("0000000000");

        // SAVE USER
        return userRepo.save(user);
    }
}