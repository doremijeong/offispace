package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.dao.notification.NotificationDAO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.notification.NotificationService;

@RestController
@RequestMapping("/notification")
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	@ResponseBody
	@RequestMapping("/list")
	public ResponseEntity<Map<String,Object>> getNotificationList (String searchType,HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>>  entity = null;
		Map<String,Object> data = new HashMap<String, Object>();
		//@RequestParam(defaultValue="instantNotification")
		//System.out.println(searchType);
		try {
			Map<String,String> searchTypeEmpCode = new HashMap<String, String>();
			searchTypeEmpCode.put("searchType", searchType);

			EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
			searchTypeEmpCode.put("empCode", emp.getEmpCode());

			List<NotificationVO> notificationList = notificationService.getNotificationList(searchTypeEmpCode);
			data.put("notificationList",notificationList);

			entity = new ResponseEntity<Map<String,Object>>(data,HttpStatus.OK);
		}catch(NullPointerException e) {
			System.out.println("알람 널포인트 예외 뜹니당.");
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping("/modifyNotiConfirmed")
	public ResponseEntity<Map<String,Object>> modifyNotiConfirmed (String ntCode, HttpSession session){
		ResponseEntity<Map<String,Object>> entity = null;
		System.out.println(ntCode);
		try {
			Map<String,String> confirmTypeNotiEmpCode = new HashMap<>();

			if("all".equals(ntCode)) {
				confirmTypeNotiEmpCode.put("confirmType", "all");
			}else {
				confirmTypeNotiEmpCode.put("confirmType", "one");
			}

			EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
			confirmTypeNotiEmpCode.put("empCode", emp.getEmpCode());
			confirmTypeNotiEmpCode.put("ntCode", ntCode);
			notificationService.modifyIsConfrim(confirmTypeNotiEmpCode);
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;

	}

	
	@ResponseBody
	@RequestMapping("/registerNotiFromNoti")
	public ResponseEntity<Map<String,Object>> registerNotiFromNoti(NotificationVO notification, HttpSession session){
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String,Object>>(HttpStatus.OK);
		try {
			notificationService.registerNotiFromNoti(notification);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		
		
		
		return entity;
	}
}
