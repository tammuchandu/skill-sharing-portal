package com.example.skill.sharing.portal.service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.repo.SkillSeekerUsersRepo;

@Service
public class SkillsSeekerServiceImpl
        implements SkillsSeekerServiceINF {

    @Autowired
    private SkillSeekerUsersRepo userRepo;

// ================= REGISTER =================
@Override
public String save(SkillsPeople user) {

    if (user.getAccountId() == null || user.getAccountId().isBlank()) {
        return "Account ID is required";
    }

    String accountId = user.getAccountId().trim();

    if (userRepo.findByAccountId(accountId).isPresent()) {
        return "Account ID already exists";
    }

    String username = "USR" +
            UUID.randomUUID()
                    .toString()
                    .replace("-", "")
                    .substring(0, 10)
                    .toUpperCase();

    user.setAccountId(accountId);
    user.setUsername(username);

    userRepo.save(user);

    return "Registration SUCCESS:" + username;
}
// ================= LOGIN =================
@Override
public Optional<SkillsPeople> login(String accountId, String password) {

    if (accountId == null || password == null) {
        return Optional.empty();
    }

    accountId = accountId.trim();
    password = password.trim();

    Optional<SkillsPeople> userOpt = userRepo.findByAccountId(accountId);

    if (userOpt.isEmpty()) {
        return Optional.empty();
    }

    SkillsPeople user = userOpt.get();

    if (user.getPassword() == null ||
        !user.getPassword().equals(password)) {
        return Optional.empty();
    }

    return Optional.of(user);
}
    // ================= FIND USERNAME =================

    @Override
    public Optional<SkillsPeople>
            findByUsername(String username) {

        return userRepo.findByUsername(username);
    }

    // ================= FIND ACCOUNT ID =================

    @Override
    public Optional<SkillsPeople>
            findByAccountId(String accountId) {

        return userRepo.findByAccountId(accountId);
    }

    // ================= FIND EMAIL =================

    @Override
    public Optional<SkillsPeople>
            findByEmail(String email) {

        return userRepo.findByEmail(email);
    }
}