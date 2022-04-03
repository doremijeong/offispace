package kr.co.offispace.dao.employee;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.RegisterEmployeeCommand;
import kr.co.offispace.dto.EmployeeVO;

public interface EmployeeDAO {

	public String selectEmpCodeToRegister()throws SQLException;
	public void insertEmployee (RegisterEmployeeCommand registerEmployeeCommand) throws SQLException;
	public List<EmployeeVO> selectEmployeeList() throws SQLException;
	public List<EmployeeVO> selectEmployeeList(ContactCriteria cri) throws SQLException;
	public int selectEmployeeListCount(ContactCriteria cri) throws SQLException;
	// 사원정보 조회
	public EmployeeVO selectEmployeeById(String empId) throws SQLException;
	public EmployeeVO selectEmployeeByEmpCode(String empCode);
	// 최초로그인 시 개인정보 업데이트
	public void updateEmployeeFirst(EmployeeVO vo) throws SQLException;

	public List<EmployeeVO> selectEmployeeListByComCode(String comCode) throws SQLException;
	//아이디 중복체크
	public String selectEmpIdById(String empId) throws SQLException;

	//팀원 리스트 가져오기
	public List<EmployeeVO> selectEmployeeListByTeamCode(String teamCode) throws SQLException;

	// 사원정보 수정
	public void updateEmp(EmployeeVO emp) throws SQLException;

	// 사원 전체리스트 조회
	public List<String> selectEmployeeAllList() throws SQLException;

	// 같은 팀원 코드 가져오는 쿼리
	public List<String> selectMyTeamEmployeeCodeList(String teamCode) throws SQLException;
}
