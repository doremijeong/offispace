package kr.co.offispace.service.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.TeamNoticeVO;

public interface TeamNoticeService {

	public String getTeamNoticeCode() throws SQLException;

	public String registerTeamNotice(TeamNoticeVO teamNotice) throws SQLException;

	public Map<String, Object> getTeamNoticeList(TeamNoticeCriteria cri) throws SQLException;

	public Map<String, Object> getTeamNoticeImptList(TeamNoticeCriteria cri) throws SQLException;

	public TeamNoticeVO getTeamNoticeByCode(String teamNoticeCode) throws SQLException;

	public void modifyTeamNotice(TeamNoticeVO teamNotice) throws SQLException;

	public void removeTeamNotice(String teamNoticeCode) throws SQLException;

	public void increaseViewCnt(String teamNoticeCode) throws SQLException;
}
