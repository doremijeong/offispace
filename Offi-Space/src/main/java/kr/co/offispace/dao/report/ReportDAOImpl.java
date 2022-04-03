package kr.co.offispace.dao.report;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.ManagerReportDTO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;

public class ReportDAOImpl implements ReportDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReportVO> selectReportList(Criteria cri) throws SQLException {
		List<ReportVO> reportList = sqlSession.selectList("Report-Mapper.selectReportList",cri);
		return reportList;
	}

	@Override
	public ReportVO selectReport(Criteria cri) throws SQLException {
		ReportVO report = sqlSession.selectOne("Report-Mapper.selectReport",cri);
		return report;
	}

	@Override
	public List<String> selectReportDayList(String reportCode) throws SQLException {
		List<String> reportDayList = sqlSession.selectList("Report-Mapper.selectReportDayList",reportCode);
		return reportDayList;
	}

	@Override
	public List<EmployeeVO> selectReportWriterList(String reportCode) throws SQLException {
		List<EmployeeVO> writerList = sqlSession.selectList("Report-Mapper.selectReportWriterList",reportCode);
		return writerList;
	}
	@Override
	public List<ReportVO> selectRegularReportListToWrite(String empCode) throws SQLException {
		List<ReportVO> regularReportListToWrite = sqlSession.selectList("Report-Mapper.selectRegularReportListToWrite",empCode);
		return regularReportListToWrite;
	}

	@Override
	public void insertReportDoc(ReportDocVO reportDoc) throws SQLException {
		sqlSession.insert("Report-Mapper.insertReportDoc",reportDoc);

	}

	@Override
	public String selectReportCodeToRegister() throws SQLException {
		String reportCode = sqlSession.selectOne("Report-Mapper.selectReportCodeToRegister");
		return reportCode;
	}
	@Override
	public String selectReportDocCodeToRegister() throws SQLException {
		String reportDocCode = sqlSession.selectOne("Report-Mapper.selectReportDocCodeToRegister");
		return reportDocCode;
	}

	@Override
	public List<ReportVO> selectIrregularReportListByTeam(String teamCode) throws SQLException {
		List<ReportVO> reportList = sqlSession.selectList("Report-Mapper.selectIrregularReportListByTeam",teamCode);
		return reportList;
	}

	@Override
	public String selectReportMarkup(String reportCode) throws SQLException {
		String markup = sqlSession.selectOne("Report-Mapper.selectReportMarkup", reportCode);

		return markup;
	}

	@Override
	public List<ManagerReportDTO> selectManagerReportList(Map<String,String> searchTypeDateEmpCode) throws SQLException {
		List<ManagerReportDTO> managerReportList = sqlSession.selectList("Report-Mapper.selectManagerReportList",searchTypeDateEmpCode);
		return managerReportList;
	}

	@Override
	public ManagerReportDTO selectManagerReport(Map<String, String> reportCodeDtEmpCode) throws SQLException {
		ManagerReportDTO managerReport = sqlSession.selectOne("Report-Mapper.selectManagerReport",reportCodeDtEmpCode);
		return managerReport;
	}

	@Override
	public List<EmployeeVO> selectManagerReportedList(Map<String, String> reportCodeAndDt) throws SQLException {
		List<EmployeeVO> reportedList = sqlSession.selectList("Report-Mapper.selectManagerReportedList",reportCodeAndDt);
		return reportedList;
	}

	@Override
	public List<EmployeeVO> selectManagerNotReportedList(Map<String, String> reportCodeAndDt) throws SQLException {
		List<EmployeeVO> notReportedList = sqlSession.selectList("Report-Mapper.selectManagerNotReportedList",reportCodeAndDt);
		return notReportedList;
	}

	@Override
	public ReportDocVO selectReportFromManager(Map<String, String> empCodeReportCodeReportDt) throws SQLException {
		ReportDocVO reportDocMarkup = sqlSession.selectOne("Report-Mapper.selectReportFromManager",empCodeReportCodeReportDt);
		return reportDocMarkup;
	}
	@Override
	public ReportDocVO selectReportDocByReportDocCode(String reportDocCode) throws SQLException {
		ReportDocVO reportDoc = sqlSession.selectOne("Report-Mapper.selectReportDocByReportDocCode",reportDocCode);
		return reportDoc;
	}

	@Override
	public ReportVO selectReportInfoByEmpcodeForRegistDoc(String reportCode) throws SQLException {

		ReportVO vo = sqlSession.selectOne("Report-Mapper.selectReportInfoByEmpcodeForRegistDoc",reportCode);

		return vo;
	}

	@Override
	public List<ReportDocVO> selectReportDocListByEmpCode(Criteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
        int limit = cri.getPerPageNum();
        RowBounds rowBounds = new RowBounds(offset, limit);

		List<ReportDocVO> reportDocList = sqlSession.selectList("Report-Mapper.selectReportDocListByEmpCode",cri,rowBounds);
		return reportDocList;
	}

	@Override
	public int selectReportDocTotalCountByEmpCode(String empCode) throws SQLException {
		int total = sqlSession.selectOne("Report-Mapper.selectReportDocTotalCount",empCode);
		return total;
	}

	@Override
	public List<ReportDocVO> selectReportDocListByTeamCode(ReportCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
        int limit = cri.getPerPageNum();
        RowBounds rowBounds = new RowBounds(offset, limit);

		List<ReportDocVO> reportDocList = sqlSession.selectList("Report-Mapper.selectReportDocListByTeamCode",cri,rowBounds);
		return reportDocList;
	}

	@Override
	public int selectReportDocTotalCountByTeamCode(String teamCode) throws SQLException {
		int total = sqlSession.selectOne("Report-Mapper.selectReportDocTotalCountByTeamCode",teamCode);
		return total;
	}

	@Override
	public String selectReportDocMarkup(String reportDocCode) throws SQLException {
		String markup = sqlSession.selectOne("Report-Mapper.selectReportDocMarkup", reportDocCode);
		return markup;
	}

	@Override
	public void updateReportDocMarkupTemp(ReportDocVO reportDoc) throws SQLException {

		sqlSession.update("Report-Mapper.updateReportDocMarkupTemp",reportDoc);


	}

	@Override
	public void updateReportDocMarkup(ReportDocVO reportDoc) throws SQLException {
		sqlSession.update("Report-Mapper.updateReportDocMarkup",reportDoc);

	}



	@Override
	public int selectReportDocTotalCountForTemp(String empCode) throws SQLException {
		sqlSession.selectOne("Report-Mapper.selectReportDocTotalCountForTemp",empCode);
		return 0;
	}

	@Override
	public List<ReportDocVO> selectReportDocListByEmpCodeTemp(ReportCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
        int limit = cri.getPerPageNum();
        RowBounds rowBounds = new RowBounds(offset, limit);

        List<ReportDocVO> reportDocList = sqlSession.selectList("Report-Mapper.selectReportDocListByEmpCodeTemp",cri,rowBounds);

		return reportDocList;
	}

	@Override
	public void insertReport(ReportRegisterCommand reportRegisterCommand) throws SQLException {
		sqlSession.insert("Report-Mapper.insertReport", reportRegisterCommand);
	}
	@Override
	public void updateReport(ReportRegisterCommand reportRegisterCommand) throws SQLException {
		sqlSession.update("Report-Mapper.updateReport", reportRegisterCommand);
	}
	@Override
	public void insertReportRule(Map<String, String> codeTypeDay) throws SQLException {
		sqlSession.insert("Report-Mapper.insertReportRule",codeTypeDay);
	}
	@Override
	public void deleteReportRule(String reportCode) throws SQLException {
		sqlSession.delete("Report-Mapper.deleteReportRule",reportCode);
	}

}
