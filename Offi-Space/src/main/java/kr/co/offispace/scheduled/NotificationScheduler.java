package kr.co.offispace.scheduled;

import kr.co.offispace.service.task.ScheduledService;

public class NotificationScheduler {
	private ScheduledService scheduledService;

	public void setScheduledService(ScheduledService scheduledService) {
		this.scheduledService = scheduledService;
	}
	
	public void removeNotification() throws Exception{
		scheduledService.scheduledNotification();
	}
}
