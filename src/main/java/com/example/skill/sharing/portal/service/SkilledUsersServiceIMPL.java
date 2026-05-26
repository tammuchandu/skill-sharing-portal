package com.example.skill.sharing.portal.service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.skill.sharing.portal.model.SkillsPeople;
import com.example.skill.sharing.portal.repo.SkilledUsersRepo;

@Service
public class SkilledUsersServiceIMPL
        implements SkilledUserServiceINF {

    @Autowired
    private SkilledUsersRepo userRepo;
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
public String login(String accountId, String password) {

    if (accountId == null || password == null) {
        return "Invalid input";
    }

    accountId = accountId.trim();
    password = password.trim();

    if (accountId.isEmpty() || password.isEmpty()) {
        return "Invalid input";
    }

    Optional<SkillsPeople> userOpt =
            userRepo.findByAccountId(accountId);

    if (userOpt.isEmpty()) {
        return "User not found";
    }

    SkillsPeople user = userOpt.get();

    if (user.getPassword() == null ||
        !user.getPassword().equals(password)) {
        return "Invalid password";
    }

    return "Login SUCCESS";
}

    @Override
    public Optional<SkillsPeople>
            findByUsername(String username) {

        return userRepo.findByUsername(username);
    }

    @Override
    public Optional<SkillsPeople>
            findByAccountId(String accountId) {

        return userRepo.findByAccountId(accountId);
    }

    @Override
    public Optional<SkillsPeople>
            findByEmail(String email) {

        return userRepo.findByEmail(email);
    }
}