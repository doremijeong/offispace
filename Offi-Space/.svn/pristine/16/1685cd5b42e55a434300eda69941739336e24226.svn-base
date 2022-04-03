package kr.co.offispace.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.JobRegisterCommand;
import kr.co.offispace.command.JobRemoveCommand;
import kr.co.offispace.command.JobUpdateCommand;
import kr.co.offispace.command.JobcodeRegisterCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JobDeniedVO;
import kr.co.offispace.dto.JobIssueVO;
import kr.co.offispace.dto.JobReplyVO;
import kr.co.offispace.dto.JobStakeholdersDTO;
import kr.co.offispace.dto.JobVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.job.JobService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@RestController
@RequestMapping("/job")
public class JobRestController {


    @Autowired
    private JobService jobService;

	@Resource(name="attachmentService")
	private AttachmentService attachService;


    @ResponseBody
    @RequestMapping(value = "/registerJobcode", method=RequestMethod.POST )
    public ResponseEntity<String> registerJobcode(@RequestBody JobcodeRegisterCommand jobcodeRegisterCommand, HttpSession session) throws SQLException{
        ResponseEntity<String> entity = null;

        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        jobcodeRegisterCommand.setJobTeamCode(loginUser.getTeamCode());

        jobService.registerJobcode(jobcodeRegisterCommand);
        entity = new ResponseEntity<String>(HttpStatus.OK);

        return entity;
    }



    @ResponseBody
    @RequestMapping(value = "/modifyJobcode", method=RequestMethod.POST )
    public ResponseEntity<String> modifyJobcode(@RequestBody JobcodeRegisterCommand jobcodeRegisterCommand, HttpSession session) throws SQLException{
        ResponseEntity<String> entity = null;

            jobService.modifyJobcode(jobcodeRegisterCommand);
            entity = new ResponseEntity<String>(HttpStatus.OK);


        return entity;
    }


    @ResponseBody
    @RequestMapping(value="/sortedjobcodeList")
    public ResponseEntity <Map<String,Object>> getSortedJobcodeList(Criteria cri) throws SQLException{
    	ResponseEntity<Map<String,Object>> entity = null;
    	Map<String,Object> data = new HashMap<>();

		List<JobStakeholdersDTO> jobcodeList = jobService.getJobStakeholderListByTeamCode(cri);
		data.put("jobcodeList", jobcodeList);
		entity = new ResponseEntity<Map<String,Object>>(data,HttpStatus.OK);


    	return entity;
    }


    @Resource(name ="jobFilesPath" )
    private String jobFilesPath;

    @ResponseBody
    @RequestMapping("/registerJob")
    public ResponseEntity<Map<String,Object>> registerJob(JobRegisterCommand jobRegisterCommand) throws Exception{
    	ResponseEntity<Map<String,Object>> entity = null;

    	List<MultipartFile> attached = jobRegisterCommand.getAttached();
		if(attached != null && attached.size() != 0) {
			List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(jobRegisterCommand.getAttached(), jobFilesPath);
			jobRegisterCommand.setAttachList(attachList);
		}
		String jobCode = jobService.registerJob(jobRegisterCommand);
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("jobCode", jobCode);
		entity = new ResponseEntity<Map<String,Object>>(data,HttpStatus.OK);


    	return entity;
    }


    @ResponseBody
    @RequestMapping("/updateProcessFile")
    public ResponseEntity<String>updateProcessFile (JobUpdateCommand jobUpdateCommand,HttpSession session) throws Exception{
    	ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
    	EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		if(jobUpdateCommand.getDeleteFiles() != null && jobUpdateCommand.getDeleteFiles().size() >0) {
			for (String atCode : jobUpdateCommand.getDeleteFiles()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				File deleteFile = new File(attach.getAttachSavepath(), attach.getAttachSavename());
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				attachService.removeAttachmentByAT(atCode);
			}
		}

    	List<MultipartFile> attached = jobUpdateCommand.getAttached();
		if(attached != null && attached.size() != 0) {
			List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(jobUpdateCommand.getAttached(), jobFilesPath);
			jobUpdateCommand.setAttachList(attachList);
		}
		jobUpdateCommand.setJobChargerCode(loginUser.getEmpCode());
		jobService.updateJobProcessFile(jobUpdateCommand);

		return entity;
    }




