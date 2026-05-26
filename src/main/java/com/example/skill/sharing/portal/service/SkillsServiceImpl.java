package com.example.skill.sharing.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.skill.sharing.portal.model.Skills;
import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.repo.SkillSeekerUsersRepo;
import com.example.skill.sharing.portal.repo.SkillsRepo;

@Service
public class SkillsServiceImpl implements SkillsServiceINF {

    @Autowired
    private SkillsRepo skillsRepo;

    @Autowired
    private SkillSeekerUsersRepo userRepo;

    @Override
    public void saveSkill(Skills skill, String username) {

        SkillsPeople user = userRepo.findByUsername(username).orElse(null);
        skill.setUser(user);

        skillsRepo.save(skill);
    }

    @Override
    public List<Skills> getAllSkills() {
        return skillsRepo.findAll();
    }

    @Override
    public Skills getSkillById(Long id) {
        return skillsRepo.findById(id).orElse(null);
    }

    @Override
    public void deleteSkill(Long id, String username) {
        skillsRepo.deleteById(id);
    }

    @Override
    public Page<Skills> getSkillsPagination(Pageable pageable) {
        return skillsRepo.findAll(pageable);
    }
    @Override
    public Page<Skills> searchSkills(
            String keyword,
            String category,
            int page
    ) {

        Pageable pageable =
                PageRequest.of(page, 1);

        if(keyword == null || keyword.trim().isEmpty()) {
    keyword = "";
}

if(category == null || category.trim().isEmpty()) {
    category = "";
}

        return skillsRepo
                .findByTitleContainingIgnoreCaseAndCategoryContainingIgnoreCase(
                        keyword,
                        category,
                        pageable
                );
            }
    @Override
    public List<String> getAllCategories() {
        return skillsRepo.findAllCategories();
    }
}