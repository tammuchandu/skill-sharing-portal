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

    private String videoUrl;

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] image1;

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] image2;

    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] image3;

    @ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "user_id")
private SkillsPeople user;
}