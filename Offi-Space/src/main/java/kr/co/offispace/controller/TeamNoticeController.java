package kr.co.offispace.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.NoticeVOCommand;
import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.command.TeamNoticeCriteriaCommand;
import kr.co.offispace.command.TeamNoticeVOCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.TeamNoticeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.notice.TeamNoticeService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/teamNotice")
public class TeamNoticeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(TeamNoticeController.class);

	@Autowired
	private TeamNoticeService teamNoticeService;

	@Autowired
	private AttachmentService attachService;

	@Resource(name = "noticeFilesPath")
	private String noticeFilesPath;


	@RequestMapping("/list")
	public ModelAndView teamNoticeList(ModelAndView mnv, TeamNoticeCriteriaCommand criCmd, HttpSession session) throws Exception {
		String url = "board/teamNoticeList";

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		TeamNoticeCriteria cri = criCmd.toCriteria();
		cri.setPerPageNum(15);
		cri.setTeamCode(emp.getTeamCode());

		Map<String, Object> dataMap = teamNoticeService.getTeamNoticeList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}


	@ResponseBody
    @RequestMapping("/registerPost")
    public ResponseEntity<Map<String,Object>> registerPost(TeamNoticeVOCommand teamNotice) throws Exception{
    	ResponseEntity<Map<String,Object>> entity = null;

    	TeamNoticeVO teamNoti = teamNotice.toTeamNoticeVO();

    	List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(teamNotice.getAttached(), noticeFilesPath);
    	teamNoti.setAttachList(attachList);

		String teamNoticeCode = teamNoticeService.registerTeamNotice(teamNoti);
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("teamNoticeCode", teamNoticeCode);

		entity = new ResponseEntity<Map<String,Object>>(data, HttpStatus.OK);

    	return entity;
    }


	//부서 공지 상세
	@RequestMapping("/detail")
	public ModelAndView teamNoticeDetail(String teamNoticeCode, ModelAndView mnv, String from)  throws Exception {
		String url="board/teamNoticeDetail";

		if(from != null && from.equals("noti")) {
			teamNoticeService.increaseViewCnt(teamNoticeCode);
			mnv.addObject("from", "noti");
		}

		TeamNoticeVO teamNotice = teamNoticeService.getTeamNoticeByCode(teamNoticeCode);

		mnv.addObject("teamNotice", teamNotice);
		mnv.setViewName(url);

		return mnv;
	};


	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String teamNoticeCode, ModelAndView mnv) throws Exception {
		String url = "board/modifyForm";

		TeamNoticeVO notice = teamNoticeService.getTeamNoticeByCode(teamNoticeCode);

		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}


	@RequestMapping("/modify")
	public ResponseEntity<String> modify(TeamNoticeVOCommand teamNotice) throws Exception {

    	TeamNoticeVO teamNoti = teamNotice.toTeamNoticeVO();

		if(teamNotice.getDeleteFiles() != null) {

			// 여기서 수정한 파일들 지워주기 수정폼에서 jsp에 어떻게 들어가는지 확인 해봐야함
			// 파일들 지우고 db에서도 지워줘여함 attachmentcode로 parameter넘기기
			for (String attachCode : teamNotice.getDeleteFiles()) {
				AttachmentVO attach = attachService.getAttachmentByAT(attachCode);
				File file = new File(noticeFilesPath, attach.getAttachSavename());

				if(file.exists()) {
					file.delete();
				}
				attachService.removeAttachmentByAT(attachCode);
			}
		}

		List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(teamNotice.getAttached(), noticeFilesPath);
		teamNoti.setAttachList(attachList);

		teamNoticeService.modifyTeamNotice(teamNoti);

		ResponseEntity<String> entity = new ResponseEntity<String>("수정 성공", HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/remove")
	public ResponseEntity<String> remove(String teamNoticeCode) throws Exception {

		teamNoticeService.removeTeamNotice(teamNoticeCode);

		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(teamNoticeCode);

		if(attachList != null) {
			for (AttachmentVO attach : attachList) {
				File target = new File(noticeFilesPath, attach.getAttachSavename());

				if(target.exists()) {
					target.delete();
				}
			}
			attachService.removeAttachmentByOther(teamNoticeCode);
		}

		 ResponseEntity<String> entity = new ResponseEntity<String>("삭제 성공", HttpStatus.OK);

		return entity;
	}


	@RequestMapping(value="/chkBoxRemove", method = RequestMethod.POST)
	@ResponseBody
	public void updateChkBoxBin(@RequestParam(value="sendArray[]") List<String> notiCode) throws Exception {

		for(int i = 0; i < notiCode.size(); i ++) {
			teamNoticeService.removeTeamNotice(notiCode.get(i));
		}
	};


	@RequestMapping("increaseViewCnt")
	public ResponseEntity<String> increaseViewCnt(String teamNoticeCode) throws Exception {

		teamNoticeService.increaseViewCnt(teamNoticeCode);

		ResponseEntity<String> entity = new ResponseEntity<String>("조회수 변경 성공", HttpStatus.OK);

		return entity;
	}

}
