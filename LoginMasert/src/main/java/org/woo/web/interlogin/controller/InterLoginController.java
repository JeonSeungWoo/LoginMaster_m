package org.woo.web.interlogin.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/interLogin/*")
public class InterLoginController {

	private static final Logger logger = LoggerFactory.getLogger(InterLoginController.class);

	// 페이스북 oAuth 관련
	@Autowired
	private FacebookConnectionFactory connectionFactory;
	@Autowired
	private OAuth2Parameters oAuth2Parameters;

	@RequestMapping(value = "/interLoginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String interLoginForm(HttpServletResponse response, Model model) {
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);

		model.addAttribute("facebook_url", facebook_url);
		System.out.println("facebook : " + facebook_url);
		return "interLogin/interLoginForm";
	}

	// js로 구현.
	@RequestMapping(value = "/interLoginForm2", method = { RequestMethod.GET, RequestMethod.POST })
	public String interLoginForm2(HttpServletResponse response, Model model) {

		return "interLogin/interLoginForm2";
	}

	@RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String facebookSignInCallback(@RequestParam String code) throws Exception {

		try {
			String redirectUri = oAuth2Parameters.getRedirectUri();
			System.out.println("Redirect URI : " + redirectUri);
			System.out.println("Code : " + code);

			OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();

			AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
			String accessToken = accessGrant.getAccessToken();
			System.out.println("AccessToken: " + accessToken);
			Long expireTime = accessGrant.getExpireTime();

			if (expireTime != null && expireTime < System.currentTimeMillis()) {
				accessToken = accessGrant.getRefreshToken();
				logger.info("accessToken is expired. refresh token = {}", accessToken);
			};

			Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
			
			
			
			Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
			
			System.out.println("con 1 : " + new FacebookTemplate(accessToken).toString());
			System.out.println("con 2 : " + connection.getApi().toString());
			
			UserOperations userOperations = facebook.userOperations();
			System.out.println("userOP : "  + userOperations.toString());
			
			User userProfile = facebook.fetchObject("me", User.class);
			System.out.println("유저이메일 : " + userProfile.getEmail());
			System.out.println("유저 id : " + userProfile.getId());
			System.out.println("유저 name : " + userProfile.getName());

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:/success/success";

	}

}
