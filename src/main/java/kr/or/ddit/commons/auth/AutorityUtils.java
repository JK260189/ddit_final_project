package kr.or.ddit.commons.auth;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher.MatchResult;

import kr.or.ddit.member.vo.MemberVOWrapper;
import kr.or.ddit.projectAttend.vo.ProjectAttendVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class AutorityUtils {
	// MANAGER
	public static boolean inCompany(Authentication user, HttpServletRequest request) {
		AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher("/company/{companyID}/**");
		boolean pass = true;
		
		if(requestMatcher.matches(request)) {
			MatchResult matchResult = requestMatcher.matcher(request);
			int companyID = Integer.parseInt(matchResult.getVariables().get("companyID"));
			
			MemberVOWrapper wrapper = (MemberVOWrapper) user.getPrincipal();
			log.info("wrapper : {}", wrapper);
			int userComId = wrapper.getRealUser().getCompanyId();
			if(companyID != userComId) {
				pass = false;
			}
		}
		
		return pass;
	}
	// MEMBER
	public static boolean inCompanyProject (Authentication user, HttpServletRequest request) {
		boolean pass = inCompany(user, request);
		if(pass) {
			AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher("/company/{companyID}/project/{projectID}/**");
			if(requestMatcher.matches(request)) {
				MatchResult matchResult = requestMatcher.matcher(request);
				int projectID = Integer.parseInt(matchResult.getVariables().get("projectID"));
				MemberVOWrapper wrapper = (MemberVOWrapper) user.getPrincipal();
				List<ProjectAttendVO> list = wrapper.getRealUser().getProAttendRole();
				log.info("wrapper : {}", wrapper);
				for (ProjectAttendVO projectAttendVO : list) {
					if(projectAttendVO.getProjectId() == projectID) {
						pass = true;
						break;
					}
					else {
						pass = false;
					}
				}
			}
			
			
		}
		
		return pass;
	}
	
	public static boolean inCompanyRole (Authentication user, HttpServletRequest request, String role) {
		boolean pass = inCompany(user, request);
		if(pass) {
			AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher("/company/{companyID}/project/projectList/**");
			if(requestMatcher.matches(request)) {
				MatchResult matchResult = requestMatcher.matcher(request);
				int companyID = Integer.parseInt(matchResult.getVariables().get("companyID"));
				MemberVOWrapper wrapper = (MemberVOWrapper) user.getPrincipal();
				List<ProjectAttendVO> list = wrapper.getRealUser().getProAttendRole();
				log.info("wrapper : {}", wrapper);
				for (ProjectAttendVO projectAttendVO : list) {
					if(projectAttendVO.getGroupRole().equals(role)) {
						pass = true;
						break;
					}
					else {
						pass = false;
					}
				}
			
			}
			else {
				pass= false;
			}
			
		}
		
		return pass;
	}

	public static boolean inCompanyProjectRole (Authentication user, HttpServletRequest request, String role) {
		boolean pass = inCompanyProject(user, request);
			if(pass) {
				AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher("/company/{companyID}/project/{projectID}/**");
				if(requestMatcher.matches(request)) {
					MatchResult matchResult = requestMatcher.matcher(request);
					MemberVOWrapper wrapper = (MemberVOWrapper) user.getPrincipal();
					List<ProjectAttendVO> list = wrapper.getRealUser().getProAttendRole();
					for (ProjectAttendVO projectAttendVO : list) {
						if(projectAttendVO.getGroupRole().equals(role)) {
							pass = true;
							break;
						}
						else {
							pass = false;
						}
					}
				}
				
				
			}
			
		return pass;
	}
}
