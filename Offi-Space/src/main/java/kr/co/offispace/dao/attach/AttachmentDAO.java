package kr.co.offispace.dao.attach;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.AttachmentVO;

public interface AttachmentDAO {

	public AttachmentVO selectAttachmentByAT(String attachCode) throws SQLException;

	public List<AttachmentVO> selectAttachmentByOther(String attachGroup) throws SQLException;

	public void insertAttachment(AttachmentVO attachment) throws SQLException;

	public void deleteAttachmentByAT(String attachCode) throws SQLException;

	public void deleteAttachmentByOther(String attachGroup) throws SQLException;
	
	public AttachmentVO selectAttachmentByAttachGroup(String attachGroup) throws SQLException;
	
	public String selectSaveNameByEmpCode(String empCode) throws SQLException;
	
	public List<AttachmentVO> selectAttachmentByAttachSavePath(String attachSavePath) throws SQLException;
	
	public AttachmentVO selectAttachmentByAttachSaveNameAndAttachSavePath(AttachmentVO attachment) throws SQLException;
	
/*	public String selectAttachCode() throws SQLException;*/
}
