package kr.co.offispace.dao.commonCode;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.CommonCodeVO;

public class CommonCodeDAOImpl implements CommonCodeDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CommonCodeVO> selectCommonCodeList(Criteria cri) throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectCommonCodeList",cri); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectHeadOfficeList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectHeadOfficeList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectGroupList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectGroupList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectTeamList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectTeamList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectPositionList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectPositionList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectChargeList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectChargeList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectStatusList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectStatusList"); 
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> selectAuthorityList() throws SQLException {
		List<CommonCodeVO> commonCodeList = sqlSession.selectList("CommonCode-Mapper.selectAuthorityList"); 
		return commonCodeList;
	}

	@Override
	public String selectComCode1(String comCode) throws SQLException {
		String comCode1 = sqlSession.selectOne("CommonCode-Mapper.selectComCode1",comCode);
		return comCode1;
	}

	@Override
	public CommonCodeVO selectCommonCodeByComCode(String comCode) throws SQLException {
		CommonCodeVO commonCode=sqlSession.selectOne("CommonCode-Mapper.selectCommonCodeByComCode",comCode);
		return commonCode;
	}

	@Override
	public String selectVideoSeq() throws SQLException {
		return sqlSession.selectOne("CommonCode-Mapper.selectVideoSeq");
	}
	

}
