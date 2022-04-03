package kr.co.offispace.dao.job;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.JobCriteria;
import kr.co.offispace.command.JobKeywordSearchCriteria;
import kr.co.offispace.command.JobRegisterCommand;
import kr.co.offispace.command.JobcodeRegisterCommand;
import kr.co.offispace.dto.JobAssistantVO;
import kr.co.offispace.dto.JobDeniedVO;
import kr.co.offispace.dto.JobIssueVO;
import kr.co.offispace.dto.JobReplyVO;
import kr.co.offispace.dto.JobVO;
import kr.co.offispace.dto.JobcodeVO;

public interface JobDAO {

	String selectJobCodeToRegister() throws SQLException;
	String selectJobcodeCodeToRegister() throws SQLException;

	void insertJobcodeCode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;
	void insertJobAssistant(JobAssistantVO jobAssistantVO) throws SQLException;
	void updateJobCharger(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;
	void updateJobcodeCode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException;
	void deleteJobAssistant(String jobcodeCode) throws SQLException;

	List<JobcodeVO>selectJobcodeList(Criteria cri) throws SQLException;
	List<JobAssistantVO>selectJobAssistantList(Criteria cri)throws SQLException;

	void insertJob (JobRegisterCommand jobRegisterCommand) throws SQLException;
	void deleteJob (String jobCode) throws SQLException;
	void insertJobReference(Map <String,String> jobCodeEmpCode) throws SQLException;
	void deleteJobReference(String jobCode) throws SQLException;

	//수신 업무 목록
	List<JobVO>selectReceivedJobList(JobCriteria cri) throws SQLException;
	//업무 개수(페이징)
	public int selectReceivedJobListTotalCount(JobCriteria cri) throws SQLException;

	//요청 업무 목록
	List<JobVO>selectRequestedJobList(JobCriteria cri) throws SQLException;
	//참조 업무 목록
	List<JobVO>selectReferencedJobList(JobCriteria cri) throws SQLException;
	//임시저장 업무 목록
	List<JobVO>selectTempSavedJobList(JobCriteria cri) throws SQLException;
	//부서 수신 업무 목록
	List<JobVO>selectTeamReceivedJobList(JobCriteria cri) throws SQLException;
	//부서 요청 업무 목록
	List<JobVO>selectTeamRequestedJobList(JobCriteria cri) throws SQLException;

	//수신 업무 상세 조회
	public JobVO selectJobByJobCode(String jobCode) throws SQLException;
	//참조자 불러오기
	public List<JobVO> selectRefByJobCode(String jobCode) throws SQLException;
	//수신 업무 처리내역 수정
	public void updateJobProcess(JobVO job) throws SQLException;
	//업무 상태 '진행'
	public void updateStatusToProcessing(String jobCode) throws SQLException;
	//업무 상태 '완료'
	public void updateStausToComplete(String jobCode) throws SQLException;

	//업무 댓글 등록
	public void insertJobReply(JobReplyVO jobReply) throws SQLException;
	//업무 댓글 목록
	List<JobReplyVO> selectJobReply(String jobCode) throws SQLException;
	//댓글 개수
	public int selectReplyTotalCount(String jobCode) throws SQLException;
	//댓글 삭제
	public void deleteJobReply(String jobReplyCode) throws SQLException;
	//댓글 수정
	public void updateJobReply(JobReplyVO jobReply) throws SQLException;

	//업무 개수(페이징)
	public int selectAllJobListTotalCount(JobCriteria cri) throws SQLException;

	int selectSortedJobListCount(JobKeywordSearchCriteria cri) throws SQLException;
	List<JobVO> selectSortedJobList(JobKeywordSearchCriteria cri) throws SQLException;
	List<JobVO> selectSortedJobListForIssue(JobKeywordSearchCriteria cri) throws SQLException;

	//이슈 업무
	public void insertJobIssue(JobIssueVO jobIssue) throws SQLException;
	public void updateJobIssueYes(String jobCode) throws SQLException;
	public void updateJobIssueNo(String jobCode) throws SQLException;
	JobIssueVO selectJobIssue(String jobCode) throws SQLException;
	public void deleteJobIssue(String jobCode) throws SQLException;
	int selectJobCount(Map<String, String> searchTypeEmpCode) throws SQLException;

	//업무 반려
	public void insertJobDenied(JobDeniedVO jobDenied) throws SQLException;
	public void updateJobDeniedYes(String jobCode) throws SQLException;
	JobDeniedVO selectJobDenied(String jobCode) throws SQLException;
	public void deleteJobDenied(String jobCode) throws SQLException;

}
