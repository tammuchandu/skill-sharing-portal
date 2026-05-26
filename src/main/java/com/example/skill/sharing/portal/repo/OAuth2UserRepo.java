package com.example.skill.sharing.portal.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.skill.sharing.portal.model.SkillsPeople;

@Repository
public interface OAuth2UserRepo
        extends JpaRepository<SkillsPeople, Long> {

    Optional<SkillsPeople> findByEmail(String email);
}