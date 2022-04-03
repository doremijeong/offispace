package kr.co.offispace.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.CriteriaCommand;
import kr.co.offispace.command.NoticeVOCommand;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.notice.NoticeService;
import kr.co.offispace.util.GetAttachesByMultipartFileAdapter;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private AttachmentService attachService;

	@Resource(name = "noticeFilesPath")
	private String noticeFilesPath;

	@RequestMapping("/main")
	public String main() {
		String url = "board/main";
		return url;
	}

	@RequestMapping("/list")
	public ModelAndView noticeList(ModelAndView mnv, CriteriaCommand criCmd) throws Exception {
		String url = "notice/noticeList";

		Criteria cri = criCmd.toCriteria();
		cri.setPerPageNum(15);

		Map<String, Object> dataMap = noticeService.getNoticeList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ResponseEntity<Map<String,Object>> register(NoticeVOCommand notiCmd) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		
		NoticeVO notice = notiCmd.toNoticeVO();

		List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(notiCmd.getAttached(), noticeFilesPath);
		notice.setAttachList(attachList);

		String noticeCode = noticeService.registerNotice(notice);
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("noticeCode", noticeCode);

		entity = new ResponseEntity<Map<String,Object>>(data, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String noticeCode, ModelAndView mnv, String from) throws Exception {
		String url = "notice/detail";

		if(from != null && from.equals("noti")) {
			noticeService.increaseViewCnt(noticeCode);
			mnv.addObject("from", "noti");
		}
		NoticeVO notice = noticeService.getNoticeByNoticeCode(noticeCode);

		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String noticeCode, ModelAndView mnv) throws Exception {
		String url = "notice/modifyForm";

		NoticeVO notice = noticeService.getNoticeByNoticeCode(noticeCode);

		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/modify")
	public ResponseEntity<String> modify(NoticeVOCommand notiCmd) throws Exception {

		NoticeVO notice = notiCmd.toNoticeVO();

		if(notiCmd.getDeleteFiles() != null) {

			// 여기서 수정한 파일들 지워주기 수정폼에서 jsp에 어떻게 들어가는지 확인 해봐야함
			// 파일들 지우고 db에서도 지워줘여함 attachmentcode로 parameter넘기기
			for (String attachCode : notiCmd.getDeleteFiles()) {
				AttachmentVO attach = attachService.getAttachmentByAT(attachCode);
				File file = new File(noticeFilesPath, attach.getAttachSavename());

				if(file.exists()) {
					file.delete();
				}
				attachService.removeAttachmentByAT(attachCode);
			}
		}

		List<AttachmentVO> attachList = GetAttachesByMultipartFileAdapter.save(notiCmd.getAttached(), noticeFilesPath);
		notice.setAttachList(attachList);


		noticeService.modifyNotice(notice);

		ResponseEntity<String> entity = new ResponseEntity<String>("수정 성공", HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/remove")
	public ResponseEntity<String> remove(String noticeCode) throws Exception {

		noticeService.removeNotice(noticeCode);

		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(noticeCode);

		if(attachList != null) {
			for (AttachmentVO attach : attachList) {
				File target = new File(noticeFilesPath, attach.getAttachSavename());

				if(target.exists()) {
					target.delete();
				}
			}

			attachService.removeAttachmentByOther(noticeCode);
		}

		 ResponseEntity<String> entity = new ResponseEntity<String>("삭제 성공", HttpStatus.OK);

		return entity;
	}
	
	
	@RequestMapping(value="/chkBoxRemove", method = RequestMethod.POST)
	@ResponseBody
	public void updateChkBoxBin(@RequestParam(value="sendArray[]") List<String> notiCode) throws Exception {

		for(int i = 0; i < notiCode.size(); i ++) {
			noticeService.removeNotice(notiCode.get(i));
		}
	};
	

	@RequestMapping("increaseViewCnt")
	public ResponseEntity<String> increaseViewCnt(String noticeCode) throws Exception {

		noticeService.increaseViewCnt(noticeCode);

		ResponseEntity<String> entity = new ResponseEntity<String>("조회수 변경 성공", HttpStatus.OK);

		return entity;
	}
}
