package kr.co.offispace.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.eclipse.jdt.internal.compiler.parser.ScannerHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.offispace.command.SchedulerCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.SchedulerVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;
import kr.co.offispace.service.scheduler.SchedulerSerivce;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {
	
	@Autowired
	private SchedulerSerivce schedulerService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private NotificationService notificationService;
	
	@RequestMapping("/list")
	public ModelAndView personalSCD(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "scheduler/personalScheduler";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String empCode = loginUser.getEmpCode();
		
		List<SchedulerVO> schedulerList = schedulerService.getScherdulerList(empCode);
		SchedulerVO scheduler = schedulerService.getSchdeulrByEmpCode(empCode);
		
		mnv.addObject("scdGrCode",scheduler.getScdGrCode());
		mnv.addObject("schedulerList",schedulerList);
		mnv.setViewName(url);
		
		return mnv;
	} 
	
	@RequestMapping("/detail")
	public ModelAndView detailEmp(ModelAndView mnv, String scdCode)throws Exception{
		
		String url = "scheduler/detailScheduler";
		
		SchedulerVO scheduler = schedulerService.getSchedulerByScdCode(scdCode);
		
		mnv.addObject("scheduler",scheduler);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modifyForm", method=RequestMethod.GET)
	public String modifySCD(Model model, String scdCode) throws Exception{
		
		String url = "scheduler/modify";
		
		SchedulerVO scheduler = schedulerService.getSchedulerByScdCode(scdCode);
		
		model.addAttribute("scheduler",scheduler);
		
		return url;
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(SchedulerCommand schedulerReq ,RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/scheduler/detail.do";
		System.out.println(schedulerReq.getScdImport()+"@@@@@@@@@@@@@@@");
//		String start = schedulerReq.getScdStartDt();
//		String end = schedulerReq.getScdEndDt();
//		schedulerReq.setScdStartDt(start.substring(2).replaceAll(",", " ")+".0");
//		schedulerReq.setScdEndDt(end.substring(2).replaceAll(",", " ")+".0");

		SchedulerVO scheduler = schedulerReq.toScheduler();
		schedulerService.modifyScheduler(scheduler);
		
		rttr.addAttribute("scdCode",scheduler.getScdCode());
		rttr.addAttribute("from","modify");
		
		return url;
	}
	
	@RequestMapping("/register")
	public String listRegister(SchedulerCommand schedulerReq, RedirectAttributes rttr)throws Exception {
		
		String url = "redirect:/scheduler/list.do";
		
		SchedulerVO scheduler = schedulerReq.toScheduler();
		
		schedulerService.registerScheduler(scheduler);
		
		
		rttr.addFlashAttribute("from","register");
		
		return url;
	}
	
	@RequestMapping("/department/register")
	public String departmentRegister(SchedulerCommand schedulerReq, RedirectAttributes rttr, HttpSession session)throws Exception {
		
		String url = "redirect:/scheduler/departmentScheduler.do";
		
		SchedulerVO scheduler = schedulerReq.toScheduler();
		System.out.println(scheduler);
		
		String scdCode = schedulerService.registerScheduler(scheduler);
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		List<String> employeeList = employeeService.getMyTeamEmployeeCodeList(loginUser.getTeamCode());
		
		for (String employee : employeeList) {
			
			if(schedulerReq.getEmpCode() != employee) {
				NotificationVO notification = new NotificationVO(scdCode, loginUser.getEmpCode(), 
						"scheduler/departmentScheduler.do", employee, "부서일정", "far fa-bell", "부서일정이 등록되었습니다.");
				notificationService.registerNotification(notification);
			}
		}
		
		
		rttr.addFlashAttribute("from","register");
		
		return url;
	}
	
	@RequestMapping("/company/register")
	public String companyRegister(SchedulerCommand schedulerReq, RedirectAttributes rttr, HttpSession session)throws Exception {
		
		String url = "redirect:/scheduler/companyScheduler";
		
		SchedulerVO scheduler = schedulerReq.toScheduler();
		
		String scdCode = schedulerService.registerScheduler(scheduler);
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		List<String> employeelist = employeeService.getEmployeeAllList();
		
		for (String employee : employeelist) {
			NotificationVO notification = new NotificationVO(scdCode, loginUser.getEmpCode(), 
					"scheduler/companyScheduler.do", employee, "회사일정", "far fa-bell", "회사일정이 등록되었습니다.");
			notificationService.registerNotification(notification);
		}
		
		rttr.addFlashAttribute("from","register");
		
		return url;
	}
	
	@RequestMapping("/remove")
	public String remove(String scdCode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/scheduler/detail.do";
		
		schedulerService.removeSchdeulr(scdCode);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("scdCode",scdCode);
		
		return url;
		
	}
	
	
	
	@RequestMapping("/departmentScheduler")
	public ModelAndView departmentSCD(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "scheduler/departmentScheduler";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String teamCode = loginUser.getTeamCode();
		
		List<SchedulerVO> schedulerDPTList = schedulerService.getSchedulerDPTList(teamCode);
		
		SchedulerVO scheduler = schedulerService.getSchedulerByScdDptCode(teamCode);

		mnv.addObject("scdGrCode",scheduler.getScdGrCode());
		mnv.addObject("schedulerList",schedulerDPTList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping("/companyScheduler")
	public ModelAndView companySCD(ModelAndView mnv, HttpSession session) throws Exception{
		String url = "scheduler/companyScheduler";
		
		List<SchedulerVO> schedulerCPList = schedulerService.selectCMPSchedulerList();
		
		SchedulerVO scheduler = schedulerService.getSchedulerByCpScdGrCode();
		
		mnv.addObject("scdGrCode",scheduler.getScdGrCode());
		mnv.addObject("schedulerList",schedulerCPList);
		mnv.setViewName(url);
		return mnv;
	}
	
//	@RequestMapping("/schedulerList")
//	public ModelAndView scheduler(ModelAndView mnv, HttpSession session) throws Exception{
//		String url = "common/main";
//		
//		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
//		
//		List<SchedulerVO> schedulerList = schedulerService.getPersonalSchedulerList(loginUser.getEmpCode());
//		
//		System.out.println("##############################3");
//		System.out.println(schedulerList.get(0).getEmpCode());
//		System.out.println(schedulerList.get(0).getScdTitle());
//		System.out.println(schedulerList.get(0).getScdContent());
//		System.out.println(schedulerList.size());
//		
//		mnv.addObject("schedulerList",schedulerList);
//		mnv.setViewName(url);
//		return mnv;
//	}
	
	
	
}
