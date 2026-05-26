package com.example.skill.sharing.portal.repo;

import com.example.skill.sharing.portal.model.Skills;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SkillsRepo extends JpaRepository<Skills, Long> {

     Page<Skills> findByTitleContainingIgnoreCaseAndCategoryContainingIgnoreCase(
            String title,
            String category,
            Pageable pageable
    );

    @Query("SELECT DISTINCT s.category FROM Skills s")
    List<String> findAllCategories();

     // LOCAL USER SKILLS
    List<Skills> findByUserUsername(
            String username);

    // GOOGLE USER SKILLS
    List<Skills> findByUserProviderId(
            String providerId);

// pagination
Page<Skills> findByUserUsername(String username, Pageable pageable);

Page<Skills> findByUserProviderId(String providerId, Pageable pageable);
}