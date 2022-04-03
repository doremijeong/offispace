package kr.co.offispace.dao.job;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

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

public class JobDAOImpl implements JobDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public String selectJobCodeToRegister() throws SQLException {
		String jobCode = sqlSession.selectOne("Job-Mapper.selectJobCodeToRegister");
		return jobCode;
	}

	@Override
	public String selectJobcodeCodeToRegister() throws SQLException {
		String jobcodeCode = sqlSession.selectOne("Job-Mapper.selectJobcodeCodeToRegister");
		return jobcodeCode;
	}


	@Override
	public List<JobcodeVO> selectJobcodeList(Criteria cri) throws SQLException {
		List<JobcodeVO> jobcodeList = sqlSession.selectList("Job-Mapper.selectJobcodeList", cri);
		return jobcodeList;
	}

	@Override
	public List<JobAssistantVO> selectJobAssistantList(Criteria cri) throws SQLException {
		List<JobAssistantVO> jobAssistantList = sqlSession.selectList("Job-Mapper.selectJobAssistantList", cri);
		return jobAssistantList;
	}

	@Override
	public void insertJobcodeCode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobcodeCode", jobcodeRegisterCommand);

	}


	@Override
	public void insertJobAssistant(JobAssistantVO jobAssistantVO) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobAssistant", jobAssistantVO);

	}

	@Override
	public void updateJobCharger(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobCharger", jobcodeRegisterCommand);
	}

	@Override
	public void updateJobcodeCode(JobcodeRegisterCommand jobcodeRegisterCommand) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobcodeCode", jobcodeRegisterCommand);

	}
	@Override
	public void deleteJobAssistant(String jobcodeCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJobAssistant",jobcodeCode);

	}

	@Override
	public void insertJob(JobRegisterCommand jobRegisterCommand) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJob",jobRegisterCommand);
	}

	@Override
	public void deleteJob(String jobCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJob",jobCode);

	}
	@Override
	public void insertJobReference(Map<String, String> jobCodeEmpCode) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobReference",jobCodeEmpCode);

	}
	@Override
	public void deleteJobReference(String jobCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJobReference",jobCode);
	}

	//수신 업무 목록
	@Override
	public List<JobVO> selectReceivedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectReceivedJobList", cri, rowBounds);

		return jobList;
	}

	//수신 업무 목록 개수
	@Override
	public int selectReceivedJobListTotalCount(JobCriteria cri) throws SQLException {
		int totalCount = sqlSession.selectOne("Job-Mapper.selectReceivedJobListTotalCount", cri);
		return totalCount;
	}


	//업무 개수
	@Override
	public int selectAllJobListTotalCount(JobCriteria cri) throws SQLException {
		int totalCount = sqlSession.selectOne("Job-Mapper.selectAllJobListTotalCount", cri);
		return totalCount;
	}


	//요청 업무 목록
	@Override
	public List<JobVO> selectRequestedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectRequestedJobList", cri, rowBounds);

		return jobList;
	}

	//참조 업무 목록
	@Override
	public List<JobVO> selectReferencedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectReferencedJobList", cri, rowBounds);

		return jobList;
	}

	//임시 보관함 목록
	@Override
	public List<JobVO> selectTempSavedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectTempSavedJobList", cri, rowBounds);

		return jobList;
	}

	//부서 수신 업무 목록
	@Override
	public List<JobVO> selectTeamReceivedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectTeamReceivedJobList", cri, rowBounds);

		return jobList;
	}

	//부서 요청 업무 목록
	@Override
	public List<JobVO> selectTeamRequestedJobList(JobCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobVO> jobList = sqlSession.selectList("Job-Mapper.selectTeamRequestedJobList", cri, rowBounds);

		return jobList;
	}

	//업무 상세 조회
	@Override
	public JobVO selectJobByJobCode(String jobCode) throws SQLException {
		JobVO jobDetail = sqlSession.selectOne("Job-Mapper.selectJobByJobcode", jobCode);
		return jobDetail;
	}

	//업무 참조자 가져오기
	@Override
	public List<JobVO> selectRefByJobCode(String jobCode) throws SQLException {
		List<JobVO> jobRef = sqlSession.selectList("Job-Mapper.selectRefByJobCode", jobCode);
		return jobRef;
	}


	@Override
	public int selectSortedJobListCount(JobKeywordSearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Job-Mapper.selectSortedJobListCount",cri);
		return count;
	}
	@Override
	public List<JobVO> selectSortedJobList(JobKeywordSearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Job-Mapper.selectSortedJobList",cri, rowBounds);
	}


	@Override
	public List<JobVO> selectSortedJobListForIssue(JobKeywordSearchCriteria cri) throws SQLException {
		List<JobVO> issueList = sqlSession.selectList("Job-Mapper.selectSortedJobListForIssue",cri);
		return issueList;
	}

	//업무 진척도 변경
	@Override
	public void updateJobProcess(JobVO job) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobProcess", job);
	}

	//업무 '진행'으로 변경
	@Override
	public void updateStatusToProcessing(String jobCode) throws SQLException {
		sqlSession.update("Job-Mapper.updateStatusToProcessing", jobCode);
	}

	//업무 '완료'로 변경
	@Override
	public void updateStausToComplete(String jobCode) throws SQLException {
		sqlSession.update("Job-Mapper.updateStausToComplete", jobCode);
	}

	//업무 댓글 등록
	@Override
	public void insertJobReply(JobReplyVO jobReply) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobReply", jobReply);
	}

	//업무 댓글 목록
	@Override
	public List<JobReplyVO> selectJobReply(String jobCode) throws SQLException {
		List<JobReplyVO> jobReplyList = sqlSession.selectList("Job-Mapper.selectJobReply", jobCode);
		return jobReplyList;
	}

	//업무 댓글 개수
	@Override
	public int selectReplyTotalCount(String jobCode) throws SQLException {
		int replyCount = sqlSession.selectOne("Job-Mapper.selectReplyTotalCount", jobCode);
		return replyCount;
	}

	//업무 댓글 삭제
	@Override
	public void deleteJobReply(String jobReplyCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJobReply", jobReplyCode);
	}

	//업무 댓글 수정
	@Override
	public void updateJobReply(JobReplyVO jobReply) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobReply", jobReply);

	}


	@Override
	public void insertJobIssue(JobIssueVO jobIssue) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobIssue",jobIssue);

	}
	@Override
	public void updateJobIssueYes(String jobCode) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobIssueYes", jobCode);

	}
	@Override
	public void updateJobIssueNo(String jobCode) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobIssueNo",jobCode);
	}

	@Override
	public JobIssueVO selectJobIssue(String jobCode) throws SQLException {
		JobIssueVO jobIssue = sqlSession.selectOne("Job-Mapper.selectJobIssue",jobCode);
		return jobIssue;
	}

	@Override
	public void deleteJobIssue(String jobCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJobIssue",jobCode);

	}

	@Override
	public int selectJobCount(Map<String, String> searchTypeEmpCode) throws SQLException {
		int count = sqlSession.selectOne("Job-Mapper.selectJobCount", searchTypeEmpCode);
		return count;
	}


	@Override
	public void insertJobDenied(JobDeniedVO jobDenied) throws SQLException {
		sqlSession.insert("Job-Mapper.insertJobDenied",jobDenied);
	}

	@Override
	public JobDeniedVO selectJobDenied(String jobCode) throws SQLException {
		JobDeniedVO jobDenied = sqlSession.selectOne("Job-Mapper.selectJobDenied",jobCode);
		return jobDenied;
	}

	@Override
	public void updateJobDeniedYes(String jobCode) throws SQLException {
		sqlSession.update("Job-Mapper.updateJobDeniedYes", jobCode);

	}

	@Override
	public void deleteJobDenied(String jobCode) throws SQLException {
		sqlSession.delete("Job-Mapper.deleteJobDenied",jobCode);

	}
}
