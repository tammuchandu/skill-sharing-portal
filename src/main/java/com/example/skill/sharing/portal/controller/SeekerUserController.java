package com.example.skill.sharing.portal.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.example.skill.sharing.portal.model.SkillsPeople;
//import com.example.skill.sharing.portal.service.SkillsServiceINF;
import com.example.skill.sharing.portal.service.SkillsSeekerServiceINF;


import java.io.File;
import java.io.IOException;
import java.util.Optional;

@Controller
public class SeekerUserController {

    @Autowired
    private SkillsSeekerServiceINF service;

   // @Autowired
   // private SkillsServiceINF skillsService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/skillSeekerAuthentication")
    public String authPage() {
        return "skillSeekerAuthentication";
    }

    @GetMapping("/SeekerloginFrom")
    public String loginPage() {
        return "SeekerloginForm";
    }
//=================== seeker logout ===================
  /*  @GetMapping("/seekerlogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }*/ 

//=====login submit======
@PostMapping("/SeekerloginFormSubmit")
public String loginUser(
        @RequestParam("accountId") String accountId,
        @RequestParam("password") String password,
        Model model,
        HttpSession session) {

    Optional<SkillsPeople> userOpt = service.login(accountId, password);

    if (userOpt.isPresent()) {
       // session.setAttribute("loggedUser", userOpt.get());
        session.setAttribute("currentUser", userOpt.get());
        return "redirect:/skillspage";   // better than home
    } else {
        model.addAttribute("error", "Invalid Account ID or Password");
        return "SeekerloginForm";
    }

}

    //=================== register page ===================

    @GetMapping("/SeekerRegisterForm")
public String registerPage(Model model) {
    model.addAttribute("user", new SkillsPeople());
    return "SeekerRegisterForm";
}

   
    // ================= REGISTER submit =================

  @PostMapping("/SeekerRegisterFormSubmit")
public String registerUser(
        @Valid @ModelAttribute("user") SkillsPeople user,
        BindingResult result,
        Model model) {

    // validation errors
    if (result.hasErrors()) {
        return "SeekerRegisterForm";
    }

    try {
        String msg = service.save(user);
        model.addAttribute("message", msg);

        model.addAttribute("user", new SkillsPeople());

    } catch (Exception e) {
        model.addAttribute("message",
                "Registration failed: " + e.getMessage());
    }

    return "SeekerRegisterForm";
}
    
    // ================= SHOW IMAGE =================

    @GetMapping("/uploads/{filename}")
    @ResponseBody
    public byte[] getImage(
            @PathVariable String filename)
            throws IOException {

        File file =
                new File("uploads/" + filename);

        return java.nio.file.Files.readAllBytes(
                file.toPath());
    }
}