package kr.or.ddit.commons.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomeLoginSuccessHandler implements AuthenticationSuccessHandler {

	private String defaultUrl;
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		handle(request, response, authentication);
		clearAuthenticationAttributes(request);
//		resultRedirectStrategy(request, response, authentication);
	}

	private void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		
		if(response.isCommitted()) {
			log.info("response가 이미 커밋 되었습니다. 목표하는 url의 redirection을 실패합니다." + targetUrl);
			return;
		}
		
		redirectStratgy.sendRedirect(request, response, targetUrl);
	}

	private String determineTargetUrl(final Authentication authentication) {
		Map<String, String> roleTargetUrlMap = new HashMap<String, String>();
		roleTargetUrlMap.put("ROLE_ADMIN", "/index/adminIndex");
		roleTargetUrlMap.put("ROLE_MANAGER", defaultUrl);
		roleTargetUrlMap.put("ROLE_MEMBER", defaultUrl);
		
		final Collection<? extends GrantedAuthority> auth = authentication.getAuthorities();
		for (final GrantedAuthority grantedAuthority : auth) {
	        String authorityName = grantedAuthority.getAuthority();
	        if(roleTargetUrlMap.containsKey(authorityName)) {
	            return roleTargetUrlMap.get(authorityName);
	        }
	    }
		throw new IllegalStateException();
		
	}

	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
        if(session==null) return;
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

//	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
//			Authentication authentication) throws IOException {
//		SavedRequest savedRequest = requestCache.getRequest(request, response);
//
//		if (savedRequest != null) {
//			String targetUrl = savedRequest.getRedirectUrl();
//			redirectStratgy.sendRedirect(request, response, targetUrl);
//		} else {
//			redirectStratgy.sendRedirect(request, response, defaultUrl);
//		}
//	}

}
