package kr.co.offispace.dao.notice;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.TeamNoticeVO;

public class TeamNoticeDAOImpl implements TeamNoticeDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public String selectTeamNoticeCode() throws SQLException {
		String teamNoticeCode = sqlSession.selectOne("TeamNotice-Mapper.selectTeamNoticeCode");
		return teamNoticeCode;
	}

	@Override
	public void insertTeamNotice(TeamNoticeVO teamNotice) throws SQLException {
		sqlSession.insert("TeamNotice-Mapper.insertTeamNotice", teamNotice);
	}


	@Override
	public List<TeamNoticeVO> selectTeamNoticeList(TeamNoticeCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("TeamNotice-Mapper.selectTeamNoticeList", cri, rowBounds);
	}


	@Override
	public List<TeamNoticeVO> selectTeamNoticeImptList(TeamNoticeCriteria cri) throws SQLException {
		return sqlSession.selectList("TeamNotice-Mapper.selectTeamNoticeImptList", cri);
	}


	@Override
	public int selectTeamNoticeListCount(TeamNoticeCriteria cri) throws SQLException {
		return sqlSession.selectOne("TeamNotice-Mapper.selectTeamNoticeListCount", cri);
	}


	@Override
	public TeamNoticeVO selectTeamNoticeByCode(String teamNoticeCode) throws SQLException {
		return sqlSession.selectOne("TeamNotice-Mapper.selectTeamNoticeByCode", teamNoticeCode);
	}


	@Override
	public void updateTeamNotice(TeamNoticeVO teamNotice) throws SQLException {
		sqlSession.update("TeamNotice-Mapper.updateTeamNotice", teamNotice);
	}


	@Override
	public void deleteTeamNotice(String teamNoticeCode) throws SQLException {
		sqlSession.delete("TeamNotice-Mapper.deleteTeamNotice", teamNoticeCode);
	}


	@Override
	public void increaseViewCnt(String teamNoticeCode) throws SQLException {
		sqlSession.update("TeamNotice-Mapper.increaseViewCnt",teamNoticeCode);
	}



}
