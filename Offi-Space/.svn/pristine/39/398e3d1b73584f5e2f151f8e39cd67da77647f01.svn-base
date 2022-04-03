package kr.co.offispace.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.EmployeeModifyCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Resource(name="attachmentService")
	private AttachmentService attachService;

	@RequestMapping("/employee/modifyForm")
	public ModelAndView empModifyForm(ModelAndView mnv, HttpSession session) throws Exception{

		String url = "/common/modifyEmpForm";

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		mnv.addObject("emp",emp);
		mnv.setViewName(url);

		return mnv;
	}

	@Resource(name="employeeImagesPath")
	String picturePath;

	@ResponseBody
	@RequestMapping(value="/employee/getPicture", produces="text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String empCode) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;


		AttachmentVO atVO = attachService.getAttachmentByAttachGroup(empCode);
		String picture = atVO.getAttachSavename();

		try {
			in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);

		} finally {
			if(in != null) in.close();
		}
		return entity;
	}

	@RequestMapping("/employee/modifyEmp")
	public String modifyEmp(EmployeeModifyCommand empCmd) throws Exception{
		String url = "/common/modifySuccess";

		EmployeeVO emp = empCmd.toEmployeeVO();

		employeeService.modifyEmp(emp);

		if(empCmd.getPicture() != null && !empCmd.getPicture().isEmpty()) {
			attachService.removeAttachmentByOther(emp.getEmpCode());

			File deleteFile = new File(picturePath, empCmd.getOldPicture());
			if(deleteFile.exists()) {
				deleteFile.delete();
			}

			List<MultipartFile> multi = new ArrayList<MultipartFile>();
			multi.add(empCmd.getPicture());

			List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(multi, picturePath);

			for (AttachmentVO attach : attachList) {
				attach.setAttachGroup(emp.getEmpCode());    // 첨부파일에 넣을 PK
				attach.setAttachRegister(emp.getEmpCode()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}

		return url;
	}



}
