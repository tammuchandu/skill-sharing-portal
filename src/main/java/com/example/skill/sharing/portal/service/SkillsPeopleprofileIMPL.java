package com.example.skill.sharing.portal.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.skill.sharing.portal.model.Skills;
import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.repo.SkillsPeopleprofileRepo;
import com.example.skill.sharing.portal.repo.SkillsRepo;

@Service
public class SkillsPeopleprofileIMPL implements SkillsPeopleprofileINF {

    @Autowired
    private SkillsPeopleprofileRepo repo;

    @Autowired
    private SkillsRepo skillsRepo;

    // ================= USER =================

    @Override
    public Optional<SkillsPeople> findByUsername(String username) {
        return repo.findByUsername(username);
    }

    @Override
    public Optional<SkillsPeople> findByProviderId(String providerId) {
        return repo.findByProviderId(providerId);
    }

    @Override
    public void save(SkillsPeople user) {
        repo.save(user);
    }

    @Override
    public void deleteUser(Long id) {
        repo.deleteById(id);
    }

    @Override
    public Optional<SkillsPeople> findById(Long id) {
        return repo.findById(id);
    }

    // ================= SKILLS =================

    @Override
    public Skills getSkillById(Long id) {
        return skillsRepo.findById(id).orElse(null);
    }

    @Override
    public void saveSkill(Skills skill) {
        skillsRepo.save(skill);
    }

    @Override
    public void deleteSkill(Long id) {
        skillsRepo.deleteById(id);
    }

    @Override
    public List<Skills> getSkillsByUsername(String username) {
        return skillsRepo.findByUserUsername(username);
    }

    @Override
    public List<Skills> getSkillsByProviderId(String providerId) {
        return skillsRepo.findByUserProviderId(providerId);
    }

    // ================= PAGINATION FIX =================

    @Override
    public Page<Skills> getSkillsPageByUsername(String username, Pageable pageable) {
        return skillsRepo.findByUserUsername(username, pageable);
    }

    @Override
    public Page<Skills> getSkillsPageByProviderId(String providerId, Pageable pageable) {
        return skillsRepo.findByUserProviderId(providerId, pageable);
    }
}