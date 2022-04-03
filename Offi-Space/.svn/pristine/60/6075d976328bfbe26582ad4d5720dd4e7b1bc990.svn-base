package kr.co.offispace.service.job;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobCriteria;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.JobKeywordSearchPageMaker;
import kr.co.offispace.command.JobPageMaker;
import kr.co.offispace.command.JobRegisterCommand;
import kr.co.offispace.command.JobRemoveCommand;
import kr.co.offispace.command.JobUpdateCommand;
import kr.co.offispace.command.JobcodeRegisterCommand;
import kr.co.offispace.dao.job.JobDAO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JobAssistantVO;
import kr.co.offispace.dto.JobDeniedVO;
import kr.co.offispace.dto.JobIssueVO;
import kr.co.offispace.dto.JobReplyVO;
import kr.co.offispace.dto.JobStakeholdersDTO;
import kr.co.offispace.dto.JobVO;
import kr.co.offispace.dto.JobcodeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

public class JobServiceImpl implements JobService {

    private JobDAO jobDAO;
    public void setJobDAO(JobDAO jobDAO) {
        this.jobDAO = jobDAO;
    }

    private AttachmentService attachService;
    public void setAttachService(AttachmentService attachService) {
        this.attachService = attachService;
    }


    private EmployeeService employeeService;
    public void setEmployeeService (EmployeeService employeeService) {
        this.employeeService = employeeService;
    }


    private NotificationService notificationService;
    public void setNotificationService (NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    @Override
    public List<JobStakeholdersDTO> getJobStakeholderListByTeamCode(Criteria cri) throws SQLException {
        List<JobStakeholdersDTO> jobStakeholderList = new ArrayList<JobStakeholdersDTO>();
        List<JobcodeVO> jobcodeList = jobDAO.selectJobcodeList(cri);

        for(JobcodeVO jobcode : jobcodeList) {
            JobStakeholdersDTO dto = new JobStakeholdersDTO();

            dto.setJobcodeCode(jobcode.getJobcodeCode());
            dto.setJobcodeName(jobcode.getJobcodeName());

            //업무 담당자가 있는 경우에만 업무담당자를 가져온다.
            if(jobcode.getEmpCode()!="") {
                EmployeeVO jobCharger = employeeService.getEmployeeByEmpCode(jobcode.getEmpCode());
                dto.setJobCharger(jobCharger);

            }
                cri.setSearchType("jobcodeCode");
                cri.setKeyword(jobcode.getJobcodeCode());


                List<EmployeeVO> jobAssistants = new ArrayList<EmployeeVO>();
                List<JobAssistantVO> jobAssistantList = jobDAO.selectJobAssistantList(cri);

                //업무 협조자가 있는 경우에만, 업무 협조자들의 정보를 가져온다.
                if(jobAssistantList != null) {
                    for(JobAssistantVO jobAssistant : jobAssistantList) {
                        EmployeeVO employee = employeeService.getEmployeeByEmpCode(jobAssistant.getEmpCode());
                        jobAssistants.add(employee);
                        dto.setJobAssistants(jobAssistants);
                }
            }
            jobStakeholderList.add(dto);
        }

        return jobStakeholderList;
    }

    @Override
    public void registerJobcode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
        String jobcodeCode = jobDAO.selectJobcodeCodeToRegister();
        jobcodeRegisterCommand.setJobcodeCode(jobcodeCode);
        jobDAO.insertJobcodeCode(jobcodeRegisterCommand);

        if(jobcodeRegisterCommand.getJobCharger() != null && "".equals(jobcodeRegisterCommand.getJobCharger()) != true){
            modifyJobCharger(jobcodeRegisterCommand);
        }

        List<String > jobAssistants = jobcodeRegisterCommand.getJobAssistants();
        if (jobAssistants != null && jobAssistants.size() != 0) {
            for(String jobAssistant: jobAssistants) {
                JobAssistantVO assistant  = new JobAssistantVO();
                assistant.setEmpCode(jobAssistant);
                assistant.setJobcodeCode(jobcodeCode);
                registerJobAssistant(assistant);
            }
        }
    }

    @Override
    public void registerJobAssistant(JobAssistantVO jobAssistantVO) throws SQLException {
        jobDAO.insertJobAssistant(jobAssistantVO);
    }

    @Override
    public void modifyJobCharger(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
        jobDAO.updateJobCharger(jobcodeRegisterCommand);

    }


    @Override
    public void modifyJobcode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
        jobDAO.updateJobcodeCode(jobcodeRegisterCommand);
        String jobcodeCode = jobcodeRegisterCommand.getJobcodeCode();

