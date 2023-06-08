package kr.or.ddit.subscribe.service;

import java.util.List;

import kr.or.ddit.subscribe.vo.SubscribeVO;

public interface SubscribeService {
	
	/**
	 * 구독 리스트 조회
	 * @return
	 */
	public List<SubscribeVO> subscribeList();
	
	/**
	 * 구독 정보 조회
	 * @param subscribeId 구독id
	 * @return
	 */
	public SubscribeVO subscribeSelect(int subscribeId);
	
	/**
	 * 회원별 구독 정보 조회
	 * @param memberId
	 * @return
	 */
	public SubscribeVO subscribeSelectByMemberId(int memberId);
	
	/**
	 * 구독 정보 입력
	 * @param subscribe 구독 정보를 가지고 있는 객체
	 * @return
	 */
	public int insertSubscribe(SubscribeVO  subscribe);
	
	/**
	 * 실행시 구독 정보를 조회하고 기간이 지난 구독 정보를 없애는 메소드
	 */
	public void updateSubscribeUse();
	
	/**
	 * 구독 갱신시 기존의 구독 정보를 갱신하는 메소드
	 * @param memberId 회원별 조회를 위한 파라미터
	 * @return
	 */
	public int updateSubscribeUseById(int memberId);
	
	/**
	 * 구독 정보를 업데이트
	 * @param subscribe 구독 정보를 가지고 있는 객체
	 * @return
	 */
	public int updateSubscribe(SubscribeVO  subscribe);
	
}
