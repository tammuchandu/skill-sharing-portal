package com.example.skill.sharing.portal.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.skill.sharing.portal.model.*;
import com.example.skill.sharing.portal.service.SkillsPeopleprofileINF;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserProfileController {

    @Autowired
    private SkillsPeopleprofileINF userService;

    // ================= PROFILE PAGE =================

    @GetMapping("/profile")
    public String profilePage(
            @RequestParam(defaultValue = "0") int page,
            HttpSession session,
            Model model) {

        SkillsPeople currentUser =
                (SkillsPeople) session.getAttribute("currentUser");

        if (currentUser == null) {
            return "redirect:/login";
        }

        Optional<SkillsPeople> dbUser;

        Page<Skills> skillsPage;

        int size = 1;

        if ("GOOGLE".equalsIgnoreCase(currentUser.getProvider())) {

            dbUser = userService.findByProviderId(currentUser.getProviderId());

            skillsPage = userService.getSkillsPageByProviderId(
                    currentUser.getProviderId(),
                    PageRequest.of(page, size)
            );

        } else {

            dbUser = userService.findByUsername(currentUser.getUsername());

            skillsPage = userService.getSkillsPageByUsername(
                    currentUser.getUsername(),
                    PageRequest.of(page, size)
            );
        }

        if (dbUser.isEmpty()) {
            session.invalidate();
            return "redirect:/login";
        }

        model.addAttribute("user", dbUser.get());
        model.addAttribute("skillsPage", skillsPage);
        model.addAttribute("skills", skillsPage.getContent());

        return "Profile";
    }
    // ================= PROFILE UPDATE (VALIDATION) =================
  // ================= UPDATE PROFILE =================

    @PostMapping("/updateProfile")
    public String updateProfile(

            @Valid @ModelAttribute("user") SkillsPeople formUser,

            BindingResult result,

            HttpSession session,

            Model model,

            @RequestParam(defaultValue = "0") int page) {

        SkillsPeople currentUser =
                (SkillsPeople) session.getAttribute("currentUser");

        if (currentUser == null) {

            return "redirect:/login";
        }

        // ================= VALIDATION =================

        if (result.hasErrors()) {

            Page<Skills> skillsPage;

            if ("GOOGLE".equalsIgnoreCase(currentUser.getProvider())) {

                skillsPage = userService.getSkillsPageByProviderId(
                        currentUser.getProviderId(),
                        PageRequest.of(page, 5)
                );

            } else {

                skillsPage = userService.getSkillsPageByUsername(
                        currentUser.getUsername(),
                        PageRequest.of(page, 5)
                );
            }

            model.addAttribute("user", formUser);

            model.addAttribute("skillsPage", skillsPage);

            model.addAttribute("skills",
                    skillsPage.getContent());

            return "Profile";
        }

        // ================= FIND USER =================

        SkillsPeople user;

        if ("GOOGLE".equalsIgnoreCase(
                currentUser.getProvider())) {

            user = userService
                    .findByProviderId(
                            currentUser.getProviderId())
                    .orElse(null);

        } else {

            user = userService
                    .findByUsername(
                            currentUser.getUsername())
                    .orElse(null);
        }

        if (user == null) {

            return "redirect:/login";
        }

        // ================= UPDATE FIELDS =================

        user.setFullName(
                formUser.getFullName());

        user.setEmail(
                formUser.getEmail());

        user.setPhone(
                formUser.getPhone());

        user.setAccountId(
                formUser.getAccountId());

        // LOCAL USERS ONLY

        if (!"GOOGLE".equalsIgnoreCase(
                user.getProvider())
                &&
                formUser.getUsername() != null
                &&
                !formUser.getUsername()
                        .trim()
                        .isEmpty()) {

            user.setUsername(
                    formUser.getUsername());
        }

        // ================= SAVE =================

        userService.save(user);

        // ================= UPDATE SESSION =================

        session.setAttribute(
                "currentUser",
                user);

        // ================= SUCCESS MESSAGE =================

        session.setAttribute(
                "successMessage",
                "Profile updated successfully!"
        );

        return "redirect:/profile";
    }

    // ================= DELETE SKILL =================

    @PostMapping("/deleteSkill")
    public String deleteSkill(@RequestParam Long id,
                              HttpSession session) {

        SkillsPeople currentUser =
                (SkillsPeople) session.getAttribute("currentUser");

        if (currentUser == null) return "redirect:/login";

        Skills skill = userService.getSkillById(id);

        if (skill == null ||
                !skill.getUser().getId().equals(currentUser.getId())) {
            return "redirect:/profile";
        }

        userService.deleteSkill(id);

        return "redirect:/profile";
    }

    // ================= UPDATE SKILL =================

    @PostMapping(value = "/updateSkill", consumes = "multipart/form-data")
    public String updateSkill(
            @RequestParam Long id,
            @RequestParam String title,
            @RequestParam String category,
            @RequestParam String description,
            @RequestParam(required = false) MultipartFile image1,
            @RequestParam(required = false) MultipartFile image2,
            @RequestParam(required = false) MultipartFile image3,
            @RequestParam(required = false) MultipartFile videoFile,
            HttpSession session) {

        SkillsPeople currentUser =
                (SkillsPeople) session.getAttribute("currentUser");

        if (currentUser == null) return "redirect:/login";

        Skills skill = userService.getSkillById(id);

        if (skill == null ||
                !skill.getUser().getId().equals(currentUser.getId())) {
            return "redirect:/profile";
        }

        try {

            skill.setTitle(title);
            skill.setCategory(category);
            skill.setDescription(description);

            if (image1 != null && !image1.isEmpty())
                skill.setImage1(image1.getBytes());

            if (image2 != null && !image2.isEmpty())
                skill.setImage2(image2.getBytes());

            if (image3 != null && !image3.isEmpty())
                skill.setImage3(image3.getBytes());

            if (videoFile != null && !videoFile.isEmpty()) {

                String fileName = System.currentTimeMillis() + "_" +
                        videoFile.getOriginalFilename();

                String uploadDir = "uploads/videos/";

                java.nio.file.Path path =
                        java.nio.file.Paths.get(uploadDir + fileName);

                java.nio.file.Files.createDirectories(path.getParent());

                java.nio.file.Files.write(path, videoFile.getBytes());

                skill.setVideoUrl("/videos/" + fileName);
            }

            userService.saveSkill(skill);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/profile";
    }

    // ================= DELETE PROFILE =================

@PostMapping("/deleteProfile")
public String deleteProfile(HttpSession session) {

    SkillsPeople currentUser =
            (SkillsPeople) session.getAttribute("currentUser");

    if (currentUser == null) {
        return "redirect:/login";
    }

    SkillsPeople user;

    if ("GOOGLE".equalsIgnoreCase(currentUser.getProvider())) {

        user = userService
                .findByProviderId(currentUser.getProviderId())
                .orElse(null);

    } else {

        user = userService
                .findByUsername(currentUser.getUsername())
                .orElse(null);
    }

    if (user != null) {

        userService.deleteUser(user.getId());
    }

    session.invalidate();

    return "redirect:/home";
}

}