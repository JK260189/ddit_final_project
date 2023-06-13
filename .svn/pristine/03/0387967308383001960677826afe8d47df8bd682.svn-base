package kr.or.ddit.projecttodolist.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.projecttodolist.vo.ProjectTodoListVO;
import kr.or.ddit.projectwork.vo.ProjectWorkVO;

/**
 * @author User
 *
 */
public interface ProjectTodoListService {
	
	/**
	 * 나의 일감별 todoList 조회
	 * @param projectWorkId
	 * @return
	 */
	public List<ProjectTodoListVO> projectTodoList(int projectWorkId);
	
	/**
	 * todoList 등록
	 * @param projectTodoList
	 * @return
	 */
	public int insertrProjectTodoList(ProjectTodoListVO projectTodoListVO);
	
	/**
	 * todoList 완료(수정1)
	 * @param todoId
	 * @return
	 */
	public int completeProjectTodoList(int todoId);
	
	/**
	 * todoList 취소(수정2)
	 * @param todoId
	 * @return
	 */
	public int returnProjectTodoList(int todoId);
	
	/**
	 * todoList 삭제
	 * @param todoId
	 * @return
	 */
	public int deleteProjectTodoList(int todoId);
	
}
