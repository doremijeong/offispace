package kr.co.offispace.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;

public class ApprovalCommand {
		private String apvEmergency;
		private String apvImportance;
		private String empCode; 		// 기안자
		private String apvTemporary;
		private String[] rEmpCode; 		// 참조자 empcode배열
		private String[] hEmpCode; 		// 합의자 empcode배열
		private String[] fEmpCode; 		// 결재자 empcode배열
		private String apvFormCode; 	// 양식 코드
		private String apvTitle;
		private String apvMarkUp;
		private String apvEndDt;
		private String apvCode;

		private List<MultipartFile> uploadFiles;

		private List<String> deleteFiles;

		public List<String> getDeleteFiles() {
			return deleteFiles;
		}

		public void setDeleteFiles(List<String> deleteFiles) {
			this.deleteFiles = deleteFiles;
		}

		public String getApvCode() {
			return apvCode;
		}

		public void setApvCode(String apvCode) {
			this.apvCode = apvCode;
		}

		public String getApvEndDt() {
			return apvEndDt;
		}

		public void setApvEndDt(String apvEndDt) {
			this.apvEndDt = apvEndDt;
		}

		public String getApvMarkUp() {
			return apvMarkUp;
		}

		public void setApvMarkUp(String apvMarkUp) {
			this.apvMarkUp = apvMarkUp;
		}

		public String getApvTitle() {
			return apvTitle;
		}

		public void setApvTitle(String apvTitle) {
			this.apvTitle = apvTitle;
		}

		public String getApvEmergency() {
			return apvEmergency;
		}

		public void setApvEmergency(String apvEmergency) {
			this.apvEmergency = apvEmergency;
		}

		public String getApvImportance() {
			return apvImportance;
		}

		public void setApvImportance(String apvImportance) {
			this.apvImportance = apvImportance;
		}

		public String getEmpCode() {
			return empCode;
		}

		public void setEmpCode(String empCode) {
			this.empCode = empCode;
		}

		public String getApvTemporary() {
			return apvTemporary;
		}

		public void setApvTemporary(String apvTemporary) {
			this.apvTemporary = apvTemporary;
		}

		public String[] getrEmpCode() {
			return rEmpCode;
		}

		public void setrEmpCode(String[] rEmpCode) {
			this.rEmpCode = rEmpCode;
		}

		public String[] gethEmpCode() {
			return hEmpCode;
		}

		public void sethEmpCode(String[] hEmpCode) {
			this.hEmpCode = hEmpCode;
		}

		public String[] getfEmpCode() {
			return fEmpCode;
		}

		public void setfEmpCode(String[] fEmpCode) {
			this.fEmpCode = fEmpCode;
		}

		public String getApvFormCode() {
			return apvFormCode;
		}

		public void setApvFormCode(String apvFormCode) {
			this.apvFormCode = apvFormCode;
		}

		public List<MultipartFile> getUploadFiles() {
			return uploadFiles;
		}

		public void setUploadFiles(List<MultipartFile> uploadFiles) {
			this.uploadFiles = uploadFiles;
		}

		public ApprovalVO toApprovalVO() {
			ApprovalVO apv = new ApprovalVO();

			apv.setEmpCode(this.empCode);
			apv.setApvTemporary(this.apvTemporary);
			apv.setApvEmergency(this.apvEmergency);
			apv.setApvImportance(this.apvImportance);
			apv.setApvFormCode(this.apvFormCode);
			apv.setApvTitle(this.apvTitle);
			apv.setApvMarkup(this.apvMarkUp);
			apv.setApvCode(this.apvCode);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date endDate = sdf.parse(this.apvEndDt);
				apv.setApvEndDt(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			List<ApprovalLineVO> apvLineList = new ArrayList<ApprovalLineVO>();
			if(this.fEmpCode != null && this.fEmpCode.length > 0) {
				for (String fCode : fEmpCode) {
					ApprovalLineVO apvLine = new ApprovalLineVO();
					String order = fCode.substring(0, 1);
					String empCode = fCode.substring(1);
					apvLine.setApvKindCode("AK0001");
					apvLine.setApvLineOrder(Integer.parseInt(order));
					apvLine.setEmpCode(empCode);

					apvLineList.add(apvLine);
				}
			}

			if(this.hEmpCode != null && this.hEmpCode.length > 0) {
				for (String hCode : hEmpCode) {
					ApprovalLineVO apvLine = new ApprovalLineVO();
					String order = hCode.substring(0, 1);
					String empCode = hCode.substring(1);
					apvLine.setApvKindCode("AK0002");
					apvLine.setApvLineOrder(Integer.parseInt(order));
					apvLine.setEmpCode(empCode);

					apvLineList.add(apvLine);
				}
			}

			if(this.rEmpCode != null && this.rEmpCode.length > 0) {
				for (String rCode : rEmpCode) {
					ApprovalLineVO apvLine = new ApprovalLineVO();
					String order = rCode.substring(0, 1);
					String empCode = rCode.substring(1);
					apvLine.setApvKindCode("AK0003");
					apvLine.setApvLineOrder(Integer.parseInt(order));
					apvLine.setEmpCode(empCode);

					apvLineList.add(apvLine);
				}
			}

			apv.setApvLineList(apvLineList);

			return apv;
		}
}
