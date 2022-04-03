package kr.co.offispace.service.employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.RegisterEmployeeCommand;
import kr.co.offispace.dto.EmployeeVO;

public interface EmployeeService {

	//등록을 위한 메서드
	public void registerEmployee (RegisterEmployeeCommand registerEmployeeCommand) throws SQLException;

	public abstract List<EmployeeVO> getEmployeeList() throws SQLException;

	public EmployeeVO getEmployee(String empId) throws SQLException;

	public Map<String, Object> getEmployeeListPage(ContactCriteria cri) throws SQLException;

	public EmployeeVO getEmployeeByEmpCode(String empCode) throws SQLException;

	public void setEmployeeFirstInformation(EmployeeVO vo) throws SQLException;

	public List<EmployeeVO> getEmployeeListByComCode(String comCode) throws SQLException;

	public String getEmpIdById(String empId) throws SQLException;

	public void setAttachSavename(EmployeeVO employee) throws SQLException;

	public List<EmployeeVO> getEmployeeListByTeamCode(String teamCode) throws SQLException;

	public void modifyEmp(EmployeeVO emp) throws SQLException;

	public List<String> getEmployeeAllList() throws SQLException;

	public List<String> getMyTeamEmployeeCodeList(String teamCode) throws SQLException;

}
