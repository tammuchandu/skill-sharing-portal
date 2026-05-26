package com.example.skill.sharing.portal.controller;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;

import org.springframework.security.oauth2.client.web.DefaultOAuth2AuthorizationRequestResolver;

import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestResolver;

import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;

public class CustomAuthorizationRequestResolver
        implements OAuth2AuthorizationRequestResolver {

            /*is used to customize Google OAuth login requests before redirecting user 
            to Google login page.
Main purpose:

It forces Google to always show the "Choose Account" screen. */

    private final OAuth2AuthorizationRequestResolver
            defaultResolver;

    // CONSTRUCTOR
    public CustomAuthorizationRequestResolver(
            ClientRegistrationRepository repo) {

        this.defaultResolver =
                new DefaultOAuth2AuthorizationRequestResolver(
                        repo,
                        "/oauth2/authorization"
                );
    }

    @Override
    public OAuth2AuthorizationRequest resolve(
            HttpServletRequest request) {

        OAuth2AuthorizationRequest req =
                defaultResolver.resolve(request);

        return customize(req);
    }

    @Override
    public OAuth2AuthorizationRequest resolve(
            HttpServletRequest request,
            String clientRegistrationId) {

        OAuth2AuthorizationRequest req =
                defaultResolver.resolve(
                        request,
                        clientRegistrationId
                );

        return customize(req);
    }

    private OAuth2AuthorizationRequest customize(
            OAuth2AuthorizationRequest req) {

        if (req == null) {

            return null;
        }

        Map<String, Object> params =
                new HashMap<>(
                        req.getAdditionalParameters()
                );

        // FORCE GOOGLE ACCOUNT CHOOSER
        params.put(
                "prompt",
                "select_account"
        );

        return OAuth2AuthorizationRequest
                .from(req)
                .additionalParameters(params)
                .build();
    }
}