package kr.co.offispace.service.attach;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.AttachmentVO;

public interface AttachmentService {
	
	public AttachmentVO getAttachmentByAT(String attachCode) throws SQLException;
	
	public List<AttachmentVO> getAttachmentListByOther(String attachGroup) throws SQLException;
	
	public void registerAttachment(AttachmentVO attachment) throws SQLException;
	
	public void removeAttachmentByAT(String attachCode) throws SQLException;
	
	public void removeAttachmentByOther(String attachGroup) throws SQLException;
	
	public AttachmentVO getAttachmentByAttachGroup(String attachGroup) throws SQLException;
	
	public List<AttachmentVO> getAttachmentListByAttachSavePath(String attachSavePath) throws SQLException;
	
	public AttachmentVO getAttachmentByAttachSaveNameAndAttachSavePath(AttachmentVO attachment) throws SQLException;
	
/*	public String getAttachCode() throws SQLException;*/
	
	
}
