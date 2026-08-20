package com.example.skill.sharing.portal.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())

            .authorizeHttpRequests(auth -> auth

                .requestMatchers(

    "/",
    "/home",
    "/error",

    "/css/**",
    "/js/**",
    "/images/**",
    "/uploads/**",

    "/skillSeekerAuthentication",
    "/skilledAuthentication",

    "/SeekerloginFrom",
    "/SeekerRegisterForm",
    "/SeekerRegisterFormSubmit",

    "/skilledloginFrom",
    "/skilledRegisterForm",
    "/skilledRegisterFormSubmit",

    "/login/google/**",

    "/oauth2/**"      // ADD THIS
).permitAll()

                .anyRequest().authenticated()
            )

            .oauth2Login(oauth -> oauth
                    .defaultSuccessUrl(
                            "/oauth-success",
                            true
                    )
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