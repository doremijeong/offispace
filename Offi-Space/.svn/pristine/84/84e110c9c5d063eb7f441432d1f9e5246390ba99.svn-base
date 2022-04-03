package kr.co.offispace.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Base64.Decoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.util.MakeFileName;


// 이제 이 컨트롤러는 forward와 redirect를 하지 못한다는 의미
// @ResponseBody가 없어도 알아서 내보내줌 
@RestController
public class SummernoteController {
	
	@Resource(name="summernoteImagesPath")
	private String summernoteImagesPath;
	
	@RequestMapping(value="/uploadImg",produces = "application/json; charset=utf-8")
	public ResponseEntity<String> uploadImg(MultipartFile file, HttpServletRequest request) throws Exception{
		ResponseEntity<String> result = null;
		
		int fileSize = 5 * 1024 * 1024;
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.", HttpStatus.BAD_REQUEST);
		}
		
		String savePath = summernoteImagesPath.replace("/", File.separator);
		String fileFormat = file.getOriginalFilename().substring(file.getName().lastIndexOf(".") + 1);
		
		String fileName = MakeFileName.toUUIDFileName("." + fileFormat, "");
		
		File saveFile = new File(savePath, fileName);
		
		saveFile.mkdirs();
		
		try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(request.getContextPath() + "/getImg.do?fileName=" + URLEncoder.encode(fileName,"utf-8"), HttpStatus.OK);
//			result = new ResponseEntity<String>(request.getContextPath() + "/getImg.do?fileName=" + fileName, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	// 바이너리 형식으로 보내주는 것 => 다운로드를 할때는 사용하면 안됨 브라우저가 열어버림
	// 이미지를 바로 보여줘야하는 경우 많이 사용
	@RequestMapping(value="/getImg")
	public ResponseEntity<byte[]> getImg(String fileName, HttpServletRequest request) throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		
		String savePath = summernoteImagesPath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		
		InputStream in = null;
		
		try {
			in = new FileInputStream(sendFile);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		}catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping("/deleteImg")
	public ResponseEntity<String> deleteImg(@RequestBody Map<String, String> data) throws Exception{
		ResponseEntity<String> result = null;
		
		String savePath = summernoteImagesPath.replace("/", File.separator);
		File target = new File(savePath, URLDecoder.decode(data.get("fileName"),"utf-8"));
		if(!target.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}else {
			try {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return result;
	}
}
