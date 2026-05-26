package com.example.skill.sharing.portal.service;

import java.util.Optional;
import com.example.skill.sharing.portal.model.SkillsPeople;

public interface SkillsSeekerServiceINF {

    String save(SkillsPeople user);

    Optional<SkillsPeople> login(String accountId, String password);

    Optional<SkillsPeople> findByUsername(String username);

    Optional<SkillsPeople> findByAccountId(String accountId);

    Optional<SkillsPeople> findByEmail(String email);
}