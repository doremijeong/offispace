package kr.co.offispace.dao.mail;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.dto.MailVO;

public class MailDAOImpl implements MailDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String insertMail(MailVO mail) throws SQLException {
		sqlSession.insert("Mail-Mapper.insertMail", mail);
		return mail.getMailCode();
	}

	@Override
	public void insertMailInfo(MailVO mail) throws SQLException {
		sqlSession.insert("Mail-Mapper.insertMailInfo", mail);
	}

	@Override
	public void insertMailRef(MailVO mail) throws SQLException {
		sqlSession.insert("Mail-Mapper.insertMailRef", mail);
	}

	@Override
	public List<MailVO> selectSendList(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectSendList", cri, rowBounds);
	}

	@Override
	public List<MailVO> selectRecievedMailList(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectRecievedList", cri, rowBounds);
	}

	@Override
	public List<MailVO> selectSendTempList(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectSendTempList", cri, rowBounds);
	}

	@Override
	public List<MailVO> selectToMeList(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectToMeList", cri, rowBounds);
	}

	@Override
	public int selectSendListCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectSendListCount", cri);
	}

	@Override
	public int selectRecievedMailListCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectRecievedMailListCount", cri);
	}

	@Override
	public int selectSendTempListCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectSendTempListCount", cri);
	}

	@Override
	public int selectToMeListCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectToMeListCount", cri);
	}

	@Override
	public int selectRecievedMailListNotReadCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectRecievedMailListNotReadCount", cri);
	}

	@Override
	public List<String> selectTrashMailCode(MailCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectTrashMailCode", cri, rowBounds);
	}

	@Override
	public List<String> selectStoreMailCode(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectStoreMailCode", cri, rowBounds);
	}

	@Override
	public List<MailVO> selectMailInfoByMailCode(String mailCode) throws SQLException {
		return sqlSession.selectList("Mail-Mapper.selectMailInfoByMailCode", mailCode);
	}

	@Override
	public MailVO selectMailbyMailCode(String mailCode) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectMailByMailCode", mailCode);
	}

	@Override
	public List<MailVO> selectMailRefbyMailCode(String mailCode) throws SQLException {
		return sqlSession.selectList("Mail-Mapper.selectMailRefByMailCode", mailCode);
	}

	@Override
	public void updateMailImportance(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateImportance", mail);
	}

	@Override
	public void updateMail(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateMail", mail);
	}

	@Override
	public void deleteMailInfo(String mailCode) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteMailInfo", mailCode);
	}

	@Override
	public void deleteMailRef(String mailCode) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteMailRef", mailCode);
	}

	@Override
	public void updateFTrash(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateFTrash", mail);
	}

	@Override
	public void updateTTrash(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateTTrash", mail);
	}

	@Override
	public void updateRefTrash(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateRefTrash", mail);
	}

	@Override
	public void updateFStore(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateFStore", mail);
	}

	@Override
	public void updateTStore(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateTStore", mail);
	}

	@Override
	public void updateRefStore(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateRefStore", mail);
	}

	@Override
	public void updateStatus(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateStatus", mail);
	}

	@Override
	public List<MailVO> selectMailToList(String mailCode) throws SQLException {
		return sqlSession.selectList("Mail-Mapper.selectMailToList", mailCode);
	}

	@Override
	public void updateRefStatus(MailVO mail) throws SQLException {
		sqlSession.update("Mail-Mapper.updateRefStatus", mail);
	}

	@Override
	public int selectImportMailListCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectImportMailListCount", cri);
	}

	@Override
	public List<MailVO> selectRecievedMailListNotRead(MailCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectRecievedMailListNotRead", cri, rowBounds);
	}

	@Override
	public List<MailVO> selectImportMailList(MailCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Mail-Mapper.selectImportMailList", cri, rowBounds);
	}

	@Override
	public int selectTrashMailCodeCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectTrashMailCodeCount", cri);
	}

	@Override
	public int selectStoreMailCodeCount(MailCriteria cri) throws SQLException {
		return sqlSession.selectOne("Mail-Mapper.selectStoreMailCodeCount", cri);
	}

}
