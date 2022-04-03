package kr.co.offispace.service.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.NoticeVO;

public interface NoticeService {
	// 공지 사항 기본키 가져오기
	public String getNoticeCode() throws SQLException;

	// 공지사항 등록
	public String registerNotice(NoticeVO notice) throws SQLException;

	// 공지사항 수정
	public void modifyNotice(NoticeVO notice) throws SQLException;

	// 공지사항 삭제
	public void removeNotice(String noticeCode) throws SQLException;

	// 공지사항 리스트
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException;
	
	// 공지사항 중요 리스트
	public Map<String, Object> getNoticeImptList(Criteria cri) throws SQLException;

	// 공지사항 상세
	public NoticeVO getNoticeByNoticeCode(String noticeCode) throws SQLException;

	public void increaseViewCnt(String noticeCode) throws SQLException;
}