	@ResponseBody
    @RequestMapping(value="/sortedjobList")
    public ResponseEntity <Map<String,Object>> getSortedJobList(JobKeywordSearchCriteria cri, HttpSession session) throws SQLException{
    	ResponseEntity<Map<String,Object>> entity = null;

    	Map<String,Object> data = new HashMap<>();

    	EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
    	cri.setLoginEmpCode(loginUser.getEmpCode());
    	cri.setTeamCode(loginUser.getTeamCode());

    	data = jobService.getSortedJobList(cri);
    	List<JobVO> issueList = jobService.getSortedJobListForIssue(cri);
    	data.put("issueList", issueList);

    	entity = new ResponseEntity<Map<String,Object>>(data,HttpStatus.OK);

    	return entity;
    }


	//업무 댓글 등록
	@ResponseBody
	@RequestMapping(value="/registerJobReply")
	public void registerJobReply(@RequestBody JobReplyVO jobReply, HttpSession session) throws Exception {

	   	EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

	   	jobReply.setJobReplyWriter(loginUser.getEmpCode());

    	jobService.registerJobReply(jobReply);
	}

	//업무 댓글 목록
	@RequestMapping("/jobReplyList/{jobCode}")
	public List<JobReplyVO> jobReplyList(@PathVariable String jobCode) throws Exception {

		List<JobReplyVO> replyList = jobService.getJobReplyList(jobCode);

		return replyList;
	}

	//업무 댓글 삭제
	@RequestMapping("/removeJobReply")
	public void removeJobReply(String jobReplyCode) throws Exception {
		jobService.removeJobReply(jobReplyCode);
	}


	//업무 댓글 수정
	@ResponseBody
	@RequestMapping(value="/updateJobReply")
	public void updateJobReply(@RequestBody JobReplyVO jobReply) throws Exception {

    	jobService.updateJobReply(jobReply);
	}



    @ResponseBody
    @RequestMapping("/registerJobIssue")
    public ResponseEntity<String> registerJobIssue(JobIssueVO jobIssue) throws Exception{
    	ResponseEntity<String> entity = null;
    	jobService.registerJobIssue(jobIssue);
  		entity = new ResponseEntity<String>(HttpStatus.OK);
    	return entity;
    }


    @ResponseBody
    @RequestMapping("/registerJobDenied")
    public ResponseEntity<String> registerJobIssue(JobDeniedVO jobDenied) throws Exception{
    	ResponseEntity<String> entity = null;
    	jobService.registerJobDenied(jobDenied);
  		entity = new ResponseEntity<String>(HttpStatus.OK);
    	return entity;
    }

    @ResponseBody
    @RequestMapping("/removeJobIssue")
    public ResponseEntity<String> removeJobIssue(String jobCode) throws Exception{
    	ResponseEntity<String> entity = null;
    	jobService.removeJobIssue(jobCode);
  		entity = new ResponseEntity<String>(HttpStatus.OK);
    	return entity;
    }

    @ResponseBody
    @RequestMapping("/removeJob")
    public ResponseEntity<String> removeJob(JobRemoveCommand jobRemoveCommand) throws Exception{
    	ResponseEntity<String> entity = null;
		if(jobRemoveCommand.getAttachList()   != null && jobRemoveCommand.getAttachList().size() >0) {
			for (String atCode : jobRemoveCommand.getAttachList()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				File deleteFile = new File(attach.getAttachSavepath(), attach.getAttachSavename());
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				attachService.removeAttachmentByAT(atCode);
			}
		}
		if(jobRemoveCommand.getAttachListByJobCharger()   != null && jobRemoveCommand.getAttachListByJobCharger().size() >0) {
			for (String atCode : jobRemoveCommand.getAttachListByJobCharger()) {
				AttachmentVO attach = attachService.getAttachmentByAT(atCode);
				File deleteFile = new File(attach.getAttachSavepath(), attach.getAttachSavename());
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				attachService.removeAttachmentByAT(atCode);
			}
		}

    	jobService.removeJob(jobRemoveCommand);


  		entity = new ResponseEntity<String>(HttpStatus.OK);
    	return entity;
    }



}
