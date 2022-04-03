package kr.co.offispace.dao.task;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class ScheduledDAOImpl implements SchduledDAO{
	
	private SqlSession sqlSessionMaria;
	
	public void setSqlSessionMaria(SqlSession sqlSessionMaria) {
		this.sqlSessionMaria = sqlSessionMaria;
	}

	@Override
	public void scheduledNotification() throws SQLException {
		sqlSessionMaria.update("Notification-MapperMaria.scheduledNotification");
	}

}
