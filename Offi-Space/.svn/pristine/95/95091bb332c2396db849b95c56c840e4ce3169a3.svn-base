package kr.co.offispace.dao.reply;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		sqlSession.update("Notice-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		sqlSession.update("Notice-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(String replyCode) throws SQLException {
		sqlSession.update("Notice-Mapper.deleteReply", replyCode);
	}

	@Override
	public List<ReplyVO> selectReplyList(Criteria cri, String boardCode) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Notice-Mapper.selectNoticeList", boardCode, rowBounds);
	}

	@Override
	public int selectReplyListCount(String boardCode) throws SQLException {
		return sqlSession.selectOne("Notice-Mapper.selectReplyListCount", boardCode);
	}

}
