package kr.co.offispace.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.util.MakeFileName;

@RestController
@RequestMapping("/admin")
public class RestAdminController {

	@Resource(name="employeeImagesPath")
	private String employeeImagesPath;
	
//	@Resource(name="errorLogPath")
//	private String errorLogPath;
	
//	@Autowired
//	LoggerHelper loggerHelper;
	
	@RequestMapping(value="/picture",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> getImg(@RequestParam("pictureFile") MultipartFile multi,String oldPicture) throws IOException
	{
		ResponseEntity<String> entity=null;
		
		String result=savePicture(oldPicture,multi);
		
		entity=new ResponseEntity<String>(result,HttpStatus.OK);
		
		return entity;
	}
	
	private String savePicture(String oldPicture,MultipartFile multi) throws IOException
	{
		String fileName=null;
		
		//파일유무확인
		if(!(multi==null||multi.isEmpty()||multi.getSize()>1024*1024*5))
		{
			String uploadPath=employeeImagesPath;
			fileName=MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile=new File(uploadPath,fileName);
			
			storeFile.mkdirs();
			
			//local HDD에 저장.
			multi.transferTo(storeFile);
			
			if(oldPicture!=null && !oldPicture.isEmpty())
			{
				File oldFile=new File(uploadPath,oldPicture);
				if(oldFile.exists())
				{
					oldFile.delete();
				}
			}
		}
		
		return fileName;
	}
	
		
}