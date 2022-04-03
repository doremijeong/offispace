package kr.co.offispace.dao.scheduler;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.SchedulerCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.SchedulerVO;

public class SchedulerDAOImpl implements SchedulerDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	;
	@Override
	public List<SchedulerVO> selectSchedulerList(String empCode) throws SQLException {
		
		List<SchedulerVO> schedulerList = sqlSession.selectList("Scheduler-Mapper.selectSchedulerList",empCode);
		return schedulerList;
	}

	@Override
	public SchedulerVO selectSchedulerByEmpCode(String empCode) throws SQLException {
		
		SchedulerVO schedulerColorList = null;
		schedulerColorList = sqlSession.selectOne("Scheduler-Mapper.selectSchedulerByScdGrCode",empCode);
		
		return schedulerColorList;
	}
	
	@Override
	public SchedulerVO selectSchedulerByScdCode(String scdCode) throws SQLException {
		return sqlSession.selectOne("Scheduler-Mapper.selectSchedulerByScdCode",scdCode);
	}

	@Override
	public void updateScheduler(SchedulerVO scheduler) throws SQLException {
		sqlSession.update("Scheduler-Mapper.updateScheduler",scheduler);
	}


	@Override
	public String insertScheduler(SchedulerVO schedulerVO) throws SQLException {
		sqlSession.update("Scheduler-Mapper.insertScheduler",schedulerVO);
		return schedulerVO.getScdCode();
	}

	@Override
	public void deleteScheduler(String scdCode) throws SQLException {
		sqlSession.delete("Scheduler-Mapper.deleteScheduler",scdCode);
	}

	@Override
	public List<SchedulerVO> selectDPTSchedulerList(String teamCode) throws SQLException {
		List<SchedulerVO> selectDPTSchedulerList = sqlSession.selectList("Scheduler-Mapper.selectDPTSchedulerList",teamCode);
		return selectDPTSchedulerList;
	}

	@Override
	public SchedulerVO selectSchedulerByScdDptCode(String scdDptCode) throws SQLException {
		return sqlSession.selectOne("Scheduler-Mapper.selectSchedulerByScdDptCode",scdDptCode);
	}

	@Override
	public List<SchedulerVO> selectCMPSchedulerList() throws SQLException {
		List<SchedulerVO> selectCMPSchedulerList = sqlSession.selectList("Scheduler-Mapper.selectCMPSchedulerList");
		return selectCMPSchedulerList;
	}

	@Override
	public SchedulerVO selectSchedulerByscdCpGrCode() throws SQLException {
		SchedulerVO selectSchedulerByscdCpGrCode = sqlSession.selectOne("Scheduler-Mapper.selectSchedulerByscdCpGrCode");
		return selectSchedulerByscdCpGrCode;
	}

	@Override
	public void insertSchedulerGroup(EmployeeVO employee) throws SQLException {
		sqlSession.update("Scheduler-Mapper.insertSchedulerGroup",employee);
	}

	@Override
	public List<SchedulerVO> selectPersonalSchedulerList(String empCode) throws SQLException {
		return sqlSession.selectList("Scheduler-Mapper.selectPersonalSchedulerList",empCode);
	}

	

}
