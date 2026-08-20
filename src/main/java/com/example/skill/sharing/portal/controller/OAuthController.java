package com.example.skill.sharing.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.service.OAuthUserServiceIMPL;

import jakarta.servlet.http.HttpSession;

@Controller
public class OAuthController {

    @Autowired
    private OAuthUserServiceIMPL userService;

    @GetMapping("/oauth-success")
    public String loginSuccess(
            Authentication authentication,
            HttpSession session) {

        if (authentication == null ||
                !(authentication.getPrincipal()
                        instanceof OAuth2User)) {

            return "redirect:/home";
        }

        OAuth2User oauthUser =
                (OAuth2User) authentication.getPrincipal();

        SkillsPeople dbUser =
                userService.processOAuthUser(oauthUser);

        session.setAttribute(
                "currentUser",
                dbUser);

        session.setAttribute(
                "fullName",
                dbUser.getFullName());

        session.setAttribute(
                "email",
                dbUser.getEmail());

        if ("GOOGLE".equals(
                dbUser.getProvider())) {

            session.setAttribute(
                    "userId",
                    dbUser.getProviderId());

        } else {

            session.setAttribute(
                    "userId",
                    dbUser.getUsername());
        }

        String loginType =
                (String) session.getAttribute(
                        "loginType");

        System.out.println(
                "LOGIN TYPE = " + loginType);

        session.removeAttribute(
                "loginType");

        if ("skilled".equals(
                loginType)) {

            return "redirect:/addSkill";
        }

        if ("seeker".equals(
                loginType)) {

            return "redirect:/skillspage";
        }

        return "redirect:/home";
    }
}