package kr.co.offispace.dao.notice;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.TeamNoticeVO;

public interface NoticeDAO {
	// 공지 사항 기본키 가져오기
	public String selectNoticeCode() throws SQLException;

	// 공지사항 등록
	public void insertNotice(NoticeVO notice) throws SQLException;

	// 공지사항 수정
	public void updateNotice(NoticeVO notice) throws SQLException;

	// 공지사항 삭제
	public void deleteNotice(String noticeCode) throws SQLException;

	// 공지사항 리스트
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException;
	
	//공지 중요 목록
	public List<NoticeVO> selectNoticeImptList(Criteria cri) throws SQLException;

	// 공지사항 상세
	public NoticeVO selectNoticeByNoticeCode(String noticeCode) throws SQLException;

	// 공지사항 리스트 갯수
	public int selectNoticeListCount(Criteria cri) throws SQLException;

	// 조회수 증가
	public void increaseViewCnt(String noticeCode) throws SQLException;
}
