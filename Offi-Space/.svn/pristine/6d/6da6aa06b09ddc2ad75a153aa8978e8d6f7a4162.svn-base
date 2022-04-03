package kr.co.offispace.service.attach;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.offispace.dao.attach.AttachmentDAO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.util.MakeFileName;

public class AttachmentServiceImpl implements AttachmentService{
	
	private AttachmentDAO attachDAO;
	
	public void setAttachmentDAO(AttachmentDAO attachmentDAO) {
		this.attachDAO = attachmentDAO;
	}

	@Override
	public AttachmentVO getAttachmentByAT(String attachCode) throws SQLException {
		return attachDAO.selectAttachmentByAT(attachCode);
	}

	@Override
	public List<AttachmentVO> getAttachmentListByOther(String attachGroup) throws SQLException {
		List<AttachmentVO> list= attachDAO.selectAttachmentByOther(attachGroup);
		
		for (AttachmentVO attach : list) {
			attach.setAttachSavename(MakeFileName.parseFileNameFromUUID(attach.getAttachSavename(), "\\$\\$"));
		}
		
		return list;
	}

	@Override
	public void registerAttachment(AttachmentVO attachment) throws SQLException {
		attachDAO.insertAttachment(attachment);
	}

	@Override
	public void removeAttachmentByAT(String attachCode) throws SQLException {
		attachDAO.deleteAttachmentByAT(attachCode);
	}

	@Override
	public void removeAttachmentByOther(String attachGroup) throws SQLException {
		attachDAO.deleteAttachmentByOther(attachGroup);
	}

	@Override
	public AttachmentVO getAttachmentByAttachGroup(String attachGroup) throws SQLException {
		return attachDAO.selectAttachmentByAttachGroup(attachGroup);
	}

	@Override
	public List<AttachmentVO> getAttachmentListByAttachSavePath(String attachSavePath) throws SQLException {
		return attachDAO.selectAttachmentByAttachSavePath(attachSavePath);
	}

	@Override
	public AttachmentVO getAttachmentByAttachSaveNameAndAttachSavePath(AttachmentVO attachment)
			throws SQLException {
		return attachDAO.selectAttachmentByAttachSaveNameAndAttachSavePath(attachment);
	}
	
/*
	@Override
	public String getAttachCode() throws SQLException {
		System.out.println("여기는 ㅓ비으===========" + attachDAO.selectAttachCode());
		return attachDAO.selectAttachCode();
	}
*/
}
