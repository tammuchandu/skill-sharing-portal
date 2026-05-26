package com.example.skill.sharing.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Autowired
    private ClientRegistrationRepository clientRegistrationRepository;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())

            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                        "/", "/home", "/oauth-success",
                        "/login/**", "/oauth2/**", "/error",

                        "/uploads/**",
                        "/skills/**",
                        "/css/**",
                        "/js/**",
                        "/images/**",

                        "/addSkill",
                        "/addSkillSAVE",
                        "/skillspage",
                        "/skillSeekerAuthentication",
                        "/skilledAuthentication",
                        "/SeekerloginFrom",
                        "/SeekerloginFromSubmit",
                        "/SeekerRegisterForm",
                        "/SeekerRegisterFormSubmit",
                        "/skilledloginFrom",
                        "/skilledloginFromSubmit",
                        "/skilledRegisterForm",
                        "/skilledRegisterFormSubmit"
                ).permitAll()
                .anyRequest().authenticated()
            )

            .oauth2Login(oauth -> oauth
                .authorizationEndpoint(endpoint -> endpoint
                    .authorizationRequestResolver(
                        new CustomAuthorizationRequestResolver(clientRegistrationRepository)
                    )
                )
                .defaultSuccessUrl("/oauth-success", true)
            )

            .logout(logout -> logout
                .logoutSuccessUrl("/home")
                .permitAll()
            )

            .sessionManagement(session -> session
                .invalidSessionUrl("/home")
            );

        return http.build();
    }
}