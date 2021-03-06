package kr.co.offispace.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.command.AttendCommand;
import kr.co.offispace.dto.AnnualHistoryVO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.AttendTeamListDTO;
import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.WorkFromHomeAnswerVO;
import kr.co.offispace.dto.WorkFromHomeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.attend.AttendService;
import kr.co.offispace.service.employee.EmployeeService;

@RestController
@RequestMapping("/attend")
public class AttendRestController {

	@Autowired
	private AttachmentService attachmentService;
	
    @Autowired
    private AttendService attendService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value="/registerAttend",method=RequestMethod.GET,produces="application/text;charset=utf-8")
    public ResponseEntity<String> register(HttpSession session) throws Exception{

        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String empCode = loginUser.getEmpCode();

        AttendCommand attend = new AttendCommand();
        attend.setEmpCode(empCode);

        attendService.registerAttend(attend);
        // ???????????? ?????? ????????? insert ??????

        // ??????????????? ???????????? ????????????
        attend = attendService.getAttTime(empCode);
        String attTime = attend.getAttTime().substring(11);
        attend.setAttTime(attTime);

        // ???????????? ????????? ??????
        session.setAttribute("attend",attend);

        ResponseEntity<String> entity = new ResponseEntity<String>(attTime, HttpStatus.OK);

        return entity;
    }

    @RequestMapping(value="/modifyAttend", method=RequestMethod.GET, produces="application/text;charset=utf-8")
    public ResponseEntity<String> modifyAttend(HttpSession session) throws Exception{


        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String empCode = loginUser.getEmpCode();

        AttendCommand attend = new AttendCommand();
        attend.setEmpCode(empCode);

        attendService.modifyAttLeavTimeByAttTime(attend);
        //???????????? ?????? ????????? update ??????

        //??????????????? ???????????? ????????????
        attend = attendService.getAttTime(empCode);
        String attTime = attend.getAttTime().substring(11);
        String attLeavTime = attend.getAttLeavTime().substring(11);
        LocalTime startTime = LocalTime.parse(attTime);
        LocalTime endTime = LocalTime.parse(attLeavTime);
        attend.setAttLeavTime(attLeavTime);
        attend.setAttTime(attTime);

        Duration duration = Duration.between(startTime, endTime);
        String attTotalWorkTime = duration.toString().substring(2).replaceAll("H","??????").replaceAll("M", "???").replaceAll("S","???");

        attend.setAttTotalWorkTime(attTotalWorkTime);
        attend.setEmpCode(empCode);
        attendService.modifyOtherAttTimesByEmpCode(attend);

        // ???????????? ????????? ??????
        session.setAttribute("attend", attend);

        ResponseEntity<String> entity = new ResponseEntity<String>(attLeavTime, HttpStatus.OK);

        return entity;
    }

    @RequestMapping(value="/getTime", method=RequestMethod.GET)
    public ResponseEntity<String> getTime(HttpSession session,@RequestParam(defaultValue="") String from) throws Exception{

        ResponseEntity<String> result=null;
        if(session.getAttribute("attend")!=null)
        {
            AttendVO attend = (AttendVO)session.getAttribute("attend");
            if(from.equals("A")) //??????
            {
                //????????????.
                result = new ResponseEntity<String>(attend.getAttTimeSt().substring(11), HttpStatus.OK);
            }
            else if(from.equals("B")) //??????
            {
                result = new ResponseEntity<String>(attend.getAttLeavTimeSt().substring(11), HttpStatus.OK);
            }
        }

        return result;
    }

    //,produces="application/text;charset=utf-8"
    @RequestMapping(value="/asyncAttend", method=RequestMethod.GET)
    public ResponseEntity<Map<String,Object>> asyncAttend(HttpSession session,@RequestParam(defaultValue="C") String from) throws Exception{

        ResponseEntity<Map<String,Object>> entity = null;
        Map<String,Object> map=new HashMap<String, Object>();

        //????????? ????????????
        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String empCode = loginUser.getEmpCode();

        // ???????????? ??????????????????
        if (!from.equals("C"))
        {
            if (from.equals("A")) // ????????????
            {
                AttendVO attend = new AttendVO();

                // ????????? ????????? ????????? ?????? (????????? ???????????? ????????????)
                attend.setEmpCode(empCode);
                attend.setEmpName(loginUser.getEmpName());
                attend.setTeamValue(loginUser.getTeamValue());

                LocalDate ld = LocalDate.now(); // ?????? : ?????? ????????? ! ????????? 00:00:00 (????????????)
                Date todayOnlyDate = java.sql.Date.valueOf(ld);
                attend.setAttDt(todayOnlyDate);

                Date today = new Date(); // ?????? : ?????? ????????? ?????? (????????????)
                attend.setAttTime(today);

                attendService.registerAttend(attend);

                // string??? ??????
                SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

                attend.setAttDtSt(format1.format(todayOnlyDate));
                attend.setAttTimeSt(format1.format(today));

                // ????????? ?????? ?????? ??????(??????)
                session.setAttribute("attend", attend);

                map.put("ment", "?????? ?????????????????????.");
//				entity = new ResponseEntity<String>("?????? ?????????????????????.", HttpStatus.OK);
                map.put("time", attend.getAttTimeSt().substring(11));
            }
            else // ????????????
            {
                AttendVO attend = (AttendVO) session.getAttribute("attend");

                Date today = new Date(); // ?????? : ?????? ????????? ?????? (????????????)
                attend.setAttLeavTime(today);

                // ????????????. (??????????????? ??????x) . ??????????????? ??????...
                long total = (today.getTime() - attend.getAttTime().getTime()) / 1000;
                long hour = total / (60 * 60);
                long minute = (total - hour * 60 * 60) / 60;
                long second = (total - hour * 60 * 60 - minute * 60);

                SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");
                Date only = format1.parse(format2.format(today) + " 00:00:00");

                Calendar cc = Calendar.getInstance();
                cc.setTime(only);
                cc.add(Calendar.HOUR, (int) hour);
                cc.add(Calendar.MINUTE, (int) minute);
                cc.add(Calendar.SECOND, (int) second);

                Date result = new Date(cc.getTimeInMillis());

                attend.setAttRealWorkTime(result);
                attend.setAttTotalWorkTime(result);
                //////////////////////////////////////

                attendService.registerLeave(attend);

                // string??? ??????
                attend.setAttLeavTimeSt(format1.format(today));
                attend.setAttRealWorkTimeSt(format1.format(result));
                attend.setAttTotalWorkTimeSt(format1.format(result));

                // ???????????? ????????? ??????
                session.setAttribute("attend", attend);

                map.put("ment", "?????? ?????????????????????.");
//				entity = new ResponseEntity<String>("?????? ?????????????????????.", HttpStatus.OK);
                map.put("time", attend.getAttLeavTimeSt().substring(11));
            }
        }

        //?????? ?????? ????????????
        if (session.getAttribute("attend") != null) // ????????? ????????????
        {
            AttendVO attend = (AttendVO) session.getAttribute("attend");
            Date today = new Date();

            long elapsedTime = (today.getTime() - attend.getAttTime().getTime()) / 1000;
            map.put("elapsedTime", elapsedTime);
//			model.addAttribute("elapsedTime", elapsedTime);

            // ????????? ??? ??????..??????
            Date temp = new Date(elapsedTime * 1000);
            Calendar cc = Calendar.getInstance();
            cc.setTime(temp);
            cc.add(Calendar.HOUR, -9);
            if (elapsedTime > 0)
                cc.add(Calendar.SECOND, -1);
            Date tempTime = new Date(cc.getTimeInMillis());
            SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
            String temporaryTime = format2.format(tempTime);

//			model.addAttribute("temporaryTime", temporaryTime);
        }

        entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
        return entity;
    }


    //?????????????????????insert
    @RequestMapping(value="/registerWorkFromHome",method=RequestMethod.POST,produces="application/text;charset=utf-8")
    public ResponseEntity<String> register(@RequestBody WorkFromHomeVO wfh, HttpSession session) throws Exception{

        ResponseEntity<String> entity = new ResponseEntity<String>("???????????? ?????? ??????!",HttpStatus.OK);;

        //????????? ????????????
        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String empCode = loginUser.getEmpCode();

        //empCode,empName,teamValue,teamCode ????????????~!
        wfh.setEmpCode(empCode);
        wfh.setEmpName(loginUser.getEmpName());
        wfh.setTeamValue(loginUser.getTeamValue());
        wfh.setTeamCode(loginUser.getTeamCode());


        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
        String today = sdf.format(new Date());
        Date applicationDt = sdf.parse(today + " 00:00:00");
        wfh.setApplicationDt(applicationDt);//??????????????? ????????? 00:00:00?????? ??????

        String stDt = sdf.format(wfh.getStartDt());
        Date startDt = sdf.parse(stDt + " 00:00:00");
        wfh.setStartDt(startDt);//??????????????? ?????? ????????? 00:00:00

        String edDt = sdf.format(wfh.getEndDt());
        Date endDt = sdf.parse(edDt+ " 23:59:59");
        wfh.setEndDt(endDt);//??????????????? ?????? ????????? 00:00:00

        attendService.registerWorkFromHome(wfh);

        //?????????????????? ?????????,?????????,???????????? ????????? (???????????? ???????????????~!)
        //System.out.println("wfh.getStartDt() : " +  wfh.getStartDt());
        //System.out.println("wfh.getEndDt() : " +  wfh.getEndDt());
        //System.out.println("wfh.getapplicationReason() : " +  wfh.getApplicationReason());

        //?????? wfhCode,applicationDt,attCode??? ????????? db??? ???????????? ???????????? vo??? ???????????? insert?????????~!

        return entity;
    }

    //??????????????????????????????
    @RequestMapping(value="/teamsHomeCheck",method=RequestMethod.GET,produces="application/text;charset=utf-8")
    public ResponseEntity<String> teamsHomeCheck( HttpSession session) throws Exception{

        ResponseEntity<String> entity = new ResponseEntity<String>("????????????!",HttpStatus.OK);
        WorkFromHomeVO home = new WorkFromHomeVO();
        EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
        home.setTeamCode(loginUser.getTeamCode());
        home.setEmpCode(loginUser.getEmpCode());
        home.setEmpName(loginUser.getEmpName());
        home.setTeamValue(loginUser.getTeamValue());


        attendService.getWorkFromHomeByTeamCode(home);

        return entity;
    }

    //????????????????????????????????? ?????? ??????
    @RequestMapping(value="/answerTimemodify", method=RequestMethod.GET,produces="application/text;charset=utf-8")
    public ResponseEntity<String> teamHomeAnswerTimeModify(HttpSession session) throws Exception{
        ResponseEntity<String> entity = new ResponseEntity<String>("????????????????????????", HttpStatus.OK);

        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

        WorkFromHomeAnswerVO answer = new WorkFromHomeAnswerVO();

        answer.setEmpCode(loginUser.getEmpCode());
        answer.setEmpName(loginUser.getEmpName());
        //?????? ???????????? ???????????? ????????????
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String nowDate = sdf.format(new Date());
        Date nowDt = sdf.parse(nowDate);
        answer.setWfhaAnsTime(nowDt); //Wed Feb 09 23:19:57 KST 2022

//		System.out.println(answer.getWfhaAnsTime()+"000000000000000000");
        attendService.modifyWorkFromHomeAnswerTime(answer);

//		WorkFromHomeAnswerVO info = attendService.getWorkFromhomeAnswerByAnswerTimeAndEmpCode(answer);
//		info.setWfhaAnsTime(answer.getWfhaAnsTime());
//		info.setEmpCode(answer.getEmpCode());
//
//		System.out.println(info.getWfhaAnsTime()+"?????????????????????");
//		System.out.println(info.getEmpCode()+"??????...");
//
//		answer.setAnswerCode(info.getAnswerCode());
//		answer.setObserverCode(info.getObserverCode());
//
//		System.out.println(answer.getAnswerCode()+"nnnnnnnnnnnnnn");
//		System.out.println(answer.getObserverCode()+"mmmmmmmmmmmmmmmmmmm");

        return entity;
    }

    //??????????????? ???????????????
    @RequestMapping(value="/modify", method=RequestMethod.GET,produces="application/text;charset=utf-8")
    public ResponseEntity<String> modifyJobStCode(HttpSession session, Model model,String attOption) throws Exception{
        ResponseEntity<String> entity = new ResponseEntity<String>("?????????????????????????????????.", HttpStatus.OK);

        EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
        String empCode = loginUser.getEmpCode();

        AttendVO attend = new AttendVO();
        attend.setEmpCode(empCode);
        attend.setAttJobStCode(attOption);

        attendService.modifyAttJobStCodeByEmpCode(attend);

        model.addAttribute("attend",attend);
        //session.setAttribute("attend", attend);

        return entity;
    }


    @RequestMapping(value="/registerAnnualHistory",method=RequestMethod.POST,produces="application/text;charset=utf-8")
    public ResponseEntity<String> annualRegister(@RequestBody AnnualHistoryVO annual,HttpSession session) throws Exception{
        ResponseEntity<String> entity = new ResponseEntity<String>("??????????????????",HttpStatus.OK);

        //?????????????????????
        EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

        annual.setEmpCode(loginUser.getEmpCode());
        annual.setEmpName(loginUser.getEmpName());
        annual.setTeamValue(loginUser.getTeamValue());

        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
        String stDt = sdf.format(annual.getAnnStartDt());
        Date annStartDt = sdf.parse(stDt + " 00:00:00");
        annual.setAnnStartDt(annStartDt);//??????????????? ????????? 00:00:00?????? ??????

        String edDt = sdf.format(annual.getAnnEndDt());
        Date annEndDt = sdf.parse(edDt + " 00:00:00");
        annual.setAnnEndDt(annEndDt);//??????????????? ????????? 00:00:00?????? ??????

        attendService.registerAnnualHistory(annual);


        return entity;
    }


    @RequestMapping(value="/getTeamAttendList")
    public ResponseEntity<Map<String,Object>> getTeamAttendList(HttpSession session) throws Exception{
        ResponseEntity<Map<String,Object>> entity = null;
        Map<String, Object> data = new HashMap<>();
        List<AttendTeamListDTO> attendTeamList = new ArrayList<AttendTeamListDTO>();


        EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

        LocalDate ld = LocalDate.now();
        Date todayOnlyDate = java.sql.Date.valueOf(ld);
        AttendVO attendTeam = new AttendVO();
          attendTeam.setTeamValue(loginUser.getTeamValue());
          attendTeam.setAttDt(todayOnlyDate);

          List<AttendVO> teamAttend = attendService.getTodaysTeamMemberAttend(attendTeam);

          List<EmployeeVO> employeeList = employeeService.getEmployeeListByTeamCode(loginUser.getTeamCode());
          for(int i=0;i<employeeList.size();i++){
              if(employeeList.get(i).getEmpCode().equals(loginUser.getEmpCode())){
                  employeeList.remove(i);
                  break;
              }
          }
          
        //????????? ?????? ??????
  		for (EmployeeVO employee : employeeList) 
  		{
  			AttachmentVO temp = attachmentService.getAttachmentByAttachGroup(employee.getEmpCode());
  			if(temp!=null) employee.setAttachSavename(temp.getAttachSavename());
  			if(temp!=null) System.out.println(temp.getAttachSavename());
  		}
          
          for(EmployeeVO employee:employeeList){
              boolean flag=false;
              for(AttendVO team:teamAttend){
                  if(employee.getEmpCode().equals(team.getEmpCode())){
                      flag=true;
                  }
              }
              if(!flag){
                  AttendVO newAttend=new AttendVO();
                  newAttend.setEmpCode(employee.getEmpCode());
                  newAttend.setEmpName(employee.getEmpName());
                  newAttend.setTeamValue(employee.getTeamValue());
                  teamAttend.add(newAttend);
              }
          }

          //????????? ?????????
          for(EmployeeVO employee:employeeList) {
        	AttendTeamListDTO info = new AttendTeamListDTO();
        	if(employee.getEmpCode()!=null) info.setEmpCode(employee.getEmpCode());
        	if(employee.getEmpName()!=null) info.setEmpName(employee.getEmpName());
      		if(employee.getPositionValue()!=null) info.setPositionValue(employee.getPositionValue());
      		if(employee.getAttachSavename()!=null) info.setAttachSavename(employee.getAttachSavename());
      		for(AttendVO attend:teamAttend) {
      			if(attend.getEmpCode().equals(info.getEmpCode())){
      				 info.setAttJobStCode(attend.getAttJobStCode());
      				 System.out.println(attend.getAttJobStCode());
      			}
      		}
      		attendTeamList.add(info);
          }


          data.put("attendTeamList", attendTeamList);
          entity = new ResponseEntity<Map<String,Object>>(data, HttpStatus.OK);

          return entity;
    }


}
