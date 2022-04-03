package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobCriteria;
import kr.co.offispace.command.JobCriteriaCommand;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.JobKeywordSearchPageMaker;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.CommonCodeVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JobStakeholdersDTO;
import kr.co.offispace.dto.JobVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.commonCode.CommonCodeService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.job.JobService;
import kr.co.offispace.util.LoggerHelper;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Resource(name="logJobsPath")
	private String savePathJobs;

    @RequestMapping("/main")
    public ModelAndView main(ModelAndView mnv, HttpSession session) throws SQLException {
        String url = "job/main";
    	Map<String,Object> dataMap = new HashMap<>();

    	//수신업무 + 완료된 업무는 제외
    	JobKeywordSearchCriteria cri = new JobKeywordSearchCriteria();
    	cri.setNotDone("Y");

    	EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
    	cri.setLoginEmpCode(loginUser.getEmpCode());
    	cri.setSearchType("received");

    	dataMap = jobService.getSortedJobList(cri);
    	List<JobVO> receivedJobList = (List<JobVO>) dataMap.get("sortedJobList");
    	List<JobVO> issueList = jobService.getSortedJobListForIssue(cri);
    	dataMap.put("issueList", issueList);

    	//업무리스트를 순서대로 합치기
    	List<JobVO> allList = new ArrayList<JobVO>();
    	for(int i = 0; i<(issueList.size()+receivedJobList.size()); i++) {
    		if(i<issueList.size()) {
    			allList.add(i, issueList.get(i));
    		}else {
    				allList.add(i, receivedJobList.get((i-issueList.size())));
    		}
    	}


    	//요청업무 + 완료업무 포함
    	cri.setNotDone("N");
    	cri.setSearchType("requested");
    	dataMap = jobService.getSortedJobList(cri);
    	List<JobVO> requestedJobList = (List<JobVO>) dataMap.get("sortedJobList");
    	List<JobVO> requestedIssueList = jobService.getSortedJobListForIssue(cri);
    	//업무리스트를 순서대로 합치기
    	List<JobVO> requestedAllList = new ArrayList<JobVO>();
    	for(int i = 0; i<(requestedIssueList.size()+requestedJobList.size()); i++) {
    		if(i<requestedIssueList.size()) {
    			requestedAllList.add(i, requestedIssueList.get(i));
    		}else {
    			requestedAllList.add(i, requestedJobList.get((i-requestedIssueList.size())));
    		}
    	}
    	
    	//카운트 가져오기
    	Map<String, Integer> jobCount = jobService.getJobCount(loginUser.getEmpCode()) ;
    	
    	mnv.addObject("jobCount", jobCount);
    	mnv.addObject("requetedAllList",requestedAllList);
    	mnv.addObject("receivedJobList",receivedJobList);
    	mnv.addObject("allList",allList);
        mnv.setViewName(url);
        return mnv;
    }

    @Autowired
    private JobService jobService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
	private CommonCodeService commonCodeService;
    @Autowired
    private AttachmentService attachmentService;


    @RequestMapping("/registerJobForm")
    public ModelAndView registerJobForm(ModelAndView mnv) throws SQLException {
    	String url = "job/registerJobForm";

    	List<CommonCodeVO> headOfficeList = commonCodeService.getHeadOfficeList();

    	List<EmployeeVO> empList = employeeService.getEmployeeList();

    	mnv.addObject("empList",empList);
    	mnv.addObject("headOfficeList", headOfficeList);
    	mnv.setViewName(url);
    	return mnv;
    }

    @RequestMapping("/registerJobFormOpenWindow")
    public ModelAndView registerJobFormOpenWindow(ModelAndView mnv) throws SQLException {
    	String url = "job/registerJobFormOpenWindow";

    	List<CommonCodeVO> headOfficeList = commonCodeService.getHeadOfficeList();

    	List<EmployeeVO> empList = employeeService.getEmployeeList();

    	mnv.addObject("empList",empList);
    	mnv.addObject("headOfficeList", headOfficeList);
    	mnv.setViewName(url);
    	return mnv;
    }
    
    
    @Resource(name ="jobFilesPath" )
    private String jobFilesPath;


    @RequestMapping("/manageJobcode")
    public ModelAndView manageJobcode(ModelAndView mnv, HttpSession session) throws SQLException{
        String url = "job/manageJobcode";
        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String teamCode = loginUser.getTeamCode();
        Criteria cri = new Criteria();
        cri.setSearchType("teamCode");
        cri.setKeyword(teamCode);

        List<JobStakeholdersDTO> jobStakeholderList = jobService.getJobStakeholderListByTeamCode(cri);
        List<EmployeeVO> teamEmpList =employeeService.getEmployeeListByComCode(teamCode);

        mnv.addObject("jobStakeholderList", jobStakeholderList);
        mnv.addObject("teamEmpList", teamEmpList);
        mnv.setViewName(url);

        return mnv;
    }



	//내 업무함 : 수신, 요청, 참조, 임시저장
	@RequestMapping("/myJobTabs")
	public ModelAndView receivedJobList(JobCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {
		String url="job/myJobTabs";

		//JobCriteria jobCri = criCmd.toCriteria();
		//jobCri.setLoginEmpCode(((EmployeeVO)session.getAttribute("loginUser")).getEmpCode());
		//Map<String, Object> dataMap = jobService.getAllJobList(jobCri);
		//mnv.addObject("dataMap",dataMap);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		JobKeywordSearchCriteria cri = new JobKeywordSearchCriteria();
				
    	EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
    	cri.setLoginEmpCode(loginUser.getEmpCode());
    	cri.setTeamCode(loginUser.getTeamCode());
    	
		cri.setSearchType("tempSaved");
		Map<String, Object> tempSaved = jobService.getSortedJobList(cri);

		cri.setSearchType("refered");
		Map<String, Object> refered = jobService.getSortedJobList(cri);	
		List<JobVO> issueListRefered = jobService.getSortedJobListForIssue(cri);		
		
		cri.setSearchType("requested");
		Map<String, Object> requested = jobService.getSortedJobList(cri);	
		List<JobVO> issueListRequested = jobService.getSortedJobListForIssue(cri);		
		
		cri.setSearchType("received");
		Map<String, Object> received = jobService.getSortedJobList(cri);
		List<JobVO> issueListReceived = jobService.getSortedJobListForIssue(cri);
		
		
		dataMap.put("tempSavedJobList",tempSaved);
		dataMap.put("referedJobList",refered);	
		dataMap.put("issueListRefered",issueListRefered);
		dataMap.put("requestedJobList",requested);
		dataMap.put("issueListRequested",issueListRequested);
		dataMap.put("receivedJobList",received);
		dataMap.put("issueListReceived",issueListReceived);
		
				
		mnv.addObject("dataMap", dataMap);		
		mnv.setViewName(url);

		return mnv;
	};


	//부서 업무함
	@RequestMapping("/teamJobTabs")
	public ModelAndView teamJob(ModelAndView mnv, HttpSession session) throws Exception {
		String url="job/teamJobTabs";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		JobKeywordSearchCriteria cri = new JobKeywordSearchCriteria();
				
		cri.setTeamCode(((EmployeeVO)session.getAttribute("loginUser")).getTeamCode());
		
		cri.setSearchType("teamRequested");
		Map<String, Object> teamRequested = jobService.getSortedJobList(cri);	
		List<JobVO> issueListRequested = jobService.getSortedJobListForIssue(cri);		
		
		cri.setSearchType("teamReceived");
		Map<String, Object> teamReceived = jobService.getSortedJobList(cri);
		List<JobVO> issueListReceived = jobService.getSortedJobListForIssue(cri);

		dataMap.put("teamRequested",teamRequested);
		dataMap.put("issueListRequested",issueListRequested);
		dataMap.put("teamReceived",teamReceived);
		dataMap.put("issueListReceived",issueListReceived);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	};


	//이슈 업무함
	@RequestMapping("/issueJob")
	public String issueJob() {
		String url="job/issueJob";
		return url;
	};

	//수신 업무 상세
	@RequestMapping("/receivedJobDetail")
	public ModelAndView receivedJobDetail(String jobCode, ModelAndView mnv,HttpServletRequest request)  throws Exception {
		String url="job/receivedJobDetail";

		JobVO jobDetail = jobService.getJobByJobCode(jobCode);

		mnv.addObject("jobDetail", jobDetail);
		mnv.setViewName(url);

		//업무 로그 남기기
		LoggerHelper.writeJobLog(request, jobCode, savePathJobs);
		
		return mnv;
	};

	//요청 업무 상세
	@RequestMapping("/requestedJobDetail")
	public ModelAndView requestedJobDetail(String jobCode, ModelAndView mnv,HttpServletRequest request)  throws Exception {
		String url="job/requestedJobDetail";

		JobVO jobDetail = jobService.getJobByJobCode(jobCode);

		mnv.addObject("jobDetail", jobDetail);
		mnv.setViewName(url);
		
		//업무 로그 남기기
		LoggerHelper.writeJobLog(request, jobCode, savePathJobs);
		
		return mnv;
	};

	//파일 다운로드
	@RequestMapping("/getFile")
	public String getFile(String atCode, Model model) throws Exception {
		String url = "downloadFile";

		AttachmentVO attach = attachmentService.getAttachmentByAT(atCode);

		model.addAttribute("savepath", attach.getAttachSavepath());
		model.addAttribute("savename", attach.getAttachSavename());

		return url;
	}


	//수신 업무 처리 내역 수정
	@RequestMapping("/updateProcess")
	public String updateProcess(JobVO job, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/job/receivedJobDetail";

		jobService.updateJobProcess(job);
		rttr.addAttribute("jobCode", job.getJobCode());

		return url;
	}






}
