package com.example.skill.sharing.portal.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.skill.sharing.portal.model.SkillsPeople;

public interface SkillsPeopleprofileRepo
        extends JpaRepository<SkillsPeople, Long> {

    // LOCAL USER
    Optional<SkillsPeople> findByUsername(
            String username);

    // GOOGLE USER
    Optional<SkillsPeople> findByProviderId(
            String providerId);
}