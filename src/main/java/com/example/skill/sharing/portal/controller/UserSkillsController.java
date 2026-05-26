package com.example.skill.sharing.portal.controller;

import com.example.skill.sharing.portal.model.Skills;
import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.service.SkillsServiceINF;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.data.domain.Page;
import java.io.File;
@Controller
public class UserSkillsController {

    @Autowired
    private SkillsServiceINF skillsService;
// ========== SHOW FORM ==========
@GetMapping("/addSkill")
public String showForm(
        HttpSession session,
        Model model) {

    SkillsPeople user =
            (SkillsPeople) session.getAttribute("currentUser");

    if (user == null) {
        return "redirect:/skilledloginFrom";
    }

    model.addAttribute("skill", new Skills());

    model.addAttribute("username", user.getUsername());

    return "addskills";
}
// ========== SAVE SKILL ==========
@PostMapping("/addSkillSAVE")
public String saveSkill(

        @RequestParam String title,
        @RequestParam String description,
        @RequestParam String category,
        @RequestParam("image1") MultipartFile image1,
        @RequestParam("image2") MultipartFile image2,
        @RequestParam("image3") MultipartFile image3,
        @RequestParam("videoFile") MultipartFile videoFile,
        HttpSession session,
        Model model
) {

    try {

        // GET USER FROM SESSION
        SkillsPeople user =
                (SkillsPeople) session.getAttribute("currentUser");

        // NOT LOGIN
        if (user == null) {

            return "redirect:/skilledloginFrom";
        }

        String username = user.getUsername();

        Skills skill = new Skills();

        skill.setTitle(title);
        skill.setDescription(description);
        skill.setCategory(category);

        // IMAGE 1
        if (!image1.isEmpty()) {

            skill.setImage1(image1.getBytes());
        }

        // IMAGE 2
        if (!image2.isEmpty()) {

            skill.setImage2(image2.getBytes());
        }

        // IMAGE 3
        if (!image3.isEmpty()) {

            skill.setImage3(image3.getBytes());
        }

        // UPLOAD DIRECTORY
        String uploadDir =
                System.getProperty("user.dir")
                + "/uploads/";

        File dir = new File(uploadDir);

        if (!dir.exists()) {

            dir.mkdirs();
        }

        // VIDEO SAVE
        if (!videoFile.isEmpty()) {

            String name =
                    System.currentTimeMillis()
                    + "_"
                    + videoFile.getOriginalFilename();

            File dest =
                    new File(uploadDir + name);

            videoFile.transferTo(dest);

            skill.setVideoUrl("/uploads/" + name);
        }

        // SAVE SKILL
        skillsService.saveSkill(skill, username);

        // SUCCESS MESSAGE
        model.addAttribute(
                "success",
                "Skill Added Successfully!"
        );

        // KEEP USERNAME
        model.addAttribute(
                "username",
                username
        );

        // STAY ON SAME PAGE
        return "addskills";

    } catch (Exception e) {

        e.printStackTrace();

        model.addAttribute(
                "error",
                "Upload failed!"
        );

        return "addskills";
    }
}
    // ========== IMAGE APIs ==========

    @GetMapping("/skills/image1/{id}")
    public ResponseEntity<byte[]> image1(@PathVariable Long id) {
        Skills s = skillsService.getSkillById(id);
        return buildImage(s != null ? s.getImage1() : null);
    }

    @GetMapping("/skills/image2/{id}")
    public ResponseEntity<byte[]> image2(@PathVariable Long id) {
        Skills s = skillsService.getSkillById(id);
        return buildImage(s != null ? s.getImage2() : null);
    }

    @GetMapping("/skills/image3/{id}")
    public ResponseEntity<byte[]> image3(@PathVariable Long id) {
        Skills s = skillsService.getSkillById(id);
        return buildImage(s != null ? s.getImage3() : null);
    }

    private ResponseEntity<byte[]> buildImage(byte[] img) {
        if (img == null) return ResponseEntity.notFound().build();

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(img);
    }

    //===================loead skills page===================
@GetMapping("/skillspage")
public String skillPage(

        @RequestParam(defaultValue = "0")
        int page,

        @RequestParam(required = false)
        String keyword,

        @RequestParam(required = false)
        String category,

        HttpSession session,

        Model model
) {

    // COMMON SESSION
    SkillsPeople user =
            (SkillsPeople) session.getAttribute("currentUser");

    // NOT LOGGED IN
    if (user == null) {

        return "redirect:/SeekerloginFrom";
    }

    String username = user.getUsername();

    Page<Skills> skillPage =
            skillsService.searchSkills(
                    keyword,
                    category,
                    page
            );

    model.addAttribute("username", username);

    model.addAttribute("skills",
            skillPage.getContent());

    model.addAttribute("currentPage",
            page);

    model.addAttribute("totalPages",
            skillPage.getTotalPages());

    model.addAttribute("keyword",
            keyword);

    model.addAttribute("category",
            category);

    model.addAttribute("categories",
            skillsService.getAllCategories());

    return "skillspage";
}
}