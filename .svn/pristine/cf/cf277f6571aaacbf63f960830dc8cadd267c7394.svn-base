package kr.or.ddit.commons.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.AdminIndexVO;
import kr.or.ddit.commons.dao.AdminIndexDAO;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AdminIndexServiceImpl implements AdminIndexService {

	@Inject
	private AdminIndexDAO adminIndexDAO;
	
	@Override
	public int selectMemberCNT() {

		return adminIndexDAO.selectMemberCNT();
	}

	@Override
	public int selectSubscribeCNT() {

		return adminIndexDAO.selectSubscribeCNT();
	}

	@Override
	public List<AdminIndexVO> selectSubEndCloseComList() {

		return adminIndexDAO.selectSubEndCloseComList();
	}

	@Override
	public int joinCompanyMemberCNT() {

		return adminIndexDAO.joinCompanyMemberCNT();
	}

	@Override
	public int selectSalesSUM() {

		return adminIndexDAO.selectSalesSUM();
	}

	@Override
	public List<Integer> selectSalesItemCNT() {

		return adminIndexDAO.selectSalesItemCNT();
	}

	@Override
	public List<AdminIndexVO> selectMonthlySubscribeCNT() {
		List<AdminIndexVO> list = adminIndexDAO.selectMonthlySubscribeCNT();
		log.info("AdminIndexVOlist:{}",list);
		return adminIndexDAO.selectMonthlySubscribeCNT();
	}

	@Override
	public List<AdminIndexVO> selectMonthlyJoinMemberCNT() {

		return adminIndexDAO.selectMonthlyJoinMemberCNT();
	}

}
