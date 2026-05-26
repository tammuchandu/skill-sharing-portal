package com.example.skill.sharing.portal.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.skill.sharing.portal.model.SkillsPeople;

public interface SkilledUsersRepo
        extends JpaRepository<SkillsPeople, Long> {

    Optional<SkillsPeople> findByUsername(String username);

    Optional<SkillsPeople> findByEmail(String email);

    Optional<SkillsPeople> findByAccountId(String accountId);
}