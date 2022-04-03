package kr.co.offispace.dao.testMaria;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.dto.TestMariaVO;

public class TestMariaDAOImpl implements TestMariaDAO{

	private SqlSession sqlSessionMaria;
	
	public void setSqlSessionMaria(SqlSession sqlSessionMaria) {
		this.sqlSessionMaria = sqlSessionMaria;
	}


	@Override
	public List<TestMariaVO> selectTestMaria() throws SQLException {
		return sqlSessionMaria.selectList("Test-MapperMaria.selectTestMaria");
	}
	
	
}
