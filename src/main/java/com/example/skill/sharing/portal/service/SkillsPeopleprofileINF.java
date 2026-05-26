package com.example.skill.sharing.portal.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.skill.sharing.portal.model.Skills;
import com.example.skill.sharing.portal.model.SkillsPeople;

public interface SkillsPeopleprofileINF {

    // ================= USER =================
    Optional<SkillsPeople> findByUsername(String username);

    Optional<SkillsPeople> findByProviderId(String providerId);

    void save(SkillsPeople user);

    void deleteUser(Long id);

    Optional<SkillsPeople> findById(Long id);

    // ================= SKILLS =================
    Skills getSkillById(Long id);

    void saveSkill(Skills skill);

    void deleteSkill(Long id);

    List<Skills> getSkillsByUsername(String username);

    List<Skills> getSkillsByProviderId(String providerId);

    // ================= PAGINATION =================
    Page<Skills> getSkillsPageByUsername(String username, Pageable pageable);

    Page<Skills> getSkillsPageByProviderId(String providerId, Pageable pageable);
}