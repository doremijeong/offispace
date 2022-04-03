package kr.co.offispace.service.notification;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.dto.NotificationVO;

public interface NotificationService {
	List<NotificationVO> getNotificationList (Map<String,String> searchTypeEmpCode) throws SQLException;
	void modifyIsNotNew(Map<String,String>searchTypeEmpCode) throws SQLException;
	void registerNotification(NotificationVO notification) throws SQLException;
	void modifyIsConfrim(Map<String,String> confirmTypeNotiEmpCode) throws SQLException;
	void registerNotiFromNoti(NotificationVO notification)throws SQLException;
	
}
