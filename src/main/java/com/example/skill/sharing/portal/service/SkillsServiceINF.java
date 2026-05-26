package com.example.skill.sharing.portal.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.example.skill.sharing.portal.model.Skills;

public interface SkillsServiceINF {

    void saveSkill(Skills skill, String username);

    List<Skills> getAllSkills();

    Skills getSkillById(Long id);

    void deleteSkill(Long id, String username);

    Page<Skills> getSkillsPagination(Pageable pageable);
    Page<Skills> searchSkills(
            String keyword,
            String category,
            int page
    );
    List<String> getAllCategories();
}