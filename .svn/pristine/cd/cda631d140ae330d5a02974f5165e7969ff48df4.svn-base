package kr.or.ddit.noticeBoard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.noticeBoard.vo.NoticeBoardVO;
import kr.or.ddit.vo.Pagination;

public interface NoticeBoardService {

	/**
	 * 공지게시판 게시글 목록 조회
	 * @return
	 */
	public List<NoticeBoardVO> NoticeBoardList();

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
	public List<NoticeBoardVO> NoticeBoardSelect(int noticeBoardId);

	/**
	 * 게시글 등록, 첨부파일 등록
	 * @param noticeBoard
	 * @param files
	 * @return
	 */
	public int insertNoticeBoard(NoticeBoardVO  noticeBoard, List<MultipartFile> files);

	/**
	 * 게시글 수정
	 * @param noticeBoard
	 * @return
	 */
	public int updateNoticeBoard(NoticeBoardVO  noticeBoard);

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
	public int updateNoticeBoardCount(int noticeBoardCount);
}
