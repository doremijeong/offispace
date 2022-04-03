package kr.co.offispace.dao.attend;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionHolder;

import kr.co.offispace.command.AttendCommand;
import kr.co.offispace.dto.AnnualHistoryVO;
import kr.co.offispace.dto.AnnualOccurVO;
import kr.co.offispace.dto.AnnualVO;
import kr.co.offispace.dto.AttendTypeVO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.WorkFromHomeAnswerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.dto.YearVacationVO;

public class AttendDAOImpl implements AttendDAO {

	private SqlSession sqlSession; 
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int selectAttPerCodeCntByEmpcode(AttendVO attendance) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAttPerCodeCntByEmpcode", attendance);
	}


	@Override
	public void insertAttend(AttendVO attend) throws SQLException {
		sqlSession.update("Attend-Mapper.insertAttendByAttend",attend);
	}

	@Override
	public void insertAttend(AttendCommand attend) throws SQLException {
		sqlSession.update("Attend-Mapper.insertAttend",attend);
	}

	@Override
	public AttendCommand selectAttTimeByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAttTimeByEmpCode",empCode);
	}

	@Override
	public void updateAttLeavTimeByAttTime(AttendCommand attend) throws SQLException {
		sqlSession.update("Attend-Mapper.updateAttLeavTimeByAttTime",attend);
	}

	@Override
	public AttendCommand selectAttLeavTimeByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAttLeavTimeByEmpCode",empCode);
	}

	@Override
	public AttendCommand selectAttTime(String empCode) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAttTime",empCode);
	}

	@Override
	public void updateOtherAttTimesByEmpCode(AttendCommand command) throws SQLException {
		sqlSession.update("Attend-Mapper.updateOtherAttTimesByEmpCode",command);
	}

	@Override
	public void updateAttJobStCodeByEmpCode(AttendVO attend) throws SQLException {
		sqlSession.update("Attend-Mapper.updateAttJobStCodeByEmpCode",attend);
	}

	@Override
	public List<AttendVO> selectAttendPerStCode(AttendVO attend) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectAttendPerStCode",attend);
	}

	@Override
	public void updateLeave(AttendVO attend) throws SQLException {
		sqlSession.update("Attend-Mapper.updateLeave",attend);
	}

	@Override
	public int selectCountAttend(AttendVO attend) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectCountAttend",attend);
	}

	@Override
	public int selectCountAttendLeave(AttendVO attend) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectCountAttendLeave",attend);
	}

	@Override
	public AttendVO selectAttendForLogin(AttendVO attend) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAttendForLogin",attend);
	}

	@Override
	public List<AttendVO> selectTodaysTeamMemberAttend(AttendVO attend) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectTodaysTeamMemberAttend",attend);
	}

	@Override
	public void insertAttendType(AttendTypeVO attendType) throws SQLException {
		sqlSession.update("Attend-Mapper.insertAttendType",attendType);
	}

	@Override
	public List<AttendVO> selectMonthPersonalAttendList(AttendVO attend) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectMonthPersonalAttendList",attend);
	}

	@Override
	public List<YearVacationVO> selectYearVacationListByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectYearVacationListByEmpCode",empCode);
	}

	@Override
	public YearVacationVO selectYearVacationByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectYearVacationByEmpCode",empCode);
	}

	@Override
	public AnnualVO selectAnnual(AnnualVO annual) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectAnnual",annual);
	}

	@Override
	public List<AnnualHistoryVO> selectAnnualHistoryList(AnnualVO annual) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectAnnualHistoryList",annual);
	}

	@Override
	public List<AnnualOccurVO> selectAnnualOccurList(AnnualVO annual) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectAnnualOccurList",annual);
	}

	@Override
	public WorkFromHomeVO selectWorkFromHomeByEmpCode(WorkFromHomeVO home) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectWorkFromHomeByEmpCode",home);
	}

	@Override
	public void insertWorkFromHome(WorkFromHomeVO home) throws SQLException {
		sqlSession.update("Attend-Mapper.insertWorkFromHome",home);
	}

	@Override
	public List<WorkFromHomeVO> selectWorkFromHomeByTeamCode(WorkFromHomeVO home) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectWorkFromHomeByTeamCode",home);
	}

	@Override
	public void insertTeamsHomeCheck(WorkFromHomeAnswerVO home) throws SQLException {
		sqlSession.update("Attend-Mapper.insertTeamsHomeCheck",home);
	}

	@Override
	public void updateWorkFromHomeAnswerTime(WorkFromHomeAnswerVO answer) throws SQLException {
		sqlSession.update("Attend-Mapper.updateWorkFromHomeAnswerTime",answer);
	}

	@Override
	public List<WorkFromHomeAnswerVO> selectWorkFromHomeAnswerListByTeamCode(String teamCode) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectWorkFromHomeAnswerListByTeamCode",teamCode);
	}

	@Override
	public int selectWorkFromHomeAnsCntByEmpCode(String empCode) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectWorkFromHomeAnsCntByEmpCode",empCode);
	}

	@Override
	public WorkFromHomeAnswerVO selectWorkFromhomeAnswerByAnswerTimeAndEmpCode(WorkFromHomeAnswerVO answer) throws SQLException {
		return sqlSession.selectOne("Attend-Mapper.selectWorkFromhomeAnswerByAnswerTimeAndEmpCode",answer);
	}

	@Override
	public void insertAnnualHistory(AnnualHistoryVO annual) throws SQLException {
		sqlSession.update("Attend-Mapper.insertAnnualHistory",annual);
	}

	@Override
	public List<EmployeeVO> selectWorkFromHomeEmployeeList(String yearMonth) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectWorkFromHomeEmployeeList",yearMonth);
	}

	@Override
	public List<WorkFromHomeAnswerVO> selectWorkFromHomeAnswerList(String yearMonth) throws SQLException {
		return sqlSession.selectList("Attend-Mapper.selectWorkFromHomeAnswerList",yearMonth);
	}



}
