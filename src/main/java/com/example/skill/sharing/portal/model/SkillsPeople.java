package com.example.skill.sharing.portal.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Table(name = "skills_people")
@Getter
@Setter
@NoArgsConstructor
public class SkillsPeople {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

@Column(unique = true, nullable = false)
private String username;   // it is  system generated uniqe user id

@NotBlank(message = "Account ID is required")
@Column(unique = true, nullable = false)
private String accountId;

@NotBlank(message = "Full Name is required")
private String fullName;

@Email(message = "Invalid Email")
private String email;   // duplicates allowed

@Pattern(regexp = "^[0-9]{10}$", message = "Phone must be 10 digits")
private String phone;

@NotBlank(message = "Password required")
private String password;


    private String provider;   // LOCAL / GOOGLE

    private String providerId;

       @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
private List<Skills> skills;
}