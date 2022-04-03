package kr.co.offispace.dao.ip;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.dto.IPVO;

public class IPDAOImpl implements IPDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public IPVO selectIPAddrByEmpCode(IPVO IP) throws SQLException {
		return sqlSession.selectOne("IP-Mapper.selectIPAddrByEmpCode",IP);
	}

}
