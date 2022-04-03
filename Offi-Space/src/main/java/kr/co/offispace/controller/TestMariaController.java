package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.offispace.dto.TestMariaVO;
import kr.co.offispace.service.testMaria.TestMariaService;

@Controller
@RequestMapping("/testMaria")
public class TestMariaController {
	
	@Autowired
	private TestMariaService testMariaService;
	
	@RequestMapping("/test")
	public List<TestMariaVO> getTestMaria() {
		
		List<TestMariaVO> list = null;
		
		try {
			list =  testMariaService.getTestMaria();
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
