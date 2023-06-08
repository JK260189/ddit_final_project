package kr.or.ddit.commons.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.AdminIndexVO;
import kr.or.ddit.commons.service.AdminIndexService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/index/adminIndex")
@Slf4j
public class AdminIndexController {
	
	private final AdminIndexService service;
	
	@GetMapping
	public String adminIndex() {
		return "index/adminIndex";
	}
	
	@GetMapping(value = "/getMemCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public int selectMemberCNT() {
		int cnt = service.selectMemberCNT();
		log.info("selectMemberCNT:{}",cnt);
		return cnt;
	}
	
	@GetMapping(value = "/selectSubscribeCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public int selectSubscribeCNT() {
		int cnt = service.selectSubscribeCNT();
		log.info("selectSubscribeCNT:{}",cnt);
		return cnt;
	}
	
	@GetMapping(value = "/selectSubEndCloseComList", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public List<AdminIndexVO> selectSubEndCloseComList() {
		List<AdminIndexVO> list = service.selectSubEndCloseComList();
		log.info("listlistlist:{}",list);
		return list;
	}
	

	@GetMapping(value = "/joinCompanyMemberCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public int joinCompanyMemberCNT() {
		int cnt = service.joinCompanyMemberCNT();
		log.info("joinCompanyMemberCNT:{}",cnt);
		return cnt;
	}
	
	@GetMapping(value = "/selectSalesSUM", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public int selectSalesSUM() {
		int cnt = service.selectSalesSUM();
		log.info("joinCompanyMemberCNT:{}",cnt);
		return cnt;
	}
	
	@GetMapping(value = "/selectSalesItemCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public List<Integer> selectSalesItemCNT() {
		List<Integer> list = service.selectSalesItemCNT();
		log.info("listlistlist:{}",list);
		return list;
	}
	
	@GetMapping(value = "/selectMonthlySubscribeCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public List<AdminIndexVO> selectMonthlySubscribeCNT() {
		List<AdminIndexVO> list = service.selectMonthlySubscribeCNT();
		log.info("listlistlist:{}",list);
		return list;
	}
	
	@GetMapping(value = "/selectMonthlyJoinMemberCNT", produces =  "application/json;charset=utf-8")
	@ResponseBody
	public List<AdminIndexVO> selectMonthlyJoinMemberCNT() {
		List<AdminIndexVO> list = service.selectMonthlyJoinMemberCNT();
		log.info("listlistlist:{}",list);
		return list;
	}
	
}
