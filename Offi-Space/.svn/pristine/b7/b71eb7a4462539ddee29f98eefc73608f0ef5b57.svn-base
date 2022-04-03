package kr.co.offispace.dao.notice;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String selectNoticeCode() throws SQLException {
		return sqlSession.selectOne("Notice-Mapper.selectNoticeCode");
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		sqlSession.update("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		sqlSession.update("Notice-Mapper.updateNotice", notice);
	}

	@Override
	public void deleteNotice(String noticeCode) throws SQLException {
		sqlSession.update("Notice-Mapper.deleteNotice", noticeCode);
	}

	@Override
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Notice-Mapper.selectNoticeList", cri, rowBounds);
	}

	@Override
	public NoticeVO selectNoticeByNoticeCode(String noticeCode) throws SQLException {
		return sqlSession.selectOne("Notice-Mapper.selectNoticeByNoticeCode", noticeCode);
	}

	@Override
	public int selectNoticeListCount(Criteria cri) throws SQLException {
		return sqlSession.selectOne("Notice-Mapper.selectNoticeListCount", cri);
	}

	@Override
	public void increaseViewCnt(String noticeCode) throws SQLException {
		sqlSession.update("Notice-Mapper.increaseViewCnt",noticeCode);
	}

	@Override
	public List<NoticeVO> selectNoticeImptList(Criteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("Notice-Mapper.selectNoticeImptList", cri, rowBounds);
	}

}
