package kr.co.offispace.dao.message;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.co.offispace.command.MessageCriteria;
import kr.co.offispace.dto.MailVO;
import kr.co.offispace.dto.MessageVO;

public class MessageDAOImpl implements MessageDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public String selectMsgCodeToRegister() throws SQLException {
		String msgCode = sqlSession.selectOne("Message-Mapper.selectMsgCodeToRegister");
		return msgCode;
	}

	
	//쪽지 목록
	@Override
	public List<MessageVO> selectAllMsgList(MessageCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<MessageVO> msgList = sqlSession.selectList("Message-Mapper.selectAllMsgList", cri, rowBounds);
		
		return msgList;
	}
	
	//메인 페이지 받은 쪽지 목록
	@Override
	public List<MessageVO> selectReceivedMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> receivedMsgList = sqlSession.selectList("Message-Mapper.selectReceivedMsgList", cri);
		
		return receivedMsgList;
	}
	
	
	//메인 페이지 보낸 쪽지 목록
	@Override
	public List<MessageVO> selectSendMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> sendMsgList = sqlSession.selectList("Message-Mapper.selectSendMsgList", cri);
		
		return sendMsgList;
	}
	
	
	//메인 페이지 개인보관함 쪽지 목록
	@Override
	public List<MessageVO> selectPersonalMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> personalMsgList = sqlSession.selectList("Message-Mapper.selectPersonalMsgList", cri);
		
		return personalMsgList;
	}
	
	
	//메인 페이지 업무보관함 쪽지 목록
	@Override
	public List<MessageVO> selectWorkMsgList(MessageCriteria cri) throws SQLException {
		List<MessageVO> personalMsgList = sqlSession.selectList("Message-Mapper.selectWorkMsgList", cri);
		
		return personalMsgList;
	}


	//쪽지 상세 보기
	@Override
	public MessageVO selectMsgByMsgCode(String msgCode) throws SQLException {
		MessageVO msg = sqlSession.selectOne("Message-Mapper.selectMsgByMsgCode", msgCode);
		return msg;
	}

	
	//쪽지 읽음 처리
	@Override
	public void updateRead(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updateRead", msgCode);
	}

	
	//휴지통으로 이동
	@Override
	public void updateBin(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updateBin", msgCode);
	}
	
	
	//쪽지 영구 삭제
	@Override
	public void deleteMsg(String msgCode) throws SQLException {
		sqlSession.delete("Message-Mapper.deleteMsg", msgCode);
	}

	//개인보관함 이동
	@Override
	public void updatePersonal(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updatePersonal", msgCode);
	}

	//업무보관함 이동
	@Override
	public void updateWork(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updateWork", msgCode);
	}

	//받은 쪽지함 이동
	@Override
	public void updateFrom(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updateFrom", msgCode);
	}

	//보낸 쪽지함 이동
	@Override
	public void updateTo(String msgCode) throws SQLException {
		sqlSession.update("Message-Mapper.updateTo", msgCode);
	}

	//쪽지 보내기
	@Override
	public void insertMessage(MessageVO message) throws SQLException {
		sqlSession.insert("Message-Mapper.insertMessage", message);
	}


	@Override
	public int selectUnreadMsgTotalCount(MessageCriteria cri) throws SQLException {
		int unreadMsg = sqlSession.selectOne("Message-Mapper.selectUnreadMsgTotalCount", cri);
		return unreadMsg;
	}


	@Override
	public int selectImptMsgTotalCount(MessageCriteria cri) throws SQLException {
		int imptMsg = sqlSession.selectOne("Message-Mapper.selectImptMsgTotalCount", cri);
		return imptMsg;
	}


	@Override
	public int selectReceivedMsgTotalCount(MessageCriteria cri) throws SQLException {
		int receivedMsg = sqlSession.selectOne("Message-Mapper.selectReceivedMsgTotalCount", cri);
		return receivedMsg;
	}


}
