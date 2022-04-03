package kr.co.offispace.service.mail;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.dto.MailVO;

public interface MailService {

	public String transferMail(MailVO mail) throws SQLException;

	public Map<String, Object> getSendMailList(MailCriteria cri) throws SQLException;

	public Map<String, Object> getRecievedMailList(MailCriteria cri) throws SQLException;

	public Map<String, Object> getSendToMeMailList(MailCriteria cri) throws SQLException;

	public Map<String, Object> getSendTempMailList(MailCriteria cri) throws SQLException;

	public Map<String, Object> getNotReadMailList(MailCriteria cri) throws SQLException;

	public List<MailVO> getNotReadMailListForMain(MailCriteria cri) throws SQLException;

	public Map<String, Object> getImportMailList(MailCriteria cri) throws SQLException;

	// 휴지통 mailCode 조회
	public Map<String, Object> getTrashMailList(MailCriteria cri) throws SQLException;

	// 보관함 mailCode 조회
	public Map<String, Object> getStoreMailList(MailCriteria cri) throws SQLException;

	// MAILCODE로 Mail조회
	public MailVO getMailbyMailCode(String mailCode, String loginUserEmpCode) throws SQLException;

	// 중요도 변경
	public void modifyMailImportance(String mailCode) throws SQLException;

	// mail 수정
	public String modifyMail(MailVO mail) throws SQLException;

	// 휴지통 이동, 삭제, 복원
	public void modifyTrash(String mailCode, String loginUserEmpCode, String trash) throws SQLException;

	// 메일 보관함 이동
	public void modifyStore(String mailCode, String loginUserEmpCode, String store) throws SQLException;

	// 메인화면 수들 불러오는 서비스
	public Map<String, Integer> selectMailMailCount(MailCriteria cri) throws SQLException;
}
