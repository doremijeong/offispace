package kr.co.offispace.dao.mail;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.dto.MailVO;

public interface MailDAO {

	// mail에 insert
	public String insertMail(MailVO mail) throws SQLException;

	// MailInfo에 insert
	public void insertMailInfo(MailVO mail) throws SQLException;

	// MailRef에 insert
	public void insertMailRef(MailVO mail) throws SQLException;

	// 보낸 리스트 불러오기
	public List<MailVO> selectSendList(MailCriteria cri) throws SQLException;

	// 받은 메일함 불러오기
	public List<MailVO> selectRecievedMailList(MailCriteria cri) throws SQLException;

	// 보낸 임시보관함 불러오기
	public List<MailVO> selectSendTempList(MailCriteria cri) throws SQLException;

	// 내게쓴 메일함
	public List<MailVO> selectToMeList(MailCriteria cri) throws SQLException;

	// 보낸 메일함 수
	public int selectSendListCount(MailCriteria cri) throws SQLException;

	// 받은 메일함 수
	public int selectRecievedMailListCount(MailCriteria cri) throws SQLException;

	// 안읽은 받은 메일수 불러오기
	public int selectRecievedMailListNotReadCount(MailCriteria cri) throws SQLException;

	// 안읽은 받은 메일 리스트 불러오기
	public List<MailVO> selectRecievedMailListNotRead(MailCriteria cri) throws SQLException;

	// 보낸 메일 임시 보관함 갯수
	public int selectSendTempListCount(MailCriteria cri) throws SQLException;

	// 내게쓴 메일함 갯수
	public int selectToMeListCount(MailCriteria cri) throws SQLException;

	// 휴지통 mailCode 조회
	public List<String> selectTrashMailCode(MailCriteria cri) throws SQLException;

	public int selectTrashMailCodeCount(MailCriteria cri) throws SQLException;

	// 보관함 mailCode 조회
	public List<String> selectStoreMailCode(MailCriteria cri) throws SQLException;

	public int selectStoreMailCodeCount(MailCriteria cri) throws SQLException;

	// MAILCODE로 MailInfo 테이블 조회
	public List<MailVO> selectMailInfoByMailCode(String mailCode) throws SQLException;

	// MAILCODE로 Mail 테이블 조회
	public MailVO selectMailbyMailCode(String mailCode) throws SQLException;

	// MAILCODE로 MailRef 테이블 조회
	public List<MailVO> selectMailRefbyMailCode(String mailCode) throws SQLException;

	// 받은 메일함 중요메일 리스트
	public List<MailVO> selectImportMailList(MailCriteria cri) throws SQLException;

	// 중요도 변경
	public void updateMailImportance(MailVO mail) throws SQLException;

	// mail 수정시 mail 테이블 수정
	public void updateMail(MailVO mail) throws SQLException;

	// mail 수정시 mailInfo 테이블 삭제
	public void deleteMailInfo(String mailCode) throws SQLException;

	// mail 수정시 mailRef 테이블 삭제
	public void deleteMailRef(String mailCode) throws SQLException;

	// 보낸 사람 휴지통 이동, 삭제, 복원
	public void updateFTrash(MailVO mail) throws SQLException;

	// 받은 사람 휴지통 이동, 삭제, 복원
	public void updateTTrash(MailVO mail) throws SQLException;

	// 참조자 휴지통 이동, 삭제, 복원
	public void updateRefTrash(MailVO mail) throws SQLException;

	// 보낸 사람 받은 메일 보관함 이동
	public void updateFStore(MailVO mail) throws SQLException;

	// 보낸 사람 받은 메일 보관함 이동
	public void updateTStore(MailVO mail) throws SQLException;

	// 보낸 사람 받은 메일 보관함 이동
	public void updateRefStore(MailVO mail) throws SQLException;

	// 받은 메일 읽음 표시
	public void updateStatus(MailVO mail) throws SQLException;

	// 참조된 메일 읽음 표시
	public void updateRefStatus(MailVO mail) throws SQLException;

	// 받은 사람 조회하는 리스트
	public List<MailVO> selectMailToList(String mailCode) throws SQLException;

	// 받은 메일 중요한 메일 수
	public int selectImportMailListCount(MailCriteria cri) throws SQLException;
}
