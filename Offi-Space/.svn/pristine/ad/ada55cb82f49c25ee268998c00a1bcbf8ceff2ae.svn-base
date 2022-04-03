package kr.co.offispace.service.task;

import java.sql.SQLException;

import kr.co.offispace.dao.task.SchduledDAO;

public class ScheduledServiceImpl implements ScheduledService{
	
	private SchduledDAO scheduledDAO;

	public void setScheduledDAO(SchduledDAO scheduledDAO) {
		this.scheduledDAO = scheduledDAO;
	}


	@Override
	public void scheduledNotification() throws SQLException {
		scheduledDAO.scheduledNotification();
	}

}
