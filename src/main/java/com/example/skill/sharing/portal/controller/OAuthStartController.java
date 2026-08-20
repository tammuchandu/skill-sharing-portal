package com.example.skill.sharing.portal.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OAuthStartController {

    @GetMapping("/login/google/skilled")
    public String skilledLogin(
            HttpServletRequest request) {
                System.out.println("INSIDE SKILLED LOGIN");

        HttpSession oldSession =
                request.getSession(false);

        if (oldSession != null) {
            oldSession.invalidate();
        }

        SecurityContextHolder.clearContext();

        new SecurityContextLogoutHandler()
                .logout(request, null, null);

        HttpSession newSession =
                request.getSession(true);

        newSession.setAttribute(
                "loginType",
                "skilled"
        );

        return "redirect:/oauth2/authorization/google";
    }


    @GetMapping("/login/google/seeker")
    public String seekerLogin(
            HttpServletRequest request) {

        HttpSession oldSession =
                request.getSession(false);

        if (oldSession != null) {
            oldSession.invalidate();
        }

        SecurityContextHolder.clearContext();

        new SecurityContextLogoutHandler()
                .logout(request, null, null);

        HttpSession newSession =
                request.getSession(true);

        newSession.setAttribute(
                "loginType",
                "seeker"
        );

        return "redirect:/oauth2/authorization/google";
    }
}