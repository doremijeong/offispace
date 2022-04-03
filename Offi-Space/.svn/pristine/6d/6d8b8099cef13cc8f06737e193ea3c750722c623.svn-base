package kr.co.offispace.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.offispace.dto.EmployeeVO;

public class LoggerHelper {
	
//	@Resource(name="logErrorsPath")
//	private static String savePathErrors;
//	
//	@Resource(name="logLoginsPath")
//	private String savePathLogins;
//	
//	@Resource(name="logApprovalsPath")
//	private static String savePathApprovals;
//	
//	@Resource(name="logReportsPath")
//	private static String savePathReports;
//	
//	@Resource(name="logJobsPath")
//	private static String savePathJobs;
	
	public static void writeErrorLog(HttpServletRequest request, Exception e, Object obj, String savePath)
	{
//		String savePath=GetUploadPath.getUploadPath("error.log").replace("/", File.separator);
		savePath=savePath.replace("/", File.separator);
		
		String logFilePath=savePath+File.separator+"system_exception_log.csv";
		
		String url=request.getRequestURI().replace(request.getContextPath(), "");
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String loginUserName=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpName();
		String exceptionType=e.getClass().getName();
		String happenObject=obj.getClass().getName();
		
//		String log="[Error : "+exceptionType+"]"+url+","+date+","+loginUserName+","+happenObject+"\n"+e.getMessage();
//		String log="[Error : "+exceptionType+"]"+url+","+date+","+loginUserName+","+happenObject+"\n";
		String log="[Error : "+exceptionType+"]"+url+","+date+","+loginUserName+","+happenObject;
		
		//로그 파일 생성
		File file=new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); //이어쓰기 진행
			
			out.write(log);
			out.newLine(); //줄바꿈
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}
	
	public static void writeLoginLog(HttpServletRequest request,String savePath)
	{
		savePath=savePath.replace("/", File.separator);
		
		String logFilePath=savePath+File.separator+"system_log_in.csv";
		
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String loginUserName=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpName();
		String loginUserCode=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpCode();
		
		String log="[Login : "+loginUserName+"("+loginUserCode+") , "+date+" ]";
		
		//로그 파일 생성
		File file=new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); //이어쓰기 진행
			
			out.write(log);
			out.newLine(); //줄바꿈
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}
	
	public static void writeApprovalLog(HttpServletRequest request,String apvCode, String savePath)
	{
		savePath=savePath.replace("/", File.separator);
		
		String logFilePath=savePath+File.separator+"system_approval.csv";
		
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String loginUserName=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpName();
		String loginUserCode=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpCode();
		
		String log="[Approval : "+loginUserName+"("+loginUserCode+") , "+apvCode+" , "+date+" ]";
		
		//로그 파일 생성
		File file=new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); //이어쓰기 진행
			
			out.write(log);
			out.newLine(); //줄바꿈
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}
	
	public static void writeReportLog(HttpServletRequest request,String reportDocCode, String savePath)
	{
		savePath=savePath.replace("/", File.separator);
		
		String logFilePath=savePath+File.separator+"system_report.csv";
		
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String loginUserName=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpName();
		String loginUserCode=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpCode();
		
		String log="[Report : "+loginUserName+"("+loginUserCode+") , "+reportDocCode+" , "+date+" ]";
		
		//로그 파일 생성
		File file=new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); //이어쓰기 진행
			
			out.write(log);
			out.newLine(); //줄바꿈
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}
	
	public static void writeJobLog(HttpServletRequest request,String jobCode, String savePath)
	{
		savePath=savePath.replace("/", File.separator);
		
		String logFilePath=savePath+File.separator+"system_job.csv";
		
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String loginUserName=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpName();
		String loginUserCode=((EmployeeVO)request.getSession().getAttribute("loginUser")).getEmpCode();
		
		String log="[Job : "+loginUserName+"("+loginUserCode+") , "+jobCode+" , "+date+" ]";
		
		//로그 파일 생성
		File file=new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); //이어쓰기 진행
			
			out.write(log);
			out.newLine(); //줄바꿈
			
			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}
}
