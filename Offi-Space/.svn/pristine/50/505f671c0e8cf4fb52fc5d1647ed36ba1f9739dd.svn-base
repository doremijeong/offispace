package kr.co.offispace.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLEngineResult.Status;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JApprovalLineVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.approval.ApprovalService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

@Controller
@RequestMapping("/videoConference")
public class VideoConferenceController {

	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private NotificationService notificationService;
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model) throws Exception
	{
		String url="videoConference/main";
		
		String ip=request.getRemoteAddr();
		model.addAttribute("ip",ip);
		
		return url;
	}
	
	@RequestMapping("/run")
	public String run(@RequestParam(defaultValue="N") String room,HttpServletRequest request) throws Exception
	{
		String url="videoConference/video";
		
		//File file = new File("C:\\Users\\InSung\\Desktop\\대덕\\workspace.WebRTC\\myRTC");
//		File file = new File(request.getServletContext().getRealPath("")+"resources/myRTC");
		Path path = Paths.get("");
		String dir = path.toAbsolutePath().normalize().toString();
		File file = new File(dir);
		System.out.println(dir);
		System.out.println("하하하하하하하하하핳"+file.exists());
		if(file.exists())
		{
			System.out.println("서버킴");
			//Runtime.getRuntime().exec("cmd /c npm run dev",null,file);
		}
		
		if(!room.equals("N"))
		{
			
		}
		//C:\Windows\System32\drivers\etc
		return url;
	}
	
	//초대하기
	@RequestMapping("/invite")
	public ModelAndView invite(ModelAndView mnv, HttpSession session, HttpServletRequest request)
			throws SQLException {
		String url = "videoConference/invite";

		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();

		List<EmployeeVO> employeeList = employeeService.getEmployeeList();

		mnv.addAllObjects(dataMap);
		mnv.addObject("employeeList", employeeList);
		mnv.setViewName(url);

		return mnv;
	}
	
	//초대하기
	@ResponseBody
	@RequestMapping("/inviteNotification")
	public ResponseEntity<String> inviteNotification(String empCode,String room,HttpSession session) throws Exception 
	{
		ResponseEntity<String> result = new ResponseEntity<String>("초대 성공",HttpStatus.OK);
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		String key = commonCodeService.getVideoSeq();
		
		NotificationVO notification = new NotificationVO(key, loginUser.getEmpCode(),
				"https://192.168.143.5/run?room="+room, empCode, "화상회의에 초대 되었습니다.",
				"far fa-bell", "화상회의초대");

		notificationService.registerNotification(notification);

		return result;
	}
}
