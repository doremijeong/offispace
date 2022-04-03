package kr.co.offispace.service.report;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.IrregularReportStakeholersDTO;
import kr.co.offispace.dto.ManagerReportDTO;
import kr.co.offispace.dto.RegularReportStakeholersDTO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;

public interface ReportService {

	List<ReportVO> getReportList(Criteria cri) throws SQLException;
	ReportVO getReport(Criteria cri) throws SQLException;
	List<RegularReportStakeholersDTO> getRegularReportList(Criteria cri) throws SQLException;
	List<RegularReportStakeholersDTO> getRegularReportListToWrite(String empCode) throws SQLException;
	List<IrregularReportStakeholersDTO>getIrregularReportList(String teamCode) throws SQLException;

	String getReportMarkup(String reportCode) throws SQLException;
	public void registerReportDoc(ReportDocVO reportDocVO) throws SQLException;
	public ReportVO getReportInfoForRegistDoc(String reportCode) throws SQLException;

	List<ManagerReportDTO> getManagerReportList (Map<String,String> searchTypeDateEmpCode) throws SQLException, ParseException;
	ManagerReportDTO getManagerReport(Map<String, String> reportCodeDtEmpCode) throws SQLException, ParseException;
	List<EmployeeVO> getManagerReportedList(Map<String, String> reportCodeAndDt) throws SQLException;
	List<EmployeeVO> getManagerNotReportedList(Map<String, String> reportCodeAndDt) throws SQLException;
	ReportDocVO getReportFromManager(Map<String,String> empCodeReportCodeReportDt) throws SQLException;
	ReportDocVO getReportDocByReportDocCode(String reportDocCode) throws SQLException;

	//사원 코드로 보고문서 리스트 가져오는 애(내보고서함)
	public Map<String, Object> getReportDocListByEmpCode(Criteria cri) throws SQLException;
	//내보고서함 페이지네이션 위한 총 보고문서 개수
	public Map<String, Integer> getReportDocTotalCountByEmpCode(String empCode) throws SQLException;
	//팀코드로 보고문서 리스트 가져오는 애(부서보고서함)
	public Map<String, Object> getReportDocListByTeamCode(ReportCriteria cri) throws SQLException;
	//부서보고서함 페이지네이션 위해 총 보고문서 개수
	public Map<String, Integer> getReportDocTotalCountByTeamCode(String teamCode) throws SQLException;
	//보고서함 상세 마크업 가져오기
	public String getReportDocMarkup(String reportDocCode) throws SQLException;

	//보고문서 수정
	public void modifyReportDoc(ReportDocVO reportDoc) throws SQLException;
	void modifyReportDocMarkup(ReportDocVO reportDoc) throws SQLException;

	//임시보고서함 페이지네이션 위한 총 보고문서 개수
	public Map<String, Integer> getReportDocTotalCountForTemp(String empCode) throws SQLException;
	//사원 코드로 보고문서 리스트 가져오는 애(내보고서함)
	public Map<String, Object> getReportDocListByEmpCodeTemp(ReportCriteria cri) throws SQLException;


	void registerReport(ReportRegisterCommand reportRegisterCommand) throws SQLException;
	void modifyReport(ReportRegisterCommand reportRegisterCommand) throws SQLException;
}
