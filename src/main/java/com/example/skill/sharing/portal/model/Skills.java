package com.example.skill.sharing.portal.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "skills")
public class Skills {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String title;

    @NotBlank
    @Column(length = 5000, nullable = false)
    private String description;

    @NotBlank
    private String category;

    @Column(name = "video_url")
    private String videoUrl;

    // ===============================
    // PostgreSQL BYTEA images
    // ===============================

    @Column(name = "image1", columnDefinition = "BYTEA")
    private byte[] image1;

    @Column(name = "image2", columnDefinition = "BYTEA")
    private byte[] image2;

    @Column(name = "image3", columnDefinition = "BYTEA")
    private byte[] image3;

    // ===============================
    // USER
    // ===============================

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private SkillsPeople user;
}
