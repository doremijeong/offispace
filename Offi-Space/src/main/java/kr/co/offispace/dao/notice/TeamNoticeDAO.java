package kr.co.offispace.dao.notice;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.TeamNoticeVO;

public interface TeamNoticeDAO {

	//부서공지 코드 가져오기
	public String selectTeamNoticeCode() throws SQLException;

	//부서공지 등록
	public void insertTeamNotice(TeamNoticeVO teamNotice) throws SQLException;

	//부서공지 목록
	public List<TeamNoticeVO> selectTeamNoticeList(TeamNoticeCriteria cri) throws SQLException;

	//부서공지 중요 목록
	public List<TeamNoticeVO> selectTeamNoticeImptList(TeamNoticeCriteria cri) throws SQLException;

	//부서공지 개수
	public int selectTeamNoticeListCount(TeamNoticeCriteria cri) throws SQLException;

	//부서공지 상세 조회
	public TeamNoticeVO selectTeamNoticeByCode(String teamNoticeCode) throws SQLException;

	//부서공지 수정
	public void updateTeamNotice(TeamNoticeVO teamNotice) throws SQLException;

	//부서공지 삭제
	public void deleteTeamNotice(String teamNoticeCode) throws SQLException;

	// 조회수 증가
	public void increaseViewCnt(String teamNoticeCode) throws SQLException;

}
