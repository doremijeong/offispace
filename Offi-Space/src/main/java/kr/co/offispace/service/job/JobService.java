package kr.co.offispace.service.job;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobCriteria;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.JobRegisterCommand;
import kr.co.offispace.command.JobRemoveCommand;
import kr.co.offispace.command.JobUpdateCommand;
import kr.co.offispace.command.JobcodeRegisterCommand;
import kr.co.offispace.dto.JobAssistantVO;
import kr.co.offispace.dto.JobDeniedVO;
import kr.co.offispace.dto.JobIssueVO;
import kr.co.offispace.dto.JobReplyVO;
import kr.co.offispace.dto.JobStakeholdersDTO;
import kr.co.offispace.dto.JobVO;

public interface JobService {

	List<JobStakeholdersDTO> getJobStakeholderListByTeamCode(Criteria cri) throws SQLException;

    void registerJobcode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;
	void registerJobAssistant(JobAssistantVO jobAssistantVO) throws SQLException;
	void modifyJobCharger(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;
	void modifyJobcode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;

	//업무 목록
	public Map<String, Object> getAllJobList(JobCriteria cri) throws SQLException;

	//부서 업무 목록
	public Map<String, Object> getAllTeamJobList(JobCriteria cri) throws SQLException;

	//업무 상세
	public JobVO getJobByJobCode(String jobCode) throws SQLException;

	//처리내역 수정
	public void updateJobProcess(JobVO job) throws SQLException;
	public void updateJobProcessFile(JobUpdateCommand jobUpdateCommand) throws SQLException;

	
	String registerJob (JobRegisterCommand jobRegisterCommand) throws SQLException;
	void removeJob (JobRemoveCommand jobRemoveCommand) throws SQLException;

	//업무 댓글 등록
	public void registerJobReply(JobReplyVO jobReply) throws SQLException;
	//업무 댓글 목록
	List<JobReplyVO> getJobReplyList(String jobCode) throws SQLException;
	//업무 댓글 삭제
	public void removeJobReply(String jobReplyCode) throws SQLException;
	//업무 댓글 수정
	public void updateJobReply(JobReplyVO jobReply) throws SQLException;

	Map<String,Object> getSortedJobList(JobKeywordSearchCriteria cri) throws SQLException;
	List<JobVO> getSortedJobListForIssue(JobKeywordSearchCriteria cri) throws SQLException;

	void registerJobIssue(JobIssueVO jobIssue) throws SQLException;
	JobIssueVO getJobIssue(String jobCode) throws SQLException;
	void removeJobIssue(String jobCode) throws SQLException;
	Map<String,Integer> getJobCount(String empCode) throws SQLException;

	void registerJobDenied(JobDeniedVO jobDenied) throws SQLException;
	JobDeniedVO getJobDenied(String jobCode) throws SQLException;

}