        List<String > jobAssistants = jobcodeRegisterCommand.getJobAssistants();

        Criteria cri = new Criteria();
        cri.setSearchType("jobcodeCode");
        cri.setKeyword(jobcodeCode);
        List<JobAssistantVO> list = jobDAO.selectJobAssistantList(cri);
        if (list != null || list.size() != 0 ) {
            jobDAO.deleteJobAssistant(jobcodeCode);
        }

        for(String jobAssistant: jobAssistants) {
            JobAssistantVO assistant  = new JobAssistantVO();
            assistant.setEmpCode(jobAssistant);
            assistant.setJobcodeCode(jobcodeCode);
            registerJobAssistant(assistant);
        }

    }


    @Override
    public String registerJob(JobRegisterCommand jobRegisterCommand) throws SQLException {
        String jobCode = jobDAO.selectJobCodeToRegister();
        jobRegisterCommand.setJobCode(jobCode);
        jobDAO.insertJob(jobRegisterCommand);
        List<String> jobReferences = jobRegisterCommand.getJobReferences();

        if(jobReferences != null && jobReferences.size() != 0) {
            for(String empCode : jobReferences) {
                Map<String, String> jobCodeEmpCode = new HashMap<>();
                jobCodeEmpCode.put("jobCode", jobCode);
                jobCodeEmpCode.put("empCode", empCode);
                jobDAO.insertJobReference(jobCodeEmpCode);
            }
        }

        List<AttachmentVO> attachList = jobRegisterCommand.getAttachList();
        if(attachList != null && attachList.size() != 0) {
            for (AttachmentVO attach : attachList) {
                attach.setAttachGroup(jobCode);    // 첨부파일에 넣을 PK
                attach.setAttachRegister(jobRegisterCommand.getJobRequesterCode()); // 등록자
                attachService.registerAttachment(attach);
            }
        }
        NotificationVO notification = new NotificationVO(jobRegisterCommand.getJobCode(), jobRegisterCommand.getJobRequesterCode(), "job/receivedJobDetail?jobCode="+jobRegisterCommand.getJobCode(), jobRegisterCommand.getJobChargerCode(), "새로운 업무 요청이 들어왔습니다.", "fas fa-briefcase","새로운 업무 요청");
        if ("Y".equals(jobRegisterCommand.getJobImportance())) {  notification.setNtImportant("Y"); }
        notificationService.registerNotification(notification);

        return jobCode;
    }


    @Override
    public void removeJob(JobRemoveCommand jobRemoveCommand) throws SQLException {
       String jobCode = jobRemoveCommand.getJobCode();
       if(jobRemoveCommand.getJobIssue() != null && jobRemoveCommand.getJobIssue().equals("Y")) {
           jobDAO.deleteJobIssue(jobCode);
       }
       if(jobRemoveCommand.getJobDenied() != null && jobRemoveCommand.getJobDenied().equals("Y")) {
           jobDAO.deleteJobDenied(jobCode);
       }

       jobDAO.deleteJobReference(jobCode);
       jobDAO.deleteJob(jobCode);

    }

    //내 수신,요청,참조,임시저장 업무 목록
    @Override
    public Map<String, Object> getAllJobList(JobCriteria cri) throws SQLException {

        Map<String, Object> dataMap = new HashMap<String, Object>();

        int totalCount = jobDAO.selectReceivedJobListTotalCount(cri);
        JobPageMaker pageMaker = new JobPageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(totalCount);

        List<JobVO> receivedJobList = jobDAO.selectReceivedJobList(cri);
        List<JobVO> requestedJobList = jobDAO.selectRequestedJobList(cri);
        List<JobVO> referencedJobList = jobDAO.selectReferencedJobList(cri);
        List<JobVO> tempSavedJobList = jobDAO.selectTempSavedJobList(cri);
        
        //수신 : 보낸 사람 정보 넣기
        for(JobVO jobs : receivedJobList) {
            String requesterCode = jobs.getJobRequesterCode();
            EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
            jobs.setJobRequester(requesterEmp);
            
            int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
            jobs.setReplyCount(replyCnt);
        }

        //요청 : 받는 사람 정보 넣기
        for(JobVO jobs : requestedJobList) {
            String receiverCode = jobs.getEmpCode();
            EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
            jobs.setJobReceiver(receiverEmp);
            
            int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
            jobs.setReplyCount(replyCnt);
        }

        //참조 : 받는 사람 정보 넣기
        for(JobVO jobs : referencedJobList) {
            String receiverCode = jobs.getEmpCode();
            EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
            jobs.setJobReceiver(receiverEmp);
            
            int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
            jobs.setReplyCount(replyCnt);
        }

        dataMap.put("jobList", receivedJobList);
        dataMap.put("requestedJobList", requestedJobList);
        dataMap.put("referencedJobList", referencedJobList);
        dataMap.put("tempSavedJobList", tempSavedJobList);
        dataMap.put("pageMaker", pageMaker);

        return dataMap;
    }

    //부서 수신, 요청 업무 목록
    @Override
    public Map<String, Object> getAllTeamJobList(JobCriteria cri) throws SQLException {

        Map<String, Object> dataMap = new HashMap<String, Object>();

        int totalCount = jobDAO.selectAllJobListTotalCount(cri);
        JobPageMaker pageMaker = new JobPageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(totalCount);

        List<JobVO> teamReceived = jobDAO.selectTeamReceivedJobList(cri);
        List<JobVO> teamRequested = jobDAO.selectTeamRequestedJobList(cri);

        //수신 : 보낸 사람 정보 넣기
        for(JobVO jobs : teamReceived) {
            String requesterCode = jobs.getJobRequesterCode();
            EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
            jobs.setJobRequester(requesterEmp);
        }
        //수신 : 받는 사람 정보 넣기
        for(JobVO jobs : teamReceived) {
            String receiverCode = jobs.getEmpCode(); //수신자
            EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
            jobs.setJobReceiver(receiverEmp);
        }

        //요청 : 보낸 사람 정보 넣기
        for(JobVO jobs : teamRequested) {
            String requesterCode = jobs.getJobRequesterCode();
            EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
            jobs.setJobRequester(requesterEmp);
        }
        //요청 : 받는 사람 정보 넣기
        for(JobVO jobs : teamRequested) {
            String receiverCode = jobs.getEmpCode(); //수신자
            EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
            jobs.setJobReceiver(receiverEmp);
        }

        dataMap.put("teamReceived", teamReceived);
        dataMap.put("teamRequested", teamRequested);
        dataMap.put("pageMaker", pageMaker);

        return dataMap;
    }

    //업무 상세 보기
    @Override
    public JobVO getJobByJobCode(String jobCode) throws SQLException {
        JobVO jobDetail = jobDAO.selectJobByJobCode(jobCode);

        int replyCount = jobDAO.selectReplyTotalCount(jobCode);
        jobDetail.setReplyCount(replyCount);

        String requesterCode = jobDetail.getJobRequesterCode();
        EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
        jobDetail.setJobRequester(requesterEmp);

        String receiverCode = jobDetail.getEmpCode(); //수신자
        EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
        jobDetail.setJobReceiver(receiverEmp);

        List<JobVO> refEmps = jobDAO.selectRefByJobCode(jobCode);
        List<EmployeeVO> empRefList = new ArrayList<>();

        for(JobVO refs : refEmps) {
            String refsEmpCode = refs.getEmpCode(); //수신자
            EmployeeVO referenceEmp = employeeService.getEmployeeByEmpCode(refsEmpCode);
            empRefList.add(referenceEmp);
        }
        jobDetail.setJobRefEmps(empRefList);


        List<AttachmentVO> attachList = attachService.getAttachmentListByOther(jobDetail.getJobCode());
        jobDetail.setAttachList(attachList);

        String fileGroupCode = "JP"+jobDetail.getJobCode().substring(2);
        List<AttachmentVO> attachListByJobCharger = attachService.getAttachmentListByOther(fileGroupCode);
        jobDetail.setAttachListByJobCharger(attachListByJobCharger);

        if(jobDetail.getJobIssue()!= null && jobDetail.getJobIssue().equals("Y")) {
            JobIssueVO jobIssue = jobDAO.selectJobIssue(jobDetail.getJobCode());
            jobDetail.setJobIssueDate(jobIssue.getJobIssueDate());
            jobDetail.setJobIssueEmpCode(jobIssue.getJobIssueEmpCode());
            jobDetail.setJobIssueReason(jobIssue.getJobIssueReason());

            EmployeeVO jobIssueEmployee = employeeService.getEmployeeByEmpCode(jobIssue.getJobIssueEmpCode());
            jobDetail.setJobIssueEmployee(jobIssueEmployee);
        }

        if(jobDetail.getJobDenied()!= null && jobDetail.getJobDenied().equals("Y")) {
            JobDeniedVO jobDenied = jobDAO.selectJobDenied(jobCode);
            jobDetail.setJobDeniedDate(jobDenied.getJobDeniedDate());
            jobDetail.setJobDeniedReason(jobDenied.getJobDeniedReason());
        }

        return jobDetail;
    }


    @Override
    public Map<String, Object> getSortedJobList(JobKeywordSearchCriteria cri) throws SQLException {
        Map<String, Object> dataMap = new HashMap<>();
        List<JobVO> sortedJobList = jobDAO.selectSortedJobList(cri);

        int totalCount = jobDAO.selectSortedJobListCount(cri);
        JobKeywordSearchPageMaker pageMaker = new JobKeywordSearchPageMaker();
        pageMaker.setJobKeywordSearchCriteria(cri);
        pageMaker.setTotalCount(totalCount);

        if("received".equals(cri.getSearchType())) {
            for(JobVO jobs : sortedJobList) {
                String requesterCode = jobs.getJobRequesterCode();
                EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
                jobs.setJobRequester(requesterEmp);
                
                int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
                jobs.setReplyCount(replyCnt);
            }
        }
        if("requested".equals(cri.getSearchType())||"done".equals(cri.getSearchType()) ||"refered".equals(cri.getSearchType())) {
            for(JobVO jobs : sortedJobList) {
                String receiverCode = jobs.getEmpCode();
                EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
                jobs.setJobReceiver(receiverEmp);
                
                int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
                jobs.setReplyCount(replyCnt);
            }
        }
        if("teamReceived".contentEquals(cri.getSearchType())||"teamRequested".contentEquals(cri.getSearchType())) {
            for(JobVO jobs : sortedJobList) {
                String requesterCode = jobs.getJobRequesterCode();
                EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
                jobs.setJobRequester(requesterEmp);
                String receiverCode = jobs.getEmpCode();
                EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
                jobs.setJobReceiver(receiverEmp);
                
                int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
                System.out.println(replyCnt + "&&&&");
                jobs.setReplyCount(replyCnt);
            }
        }


        dataMap.put("sortedJobList", sortedJobList);
        dataMap.put("pageMaker", pageMaker);


        return dataMap;
    }

    @Override
    public List<JobVO> getSortedJobListForIssue(JobKeywordSearchCriteria cri) throws SQLException {
        List<JobVO> issueList = jobDAO.selectSortedJobListForIssue(cri);

        if("received".equals(cri.getSearchType())) {
            for(JobVO jobs : issueList) {
                String requesterCode = jobs.getJobRequesterCode();
                EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
                jobs.setJobRequester(requesterEmp);
                
                int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
                jobs.setReplyCount(replyCnt);
            }
        }
        if("requested".equals(cri.getSearchType())||"done".equals(cri.getSearchType())||"refered".equals(cri.getSearchType()) ) {
            for(JobVO jobs : issueList) {
            String receiverCode = jobs.getEmpCode();
            EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
            jobs.setJobReceiver(receiverEmp);
            
            int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
            jobs.setReplyCount(replyCnt);
            }
        }

        if("teamReceived".contentEquals(cri.getSearchType())||"teamRequested".contentEquals(cri.getSearchType())) {
            for(JobVO jobs : issueList) {
                String requesterCode = jobs.getJobRequesterCode();
                EmployeeVO requesterEmp = employeeService.getEmployeeByEmpCode(requesterCode);
                jobs.setJobRequester(requesterEmp);
                String receiverCode = jobs.getEmpCode();
                EmployeeVO receiverEmp = employeeService.getEmployeeByEmpCode(receiverCode);
                jobs.setJobReceiver(receiverEmp);
                
                int replyCnt = jobDAO.selectReplyTotalCount(jobs.getJobCode());
                jobs.setReplyCount(replyCnt);
            }
        }
        return issueList;
    }


    //업무 진척도 수정
    @Override
    public void updateJobProcess(JobVO job) throws SQLException {
        jobDAO.updateJobProcess(job);
        jobDAO.updateStatusToProcessing(job.getJobCode());
        jobDAO.updateStausToComplete(job.getJobCode());
    }


    @Override
    public void updateJobProcessFile(JobUpdateCommand jobUpdateCommand) throws SQLException {

        List<AttachmentVO> attachList = jobUpdateCommand.getAttachList();
        String fileGroupCode = "JP"+jobUpdateCommand.getJobCode().substring(2);

        if(attachList != null && attachList.size() != 0) {
            for (AttachmentVO attach : attachList) {
                attach.setAttachGroup(fileGroupCode);    // 첨부파일에 넣을 PK
                attach.setAttachRegister(jobUpdateCommand.getJobChargerCode()); // 등록자
                attachService.registerAttachment(attach);
            }
        }

        JobVO job = jobUpdateCommand.getJobVO();
        jobDAO.updateJobProcess(job);
        jobDAO.updateStatusToProcessing(job.getJobCode());
        if(job.getJobProgress()==100) {
            jobDAO.updateStausToComplete(job.getJobCode());
        }
    }


    //업무 댓글 등록
    @Override
    public void registerJobReply(JobReplyVO jobReply) throws SQLException {
        jobDAO.insertJobReply(jobReply);
    }

    
    //업무 댓글 목록
    @Override
    public List<JobReplyVO> getJobReplyList(String jobCode) throws SQLException {
        List<JobReplyVO> jobReplyList =  jobDAO.selectJobReply(jobCode);

        for(JobReplyVO jobReply : jobReplyList) {
            String replierCode = jobReply.getJobReplyWriter();
            EmployeeVO replierEmp = employeeService.getEmployeeByEmpCode(replierCode);
            jobReply.setJobReplier(replierEmp);

            String pattern = "yyyy-MM-dd(E) | hh:mm:ss";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

            String modifyDate = simpleDateFormat.format(jobReply.getReplyModifyDt());

            jobReply.setReplyModifyDate(modifyDate);
        }

        return jobReplyList;
    }

    
    //업무 댓글 삭제
    @Override
    public void removeJobReply(String jobReplyCode) throws SQLException {
        jobDAO.deleteJobReply(jobReplyCode);
    }

    //업무 댓글 수정
    @Override
    public void updateJobReply(JobReplyVO jobReply) throws SQLException {
        jobDAO.updateJobReply(jobReply);
    }

    //이슈 업무
    @Override
    public void registerJobIssue(JobIssueVO jobIssue) throws SQLException {
        jobDAO.insertJobIssue(jobIssue);
        jobDAO.updateJobIssueYes(jobIssue.getJobCode());
    }

    @Override
    public JobIssueVO getJobIssue(String jobCode) throws SQLException {
        JobIssueVO jobIssue = jobDAO.selectJobIssue(jobCode);
        return jobIssue;
    }

    @Override
    public void removeJobIssue(String jobCode) throws SQLException {
        jobDAO.deleteJobIssue(jobCode);
        jobDAO.updateJobIssueNo(jobCode);

    }
    @Override
    public void registerJobDenied(JobDeniedVO jobDenied) throws SQLException {
        jobDAO.insertJobDenied(jobDenied);
        jobDAO.updateJobDeniedYes(jobDenied.getJobCode());

    }
    @Override
    public JobDeniedVO getJobDenied(String jobCode) throws SQLException {
        JobDeniedVO jobDenied = jobDAO.selectJobDenied(jobCode);
        return jobDenied;
    }

    @Override
    public Map<String, Integer> getJobCount(String empCode) throws SQLException {
        Map<String, String> searchTypeEmpCode = new HashMap<String, String>();
        Map<String, Integer> countMap = new HashMap<String, Integer>();

        searchTypeEmpCode.put("empCode", empCode);
        searchTypeEmpCode.put("searchType", "weeklyWaiting");
        int weeklyWaiting = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("weeklyWaiting",weeklyWaiting);
        System.out.println(weeklyWaiting);

        searchTypeEmpCode.put("searchType", "weeklyWorking");
        int weeklyWorking = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("weeklyWorking",weeklyWorking);
        System.out.println(weeklyWorking);

        searchTypeEmpCode.put("searchType", "weeklyDone");
        int weeklyDone = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("weeklyDone",weeklyDone);
        System.out.println(weeklyDone);

        searchTypeEmpCode.put("searchType", "weeklyLate");
        int weeklyLate = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("weeklyLate",weeklyLate);
        System.out.println(weeklyLate);

        searchTypeEmpCode.put("searchType", "monthlyWaiting");
        int monthlyWaiting = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("monthlyWaiting",monthlyWaiting);

        searchTypeEmpCode.put("searchType", "monthlyWorking");
        int monthlyWorking = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("monthlyWorking",monthlyWorking);

        searchTypeEmpCode.put("searchType", "monthlyDone");
        int monthlyDone = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("monthlyDone",monthlyDone);

        searchTypeEmpCode.put("searchType", "monthlyLate");
        int monthlyLate = jobDAO.selectJobCount(searchTypeEmpCode);
        countMap.put("monthlyLate",monthlyLate);


        return countMap;
    }



}
