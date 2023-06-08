package kr.or.ddit.noticeBoard.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.noticeBoard.vo.NoticeBoardFileVO;

@Mapper
public interface NoticeBoardFileDAO {
	
	public int insertNoticeBoardFile(NoticeBoardFileVO  noticeBoardFile);
	
}
