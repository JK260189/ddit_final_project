package kr.or.ddit.statistics.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.statistics.vo.StatisticsVO;

@Mapper
public interface StatisticsDAO {
	
	public int selectProjectCount(int companyId);
	
	public Date selectProjectStartDate(int projectId);

	public Date selectProjectEndDate(int projectId);
	
	public int selectProjectStatusIncomplete(int companyId);
	
	public int selectProjectStatusComplete(int companyId);
	
	public int selectProjectWorkPriorityCount(int projectId);
	
	public int selectProjectWorkPriorityEmergency(int projectId);

	public int selectProjectWorkPriorityHigh(int projectId);
	
	public int selectProjectWorkPriorityNormal(int projectId);
	
	public int selectProjectWorkPriorityLow(int projectId);

	public int selectProjectWorkStatusCount(int projectId);
	
	public int selectProjectWorkStatusRequest(int projectId);
	
	public int selectProjectWorkStatusProceed(int projectId);
	
	public int selectProjectWorkStatusFeedback(int projectId);
	
	public int selectProjectWorkStatusPostpone(int projectId);

	public int selectProjectWorkStatusComplete(int projectId);
	
	public int selectProjectIssueStatusCount(int projectId);

	public int selectProjectIssueStatusEmergency(int projectId);
	
	public int selectProjectIssueStatusNormal(int projectId);
	
	public int selectProjectIssueStatusLow(int projectId);
	
	public int selectProjectIssueCategoryError(int projectId);

	public int selectProjectIssueCategoryModify(int projectId);
	
	public int selectProjectIssueCategoryEvent(int projectId);
	
	public List<StatisticsVO> selectProjectIdByCompany(int companyId);
	
	public List<StatisticsVO> selectProjectIssueContentByProject(int projectId);
	
}
