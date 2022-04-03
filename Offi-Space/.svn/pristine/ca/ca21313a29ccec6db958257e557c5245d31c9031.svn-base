package kr.co.offispace.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.service.attach.AttachmentService;

@RestController
@RequestMapping("/common")
public class RestCommonController {

	@Resource(name="employeeImagesPath")
	private String employeeImagesPath;
	
	@Autowired
	private AttachmentService attachmentService;
	
	@RequestMapping(value="/getPicture",produces="text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String attachSaveName) throws IOException
	{
		System.out.println("##사원 파일 이름 ="+attachSaveName);
		InputStream in =null;
		ResponseEntity<byte[]> entity=null;
		String imgPath=employeeImagesPath;
		
		try {
			in=new FileInputStream(new File(imgPath,attachSaveName));
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),HttpStatus.CREATED);
		}catch(FileNotFoundException e){
			System.out.println("사진이 없습니다.............");
		}finally {
			if(in!=null)in.close();
		}
			
		return entity;
	}
		
	@RequestMapping(value="/getPictureByEmpCode.do/{empCode}",method=RequestMethod.GET) //엔드포인트의 .do 만 없어진다.
	public ResponseEntity<byte[]> getPictureById(@PathVariable("empCode") String empCode,HttpServletRequest request) throws Exception
	{
		String picture=null;
		try {
			picture = attachmentService.getAttachmentByAttachGroup(empCode).getAttachSavename();
		} catch (Exception e) {
			e.printStackTrace();
//			LoggerHelper.writeErrorLog(request, e, attachmentService, errorLogPath); 
			throw e; //ajax 반응을 위해 던져준다.
		}
			
		return getPicture(picture); //얘가 ioexception 던짐.
	}
}
