package kr.co.offispace.service.testMaria;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dao.testMaria.TestMariaDAO;
import kr.co.offispace.dto.TestMariaVO;

public class TestMariaServiceImpl implements TestMariaService{

	private TestMariaDAO testMariaDAO;
	public void setTestMariaDAO(TestMariaDAO testMariaDAO) {
		this.testMariaDAO = testMariaDAO;
	}
	
	@Override
	public List<TestMariaVO> getTestMaria() throws SQLException {
		return testMariaDAO.selectTestMaria();
	}

}
