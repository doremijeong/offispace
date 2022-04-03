package kr.co.offispace.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.service.commonCode.CommonCodeService;

@Controller
@RequestMapping("/organizationChart")
public class OrganizationChartController {

	@Autowired
	private CommonCodeService commonCodeService; 
	
	@RequestMapping("main")
	public ModelAndView main(ModelAndView mnv) throws Exception
	{
		String url="organizationChart/main";
		
		Map<String, Object> dataMap = commonCodeService.getOrganizationChart();
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
