package kr.co.offispace.service.message;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.Notification;

import kr.co.offispace.command.MessageCriteria;
import kr.co.offispace.command.MessagePageMaker;
import kr.co.offispace.dao.employee.EmployeeDAO;
import kr.co.offispace.dao.message.MessageDAO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.MessageVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.notification.NotificationService;

public class MessageServiceImpl implements MessageService {

	private MessageDAO messageDAO;

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	private EmployeeDAO employeeDAO;
	
	public void setEmployDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	private NotificationService notificationService;

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	//=======================================================================================


	//쪽지 목록
	@Override
	public Map<String, Object> getAllMsgList(MessageCriteria msgCri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MessageVO> msgList = messageDAO.selectAllMsgList(msgCri);
		
		int totalCount = messageDAO.selectReceivedMsgTotalCount(msgCri);
		
		MessagePageMaker pageMaker = new MessagePageMaker();
		pageMaker.setMsgCri(msgCri);
		pageMaker.setTotalCount(totalCount);
		
		for (MessageVO msg : msgList) {
			
			String toID = msg.getMsgTo();
			String fromID = msg.getMsgFrom();

			EmployeeVO employeeTo = employeeDAO.selectEmployeeById(toID);
			EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
			
			msg.setMsgToName(employeeTo.getEmpName());
			msg.setMsgFromName(employeeFrom.getEmpName());
			
			msg.setMsgToTeam(employeeTo.getTeamValue());
			msg.setMsgFromTeam(employeeFrom.getTeamValue());
			
			msg.setMsgToPosition(employeeTo.getPositionValue());
			msg.setMsgFromPosition(employeeFrom.getPositionValue());
			
		}
		
		dataMap.put("msgList", msgList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	//메인 페이지 받은 쪽지 목록
	@Override
	public List<MessageVO> getReceivedMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> receivedMsgList = messageDAO.selectReceivedMsgList(cri);
		int unreadMsgCnt = messageDAO.selectUnreadMsgTotalCount(cri);
		int imptMsgCnt = messageDAO.selectImptMsgTotalCount(cri);
		int receivedMsgCnt = messageDAO.selectReceivedMsgTotalCount(cri);
		
		for (MessageVO msg : receivedMsgList) {
			
			String fromID = msg.getMsgFrom();
			EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
			msg.setMsgFromName(employeeFrom.getEmpName());
			msg.setMsgFromPosition(employeeFrom.getPositionValue());
			
			String pattern = "yyyy-MM-dd(E)";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String modifyDate = simpleDateFormat.format(msg.getMsgDt());
			
			msg.setMsgDate(modifyDate);
			msg.setUnreadMsgCnt(unreadMsgCnt);
			msg.setImptMsgCnt(imptMsgCnt);
			msg.setReceivedMsgCnt(receivedMsgCnt);
		}
		
		return receivedMsgList;
	}
	
	
	//메인 페이지 보낸 쪽지 목록
	@Override
	public List<MessageVO> getSendMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> sendMsgList = messageDAO.selectSendMsgList(cri);
		
		for (MessageVO msg : sendMsgList) {
			
			String toID = msg.getMsgTo();
			EmployeeVO employeeTo = employeeDAO.selectEmployeeById(toID);
			msg.setMsgToName(employeeTo.getEmpName());
			msg.setMsgToPosition(employeeTo.getPositionValue());
			
			String pattern = "yyyy-MM-dd(E)";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String modifyDate = simpleDateFormat.format(msg.getMsgDt());
			
			msg.setMsgDate(modifyDate);
		}
		
		return sendMsgList;
	}
	
	
	//메인 페이지 개인보관함 쪽지 목록
	@Override
	public List<MessageVO> getPersonalMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> personalMsgList = messageDAO.selectPersonalMsgList(cri);
		
		for (MessageVO msg : personalMsgList) {
			
			String fromID = msg.getMsgFrom();
			
			EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
			msg.setMsgFromCode(employeeFrom.getEmpCode());
			msg.setMsgFromName(employeeFrom.getEmpName());
			msg.setMsgFromPosition(employeeFrom.getPositionValue());
			
			String pattern = "yyyy-MM-dd(E)";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String modifyDate = simpleDateFormat.format(msg.getMsgDt());
			
			msg.setMsgDate(modifyDate);
		}
		
