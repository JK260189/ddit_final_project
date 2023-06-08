package kr.or.ddit.statistics.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.statistics.dao.StatisticsDAO;
import kr.or.ddit.statistics.vo.StatisticsVO;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	
	@Inject
	private StatisticsDAO statDao;
	
	@Override
	public int selectProjectCount(int companyId) {
		return statDao.selectProjectCount(companyId);
	}

	@Override
	public Date selectProjectStartDate(int projectId) {
		return statDao.selectProjectStartDate(projectId);
	}

	@Override
	public Date selectProjectEndDate(int projectId) {
		return statDao.selectProjectEndDate(projectId);
	}

	@Override
	public int selectProjectStatusIncomplete(int companyId) {
		return statDao.selectProjectStatusIncomplete(companyId);
	}

	@Override
	public int selectProjectStatusComplete(int companyId) {
		return statDao.selectProjectStatusComplete(companyId);
	}

	@Override
	public int selectProjectWorkPriorityCount(int projectId) {
		return statDao.selectProjectWorkPriorityCount(projectId);
	}

	@Override
	public int selectProjectWorkPriorityEmergency(int projectId) {
		return statDao.selectProjectWorkPriorityEmergency(projectId);
	}

	@Override
	public int selectProjectWorkPriorityHigh(int projectId) {
		return statDao.selectProjectWorkPriorityHigh(projectId);
	}

	@Override
	public int selectProjectWorkPriorityNormal(int projectId) {
		return statDao.selectProjectWorkPriorityNormal(projectId);
	}

	@Override
	public int selectProjectWorkPriorityLow(int projectId) {
		return statDao.selectProjectWorkPriorityLow(projectId);
	}

	@Override
	public int selectProjectWorkStatusCount(int projectId) {
		return statDao.selectProjectWorkStatusCount(projectId);
	}

	@Override
	public int selectProjectWorkStatusRequest(int projectId) {
		return statDao.selectProjectWorkStatusRequest(projectId);
	}

	@Override
	public int selectProjectWorkStatusProceed(int projectId) {
		return statDao.selectProjectWorkStatusProceed(projectId);
	}

	@Override
	public int selectProjectWorkStatusFeedback(int projectId) {
		return statDao.selectProjectWorkStatusFeedback(projectId);
	}

	@Override
	public int selectProjectWorkStatusPostpone(int projectId) {
		return statDao.selectProjectWorkStatusPostpone(projectId);
	}

	@Override
	public int selectProjectWorkStatusComplete(int projectId) {
		return statDao.selectProjectWorkStatusComplete(projectId);
	}

	@Override
	public int selectProjectIssueStatusCount(int projectId) {
		return statDao.selectProjectIssueStatusCount(projectId);
	}

	@Override
	public int selectProjectIssueStatusEmergency(int projectId) {
		return statDao.selectProjectIssueStatusEmergency(projectId);
	}

	@Override
	public int selectProjectIssueStatusNormal(int projectId) {
		return statDao.selectProjectIssueStatusNormal(projectId);
	}

	@Override
	public int selectProjectIssueStatusLow(int projectId) {
		return statDao.selectProjectIssueStatusLow(projectId);
	}

	@Override
	public int selectProjectIssueCategoryError(int projectId) {
		return statDao.selectProjectIssueCategoryError(projectId);
	}

	@Override
	public int selectProjectIssueCategoryModify(int projectId) {
		return statDao.selectProjectIssueCategoryModify(projectId);
	}

	@Override
	public int selectProjectIssueCategoryEvent(int projectId) {
		return statDao.selectProjectIssueCategoryEvent(projectId);
	}

	@Override
	public List<StatisticsVO> selectProjectIssueContentByProject(int projectId) {
		return statDao.selectProjectIssueContentByProject(projectId);
	}

	@Override
	public List<StatisticsVO> selectProjectIdByCompany(int companyId) {
		return statDao.selectProjectIdByCompany(companyId);
	}

}
