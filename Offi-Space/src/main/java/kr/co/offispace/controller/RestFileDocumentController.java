package kr.co.offispace.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.FileDocumentVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.util.MakeFileName;

@RestController
@RequestMapping("/fileDocument")
public class RestFileDocumentController {

	@Autowired
	private AttachmentService attachService;
	
	@Resource(name="fileDocumentPath")
	private String fileDocumentPath;
	
	@RequestMapping("/getFoldListOriginal")
	public ResponseEntity<List<AttachmentVO>> mainbefore(String attachSavePath) throws Exception
	{
		ResponseEntity<List<AttachmentVO>> result=null;
		
		List<AttachmentVO> attachmentList = attachService.getAttachmentListByAttachSavePath(attachSavePath);
		
		result=new ResponseEntity<List<AttachmentVO>>(attachmentList,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/getFoldList")
	public ResponseEntity<List<FileDocumentVO>> main1(HttpSession session) throws Exception
	{
		ResponseEntity<List<FileDocumentVO>> result=null;
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String rootPath = fileDocumentPath + loginUser.getEmpName() + "/"; // offispace/fileDocument/임나리/ -> 이게 루트 디렉터리

		// jstree용 리스트 출력
		List<FileDocumentVO> docList = new ArrayList<FileDocumentVO>();

		dfs(rootPath, docList, "", true);
//		Collections.reverse(docList);
		List<FileDocumentVO> temp3 = sorting(docList);

		result=new ResponseEntity<List<FileDocumentVO>>(temp3,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/getFoldListTeam")
	public ResponseEntity<List<FileDocumentVO>> main2(HttpSession session) throws Exception
	{
		ResponseEntity<List<FileDocumentVO>> result=null;
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String rootPath = fileDocumentPath + loginUser.getTeamValue() + "/"; // offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		// jstree용 리스트 출력
		List<FileDocumentVO> docList = new ArrayList<FileDocumentVO>();

		dfs(rootPath, docList, "", true);
//		Collections.reverse(docList);
		List<FileDocumentVO> temp3 = sorting(docList);

		result=new ResponseEntity<List<FileDocumentVO>>(temp3,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/getFoldListShare")
	public ResponseEntity<List<FileDocumentVO>> main3(HttpSession session) throws Exception
	{
		ResponseEntity<List<FileDocumentVO>> result=null;
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		String rootPath = fileDocumentPath + "공용/"; 

		// jstree용 리스트 출력
		List<FileDocumentVO> docList = new ArrayList<FileDocumentVO>();

		dfs(rootPath, docList, "", true);
//		Collections.reverse(docList);
		List<FileDocumentVO> temp3 = sorting(docList);

		result=new ResponseEntity<List<FileDocumentVO>>(temp3,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/getTrashList")
	public ResponseEntity<List<FileDocumentVO>> getTrashList(HttpSession session,String stand) throws Exception
	{
		ResponseEntity<List<FileDocumentVO>> result=null;
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		String rootPath = fileDocumentPath + loginUser.getEmpName() + "/휴지통/"; // offispace/fileDocument/임나리/ -> 이게 루트 디렉터리

		if(stand.equals("D")) //개인 휴지통
		{
			rootPath = fileDocumentPath + loginUser.getEmpName() + "/휴지통/";
		}
		if(stand.equals("E")) //부서 휴지통
		{
			rootPath = fileDocumentPath + loginUser.getTeamValue() + "/휴지통/";
		}
		if(stand.equals("F")) //공용 휴지통
		{
			rootPath = fileDocumentPath + "/공용/휴지통/";
		}
		
		// jstree용 리스트 출력
		List<FileDocumentVO> docList = new ArrayList<FileDocumentVO>();

		dfs(rootPath, docList, "", true);
//		Collections.reverse(docList);
		List<FileDocumentVO> temp3 = sorting(docList);

		result=new ResponseEntity<List<FileDocumentVO>>(temp3,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping(value="/moving",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> moving(@RequestParam(value="sendArray[]") List<String> moveList, String target) throws Exception
	{
		ResponseEntity<String> result=null;
		
		for(int i=0;i<moveList.size();i++)
		{
			File temp = new File(moveList.get(i));
			String path = temp.getPath();
			int num = path.lastIndexOf(File.separator);
			String real = target+path.substring(num+1);

			File dup=new File(real);
			if(dup.exists())
			{
				result=new ResponseEntity<String>("이름이 중복된 파일이 검색되어 이동이 불가합니다.",HttpStatus.INTERNAL_SERVER_ERROR);
				return result;
			}
			
			Path oldFile = Paths.get(path);
			Path newFile = Paths.get(real);
			Files.move(oldFile, newFile, StandardCopyOption.ATOMIC_MOVE);
		}
		result=new ResponseEntity<String>("이동 성공하였습니다.",HttpStatus.OK);
		
		return result;
	}
	
	
	@RequestMapping("/goTrash")
	public ResponseEntity<String> goTrash(@RequestParam(value="sendArray[]") List<String> deleteList,HttpSession session,String from) throws Exception
	{
		ResponseEntity<String> result=null;
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		String real=fileDocumentPath;
		
		if(from.equals("D")) real+=loginUser.getEmpName()+"/휴지통/";
		if(from.equals("E")) real+=loginUser.getTeamValue()+"/휴지통/";
		if(from.equals("F")) real+="공용/휴지통/";
		
		for(int i=0;i<deleteList.size();i++)
		{
			File temp = new File(deleteList.get(i));
			//dfs(temp);
			String path = temp.getPath();
			int num = path.lastIndexOf(File.separator);
//			String real = path.substring(0, num)+File.separator+"휴지통"+File.separator+path.substring(num+1);
//			String real = fileDocumentPath+loginUser.getEmpName()+"/휴지통"+File.separator+path.substring(num+1);
			real += path.substring(num+1);
			System.out.println(real);
			
			Path oldFile = Paths.get(path);
			Path newFile = Paths.get(real);
			Files.move(oldFile, newFile, StandardCopyOption.ATOMIC_MOVE);
		}
//		result=new ResponseEntity<String>("삭제 성공하였습니다.",HttpStatus.OK);
		
		
		return result;
	}
	
	
	@RequestMapping("/delete")
	public ResponseEntity<String> delete(@RequestParam(value="sendArray[]") List<String> deleteList) throws Exception
	{
		ResponseEntity<String> result=null;
		
		for(int i=0;i<deleteList.size();i++)
		{
//			System.out.println(deleteList.get(i));
			File temp = new File(deleteList.get(i));
			dfs(temp);
		}
//		result=new ResponseEntity<String>("삭제 성공하였습니다.",HttpStatus.OK);
		
		
		return result;
	}
	
	private void dfs(File file) throws Exception
	{
		if(file.isDirectory())
		{
			File[] temps = file.listFiles();
			for(File temp:temps)
			{
				dfs(temp);
			}
			file.delete();
		}
		else
		{
			file.delete();
		}
	}
	
	public void dfs(String directName,List<FileDocumentVO> docList,String parent,boolean isRoot) throws IOException
	{
		File temp = new File(directName);
		temp.mkdirs();
		File[] items = temp.listFiles();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");

		for(File item:items)
		{
			FileDocumentVO doc=null;
			
			BasicFileAttributes attrs = Files.readAttributes(item.toPath(), BasicFileAttributes.class);
			FileTime time = attrs.creationTime();
			
			if (item.isDirectory()) //폴더면
			{
//				doc=new FileDocumentVO("fold"+(++uniqFolder) , isRoot?"#":""+parent , item.getName() , ""); //fa fa-folder text-warning
//				docList.add(doc);
//				String addDirect=directName+item.getName()+"/";
//				dfs(addDirect,docList,"fold"+uniqFolder,false);
				if(item.getName().equals("휴지통")) continue;
				doc=new FileDocumentVO(item.getAbsolutePath().replace(File.separator, "/")+"/" , isRoot?"#":""+parent , item.getName() , "", format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName() ); //fa fa-folder text-warning
				docList.add(doc);
				String addDirect=directName+item.getName()+"/";
				dfs(addDirect,docList,item.getAbsolutePath().replace(File.separator, "/")+"/",false);
			}
			else //파일이면
			{
//				doc=new FileDocumentVO("file"+(uniqFile++) , isRoot?"#":""+parent , item.getName() , "fa fa-file  text-warning");
//				docList.add(doc);
				doc=new FileDocumentVO(directName+item.getName() , isRoot?"#":""+parent ,  MakeFileName.parseFileNameFromUUID(item.getName(), "\\$\\$") , "fa fa-file  text-warning" , format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName());
				docList.add(doc);
			}
		}
	}
	
	private List<FileDocumentVO> sorting(List<FileDocumentVO> docList) throws Exception
	{
		List<FileDocumentVO> temp1=new ArrayList<FileDocumentVO>();
		List<FileDocumentVO> temp2=new ArrayList<FileDocumentVO>();
		List<FileDocumentVO> temp3=new ArrayList<FileDocumentVO>();
		for(int i=0;i<docList.size();i++)
		{
			if(docList.get(i).getIcon().equals("fa fa-file  text-warning"))
			{
				temp2.add(docList.get(i));
			}
			else
			{
				temp1.add(docList.get(i));
			}
		}
		
		temp3.addAll(temp1);
		temp3.addAll(temp2);
		
		return temp3;
	}
	
}
