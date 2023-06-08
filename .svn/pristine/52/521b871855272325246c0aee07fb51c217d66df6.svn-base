package kr.or.ddit.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.management.relation.RoleList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.commons.auth.CompanyGrantedAuthorityImpl;
import kr.or.ddit.commons.auth.CompanyProjectGrantedAuthorityImpl;
import kr.or.ddit.commons.auth.CustomGrantedAuthorityImpl;
import lombok.Getter;
//import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class MemberVOWrapper extends User {

	private MemberVO realUser;

	public static List<GrantedAuthority> makeRole(MemberVO vo) {
		// GrantedAuthority를 리스트로 받기 위해 새로 선언
		List<GrantedAuthority> roleList = new ArrayList<>();
		
		// ROLE_ 라는 형식으로 member의 grade를 인가하기 위하여 접속사 형식으로 합성
		vo.setMemberGrade("ROLE_" + vo.getMemberGrade());

		log.debug("memberGrade", vo.getMemberGrade());
		log.debug("companyId", String.valueOf(vo.getCompanyId()));

		// SimpleGrantedAuthority 메소드를 통해 접속한 인원의 인증 정보를 roleList에 추가
		roleList.add(new SimpleGrantedAuthority(vo.getMemberGrade()));
		roleList.add(new SimpleGrantedAuthority(String.valueOf(vo.getCompanyId())));
		
		// 접속한 인원이 어떤 프로젝트에 속해있는지 인증하기 위하여 CustomGrantedAuthorityImpl을 구현하여 인증 정보에 추가
		vo.getProAttendRole().stream().filter(item -> !item.getGroupGrade().isEmpty())
				.map(role -> new CustomGrantedAuthorityImpl(role.getCompanyId(), role.getProjectId(),
						role.getGroupRole(), role.getMemberId(), role.getProjectAttendAk(), role.getProjectRoleId()
						))
				.forEach(item -> roleList.add(item));

		log.debug("roleList : {}", roleList);

		return roleList;
	}
	
	// 접속한 인원의 개인 정보를 로드하기 위하여 realUser라는 이름의 memberVO 객체 반환
	public MemberVO getRealUser() {
		return realUser;
	}

	public MemberVOWrapper(MemberVO realUser) {
		super(realUser.getMemberEmail(), realUser.getMemberPassword(), makeRole(realUser));
		this.realUser = realUser;
	}
}