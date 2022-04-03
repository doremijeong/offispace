package kr.co.offispace.dao.approval;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalProcessCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.JApprovalLineVO;

public class ApprovalDAOImpl implements ApprovalDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertCertify(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.insertCerfity", approvalCertify);
	}

	@Override
	public void updateCertify(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.updateCertify", approvalCertify);
	}

	@Override
	public ApprovalCertifyVO selectCertify(String empCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectCerfity", empCode);
	}

	@Override
	public void insertApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.insertApprovalPwd", approvalCertify);
	}

	@Override
	public void updateApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApprovalPwd", approvalCertify);
	}

	@Override
	public void insertApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.insertApprovalOtp", approvalCertify);
	}

	@Override
	public void updateApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApprovalOtp", approvalCertify);
	}

	@Override
	public String selectApvPwdByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectApvPwdByEmpCode", empCode);
	}

	@Override
	public String selectOtpKeyByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectOtpKeyByEmpCode", empCode);
	}

	@Override
	public List<ApprovalFormVO> selectApprovalForm() throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectApprovalForm");
	}

	@Override
	public List<ApprovalFormVO> selectApvFormGr() throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectApvFormGr");
	}

	@Override
	public List<ApprovalFormVO> selectApvFormByFormGr(String apvFormGr) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectApvFormByFormGr", apvFormGr);
	}

	@Override
	public ApprovalFormVO selectApvFormByFormCode(String apvFormCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectApvFormByFormCode", apvFormCode);
	}

	@Override
	public String selectApcCodeNextVal() throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectApcCodeNextVal");
	}

	@Override
	public void insertApproval(ApprovalVO apv) throws SQLException {
		sqlSession.update("Approval-Mapper.insertApproval", apv);
	}

	@Override
	public void insertApprovalLine(ApprovalLineVO apvLine) throws SQLException {
		sqlSession.update("Approval-Mapper.insertApprovalLine", apvLine);
	}

	@Override
	public List<ApprovalVO> selectTempApvList(ApprovalCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectTempApvList", cri, rowBounds);
	}

	@Override
	public int selectTempApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectTempApvListCount", cri);
	}

	@Override
	public List<String> selectApvCodeByEmpCodeFromApvLine(ApprovalCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectApvCodeByEmpCodeFromApvLine", cri, rowBounds);
	}

	@Override
	public ApprovalVO selectAppovalByApvCode(String apvCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectAppovalByApvCode", apvCode);
	}

	@Override
	public int selectWaitApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectWaitApvListCount", cri);
	}

	@Override
	public ApprovalVO selectApproval(String apvCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectApproval", apvCode);
	}

	@Override
	public List<ApprovalLineVO> selectApprovalLine(String apvCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectApprovalLine", apvCode);
	}

	@Override
	public void updateApproval(ApprovalVO apv) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApproval", apv);
	}

	@Override
	public void deleteApvLine(String apvCode) throws SQLException {
		sqlSession.update("Approval-Mapper.deleteApprovalLine", apvCode);
	}

	@Override
	public List<ApprovalLineVO> selectNowApvLine(String apvCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectNowApvLine", apvCode);
	}

	@Override
	public int selectMyApvLineOrder(ApprovalLineVO apvLine) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectMyApvLineOrder", apvLine);
	}

	@Override
	public void insertJApvLine(JApprovalLineVO jApvLine) throws SQLException {
		sqlSession.update("Approval-Mapper.insertJApvLine", jApvLine);
	}

	@Override
	public void insertJApvLineInfo(JApprovalLineVO jApvLine) throws SQLException {
		sqlSession.update("Approval-Mapper.insertJApvLineInfo", jApvLine);
	}

	@Override
	public String selectJApvLineSeqNextval() throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectJApvLineSeqNextval");
	}

	@Override
	public List<JApprovalLineVO> selectJApvLine(String empCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectJApvLine", empCode);
	}

	@Override
	public List<JApprovalLineVO> selectJApvLineInfo(String jApvLineCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectJApvLineInfo", jApvLineCode);
	}

	@Override
	public void deleteJApvLine(String jApvLineCode) throws SQLException {
		sqlSession.update("Approval-Mapper.deleteJApvLine", jApvLineCode);
	}

	@Override
	public void deleteJApvLineInfo(String jApvLineCode) throws SQLException {
		sqlSession.update("Approval-Mapper.deleteJApvLineInfo", jApvLineCode);
	}

	@Override
	public void updateApprovalForProcess(ApprovalProcessCommand apvProCmd) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApprovalForProcess",apvProCmd);
	}

	@Override
	public void updateApprovalLineForProcess(ApprovalProcessCommand apvProCmd) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApprovalLineForProcess",apvProCmd);
	}

	@Override
	public int selectLastApvOrder(String apvCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectLastApvOrder",apvCode);
	}

	@Override
	public List<String> selectRefApvList(ApprovalCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectRefApvList", cri, rowBounds);
	}

	@Override
	public int selectRefApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectRefApvListCount", cri);
	}

	@Override
	public List<String> selectCompleteApvList(ApprovalCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectCompleteApvList", cri, rowBounds);
	}

	@Override
	public int selectCompleteApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectCompleteApvListCount", cri);
	}

	@Override
	public void insertAgency(ApvAgencyVO agency) throws SQLException {
		sqlSession.update("Approval-Mapper.insertAgency",agency);
	}

	@Override
	public List<ApvAgencyVO> selectAgencyList(String empCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectAgencyList", empCode);
	}

	@Override
	public List<ApprovalVO> selectRefuseApvList(ApprovalCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectRefuseApvList", cri, rowBounds);
	}

	@Override
	public List<ApprovalVO> selectRequestApvList(ApprovalCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("Approval-Mapper.selectRequestApvList", cri, rowBounds);
	}

	@Override
	public int selectRefuseApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectRefuseApvListCount", cri);
	}

	@Override
	public int selectRequestApvListCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectRequestApvListCount", cri);
	}

	@Override
	public String selectApvState(String comCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectApvState", comCode);
	}

	@Override
	public String selectFinalEmpCodeByApvCode(String apvCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectFinalEmpCodeByApvCode", apvCode);
	}

	@Override
	public String selectRefuseEmpCode(String apvCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectRefuseEmpCode", apvCode);
	}

	@Override
	public void updateApvForAgain(ApprovalVO apv) throws SQLException {
		sqlSession.update("Approval-Mapper.updateApvForAgain",apv);
	}

	@Override
	public List<ApprovalVO> selectListForMain(String empCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectListForMain", empCode);
	}

	@Override
	public ApvAgencyVO selectAgency(String empCode) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectAgency", empCode);
	}

	@Override
	public int selectApvCount(Map<String, String> apvEmpCode) throws SQLException {
		int count = sqlSession.selectOne("Approval-Mapper.selectApvCount", apvEmpCode);
		return count;
	}

	@Override
	public int selectWaitApvListNowCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectWaitApvListNowCount", cri);
	}

	@Override
	public int selectWaitApvListHapCount(ApprovalCriteria cri) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectWaitApvListHapCount", cri);
	}

	@Override
	public List<String> selectHabLineList(String apvCode) throws SQLException {
		return sqlSession.selectList("Approval-Mapper.selectHabLineList", apvCode);
	}

	@Override
	public String selectNextApvEmpCode(ApprovalLineVO apvLine) throws SQLException {
		return sqlSession.selectOne("Approval-Mapper.selectNextApvEmpCode", apvLine);
	}

}
