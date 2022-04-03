package kr.co.offispace.dao.message;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.MessageCriteria;
import kr.co.offispace.dto.MessageVO;

public interface MessageDAO {
	
	String selectMsgCodeToRegister() throws SQLException;
	
	//모든 쪽지 목록
	public List<MessageVO> selectAllMsgList(MessageCriteria cri) throws SQLException;
	
	//받은 쪽지 목록
	public List<MessageVO> selectReceivedMsgList(MessageCriteria cri) throws SQLException;
	//보낸 쪽지 목록
	public List<MessageVO> selectSendMsgList(MessageCriteria cri) throws SQLException;
	//개인보관함 쪽지 목록
	public List<MessageVO> selectPersonalMsgList(MessageCriteria cri) throws SQLException;
	//개인보관함 쪽지 목록
	public List<MessageVO> selectWorkMsgList(MessageCriteria cri) throws SQLException;
	
	//받은 쪽지 개수
	public int selectReceivedMsgTotalCount(MessageCriteria cri) throws SQLException;
	//안 읽은 쪽지 개수
	public int selectUnreadMsgTotalCount(MessageCriteria cri) throws SQLException;
	//중요 쪽지 개수
	public int selectImptMsgTotalCount(MessageCriteria cri) throws SQLException;
	
	//쪽지코드로 상세 보기
	public MessageVO selectMsgByMsgCode(String msgCode) throws SQLException;
	
	//쪽지 읽음 처리
	void updateRead(String msgCode) throws SQLException;
	
	//쪽지 휴지통 이동
	void updateBin(String msgCode) throws SQLException;
	
	//쪽지 영구 삭제
	void deleteMsg(String msgCode) throws SQLException;
	
	//쪽지 개인보관함 이동
	void updatePersonal(String msgCode) throws SQLException;
	
	//쪽지 업무보관함 이동
	void updateWork(String msgCode) throws SQLException;
	
	//받은 쪽지함 이동
	void updateFrom(String msgCode) throws SQLException;
	
	//보낸 쪽지함 이동
	void updateTo(String msgCode) throws SQLException;
	
	//쪽지 보내기!
	void insertMessage(MessageVO message) throws SQLException;
		
}
