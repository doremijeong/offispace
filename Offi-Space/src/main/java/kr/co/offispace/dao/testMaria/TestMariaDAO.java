package kr.co.offispace.dao.testMaria;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.IPVO;
import kr.co.offispace.dto.TestMariaVO;

public interface TestMariaDAO {

	public List<TestMariaVO> selectTestMaria() throws SQLException;
}
