package com.example.skill.sharing.portal.controller;

import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.service.SkilledUserServiceINF;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class SkilledController {

    @Autowired
    private SkilledUserServiceINF userService;


    // ================= HOME =================
    @GetMapping("/home")
    public String home() {
        return "home";
    }

    // ================= AUTH PAGE =================
    @GetMapping("/skilledAuthentication")
    public String authPage() {
        return "skilledAuthentication";
    }

    // ================= LOGIN PAGE =================
    @GetMapping("/skilledloginFrom")
    public String loginPage() {
        return "skilledlogin";
    }

    // ================= LOGIN SUBMIT =================
@PostMapping("/skilledloginFromSubmit")
public String loginUser(
        @RequestParam String accountId,
        @RequestParam String password,
        HttpSession session,
        Model model) {

    String result = userService.login(accountId, password);

    if (result.equalsIgnoreCase("Login Success")) {

        SkillsPeople user =
                userService.findByAccountId(accountId).orElse(null);

        if (user == null) {

            model.addAttribute("error", "User not found");

            return "skilledlogin";
        }

        // SAVE USER IN SESSION
        //session.setAttribute("loggedUser", user);
        session.setAttribute("currentUser", user);
        

        session.setAttribute("accountId", user.getAccountId());

        session.setAttribute("username", user.getUsername());

        // REDIRECT TO ADD SKILL
        return "redirect:/addSkill";
    }

    model.addAttribute("error", result);

    return "skilledlogin";
}


   // ================ REGISTER PAGE =================
    @GetMapping("/skilledRegisterForm")
    public String registerPage(Model model) {
        model.addAttribute("user", new SkillsPeople());
        return "skilledregister";
    }

    //============================= REGISTER SUBMIT ============================
    @PostMapping("/skilledRegisterFormSubmit")
public String registerUser(
        @Valid @ModelAttribute("user") SkillsPeople user,
        BindingResult result,
        Model model) {

    if (result.hasErrors()) {
        return "skilledregister";
    }

    String response = userService.save(user);
    model.addAttribute("message", response);

    return "skilledregister";
}
}