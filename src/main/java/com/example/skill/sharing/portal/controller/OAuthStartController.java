package com.example.skill.sharing.portal.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OAuthStartController {

    @GetMapping("/login/google/skilled")// url that user clicks to start from  skilled login page
    public String skilledLogin(
            HttpServletRequest request) {
//Remove old login session it  Deletes previous user login data.
        HttpSession oldSession =
                request.getSession(false);

        if (oldSession != null) {

            oldSession.invalidate();
        }
//Removes old Google authentication.
        SecurityContextHolder.clearContext();

        new SecurityContextLogoutHandler()
                .logout(request, null, null);
//Create new session and set login type to skilled.
//  This is used to identify the login type in the OAuth success handler.

        HttpSession newSession =
                request.getSession(true);

        newSession.setAttribute(
                "loginType",
                "skilled");

        return "redirect:/oauth2/authorization/google";
        /* ->these line is redirect to aouth2 controller method in these 
        ->method devlepoer dont need create it is an inbuilt method of oauth2
        -> and thes method calls defult sucess meassage of configuration class */
            }
      

    @GetMapping("/login/google/seeker")
    public String seekerLogin(
            HttpServletRequest request) {
//Remove old login session it  Deletes previous user login data.
        HttpSession oldSession =
                request.getSession(false);

        if (oldSession != null) {

            oldSession.invalidate();
        }
//it Deletes previous Google authentication.
        SecurityContextHolder.clearContext();

        new SecurityContextLogoutHandler()
                .logout(request, null, null);
//it creates new session and set login type to seeker.
// This is used to identify the login type in the OAuth success handler.
        HttpSession newSession =
                request.getSession(true);

        newSession.setAttribute(
                "loginType",
                "seeker");

        return "redirect:/oauth2/authorization/google";
    }
}