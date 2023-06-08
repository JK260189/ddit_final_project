package kr.or.ddit.codeWall.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.codeWall.vo.CodeWallVO;

public interface CodeWallService {

	/**
	 * 해당 프로젝트의 코드 게시판의 리스트를 조회
	 * @param projectId
	 * @return
	 */
	public List<CodeWallVO> selectCodeWallList(int projectId);
	
	/**
	 * 상세 조회를 위해 해당되는 코드 게시판의 한 row를 조회
	 * @param codeWallId 조회를 위한 조건 파라미터
	 * @return
	 */
	public CodeWallVO selectCodeWallArticle(int codeWallId);
	
	/**
	 * 코드 게시판에 입력을 위한 메소드
	 * @param vo 한 row에 입력되는 정보를 가지고 있는 객체
	 * @return
	 */
	public int insertCodeWall(CodeWallVO vo);
	
	/**
	 * 코드 게시판의 row를 수정하기 위한 메소드
	 * @param vo 수정 값을 가지고 있는 객체
	 * @return
	 */
	public int updateCodeWall(CodeWallVO vo);
	
	/**
	 * 코드 게시판의 게시물을 삭제하기 위한 메소드
	 * @return
	 */
	public int deleteCodeWall(int codeWallId);
	
	
}
