package kr.co.offispace.dao.attach;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.dto.AttachmentVO;

public class AttachmentDAOImpl implements AttachmentDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public AttachmentVO selectAttachmentByAT(String attachCode) throws SQLException {
		return sqlSession.selectOne("Attachment-Mapper.selectAttachmentByAT",attachCode);
	}

	@Override
	public List<AttachmentVO> selectAttachmentByOther(String attachGroup) throws SQLException {
		return sqlSession.selectList("Attachment-Mapper.selectAttachmentByOther",attachGroup);
	}

	@Override
	public void insertAttachment(AttachmentVO attachment) throws SQLException {
		int s = sqlSession.update("Attachment-Mapper.insertAttachment", attachment);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$");
		System.out.println(s);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$");
	}

	@Override
	public void deleteAttachmentByAT(String attachCode) throws SQLException {
		sqlSession.update("Attachment-Mapper.deleteAttachmentByAT", attachCode);
	}

	@Override
	public void deleteAttachmentByOther(String attachGroup) throws SQLException {
		sqlSession.update("Attachment-Mapper.deleteAttachmentByOther", attachGroup);
	}
	
	@Override
	public AttachmentVO selectAttachmentByAttachGroup(String attachGroup) throws SQLException {
		return sqlSession.selectOne("Attachment-Mapper.selectAttachmentByAttachGroup",attachGroup);
	}

	@Override
	public String selectSaveNameByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Attachment-Mapper.selectSaveNameByEmpCode",empCode);
	}

	@Override
	public List<AttachmentVO> selectAttachmentByAttachSavePath(String attachSavePath) throws SQLException {
		return sqlSession.selectList("Attachment-Mapper.selectAttachmentByAttachSavePath",attachSavePath);
	}

	@Override
	public AttachmentVO selectAttachmentByAttachSaveNameAndAttachSavePath(AttachmentVO attachment) throws SQLException {
		return sqlSession.selectOne("Attachment-Mapper.selectAttachmentByAttachSaveNameAndAttachSavePath",attachment);
	}
	
/*
	@Override
	public String selectAttachCode() throws SQLException {
		String code = sqlSession.selectOne("Attachment-Mapper.selectAttachCode");
		
		System.out.println("여기는 다오오오오오===========" + code);
		String code = sqlSession.selectOne("Attachment-Mapper.selectAttachCode");
		return code;
	}
*/

}
