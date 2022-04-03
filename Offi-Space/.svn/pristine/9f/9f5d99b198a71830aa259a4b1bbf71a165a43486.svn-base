package kr.co.offispace.service.approval;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalProcessCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.JApprovalLineVO;

public interface ApprovalService {

	// 인증방식 등록
	public void registerCertify(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 인증방식 방법 수정
	public void modifyCertify(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 인증방식 조회
	public ApprovalCertifyVO getCertify(String empCode) throws SQLException;

	// 결재 비밀번호 생성
	public void registerApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 비밀번호 수정
	public void modifyApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 OTP 생성
	public void registerApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 OTP 수정
	public void modifyApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 비밀번호 가져오기
	public String getApvPwdByEmpCode(String empCode) throws SQLException;

	// 결재 OTP 가져오기
	public String getOtpKeyByEmpCode(String empCode) throws SQLException;

	// 결재 폼&폼 그룹 조회하기
	public List<ApprovalFormVO> getApprovalForm() throws SQLException;

	// 결재 폼그룹 조회하기
	public List<ApprovalFormVO> getApvFormGr() throws SQLException;

	// 결재 폼그룹으로 결재 폼 조회하기
	public List<ApprovalFormVO> getApvFormByFormGr(String apvFormGr) throws SQLException;

	// 결재 폼코드로 결재 폼 조회하기
	public ApprovalFormVO getApvFormByFormCode(String apvFormCode) throws SQLException;

	// 결재 등록
	public void registerApproval(ApprovalVO apv) throws SQLException;

	// 임시보관함 리스트 불러오기
	public Map<String, Object> getApprovalTempList(ApprovalCriteria cri) throws SQLException;

	// 내가 속한 결재의 결재코드 가져오기
	//public List<String> getApvCodeByEmpCodeFromApvLine(String empCode) throws SQLException;

	// 결재코드로 결재문서 조회하기
	public Map<String, Object> getApprovalByApvCode(ApprovalCriteria cri) throws SQLException;
	public ApprovalVO getApprovalByApvCode2(String apvCode) throws SQLException;

	// 결재 하나 가져오는 서비스
	public ApprovalVO getApprovalByApvCode(String apvCode) throws SQLException;

	// 임시보관함에서 수정
	public void modifyApproval(ApprovalVO apv) throws SQLException;

	// 해당 결재문서의 내 결재순서 가져오기
	public int getMyApvLineOrder(ApprovalLineVO apvLine) throws SQLException;

	// 자주쓰는 결재선 등록
	public void registerJApvLine(JApprovalLineVO jApvLine) throws SQLException;
	public void registerJApvLineInfo(JApprovalLineVO jApvLine) throws SQLException;
	public String getJApvSeqNextval() throws SQLException;

	// 자주쓰는 결재선 리스트
	public List<JApprovalLineVO> jApvLineList(String empCode) throws SQLException;
	public List<JApprovalLineVO> getJApvLineInfo(String jApvLineCode)  throws SQLException;

	// 자주쓰는 결재선 삭제
	public void removeJApprovalLine(String jApvLineCode) throws SQLException;
	// 결재/합의 처리시 결재문서 수정
	public void modifyApprovalForProcess(ApprovalProcessCommand apvProCmd) throws SQLException;

	// 결재/합의 처리시 결재선 수정
	public void modifyApprovalLineForProcess(ApprovalProcessCommand apvProCmd) throws SQLException;

	// 마지막 순번 가져오기
	public int getLastApvOrder(String apvCode) throws SQLException;

	// 대결자 등록하기
	public void registerApvAgency(ApvAgencyVO agency) throws SQLException;

	// 대결자 목록 조회하기
	public List<ApvAgencyVO> getAgencyList(String empCode) throws SQLException;

	// 반려함 리스트 불러오기
	public Map<String, Object> getRefuseApvList(ApprovalCriteria cri) throws SQLException;

	// 요청함 리스트 불러오기
	public Map<String, Object> getRequestApvList(ApprovalCriteria cri) throws SQLException;

	// 재기안 수정
	public void modifyApvForAgain(ApprovalVO apv) throws SQLException;

	// 참조/열람함 리스트 조회하기
	public Map<String, Object> getRefApprovalByApvCode(ApprovalCriteria cri) throws SQLException;

	// 결재완료함 리스트 조회하기
	public Map<String, Object> getCompleteApprovalByApvCode(ApprovalCriteria cri) throws SQLException;

	// 메인 결재할 리스트 조회하기
	public List<ApprovalVO> getListForMain(String empCode) throws SQLException;

	// 메인 숫자 조회하기
	public Map<String, Integer> getMainCnt(ApprovalCriteria cri) throws SQLException;

	// 대결자 조회
	public ApvAgencyVO getAgency(String empCode) throws SQLException;
	
	// 메인 그래프 COUNT
	Map<String,Integer> getApvCount(String empCode) throws SQLException;
}