		return personalMsgList;
	}

	
	//메인 페이지 업무보관함 쪽지 목록
	@Override
	public List<MessageVO> getWorkMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> workMsgList = messageDAO.selectWorkMsgList(cri);
		
		for (MessageVO msg : workMsgList) {
			
			String fromID = msg.getMsgFrom();
			
			EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
			msg.setMsgFromCode(employeeFrom.getEmpCode());
			msg.setMsgFromName(employeeFrom.getEmpName());
			msg.setMsgFromPosition(employeeFrom.getPositionValue());
			
			String pattern = "yyyy-MM-dd(E)";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String modifyDate = simpleDateFormat.format(msg.getMsgDt());
			
			msg.setMsgDate(modifyDate);
		}
		
		return workMsgList;
	}


	
	//쪽지 상세 보기
	@Override
	public MessageVO getMsgByMsgCode(String msgCode) throws SQLException {
		
		MessageVO msg = messageDAO.selectMsgByMsgCode(msgCode);
		
		String toID = msg.getMsgTo();
		String fromID = msg.getMsgFrom();
		
		EmployeeVO employeeTo = employeeDAO.selectEmployeeById(toID);
		EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
		
		msg.setMsgToName(employeeTo.getEmpName());
		msg.setMsgFromName(employeeFrom.getEmpName());
		
		msg.setMsgToTeam(employeeTo.getTeamValue());
		msg.setMsgFromTeam(employeeFrom.getTeamValue());
		
		msg.setMsgToPosition(employeeTo.getPositionValue());
		msg.setMsgFromPosition(employeeFrom.getPositionValue());
		
		return msg;
	}

	
	//쪽지 보내기
	@Override
	public void sendMsg(MessageVO msg) throws SQLException {
		String code = messageDAO.selectMsgCodeToRegister();
		msg.setMsgCode(code);

		String toID = msg.getMsgTo();
		String fromID = msg.getMsgFrom();

		EmployeeVO employeeTo = employeeDAO.selectEmployeeById(toID);
		EmployeeVO employeeFrom = employeeDAO.selectEmployeeById(fromID);
		
		msg.setMsgToCode(employeeTo.getEmpCode());
		msg.setMsgFromCode(employeeFrom.getEmpCode());
		
		messageDAO.insertMessage(msg);
		
		NotificationVO notification = new NotificationVO(msg.getMsgCode(), msg.getMsgFromCode(), "message/list.do?kindOfMsg=recieved", msg.getMsgToCode(), "쪽지가 도착했습니다.", "far fa-comment-dots", "새로운 쪽지");
		notificationService.registerNotification(notification);
		
	}
	
	//쪽지 읽음 처리
	@Override
	public void updateRead(String msgCode) throws SQLException {
		messageDAO.updateRead(msgCode);
	}


	//쪽지 휴지통 이동
	@Override
	public void updateBin(String msgCode) throws SQLException {
		messageDAO.updateBin(msgCode);
	}

	
	//쪽지 영구 삭제
	@Override
	public void removeMsg(String msgCode) throws SQLException {
		messageDAO.deleteMsg(msgCode);
	}

	//개인보관함 이동
	@Override
	public void updatePersonal(String msgCode) throws SQLException {
		messageDAO.updatePersonal(msgCode);
	}

	//업무보관함 이동
	@Override
	public void updateWork(String msgCode) throws SQLException {
		messageDAO.updateWork(msgCode);
	}

	@Override
	public void updateFrom(String msgCode) throws SQLException {
		messageDAO.updateFrom(msgCode);
	}

	@Override
	public void updateTo(String msgCode) throws SQLException {
		messageDAO.updateTo(msgCode);
	}

	
	@Override
	public Map<String, Integer> selectMsgCounts(MessageCriteria cri) throws SQLException {
		Map<String, Integer> countMap = new HashMap<>();

		int recievedMsgCnt = messageDAO.selectReceivedMsgTotalCount(cri);
		int unReadMsgCnt = messageDAO.selectUnreadMsgTotalCount(cri);
		int imptMsgCnt = messageDAO.selectImptMsgTotalCount(cri);
		
		countMap.put("recievedMsgCnt", recievedMsgCnt);
		countMap.put("unReadMsgCnt", unReadMsgCnt);
		countMap.put("imptMsgCnt", imptMsgCnt);

		return countMap;
	}

	
	
} //MessageServiceImpl
