package kr.or.ddit.noticeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.noticeBoard.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardDAO {
	
	/**
	 * 공지게시판 게시글 목록 조회
	 * @return
	 */
	public List<NoticeBoardVO> noticeBoardList();
	
	/**
	 * FNQ게시판 게시글 목록 조회
	 * @return
	 */
	public List<NoticeBoardVO> fnqNoticeBoardList();
	
	/**
	 * 게시글번호와 파일정보 조회
	 * @param noticeBoardId
	 * @return
	 */
	public  List<NoticeBoardVO> noticeBoardSelect(int noticeBoardId);
	
	public int selectTotalRecord();
	
	/**
	 * 게시글 등록, 첨부파일 등록
	 * @param noticeBoard
	 * @param files
	 * @return
	 */
	public int insertNoticeBoard(NoticeBoardVO noticeBoard);
	
	/**
	 * 게시글 수정
	 * @param noticeBoard
	 * @return
	 */
	public int updateNoticeBoard(NoticeBoardVO noticeBoard);
	
	/**
	 * 게시글 삭제
	 * 실제 삭제는 아니고, 삭제여부를 'N' -> 'Y'로 변경
	 * @param noticeBoardId
	 * @return
	 */
	public int deleteNoticeBoard(int noticeBoardId);
	
	/**
	 * 조회수 증가
	 * @param noticeBoardCount
	 * @return
	 */
	public int updateNoticeBoardCount(int noticeBoardId);
}
