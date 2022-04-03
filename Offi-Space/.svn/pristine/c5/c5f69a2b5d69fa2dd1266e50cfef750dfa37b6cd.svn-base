package kr.co.offispace.dao.notification;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.aop.ThrowsAdvice;

import kr.co.offispace.dto.NotificationVO;

public class NotificationDAOImpl implements NotificationDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private SqlSession sqlSessionMaria;
	
	public void setSqlSessionMaria(SqlSession sqlSessionMaria) {
		this.sqlSessionMaria = sqlSessionMaria;
	}



	@Override
	public List<NotificationVO> selectNotificationList(Map<String, String> searchTypeEmpCode) throws SQLException {
		//List<NotificationVO> notificationList = sqlSession.selectList("Notification-Mapper.selectNotificationList", searchTypeEmpCode);
		
		List<NotificationVO> notificationList = sqlSession.selectList("Notification-Mapper.selectNotificationList", searchTypeEmpCode);
		return notificationList;
	}

	@Override
	public void updateIsNotNew(Map<String, String> searchTypeEmpCode) throws SQLException {
		//sqlSession.update("Notification-Mapper.updateIsNotNew",searchTypeEmpCode);
		
		sqlSession.update("Notification-Mapper.updateIsNotNew",searchTypeEmpCode);
	}

	@Override
	public void insertNotification(NotificationVO notification) throws SQLException {
		//sqlSession.insert("Notification-Mapper.insertNotification", notification);
		
		sqlSession.insert("Notification-Mapper.insertNotification", notification);
	}

	@Override
	public void updateIsConfrim(Map<String, String> confirmTypeNotiEmpCode) throws SQLException {
		//sqlSession.update("Notification-Mapper.updateIsConfrim",confirmTypeNotiEmpCode);
		
		sqlSession.update("Notification-Mapper.updateIsConfrim",confirmTypeNotiEmpCode);
	}
	
	@Override
	public String selectNotiCodeToRegister() throws SQLException {
		//String ntCode = sqlSession.selectOne("Notification-Mapper.selectNotiCodeToRegister");
		String ntCode = sqlSession.selectOne("Notification-Mapper.selectNotiCodeToRegister");
		return ntCode;
	}
}
