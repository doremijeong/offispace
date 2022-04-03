package kr.co.offispace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;


@RestController
@RequestMapping("/organizationChart")
public class RestOrganizationChartController {

	@Autowired
	private AttachmentService attachmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
//	@RequestMapping(value="/getPictureById.do/{id}",method=RequestMethod.GET) //엔드포인트의 .do 만 없어진다.
//	public ResponseEntity<byte[]> getPictureById(@PathVariable("id") String id,HttpServletRequest request) throws Exception
//	{
//		String picture=null;
//		try {
//			picture = memberService.getMember(id).getPicture();
//		} catch (SQLException e) {
//			e.printStackTrace();
//			throw new SQLException(); //얘가 sqlexception 던짐.
//		} catch (Exception e) {
//			e.printStackTrace();
//			ExceptionLoggerHelper.write(request, e, memberService); //여기까지만 하면 ajax가 아무 반응도 없이 가만히 있기때문에 던져주자.
//			throw e;
//		}
//		
//		return getPicture(picture); //얘가 ioexception 던짐.
//	}
	
	
	@RequestMapping("/getTeamList")
	public ResponseEntity<List<EmployeeVO>> getTeamList(String comCode) throws Exception
	{
		ResponseEntity<List<EmployeeVO>> entity=null;

		List<EmployeeVO> employeeList = employeeService.getEmployeeListByComCode(comCode);
		if(employeeList!=null) 
		{
			entity=new ResponseEntity<List<EmployeeVO>>(employeeList,HttpStatus.OK);
		}
//		else 
//		{
//			entity=new ResponseEntity<String>("",HttpStatus.OK);
//		}
		
		return entity;
	}
	
	@RequestMapping("/getDetail")
	public ResponseEntity<EmployeeVO> getDetail(String empCode) throws Exception
	{
		ResponseEntity<EmployeeVO> entity=null;
		
		EmployeeVO employee = employeeService.getEmployeeByEmpCode(empCode);
		
		if(employee!=null)
		{
			AttachmentVO temp = attachmentService.getAttachmentByAttachGroup(employee.getEmpCode());
			if(temp!=null) employee.setAttachSavename(temp.getAttachSavename());
			entity=new ResponseEntity<EmployeeVO>(employee,HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	@RequestMapping("/getAllList")
	public ResponseEntity<List<EmployeeVO>> getAllList() throws Exception
	{
		ResponseEntity<List<EmployeeVO>> entity=null;

		List<EmployeeVO> employeeList = employeeService.getEmployeeList();
		if(employeeList!=null) 
		{
			entity=new ResponseEntity<List<EmployeeVO>>(employeeList,HttpStatus.OK);
		}
//		else 
//		{
//			entity=new ResponseEntity<String>("",HttpStatus.OK);
//		}
		
		return entity;
	}
}
