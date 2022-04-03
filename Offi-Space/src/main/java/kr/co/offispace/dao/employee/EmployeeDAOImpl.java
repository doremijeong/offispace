package kr.co.offispace.dao.employee;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.RegisterEmployeeCommand;
import kr.co.offispace.dto.EmployeeVO;

public class EmployeeDAOImpl implements EmployeeDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String selectEmpCodeToRegister() throws SQLException {
		String empCode = sqlSession.selectOne("Employee-Mapper.selectEmpCodeToRegister");
		return empCode;
	}

	@Override
	public void insertEmployee(RegisterEmployeeCommand registerEmployeeCommand) throws SQLException {
		sqlSession.insert("Employee-Mapper.insertEmployee", registerEmployeeCommand);
	}

	@Override
	public List<EmployeeVO> selectEmployeeList() throws SQLException {
		List<EmployeeVO> employeeList=sqlSession.selectList("Employee-Mapper.selectEmployeeList");
		return employeeList;
	}

	@Override
	public List<EmployeeVO> selectEmployeeList(ContactCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<EmployeeVO> employeeList = sqlSession.selectList("Employee-Mapper.selectSearchEmployeeList", cri, rowBounds);
		return employeeList;
	}

	@Override
	public int selectEmployeeListCount(ContactCriteria cri) throws SQLException {
		int totalCount=sqlSession.selectOne("Employee-Mapper.selectSearchEmployeeListCount",cri);
		return totalCount;
	}


	@Override
	public EmployeeVO selectEmployeeById(String empId) throws SQLException {
		EmployeeVO employee = null;
		employee = sqlSession.selectOne("Employee-Mapper.selectEmployeeById",empId);
		return employee;
	}

	@Override
	public EmployeeVO selectEmployeeByEmpCode(String empCode) {
		EmployeeVO employee = sqlSession.selectOne("Employee-Mapper.selectEmployeeByEmpCode",empCode);
		return employee;
	}

	@Override
	public void updateEmployeeFirst(EmployeeVO vo) throws SQLException {

		sqlSession.update("Employee-Mapper.updateEmployeeFirst", vo);

	}

	@Override
	public List<EmployeeVO> selectEmployeeListByComCode(String comCode) throws SQLException {
		List<EmployeeVO> employeeList=sqlSession.selectList("Employee-Mapper.selectEmployeeListByComCode",comCode);
		return employeeList;
	}

	@Override
	public String selectEmpIdById(String empId) throws SQLException {

		String getId = sqlSession.selectOne("Employee-Mapper.selectEmpIdById", empId);

		return getId;
	}

	@Override
	public List<EmployeeVO> selectEmployeeListByTeamCode(String teamCode) throws SQLException {
		return sqlSession.selectList("Employee-Mapper.selectEmployeeListByTeamCode",teamCode);
	}

	@Override
	public void updateEmp(EmployeeVO emp) throws SQLException {
		sqlSession.update("Employee-Mapper.updateEmp", emp);
	}


	@Override
	public List<String> selectMyTeamEmployeeCodeList(String teamCode) throws SQLException {
		return sqlSession.selectList("Employee-Mapper.selectMyTeamEmployeeCodeList", teamCode);
	}


	@Override
	public List<String> selectEmployeeAllList() throws SQLException {
		return sqlSession.selectList("Employee-Mapper.selectEmployeeAllList");
	}



}
