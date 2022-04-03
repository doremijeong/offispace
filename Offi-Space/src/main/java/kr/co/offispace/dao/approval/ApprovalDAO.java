package kr.co.offispace.dao.approval;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.w3c.dom.stylesheets.LinkStyle;

import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalProcessCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.JApprovalLineVO;

public interface ApprovalDAO {

	// 인증방식 등록
	public void insertCertify(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 인증방식 방법 수정
	public void updateCertify(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 인증방식 조회
	public ApprovalCertifyVO selectCertify(String empCode) throws SQLException;

	// 결재 비밀번호 생성
	public void insertApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 비밀번호 수정
	public void updateApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 OTP 생성
	public void insertApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 OTP 수정
	public void updateApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException;

	// 결재 비밀번호 가져오기
	public String selectApvPwdByEmpCode(String empCode) throws SQLException;

	// 결재 OTP 가져오기
	public String selectOtpKeyByEmpCode(String empCode) throws SQLException;

	// 결재 폼&폼 그룹 조회하기
	public List<ApprovalFormVO> selectApprovalForm() throws SQLException;

	// 결재 폼그룹 조회하기
	public List<ApprovalFormVO> selectApvFormGr() throws SQLException;

	// 결재 폼그룹으로 결재 폼 조회하기
	public List<ApprovalFormVO> selectApvFormByFormGr(String apvFormGr) throws SQLException;

	// 결재 폼코드로 결재 폼 조회하기
	public ApprovalFormVO selectApvFormByFormCode(String apvFormCode) throws SQLException;

	// 결재코드 가져오기
	public String selectApcCodeNextVal() throws SQLException;

	// 결재 등록하기
	public void insertApproval(ApprovalVO apv) throws SQLException;

	// 결재선 등록하기
	public void insertApprovalLine(ApprovalLineVO apvLine) throws SQLException;

	// 임시보관함 리스트 불러오기
	public List<ApprovalVO> selectTempApvList(ApprovalCriteria cri) throws SQLException;

	// 임시보관함 리스트 수 불러오기
	public int selectTempApvListCount(ApprovalCriteria cri) throws SQLException;

	// 내가 속한 결재의 결재코드 가져오기
	public List<String> selectApvCodeByEmpCodeFromApvLine(ApprovalCriteria cri) throws SQLException;

	// 결재코드로 결재문서 조회하기
	public ApprovalVO selectAppovalByApvCode(String apvCode) throws SQLException;

	// 결재대기함 리스트 수 불러오기
	public int selectWaitApvListCount(ApprovalCriteria cri) throws SQLException;

	// approvalVO하나 가져오는 쿼리문
	public ApprovalVO selectApproval(String apvCode) throws SQLException;

	// approvalLineVO 하나 가져오는 쿼리문
	public List<ApprovalLineVO> selectApprovalLine(String apvCode) throws SQLException;

	// approval 수정
	public void updateApproval(ApprovalVO apv) throws SQLException;

	// approval line삭제 쿼리
	public void deleteApvLine(String apvCode) throws SQLException;

	// 현재 결재 진행자 가져오는 쿼리
	public List<ApprovalLineVO> selectNowApvLine(String apvCode) throws SQLException;

	// 해당 결재문서의 내 결재순서 가져오는 쿼리
	public int selectMyApvLineOrder(ApprovalLineVO apvLine) throws SQLException;

	// 자주쓰는 결재선 등록
	public void insertJApvLine(JApprovalLineVO jApvLine) throws SQLException;
	public void insertJApvLineInfo(JApprovalLineVO jApvLine) throws SQLException;

	// 자주쓰는 결재선 시쿼스 값 가져오기
	public String selectJApvLineSeqNextval() throws SQLException;

	// 자주 쓰는 결재선 조회
	public List<JApprovalLineVO> selectJApvLine(String empCode) throws SQLException;
	public List<JApprovalLineVO> selectJApvLineInfo(String jApvLineCode) throws SQLException;

	// 자주 쓰는 결재선 삭제
	public void deleteJApvLine(String jApvLineCode) throws SQLException;
	public void deleteJApvLineInfo(String jApvLineCode) throws SQLException;


	// 결재/합의 처리시 결재문서 수정 쿼리
	public void updateApprovalForProcess(ApprovalProcessCommand apvProCmd) throws SQLException;

	// 결재/합의 처리시 결재선 수정 쿼리
	public void updateApprovalLineForProcess(ApprovalProcessCommand apvProCmd) throws SQLException;

	// 마지막 결재순번 가져오는 쿼리
	public int selectLastApvOrder(String apvCode) throws SQLException;

	// 대결자 테이블에 insert
	public void insertAgency(ApvAgencyVO agency) throws SQLException;

	// 대결자 테이블에서 조회
	public List<ApvAgencyVO> selectAgencyList(String empCode) throws SQLException;

	// 반려 문서함 목록 불러오기
	public List<ApprovalVO> selectRefuseApvList(ApprovalCriteria cri) throws SQLException;

	// 요청함 목록 불러오기
	public List<ApprovalVO> selectRequestApvList(ApprovalCriteria cri) throws SQLException;

	// 반려 문서함 목록 불러오기
	public int selectRefuseApvListCount(ApprovalCriteria cri) throws SQLException;

	// 요청함 목록 불러오기
	public int selectRequestApvListCount(ApprovalCriteria cri) throws SQLException;

	// 결재 상태불러오기
	public String selectApvState(String comCode) throws SQLException;

	// 마지막 결재자 empCode가져오기
	public String selectFinalEmpCodeByApvCode(String apvCode) throws SQLException;

	// 반려시킨 결재자 empCode가져오기
	public String selectRefuseEmpCode(String apvCode) throws SQLException;

	// 재기안 수정
	public void updateApvForAgain(ApprovalVO apv) throws SQLException;

	// 참조/열람함 리스트 결재코드 가져오는 쿼리
	public List<String> selectRefApvList(ApprovalCriteria cri) throws SQLException;

	// 참조/열람함 리스트 수 불러오기
	public int selectRefApvListCount(ApprovalCriteria cri) throws SQLException;

	// 결재완료함 리스트 결재코드 가져오는 쿼리
	public List<String> selectCompleteApvList(ApprovalCriteria cri) throws SQLException;

	// 결재완료함 리스트 수 불러오기
	public int selectCompleteApvListCount(ApprovalCriteria cri) throws SQLException;

	// 메인 결재할 리스트 가져오기
	public List<ApprovalVO> selectListForMain(String empCode) throws SQLException;

	// 메일 대결자 조회
	public ApvAgencyVO selectAgency(String empCode) throws SQLException;

	// 메인 그래프 COUNT
	int selectApvCount(Map<String, String> apvEmpCode) throws SQLException;

	public int selectWaitApvListNowCount(ApprovalCriteria cri) throws SQLException;

	public int selectWaitApvListHapCount(ApprovalCriteria cri) throws SQLException;
	
	public List<String> selectHabLineList(String apvCode) throws SQLException;
	
	public String selectNextApvEmpCode(ApprovalLineVO apvLine) throws SQLException;
}
