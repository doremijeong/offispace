package kr.co.offispace.dao.report;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.ManagerReportDTO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;

public interface ReportDAO {
	List<ReportVO> selectReportList(Criteria cri) throws SQLException;
	ReportVO selectReport(Criteria cri) throws SQLException;
	List<String> selectReportDayList(String reportCode) throws SQLException;
	List<EmployeeVO> selectReportWriterList(String reportCode) throws SQLException;
	List<ReportVO> selectRegularReportListToWrite(String empCode) throws SQLException;


	String selectReportCodeToRegister() throws SQLException;
	String selectReportDocCodeToRegister() throws SQLException;
	void insertReport(ReportRegisterCommand reportRegisterCommand) throws SQLException;
	void updateReport(ReportRegisterCommand reportRegisterCommand) throws SQLException;
	void insertReportRule(Map<String, String> codeTypeDay) throws SQLException;
	void deleteReportRule(String reportCode) throws SQLException;

	public void insertReportDoc(ReportDocVO reportDoc) throws SQLException;

	List<ReportVO> selectIrregularReportListByTeam(String teamCode) throws SQLException;
	public String selectReportMarkup(String reportCode) throws SQLException;

	List<ManagerReportDTO> selectManagerReportList (Map<String,String> searchTypeDateEmpCode) throws SQLException;
	ManagerReportDTO selectManagerReport(Map<String, String> reportCodeDtEmpCode) throws SQLException;
	List<EmployeeVO> selectManagerReportedList(Map<String, String> reportCodeAndDt) throws SQLException;
	List<EmployeeVO> selectManagerNotReportedList(Map<String, String> reportCodeAndDt) throws SQLException;
	ReportDocVO selectReportFromManager(Map<String,String> empCodeReportCodeReportDt) throws SQLException;
	ReportDocVO selectReportDocByReportDocCode(String reportDocCode) throws SQLException;

	public ReportVO selectReportInfoByEmpcodeForRegistDoc(String reportCode) throws SQLException;

	//사원코드로 보고문서 리스트
	List<ReportDocVO> selectReportDocListByEmpCode(Criteria cri) throws SQLException;
	//내보고서함 페이지네이션을 위한 보고문서 총개수
	public int selectReportDocTotalCountByEmpCode(String empCode) throws SQLException;
	//팀코드로 보고문서 리스트
	List<ReportDocVO> selectReportDocListByTeamCode(ReportCriteria cri) throws SQLException;
	//부서보고서함 페이지네이션을 위한 보고문서 총개수
	public int selectReportDocTotalCountByTeamCode(String teamCode) throws SQLException;
	//보고서함 상세 마크업 가져오기
	public String selectReportDocMarkup(String reportDocCode) throws SQLException;

	//보고서 수정
	public void updateReportDocMarkupTemp(ReportDocVO reportDoc) throws SQLException;

	void updateReportDocMarkup(ReportDocVO reportDoc) throws SQLException;



	//임시보고서함 보고문서 리스트
	List<ReportDocVO> selectReportDocListByEmpCodeTemp(ReportCriteria cri) throws SQLException;

	//임시보고서함 페이지네이션을 위한 임시보고문서 총개수
	public int selectReportDocTotalCountForTemp(String empCode) throws SQLException;



}
