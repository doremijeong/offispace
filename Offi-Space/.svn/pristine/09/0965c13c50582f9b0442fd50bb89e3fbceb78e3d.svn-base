package kr.co.offispace.service.notification;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.dao.notification.NotificationDAO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.employee.EmployeeService;

public class NotificationServiceImpl implements NotificationService {

	NotificationDAO notificationDAO;

	EmployeeService employeeService;

	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@Override
	public List<NotificationVO> getNotificationList(Map<String, String> searchTypeEmpCode) throws SQLException {
		List<NotificationVO> notificationList = notificationDAO.selectNotificationList(searchTypeEmpCode);
		for(NotificationVO notification: notificationList) {
			EmployeeVO ntFrom =  employeeService.getEmployeeByEmpCode(notification.getNtFromEmpCode());
			notification.setNtFrom(ntFrom);
		}

		modifyIsNotNew(searchTypeEmpCode);
		return notificationList;
	}

	@Override
	public void modifyIsNotNew(Map<String, String> searchTypeEmpCode) throws SQLException {
		notificationDAO.updateIsNotNew(searchTypeEmpCode);
	}


	@Override
	public void registerNotification(NotificationVO notification) throws SQLException {
		notificationDAO.insertNotification(notification);

	}

	@Override
	public void modifyIsConfrim(Map<String, String> confirmTypeNotiEmpCode) throws SQLException {
		notificationDAO.updateIsConfrim(confirmTypeNotiEmpCode);
	}
	
	@Override
	public void registerNotiFromNoti(NotificationVO notification) throws SQLException {
		String ntCode = notificationDAO.selectNotiCodeToRegister();
		notification.setNtCode(ntCode);
		registerNotification(notification);
		
	}
}
