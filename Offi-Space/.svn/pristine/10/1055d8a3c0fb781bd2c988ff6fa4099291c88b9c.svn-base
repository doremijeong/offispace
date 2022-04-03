package kr.co.offispace.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.FileDocumentVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.util.MakeFileName;

@Controller
@RequestMapping("/fileDocument")
public class FileDocumentController {
	
	@Autowired
	private AttachmentService attachmentService;
	
	@Resource(name="fileDocumentPath")
	private String fileDocumentPath;
	
//	private static int uniqFolder;
//	private static int uniqFile;
	
	@RequestMapping("/main")
	public ModelAndView personalMain(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/personalMain";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String rootPath=fileDocumentPath+loginUser.getEmpName()+"/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//휴지통 만들어주기
		File trash = new File(rootPath+"휴지통/");
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
//		Collections.reverse(docList);
//		System.out.println("===========");
//		for(FileDocumentVO temp:docList)
//		{
//			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
//		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
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
	
	//다운로드용 메서드.
	@RequestMapping("/getFile")
	public String getFile(String attachSaveName,String attachSavePath,HttpSession session,Model model,String stand) throws Exception
	{
		String url="downloadFile"; //이거 jsp 아니다~.
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		//if(attachSavePath==null || attachSavePath.isEmpty()) //원래는 #인데 주소줄에서 깨진다.
		if(attachSavePath.equals("root")) //원래는 #인데 주소줄에서 깨진다.
		{
			if(stand.equals("A")) {
				attachSavePath=fileDocumentPath+loginUser.getEmpName()+"/"; //얘는 슬래쉬로 잘되어있다. properties 항목이기 때문에
			}
			if(stand.equals("B")) {
				attachSavePath=fileDocumentPath+loginUser.getTeamValue()+"/";
			}
			if(stand.equals("C")) {
				attachSavePath=fileDocumentPath+"공용/";
			}
			
			if(stand.equals("D")) {
				attachSavePath=fileDocumentPath+loginUser.getEmpName()+"/휴지통/";
			}
			if(stand.equals("E")) {
				attachSavePath=fileDocumentPath+loginUser.getTeamValue()+"/휴지통/";
			}
			if(stand.equals("F")) {
				attachSavePath=fileDocumentPath+"공용/휴지통/";
			}
		}
		System.out.println(attachSavePath);
		System.out.println("끄아앙"+attachSaveName);
//		AttachmentVO attachment = attachmentService.getAttachmentByAttachGroup("FD001");
//		AttachmentVO temp=new AttachmentVO();
//		temp.setAttachSavename(attachSaveName);
//		temp.setAttachSavepath(attachSavePath);
//		
//		//궂이 만들 필요가 없다?????????
//		AttachmentVO attachment = attachmentService.getAttachmentByAttachSaveNameAndAttachSavePath(temp);
		
		//model.addAttribute("savepath",attachment.getAttachSavepath());
		//model.addAttribute("savename",attachment.getAttachSavename()); //==request.setAttribute("filename",attach.getFileName());
		//model에서 addAttribute할때, 키값을 생략하면, 클래스명을 키값으로 대체한다!
		model.addAttribute("savename",attachSaveName); //==request.setAttribute("filename",attach.getFileName());
		model.addAttribute("savepath",attachSavePath);
		
		return url;
	}
	
	@RequestMapping("/newFoldForm")
	public void newFoldForm(Model model,String current) throws Exception {
		model.addAttribute("current",current);
	}
	
	@RequestMapping("/uploadForm")
	public void uploadForm(Model model,String current) throws Exception {
		model.addAttribute("current",current);
	}
	
	@RequestMapping("/movingForm")
	public ModelAndView movingForm(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current,String array,String from) throws Exception {
		
		String url="fileDocument/movingForm";
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
//		String rootPath = fileDocumentPath + loginUser.getEmpName() + "/"; // offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		String rootPath = fileDocumentPath; // offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		if(from.equals("A")) rootPath+=loginUser.getEmpName() + "/";
		if(from.equals("B")) rootPath+=loginUser.getTeamValue() + "/";
		if(from.equals("C")) rootPath+="공용/";

		// jstree용 리스트 출력
		List<FileDocumentVO> docList = new ArrayList<FileDocumentVO>();

		dfsFormovingForm(rootPath, docList, "", true);
		//특별히 상단 폴더 추가
//		docList.add(new FileDocumentVO(rootPath, "#" , loginUser.getEmpName(), "", "", 0,""));
		if(from.equals("A")) docList.add(new FileDocumentVO(rootPath, "#" , loginUser.getEmpName(), "", "", 0,""));
		if(from.equals("B")) docList.add(new FileDocumentVO(rootPath, "#" , loginUser.getTeamValue(), "", "", 0,""));
		if(from.equals("C")) docList.add(new FileDocumentVO(rootPath, "#" , "공용", "", "", 0,""));
		Collections.reverse(docList);
		
		for(FileDocumentVO temp:docList)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
		
		List<String> moveList=new ArrayList<String>();
		String[] temp = array.split(",");
		for(int i=0;i<temp.length;i++)
		{
			moveList.add(temp[i]);
		}
		
		// 심어주는 부분
		mnv.addObject("docList", docList);
		mnv.setViewName(url);
		mnv.addObject("current", current);
		mnv.addObject("moveList",moveList);
		mnv.addObject("cnt",temp.length);
		mnv.addObject("from",from);
		
		return mnv;
	}
	
	@RequestMapping("/nameChangeForm")
	public void nameChangeForm(Model model,String current) throws Exception {
		
		String path=null;
		String name=null;
		
		if(current.charAt(current.length()-1)=='/') //폴더면
		{
			String[] divide = current.split("/");
			name=divide[divide.length-1];
			int num = current.indexOf(name);
			path=current.substring(0,num);
		}
		else //파일이면
		{
			int num = current.lastIndexOf("/");
			path = current.substring(0,num+1);
			name = current.substring(num+1);
		}
		model.addAttribute("path",path);
		model.addAttribute("name",name);
//		model.addAttribute("current",current);
		
	}
	
	@RequestMapping("/changeName")
	public String changeName(String originalName,String originalPath,String target) throws Exception
	{
		String url="fileDocument/successChangeName";

		String extension=null;
		if(originalName.contains(".")) //파일
		{
			extension=originalName.substring(originalName.indexOf("."));
		}
			
		String before = originalPath+originalName;
		String after = originalPath+target;
		if(extension!=null) after+=extension;
		
		System.out.println(before);
		System.out.println(after);
		
		Path oldFile = Paths.get(before);
		Path newFile = Paths.get(after);
		
//		Files.move(oldFile, newFile, StandardCopyOption.ATOMIC_MOVE);
		Files.move(oldFile, newFile);
		
		return url;
	}
	
	public void dfsFormovingForm(String directName,List<FileDocumentVO> docList,String parent,boolean isRoot) throws IOException
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
				doc=new FileDocumentVO(item.getAbsolutePath().replace(File.separator, "/")+"/" , isRoot?directName:""+parent , item.getName() , "", format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName() ); //fa fa-folder text-warning
				docList.add(doc);
				String addDirect=directName+item.getName()+"/";
				dfsFormovingForm(addDirect,docList,item.getAbsolutePath().replace(File.separator, "/")+"/",false);
			}
		}
	}
	
	@RequestMapping("/makeFold")
	public String makeFold(HttpSession session,@RequestParam(defaultValue="새폴더") String foldName,String foldLocate) throws Exception
	{
		String url="fileDocument/successMakeFold";
		
		String rootPath=fileDocumentPath+foldLocate+foldName+"/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		File newFold=new File(rootPath);
		newFold.mkdirs();
		
		return url;
	}
	
	@RequestMapping("/uploadFile")
	public String uploadFile(HttpSession session,@RequestParam("files") MultipartFile files,String foldLocate) throws Exception
	{
		String url="fileDocument/successUploadFile";
		
		String rootPath=fileDocumentPath+foldLocate; 
		File newFold=new File(rootPath);
		newFold.mkdirs();
		
		savePicture(files, rootPath);
		
		return url;
	}
	
	private String savePicture(MultipartFile multi,String uploadPath) throws IOException
	{
		String fileName=null;
		//파일유무확인
		if(!(multi==null||multi.isEmpty()||multi.getSize()>1024*1024*5))
		{
			fileName=MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile=new File(uploadPath,fileName);
			
			storeFile.mkdirs();
			
			//local HDD에 저장.
			multi.transferTo(storeFile);
		}
		
		return fileName;
	}
	
	@RequestMapping("/trash")
	public ModelAndView trash(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/trash";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String rootPath=fileDocumentPath+loginUser.getEmpName()+"/휴지통/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//휴지통 만들어주기
		File trash = new File(rootPath);
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
//		Collections.reverse(docList);
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	@RequestMapping("/trashTeam")
	public ModelAndView trashTeam(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/trashTeam";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String rootPath=fileDocumentPath+loginUser.getTeamValue()+"/휴지통/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//휴지통 만들어주기
		File trash = new File(rootPath);
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
//		Collections.reverse(docList);
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	@RequestMapping("/trashShare")
	public ModelAndView trashShare(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/trashShare";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String rootPath=fileDocumentPath+"공용/휴지통/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//휴지통 만들어주기
		File trash = new File(rootPath);
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
//		Collections.reverse(docList);
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	@RequestMapping("/share")
	public ModelAndView share(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/shareMain";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		String rootPath=fileDocumentPath+"공용/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//공용 휴지통 만들어주기
		File trash = new File(rootPath+"휴지통/");
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	@RequestMapping("/team")
	public ModelAndView team(HttpSession session,ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="fileDocument/teamMain";
		
		//로그인 세션, 로그인한 이름으로 root path 설정
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		String rootPath=fileDocumentPath+loginUser.getTeamValue()+"/"; //offispace/fileDocument/임나리/ -> 이게 루트 디렉터리
		
		//휴지통 만들어주기
		File trash = new File(rootPath+"휴지통/");
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileDocumentVO> docList=new ArrayList<FileDocumentVO>();
		
		dfs(rootPath,docList,"",true);
		
		List<FileDocumentVO> temp3 = sorting(docList);
		
		for(FileDocumentVO temp:temp3)
		{
			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
		}
		
//		Collections.reverse(docList);
//		System.out.println("===========");
//		for(FileDocumentVO temp:docList)
//		{
//			System.out.println(temp.getId()+" , "+temp.getParent()+" , "+temp.getText()+" , "+temp.getIcon());
//		}
		
		//심어주는 부분
		mnv.addObject("docList",temp3);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
//	Queue<String> que=new LinkedList<String>();
//	que.offer(rootPath);
//	
//	System.out.println("=======시작=========");
//	
//	int level=1;
//	int uniq=1;
//	while(que.size()>0)
//	{
//		int cnt = que.size();
//		for(int i=0;i<cnt;i++)
//		{
//			String directName = que.poll();
//			File temp = new File(directName);
//			temp.mkdirs();
//			File[] items = temp.listFiles();
//			
//			for(File item:items)
//			{
//				FileDocumentVO doc=null;
//				
//				if (item.isDirectory()) //폴더면
//				{
//					System.out.println("폴더 : "+item.getName());
//					String addDirect=directName+item.getName()+"/";
//					que.offer(addDirect);
//					doc=new FileDocumentVO(""+uniq,level==1?"#":"#",item.getName(),"폴더 아이콘");
//				}
//				else //파일이면
//				{
//					System.out.println("파일 : "+item.getName());
//					doc=new FileDocumentVO(""+uniq,level==1?"#":"#",item.getName(),"파일 아이콘");
//					//doc=new FileDocumentVO(id, parent, text, icon);
//				}
//				
//				docList.add(doc);
//			}
//		}
//		System.out.println("======="+level+"레벨 끝=========");
//		level++;
//	}
//	System.out.println("=======끝=========");
}
