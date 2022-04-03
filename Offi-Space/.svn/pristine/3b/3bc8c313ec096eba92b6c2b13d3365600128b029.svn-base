package kr.co.offispace.service.employee;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.ContactPageMaker;
import kr.co.offispace.command.PageMaker;
import kr.co.offispace.command.RegisterEmployeeCommand;
import kr.co.offispace.dao.attach.AttachmentDAO;
import kr.co.offispace.dao.commonCode.CommonCodeDAO;
import kr.co.offispace.dao.employee.EmployeeDAO;
import kr.co.offispace.dto.EmployeeVO;

public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDAO employeeDAO;
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	private CommonCodeDAO commonCodeDAO;
	public void setCommonCodeDAO(CommonCodeDAO commonCodeDAO) {
		this.commonCodeDAO = commonCodeDAO;
	}

	private AttachmentDAO attachmentDAO;
	public void setAttachDAO (AttachmentDAO attachmentDAO) {
		this.attachmentDAO = attachmentDAO;
	}

	@Override
	public void registerEmployee(RegisterEmployeeCommand registerEmployeeCommand) throws SQLException {
		String empCode = employeeDAO.selectEmpCodeToRegister(); //OP0033 lpad 사용해서 시퀀스 적용
		registerEmployeeCommand.setEmpCode(empCode); //세팅

		registerEmployeeCommand.setEmpHireDt(registerEmployeeCommand.getEmpHireDt().replaceAll("-", ""));

		String empId = "EMP"+registerEmployeeCommand.getEmpHireDt()+empCode.substring(2); // EMP20220112 033
		registerEmployeeCommand.setEmpId(empId);
		String empPassword = empCode+registerEmployeeCommand.getEmpReginum().substring(0,6); // OP0033 121212
		registerEmployeeCommand.setEmpPassword(empPassword);

		System.out.println(empCode +"/" +empId +"/"+ empPassword); //OP0033/EMP20220112033/OP0033121212
		employeeDAO.insertEmployee(registerEmployeeCommand);
	}

	@Override
	public List<EmployeeVO> getEmployeeList() throws SQLException {

		List<EmployeeVO> employeeList = employeeDAO.selectEmployeeList();
		for(EmployeeVO employee : employeeList) {
			setAttachSavename(employee);
		}
		return employeeList;
	}

	@Override
	public EmployeeVO getEmployee(String empId) throws SQLException {

		EmployeeVO employee = employeeDAO.selectEmployeeById(empId);
		if(employee!=null) setAttachSavename(employee);
		return employee;

	}

	@Override
	public Map<String, Object> getEmployeeListPage(ContactCriteria cri) throws SQLException {

		Map<String, Object> dataMap = null;

		List<EmployeeVO> employeeList = null;
		ContactPageMaker pageMaker = null;

		employeeList=employeeDAO.selectEmployeeList(cri);
		
		for(EmployeeVO employee:employeeList)
		{
			setAttachSavename(employee);
		}

		pageMaker = new ContactPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeeDAO.selectEmployeeListCount(cri));

		dataMap=new HashMap<String,Object>();
		dataMap.put("employeeList", employeeList);
		dataMap.put("pageMaker",pageMaker);

		return dataMap;
	}


	@Override
	public EmployeeVO getEmployeeByEmpCode(String empCode) throws SQLException {
		EmployeeVO employee = employeeDAO.selectEmployeeByEmpCode(empCode) ;
		if(employee!=null) setAttachSavename(employee);
		return employee;
	}

	@Override
	public void setEmployeeFirstInformation(EmployeeVO vo) throws SQLException {

		employeeDAO.updateEmployeeFirst(vo);

	}

	@Override
	public List<EmployeeVO> getEmployeeListByComCode(String comCode) throws SQLException {

		List<EmployeeVO> employeeList = employeeDAO.selectEmployeeListByComCode(comCode);
		for(EmployeeVO employee : employeeList) {
			setAttachSavename(employee);
		}

		return employeeList;
	}


	@Override
	public String getEmpIdById(String empId) throws SQLException {

		String getId = employeeDAO.selectEmpIdById(empId);

		return getId;
	}

	@Override
	public void setAttachSavename(EmployeeVO employee) throws SQLException{
		String attachSavename = attachmentDAO.selectSaveNameByEmpCode(employee.getEmpCode());
		employee.setAttachSavename(attachSavename);
	}

	@Override
	public List<EmployeeVO> getEmployeeListByTeamCode(String teamCode) throws SQLException {
		List<EmployeeVO> list = employeeDAO.selectEmployeeListByTeamCode(teamCode);
		for(EmployeeVO employee:list)
		{
			setAttachSavename(employee);
		}
		return list;
	}

	@Override
	public void modifyEmp(EmployeeVO emp) throws SQLException {
		employeeDAO.updateEmp(emp);
	}

	@Override
	public List<String> getEmployeeAllList() throws SQLException {
		return employeeDAO.selectEmployeeAllList();
	}

	@Override
	public List<String> getMyTeamEmployeeCodeList(String teamCode) throws SQLException {
		return employeeDAO.selectMyTeamEmployeeCodeList(teamCode);
	}


}
