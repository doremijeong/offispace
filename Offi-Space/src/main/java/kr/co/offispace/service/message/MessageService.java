package kr.co.offispace.service.message;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.MessageCriteria;
import kr.co.offispace.dto.MessageVO;

public interface MessageService {
	
	//쪽지 목록
	public Map<String, Object> getAllMsgList(MessageCriteria cri) throws SQLException;
	
	//메인 페이지 받은 쪽지 목록
	public List<MessageVO> getReceivedMsgList(MessageCriteria cri) throws SQLException;
	//메인 페이지 보낸 쪽지 목록
	public List<MessageVO> getSendMsgList(MessageCriteria cri) throws SQLException;
	//메인 페이지 개인보관함 쪽지 목록
	public List<MessageVO> getPersonalMsgList(MessageCriteria cri) throws SQLException;
	//메인 페이지 개인보관함 쪽지 목록
	public List<MessageVO> getWorkMsgList(MessageCriteria cri) throws SQLException;
	
	//쪽지 상세 보기
	public MessageVO getMsgByMsgCode(String msgCode) throws SQLException;
	
	//쪽지 읽음 처리
	public void updateRead(String msgCode) throws SQLException;
	
	//쪽지 휴지통 이동
	public void updateBin(String msgCode) throws SQLException;
	
	//쪽지 영구 삭제
	public void removeMsg(String msgCode) throws SQLException;
	
	//쪽지 개인보관함 이동
	public void updatePersonal(String msgCode) throws SQLException;
	
	//쪽지 업무보관함 이동
	public void updateWork(String msgCode) throws SQLException;
	
	//받은 쪽지함 이동
	public void updateFrom(String msgCode) throws SQLException;
	
	//받은 쪽지함 이동
	public void updateTo(String msgCode) throws SQLException;
	
	//쪽지 보내기!
	public void sendMsg(MessageVO msg) throws SQLException;
	
	// 메인 페이지 쪽지 개수
	public Map<String, Integer> selectMsgCounts(MessageCriteria cri) throws SQLException;
		
}
