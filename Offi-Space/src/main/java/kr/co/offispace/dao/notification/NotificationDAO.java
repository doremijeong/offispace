package kr.co.offispace.dao.notification;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.dto.NotificationVO;

public interface NotificationDAO {
	List<NotificationVO> selectNotificationList (Map<String,String> searchTypeEmpCode) throws SQLException;
	void updateIsNotNew(Map<String,String>searchTypeEmpCode) throws SQLException;
	void insertNotification(NotificationVO notification) throws SQLException;
	void updateIsConfrim(Map<String,String> confirmTypeNotiEmpCode) throws SQLException;
	String selectNotiCodeToRegister()throws SQLException;
}

