<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="apvList" value="${apvList}" />
<c:set var="apvReqList" value="${apvDataMap.requestList}" />
<c:set var="requestedList" value="${requetedAllList}"/>
<c:set var="requestedList" value="${requestedAllList}"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="date"/>
<fmt:formatDate value="${now}" pattern="E" var="today" />
<c:set var="reportDocList" value="${dataMap.reportDocList}"/>

<head></head>

<title></title>

<body>
	<!-- Content Header (Page header) -->
	<!-- 마진을 위한 div -->
	<div style="height: 20px;"></div>
	
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
<script>
	/* 윈도우 온로드 자바스크립트  */
	window.onload= function(){
		showTime();
		 if('${alert}')
			{
			 callSuccess("${alert}","");
			}
	
	
		if('${attachment.attachSavename}')
		{
		   	MemberPictureThumb($('#main_photo'),'${attachment.attachSavename}','<%=request.getContextPath()%>');
		}
		
		if('${alert}')
		{
		  	var parent = window.parent.document;
		  	if('${alert}'=='출근 성공하였습니다.')
		  	{
		   		window.parent.start();
		
				$.ajax({
		       		url:'<%=request.getContextPath()%>/attend/getTime?from=A',
		       		type:'get',
		       		success:function(result){
						parent.getElementById('attTime').innerText=result;
		       		},
		       		error:function(error){
		       			AjaxErrorSecurityRedirectHandler(error.status);
		         	}
		     	});
				parent.getElementById('attBtn').innerText='퇴근하기';
				$('#attBtn', window.parent.document).prop("href","javascript:IPCheck('B');");
		    }
		   	else
		   	{
				window.parent.end();
		
				$.ajax({
					url:'<%=request.getContextPath()%>/attend/getTime?from=B',
					type:'get',
					success:function(result){
						parent.getElementById('leaveTime').innerText=result;
					},
					error:function(error){
						AjaxErrorSecurityRedirectHandler(error.status);
				}
				});
				parent.getElementById('attBtn').innerText='업무완료';
				$('#attBtn', window.parent.document).prop("href","#");
			}
		  	'<c:remove var="alert"/>';
 		}
	}

/* 각 필요한 자바스크립트 시작   */

// 업무 상세보기 관련
function myReceivedJobDetail(jobCode){
	OpenWindow('<%=request.getContextPath()%>/job/receivedJobDetail?jobCode='+jobCode, '', '950', '830');
};

function myRequestedJobDetail(jobCode){
	OpenWindow('<%=request.getContextPath()%>/job/requestedJobDetail?jobCode='+jobCode, '', '950', '830');
};


// 전자결재 상세보기 관련
function detail(apvCode) {
	//OpenWindow('waitDetail?apvCode='+apvCode,'','900','870')
	OpenWindow('<%=request.getContextPath()%>/approval/waitDetail?apvCode='+ apvCode, '', '900', '870');
}

function requestDetail(apvCode){
	OpenWindow('<%=request.getContextPath()%>/approval/request/detail?apvCode='+ apvCode, '', '900', '870');
}


// 보고서 상세보기 관련
function myReportDetail(reportDocCode){
	OpenWindow('<%=request.getContextPath()%>/report/reportDetail?reportDocCode='+reportDocCode, '', '900', '870');
}


 function IPCheck(from,smooth)
 {
 	if(from=="A") //출근
 	{
 		 $.ajax({
	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
	            type:'get',
	            success:function(success){
	            	//alert(success);

	            	location.href='<%=request.getContextPath()%>/main.do?from='+from;
	            },
	            error:function(error){
	            	callSuccess(error.responseText,'');
// 	            	alert(error.responseText);
	            	//alert(error.status);
	                //AjaxErrorSecurityRedirectHandler(error.status);
	            }
	        });
 	}
 	else //퇴근
 	{
 		if(smooth || confirm('퇴근처리하시겠습니까?'))
     	{
 			$.ajax({
 	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
 	            type:'get',
 	            success:function(success){
 	            	//alert(success);

 	            	location.href='<%=request.getContextPath()%>/main.do?from='+from;
 	            },
 	            error:function(error){
 	            	callSuccess(error.responseText,'');
//  	            	alert(error.responseText);

 	            	//alert(error.status);
 	                //AjaxErrorSecurityRedirectHandler(error.status);
 	            }
 	        });
     	}
 	}
 }

 function faceSuccess(from)
 {
 	location.href='<%=request.getContextPath()%>/main.do?from='+from;
 }


 //재택근무확인
 function homeCheck(from){
	if(from=="A"){ //출근
		 $.ajax({
	        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
	            type:'get',
	            success:function(success){
	            	if(success=='얼굴인식'){
	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'안면인식','750','600');
<%-- 	            		OpenWindow('<%=request.getContextPath()%>/common/testtt.do','안면인식','750','600'); --%>
	            	}
	            	else{
	            		IPCheck(from);
	            	}
	            },
	            error:function(error){
	            	alert(error.responseText);
	            }
	        });
	}
	else{ //퇴근
		
		Swal.fire({
			  title: '퇴근처리하시겠습니까?',
// 			  text: text,
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: '확인',
			  cancelButtonText: '취소',
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					$.ajax({
			        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
			            type:'get',
			            success:function(success){
			            	if(success=='얼굴인식'){
		 	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'안면인식','750','600');
		 	            	}
		 	            	else{
		 	            		IPCheck(from,true);
		 	            	}
			            },
			            error:function(error){
			            	alert(error.responseText);
			            }
			        });
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					callCancel(canTitle,canText);
			 	}
			});
		
		
		
		
		/* confirm커스텀 주기전 코드 */
		<%-- if(confirm('퇴근처리하시겠습니까?')){
			$.ajax({
	        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
	            type:'get',
	            success:function(success){
	            	if(success=='얼굴인식'){
 	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'안면인식','750','600');
 	            	}
 	            	else{
 	            		IPCheck(from,true);
 	            	}
	            },
	            error:function(error){
	            	alert(error.responseText);
	            }
	        });
    	} --%>







	}
}
	//걍 시간
 function showTime(){
 	var today = new Date();

 	var year=today.getFullYear();

 	var month=today.getMonth()+1;

 	var day=today.getDate();

 	var week = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');
		var temp=new Date().getDay();
 	var label = week[temp];

 	var hour = today.getHours();
 	if(hour>12){hour="오후 "+(hour-12)}
 	else{hour="오전 "+hour}

 	var minute = today.getMinutes();
 	if(minute<10){minute="0"+minute;}

 	var second = today.getSeconds();
 	if(second<10){second="0"+second;}

 	var mytime = year+'년 '+month+'월 '+day+'일 '+ label+' '+ hour+':'+minute+':'+second;
 	document.getElementById('timeCheck').innerText=mytime;
 }
 setInterval("showTime()",1000);


//  if('${alert}')
// 	{
// 	 callSuccess("${alert}","");
// 		alert('${alert}');
// 	}

 var time = 1;
 var inter1;
 var inter2;

 if(!'${attend.attLeavTime}')
 {
 	if('${elapsedTime}')
     {
     	time='${elapsedTime}'*1;
     	inter1=setInterval("workTime()",1000);
      	inter2=setInterval("workTime2()",1000);
     }
 }


 //자식 메서드
 function start()
	{
 	inter1=setInterval("workTime()",1000);
  	inter2=setInterval("workTime2()",1000);
	}
 function end()
 {
 	clearInterval(inter1);
 	clearInterval(inter2);
 }


 //업무경과 시간
 function workTime2(){
     var hours = Math.floor(time / 3600 );
     var mins = Math.floor(time % 3600 / 60 );
     var secs = time % 3600 % 60;
     if (hours < 10) {
         hours = "0" + hours;
     }
     if (mins < 10) {
         mins = "0" + mins;
     }
     if (secs < 10) {
         secs = "0" + secs;
     }
     document.getElementById("elapsedTime").innerHTML = "<h2>"+hours + ":" + mins + ":" + secs+"</h2>";
 	time++;
 }

	//업무경과 Bar
 function workTime(){
 	var percent=time/32400*100; //9시간 = 32400초
 	document.getElementById('workBar').style.width=percent+"%";
 	//$('#workBar').width(percent+"%");
 }


 </script>



			<!-- 마진을 위한 div -->
			<div style="height: 0px;"></div>

			<div class="row">
				<!-- 마이페이지 좌측 컨텐츠 -->
				<div class="col-lg-3">
					<div class="flex-column" style="height: 255px;">
						<div class="card bg-gradient-info" style="margin-bottom: -2px;">

							<div class="card-body box-profile" style="padding: 0.8em;">
								<div class="text-center">
									<img id="main_photo" class="profile-user-img img-fluid img-circle bg-light" style="object-fit: cover; width: 100px; height: 100px;" src="" alt="User profile picture" onerror="this.src='<%=request.getContextPath()%>/resources/images/01.jpg'">
									<%-- height: 128px;" src="<%=request.getContextPath() %>/resources/images/01.jpg" alt="User profile picture"> --%>
								</div>

							</div>
							<!-- /.card-body -->
							<div class="card-footer bg-transparent" style="padding: 0em 0.5em 0.5em 0.5em;">
								<h6 class="profile-username text-center" style="margin: 0; font-size: 1.1em;">${loginUser.empName }&nbsp;${loginUser.positionValue }</h6>
								<p class="text-center" style="margin: 0; font-size: 0.9em;">${loginUser.groupValue }&nbsp;${loginUser.teamValue }</p>
							</div>
							<!-- /.card-footer -->
						</div>
						<!-- / .card -->


						<!-- 근태관리 card -->
						<div class="card card-info card-outline">
							<div class="card-body">
								<span id="timeCheck" class="text-muted text-truncate" style="font-size: 0.96em;"> </span>
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item">

										<div id="elapsedTime">
											<c:if test="${!empty attend.attTotalWorkTimeSt}">
												<h3>${attend.attTotalWorkTimeSt.substring(11) }</h3>
											</c:if>
											<c:if test="${empty attend.attLeavTime }">
												<c:if test="${temporaryTime ne null }">
													<h3>${temporaryTime }</h3>
												</c:if>
												<c:if test="${temporaryTime eq null }">
													<h3>00:00:00</h3>
												</c:if>
											</c:if>
										</div>


										<div class="progress">
											<div id="workBar" class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
												<span class="sr-only">0% Complete (success)</span>
											</div>
										</div>
									</li>
									<li class="list-group-item" style="padding-left: 10px; padding-right: 10px;">
										<div class="row" style="justify-content: space-between;">
											<span>출근시간 :</span><span id="attTime" class="attTime">${attend.attTimeSt eq null ? '미등록' : attend.attTimeSt.substring(11) }</span>
										</div>
										<div class="row" style="justify-content: space-between;">
											<span>퇴근시간 :</span><span id="leaveTime" class="attLeavTime">${attend.attLeavTimeSt eq null ? '미등록' : attend.attLeavTimeSt.substring(11)}</span>
										</div>
									</li>
									<li class="list-group-item" id="attLeav"><c:choose>
											<%-- <c:when test="${empty attend || attend eq null}"> --%>
											<c:when test="${checkAttend eq 'N'}">
												<a id="attBtn" href="javascript:homeCheck('A');" class="btn btn-outline-primary btn-block">
													<b>출근하기</b>
												</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<%-- <c:when test="${empty attend.attLeavTimeSt || attend.attLeavTimeSt eq null}"> --%>
													<c:when test="${checkAttend eq 'Y' && checkLeave eq 'N'}">
														<a id="attBtn" href="javascript:homeCheck('B');" class="btn btn-outline-primary btn-block">
															<b>퇴근하기</b>
														</a>
													</c:when>
													<c:otherwise>
														<a id="attBtn" href="#" class="btn btn-outline-primary btn-block">
															<b>업무완료</b>
														</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose> <%-- <c:if test="${attend.attTime ne null && attend.attLeavTime ne null}"> --%></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card 근태관리-->

						<!-- 일정 card -->
						<div class="card card-info card-outline">
							<div class="card-header" style="padding: 7px 15px;">
				                  <div style="padding:4px; display: inline-block;">
				                    <i class="far fa-calendar-alt"></i>
				                   	<p style="font-size: 1.0em; margin: 0px; display: inline-block;">개인일정</p>
				                  </div>
				                  <div class="float-right">
				                    <div class="btn-group">
				                      <a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/scheduler/list.do`" aria-selected="false">
										  <i class="fas fa-plus text-secondary"></i>
									  </a>
				                    </div>
				                    <!-- /.btn-group -->
				                  </div>
				                  <!-- /.float-right -->
				                </div>
							<div class="card-body" style="height: 210px; padding: 0px 13px 10px 13px;">
								<!-- <div style="padding: 4px; height: 32px;">
									<i class="far fa-calendar-alt"></i>
									<p style="font-size: 1.0em; margin: 0px; display: inline-block;">일정</p>
									<hr>
								</div> -->
								<div>
									<div class="card-body" style="padding: 0px; padding-bottom: 1em;">
										<table class="table table-sm table-hover" style="font-size: 0.8em;">
											<colgroup>
												<col width="20%">
												<col width="80%">
<%-- 												<col width="40%"> --%>
											</colgroup>
											<thead>
												<tr>
													<th class="text-center text-truncate">중요</th>
													<th class="text-center text-truncate">제목</th>
<!-- 													<th class="text-center text-truncate">내용</th> -->
												</tr>
											</thead>
										</table>
										<div style="overflow: auto; height: 250px;">
											<table class="table table-sm table-hover" style="font-size: 0.8em;">
												<colgroup>
													<col width="20%">
													<col width="80%">
<%-- 													<col width="40%"> --%>
												</colgroup>
												<tbody style="font-size: 0.9em;">
													<c:if test="${!empty schedulerList}">
														<c:forEach items="${schedulerList}" var="scheduler">
															<tr onclick="schedulerDetail('${scheduler.scdCode}');" style="cursor: pointer;">
																<td class="text-center text-truncate"><c:if test="${scheduler.scdImport eq 'Y'}">
																		<i class="fas fa-exclamation" style="color: red;"></i>
																	</c:if> <c:if test="${scheduler.scdImport eq 'N'}">

																	</c:if></td>
																<td class="text-left"><div style="width: 190px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${scheduler.scdTitle}</div></td>
<%-- 																<td class="text-left"><div style="width: 85px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${scheduler.scdContent }</div></td> --%>
															</tr>
														</c:forEach>
													</c:if>
													<c:if test="${empty schedulerList}">
														<tr class="text-center">
															<td colspan="3">오늘 일정이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.일정 card-->
					</div>
				</div>
				<!-- /.마이페이지 좌측 컨텐츠 -->

				<!-- 마이페이지 우측 컨텐츠 -->
				<div class="col-lg-9">
					<!-- compressed list -->
					<div class="row">
						<!-- left-list -->
						<!-- 전자결재 리스트 -->
						<div class="col-lg-6">
							<div class="card card-info card-outline card-outline-tabs" style="height:385px;">
								<div class="card-header p-0 border-bottom-0">
									<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist" style="display: flex; justify-content: space-between;">
										<li>
											<ul class="nav">
											<li class="nav-item">
												<a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-apvwait" role="tab" aria-controls="custom-tabs-four-wait" aria-selected="true" style="font-size:0.9em;">기안문서</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-apvwork" role="tab" aria-controls="custom-tabs-four-work" aria-selected="false" style="font-size:0.9em;">결재문서</a>
											</li>
											</ul>
										</li>
										<li class="nav-item" >
											<a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/approval/request/list.do`" aria-selected="false"><i class="fas fa-plus text-secondary"></i></a>
										</li>
									</ul>
								</div>
								<div class="card-body" style="padding: 5px 5px;overflow: hidden;">
									<div class="tab-content" id="custom-tabs-four-tabContent">
										<!-- 기안문서 -->
										<div class="tab-pane fade active show" id="custom-tabs-four-apvwait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
											<!-- 내부 table card -->
											<div>
												<!-- /.card-header -->
													<div class="card-body p-0">
														<table class="table table-sm table-hover" style="font-size:0.8em;">
															<colgroup>
																<col width="5%">
																<col width="38%">
																<col width="23%">
																<%-- <col width="10%"> --%>
																<col width="24%">
															 </colgroup>
															<thead>
																<tr>
																	<th class="text-center text-truncate"></th>
																	<!-- <th class="text-center" style="width:17%;">양식명</th> -->
																	<th class="text-center text-truncate">제목</th>
																	<!-- <th class="text-center text-truncate">기안일</th> -->
																	<th class="text-center text-truncate">결재상태</th>
																	<th class="text-center text-truncate">현결재자</th>
																</tr>
															</thead>
														 </table>
														 <div style="overflow: auto;height: 300px;">
														 <table class="table table-sm table-hover" style="font-size:0.8em;">
															<colgroup>
																<col width="5%">
																<col width="33%">
																<col width="23%">
																<%-- <col width="10%"> --%>
																<col width="24%">
															</colgroup>
															<tbody style="font-size: 0.9em;">
															<c:choose>
																<c:when test="${empty apvReqList}">
																	<tr>
																		<td colspan="6" class="text-center">기안한 문서가 없습니다.</td>
																	</tr>
																</c:when>
																<c:otherwise>

																	<c:forEach items="${apvReqList}" var="apv">
																		<tr class="text-truncate">
																			<!-- 긴급,중요여부 -->
																			<c:if test="${apv.apvEmergency eq 'Y'}">
																				<td class="text-center emergency">
																					<span class="badge bg-danger">긴급</span>
																				</td>
																			</c:if>
																			<c:if test="${apv.apvImportance eq 'Y'}">
																				<td class="text-center importance">
																					<span class="badge bg-primary">중요</span>
																				</td>
																			</c:if>
																			<c:if test="${apv.apvImportance ne 'Y' && apv.apvEmergency eq 'N'}">
																				<td class="text-center importance">
																				</td>
																			</c:if>
																			<!-- 양식명 -->
																			<%-- <td class="text-center apvFormName">${apv.apvForm.apvFormName}</td> --%>
																			<!-- 제목 -->
																			<c:if test="${!empty apv.apvTitle}">
																				<td onclick="requestDetail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 130px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvTitle}</div></td>
																			</c:if>
																			<c:if test="${empty apv.apvTitle}">
																				<td onclick="requestDetail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 130px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvForm.apvFormName} 신청</div></td>
																			</c:if>
																			<!-- 기안일 -->
																			<%-- <td class="text-center apvDraftDt"><fmt:formatDate value="${apv.apvDraftDt}" pattern="MM월 dd일"/>(<fmt:formatDate value="${apv.apvDraftDt}" pattern="E"/>) </td> --%>
																			<!-- 기안상태 -->
																			<td class="text-center">${apv.stateValue }</td>
																			<!-- 현결재자 -->
																			<td class="text-center">${apv.nowEmp.empName }&nbsp;${apv.nowEmp.positionValue }</td>
																		</tr>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
															</tbody>
														</table>
														</div>
													</div>
												<!-- /.card-body -->
											</div>
											<!-- / .내부 table card -->
										</div>
										<!-- 결재문서 -->
										<div class="tab-pane fade" id="custom-tabs-four-apvwork" role="tabpanel" aria-labelledby="custom-tabs-four-work-tab">
											<!-- 내부 table card -->
											<div>
												<!-- /.card-header -->
												<div class="card-body p-0">
													<table class="table table-sm table-hover" style="font-size:0.8em;">
														<thead>
															<tr>
																<th class="text-center text-truncate" style="width:5%;"></th>
																<!-- <th class="text-center" style="width:17%;">양식명</th> -->
																<th class="text-center text-truncate" style="width:40%;">제목</th>
																<th class="text-center text-truncate" style="width:16%;">기안자</th>
																<th class="text-center text-truncate" style="width:19%;">결재기한</th>
																<th class="text-center text-truncate" style="width:20%;">현결재자</th>
															</tr>
														</thead>
														<tbody style="font-size: 0.9em;">
														<c:choose>
															<c:when test="${empty apvList}">
																<tr>
																	<td colspan="6" class="text-center">결재할 문서가 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>

																<c:forEach items="${apvList}" var="apv">
																	<tr class="text-truncate">
																		<!-- 긴급,중요여부 -->
																		<c:if test="${apv.apvEmergency eq 'Y'}">
																			<td class="text-center emergency" style="padding-left: 8px;">
																				<span class="badge bg-danger">긴급</span>
																			</td>
																		</c:if>
																		<c:if test="${apv.apvImportance eq 'Y'}">
																			<td class="text-center importance" style="padding-left: 8px;">
																				<span class="badge bg-primary">중요</span>
																			</td>
																		</c:if>
																		<c:if test="${apv.apvImportance ne 'Y' && apv.apvEmergency eq 'N'}">
																			<td class="text-center importance" style="padding-left: 8px;">
																			</td>
																		</c:if>
																		<!-- 양식명 -->
																		<%-- <td class="text-center apvFormName">${apv.apvForm.apvFormName}</td> --%>
																		<!-- 제목 -->
																		<c:if test="${!empty apv.apvTitle}">
																			<td onclick="detail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 155px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvTitle}</div></td>
																		</c:if>
																		<c:if test="${empty apv.apvTitle}">
																			<td onclick="detail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 155px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvForm.apvFormName} 신청</div></td>
																		</c:if>
																		<!-- 기안자 -->
																		<td class="text-center">${apv.dratfEmp.empName }&nbsp;${apv.dratfEmp.positionValue }</td>
																		<!-- 결재기한 -->
																		<td class="text-center apvDraftDt"><fmt:formatDate value="${apv.apvEndDt}" pattern="MM월 dd일"/>(<fmt:formatDate value="${apv.apvEndDt}" pattern="E"/>) </td>
																		<!-- 현결재자 -->
																		<td class="text-center">${apv.nowEmp.empName }&nbsp;${apv.nowEmp.positionValue }</td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														</tbody>
													</table>
												</div>
												<!-- /.card-body -->
											</div>
											<!-- / .내부 table card -->
										</div>
									</div>
								</div>
								<!-- /.card -->
							</div>
						</div>
						<!-- ./left-list -->
						<!-- right-list -->
						<!-- 업무 리스트 -->
						<div class="col-lg-6">
							<div class="card card-info card-outline card-outline-tabs" style="height: 385px;">
								<div class="card-header p-0 border-bottom-0">
									<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist" style="display: flex; justify-content: space-between;">
										<li>
											<ul class="nav">
												<li class="nav-item">
													<a class="nav-link active" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-work" role="tab" aria-controls="custom-tabs-four-work" aria-selected="true" style="font-size:0.9em;">수신업무</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-wait" role="tab" aria-controls="custom-tabs-four-wait" aria-selected="false" style="font-size:0.9em;">요청업무</a>
												</li>
											</ul>
										<li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/job/myJobTabs.do`" aria-selected="false">
												<i class="fas fa-plus text-secondary"></i>
											</a>
										</li>
									</ul>
								</div>
								<div class="card-body" style="padding: 5px 5px;">
									<div class="tab-content" id="custom-tabs-four-tabContent">
										<div class="tab-pane fade" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
											<!-- 내부 table card -->
											<div>
												<!-- /.card-header -->
												<div class="card-body p-0 table-responsive" style="height: 100%;">
													<table class="table table-sm table-hover" style="font-size:0.8em;">
														<colgroup>
															<col width="8%">
															<col width="32%">
															<col width="15%">
															<col width="20%">
															<col width="15%">
															<col width="10%">
														</colgroup>
														<thead>
															<tr class="text-center">
																<th></th>
																<th class="text-truncate">제목</th>
																<th class="text-truncate">담당자</th>
																<th class="text-truncate">마감일</th>
																<th class="text-truncate">진척도</th>
																<th class="text-truncate">상태</th>
															</tr>
														</thead>
													  </table>
													  <div style="overflow: auto;height: 300px;">
													  <table class="table table-sm table-hover" style="font-size:0.8em;">
														<colgroup>
															<col width="8%">
															<col width="32%">
															<col width="15%">
															<col width="20%">
															<col width="15%">
															<col width="10%">
														</colgroup>
														<tbody style="font-size:0.9em;">
															<c:choose>
																<c:when test="${empty requestedAllList}">
																	<tr>
																		<td colspan="6" class="text-center">요청한 업무가 없습니다. </td>
																	</tr>
																</c:when>
																<c:otherwise>

																	<c:forEach items="${requestedAllList}" var="job">
																		<tr onclick="myRequestedJobDetail('${job.jobCode}');" style="cursor: pointer;"
																		<c:if test="${job.jobIssue eq 'Y'}"> bgcolor="#ff8a80"</c:if>>
																			<td class="text-left"><c:choose>
																					<c:when test="${ job.jobIssue eq 'Y'} ">
																						<span class="badge bg-danger">긴급</span>
																					</c:when>
																					<c:otherwise>
																						<c:if test="${ job.jobImportance eq 'Y'}">
																							<span class="badge bg-primary">중요</span>
																						</c:if>
																					</c:otherwise>
																				</c:choose></td>
																			<td class="text-left"><div style="width:110px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${job.jobTitle }</div></td>
																			<td class="text-center text-truncate"><a class="tooltipCaller" style="width: 10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title="" data-emp-name='${job.jobReceiver.empName }' data-emp-telephone='${job.jobReceiver.empTelephone }' data-emp-email='${job.jobReceiver.empEmail }' data-position-value='${job.jobReceiver.positionValue }' data-team-value='${job.jobReceiver.teamValue }' data-group-value='${job.jobReceiver.groupValue }' data-attach-savename='${job.jobReceiver.attachSavename }'> ${job.jobReceiver.empName}&nbsp;${job.jobReceiver.positionValue} </a></td>
																			<td class="text-center text-truncate"><fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" /></td>
																			<td class="text-center">
																				<div class="progress progress-xs" style="margin-top: 6px;">
																					<div class="progress-bar progress-bar-danger" style="width: ${job.jobProgress}%"></div>
																				</div>
																			</td>
																			<td class="text-center">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${job.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
	<c:when test="${job.jobStatus eq '완료'}">
																<span class="badge bg-secondary">완료</span>
	</c:when>
	<c:otherwise>
	<c:if test="${job.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${job.jobDenied eq 'N'}">
			<c:choose>
				<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
				</c:when>
				<c:otherwise>
																	<c:if test="${job.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${job.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:otherwise>
</c:choose>
																			</td>
																		</tr>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
														</tbody>
													</table>
													</div>
												</div>
												<!-- /.card-body -->
											</div>
											<!-- / .내부 table card -->
										</div>
										<div class="tab-pane fade active show" id="custom-tabs-four-work" role="tabpanel" aria-labelledby="custom-tabs-four-work-tab">
											<!-- 내부 table card -->
											<div>
												<!-- /.card-header -->
												<div class="card-body p-0 table-responsive" style="height: 100%;">
													<table class="table table-sm table-hover" style="font-size:0.8em;">
														<colgroup>
															<col width="8%">
															<col width="32%">
															<col width="20%">
															<col width="15%">
															<col width="15%">
															<col width="10%">
														</colgroup>
														<thead style="border-top: none;">
															<tr class="text-center">
																<th></th>
																<th class="text-truncate">제목</th>
																<th class="text-truncate">요청자</th>
																<th class="text-truncate">요청일</th>
																<th class="text-truncate">마감일</th>
																<th class="text-truncate">상태</th>

															</tr>
														</thead>
													  </table>
													  <div style="overflow: auto;height: 300px;">
													  <table class="table table-sm table-head-fixed table-hover" style="font-size:0.8em;">
														<colgroup>
															<col width="8%">
															<col width="32%">
															<col width="20%">
															<col width="15%">
															<col width="15%">
															<col width="10%">
														</colgroup>
														<tbody style="font-size:0.9em;">
															<c:choose>
																<c:when test="${empty receivedAllList}">
																	<tr>
																		<td colspan="6" class="text-center">요청한 업무가 없습니다.</td>
																	</tr>
																</c:when>
																<c:otherwise>
																	<c:forEach items="${receivedAllList}" var="job">
																		<tr onclick="myReceivedJobDetail('${job.jobCode}');" style="cursor: pointer;"
																		<c:if test="${job.jobIssue eq 'Y'}"> bgcolor="#ff8a80"</c:if>>
																			<td class="text-center" style="padding-left: 10px;"><c:choose>
																					<c:when test="${ job.jobIssue eq 'Y'} ">
																						<span class="badge bg-danger">긴급</span>
																					</c:when>
																					<c:otherwise>
																						<c:if test="${ job.jobImportance eq 'Y'}">
																							<span class="badge bg-primary">중요</span>
																						</c:if>
																					</c:otherwise>
																				</c:choose></td>
																			<td class="text-left"><div style="width:110px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${job.jobTitle }</div></td>
																			<td class="text-center text-truncate"><a class="tooltipCaller" style="width: 10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title="" data-emp-name='${job.jobRequester.empName }' data-emp-telephone='${job.jobRequester.empTelephone }' data-emp-email='${job.jobRequester.empEmail }' data-position-value='${job.jobRequester.positionValue }' data-team-value='${job.jobRequester.teamValue }' data-group-value='${job.jobRequester.groupValue }' data-attach-savename='${job.jobRequester.attachSavename }'> ${job.jobRequester.empName}&nbsp;${job.jobRequester.positionValue} </a></td>
																			<td class="text-center text-truncate" style="font-size:0.8em;"><fmt:formatDate value="${job.jobRequestDt}" pattern="yyyy-MM-dd(E)" /></td>
																			<td class="text-center text-truncate" style="font-size:0.8em; "><fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" /></td>
																			<td class="text-center" style="padding-right: 10px;">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${job.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
	<c:when test="${job.jobStatus eq '완료'}">
																<span class="badge bg-secondary">완료</span>
	</c:when>
	<c:otherwise>
	<c:if test="${job.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${job.jobDenied eq 'N'}">
			<c:choose>
				<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
				</c:when>
				<c:otherwise>
																	<c:if test="${job.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${job.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:otherwise>
</c:choose>
																				</td>
																		</tr>
																	</c:forEach>
																</c:otherwise>
															</c:choose>


														</tbody>
													</table>
													</div>
												</div>
												<!-- /.card-body -->
											</div>
											<!-- / .내부 table card -->
										</div>

									</div>
								</div>
								<!-- /.card -->
							</div>
						</div>
						<!-- ./right-list -->
					</div>
					<!-- ./row -->
					<!-- ./compressed list -->

					<!-- row -->
					<div class="row">
						<!-- 최근생성된 보고서 list -->
						<div class="col-lg-6">
							<div class="card card-info card-outline" style="height: 340px;">
				                <div class="card-header" style="padding: 7px 15px;">
				                  <div style="padding:4px; display: inline-block;">
				                    <i class="fas fa-edit"></i>
				                   	<p style="font-size: 1.0em; margin: 0px; display: inline-block;">최근 생성된 보고서</p>
				                  </div>
				                  <div class="float-right">
				                    <div class="btn-group">
				                      <a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/report/teamReport/list.do`" aria-selected="false">
										  <i class="fas fa-plus text-secondary"></i>
									  </a>
				                    </div>
				                    <!-- /.btn-group -->
				                  </div>
				                  <!-- /.float-right -->
				                </div>
				                <div class="card-body" style="padding-top:0.3em; padding-bottom:1em;">
				                  <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
										<col width="25%">
										<col width="35%">
										<col width="20%">
										<col width="20%">
									</colgroup>
				                    <thead>
				                      <tr>
				                        <th class="text-center text-truncate">보고서</th>
				                        <th class="text-center text-truncate">제목</th>
				                        <th class="text-center text-truncate">부서</th>
				                        <th class="text-center text-truncate">보고자</th>
				                      </tr>
				                    </thead>
				                  </table>
				                  <div style="overflow: auto;height: 250px;">
				                  <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
										<col width="25%">
										<col width="35%">
										<col width="20%">
										<col width="20%">
									</colgroup>
				                    <tbody style="font-size: 0.9em;">
				                     <c:choose>
										<c:when test="${empty reportDocList}">
											<tr>
												<td colspan="5" class="text-center">최근 생성된 보고서가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>

											<c:forEach items="${reportDocList}" var="report">
												<tr onclick="myReportDetail('${report.reportDocCode}')" style="cursor: pointer;">
													<!-- 보고서 -->
													<td class="text-center text-truncate">${report.reportTitle}</td>
													<!-- 제목 -->
													<td style="cursor: pointer;" class="text-left text-truncate"><div style="width: 145px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${report.reportDocTitle}</div></td>
													<%-- <td class="text-left text-truncate">${report.reportDocTitle}</td> --%>
													<!-- 부서 -->
													<td class="text-center text-truncate">${report.reportDocWriterInfo.teamValue}</td>
													<!-- 보고자 -->
													<td class="text-center text-truncate">${report.reportDocWriterInfo.empName}&nbsp;${report.reportDocWriterInfo.positionValue }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
				                    </tbody>
				                  </table>
				                  </div>
				                </div>
				                <!-- /.card-body -->
				              </div>
				              <!-- /.card -->
						</div>

						<!-- 안읽은 메일 list -->
						<div class="col-lg-6">
							<div class="card card-info card-outline" style="height: 340px;">
				                <div class="card-header" style="padding: 7px 15px;">
				                  <div style="padding:4px; display: inline-block;">
				                    <i class="fas fa-envelope"></i>
				                   	<p style="font-size: 1.0em; margin: 0px; display: inline-block;">읽지 않은 메일</p>
				                  </div>
				                  <div class="float-right">
				                    <div class="btn-group">
				                      <a class="nav-link" href="<%=request.getContextPath() %>/mail/list?kindOfMail=notRead" aria-selected="false">
										  <i class="fas fa-plus text-secondary"></i>
									  </a>
				                    </div>
				                    <!-- /.btn-group -->
				                  </div>
				                  <!-- /.float-right -->
				                </div>
				                <div class="card-body" style="padding-top:0.3em; padding-bottom:1em;">
				                  <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
										<col width="10%">
										<col width="25%">
										<col width="40%">
										<col width="25%">
									</colgroup>
				                    <thead>
				                      <tr>
				                        <th class="text-center text-truncate"></th>
										<th class="text-center text-truncate">수신일</th>
										<th class="text-center text-truncate">제목</th>
										<th class="text-center text-truncate">보낸 사람</th>
				                      </tr>
				                    </thead>
				                  </table>
				                  <div style="overflow: auto;height: 250px;">
				                  <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
										<col width="10%">
										<col width="25%">
										<col width="40%">
										<col width="25%">
									</colgroup>
				                    <tbody style="font-size: 0.9em;">
				                    	<c:if test="${!empty mailList}">
											<c:forEach items="${mailList}" var="mail">
												<tr onclick="mailDetail('${mail.mailCode}','recieved');" style="cursor: pointer;">
													<td class="text-center text-truncate">
														<c:if test="${mail.mailImportance eq 'Y'}">
															<i class="fas fa-star text-warning"></i>
														</c:if>
														<c:if test="${mail.mailImportance eq 'N'}">
															<i class="far fa-star"></i>
														</c:if>
													</td>
													<td class="text-center text-truncate" style="font-size:0.8em;">
														<fmt:formatDate value="${mail.mailDate}" pattern="YYYY년 MM월 dd일" />
													</td>
													<td class="text-truncate">
														<div style="width: 155px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${mail.mailTitle}</div>
													</td>
													<td class="text-center text-truncate">
														${mail.mailFromEmp.empName}&nbsp;${mail.mailFromEmp.positionValue}
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty mailList}">
											<tr class="text-center">
												<td colspan="4">안읽은 메일이 없습니다.</td>
											</tr>
										</c:if>
				                    </tbody>
				                  </table>
				                  </div>
				                </div>
				                <!-- /.card-body -->
				              </div>
				              <!-- /.card -->
						</div>
						<!-- ./list -->
					</div>
					<!-- ./row -->
				</div>
				<!-- /.마이페이지 우측 컨텐츠 -->


				<!-- /.card -->
				<!-- 마이페이지 공지사항 -->
				<div class="col-lg-12">
					<!-- row -->
					<div class="row">
						<!-- 사내 공지게시판 -->
						<div class="col-lg-6">
							<!-- 검색줄-->
							<div class="card card-info card-outline" style="height: 370px;">
				                <div class="card-header" style="padding: 7px 15px;">
				                  <div style="padding:4px; display: inline-block;">
				                    <i class="fas fa-bullhorn"></i>
										<p style="font-size: 1.0em; margin: 0px; display: inline-block;">사내공지</p>
				                  </div>
				                  <div class="float-right">
				                    <div class="btn-group">
				                      <a class="nav-link" href="<%=request.getContextPath() %>/notice/list.do" aria-selected="false">
										  <i class="fas fa-plus text-secondary"></i>
									  </a>
				                    </div>
				                    <!-- /.btn-group -->
				                  </div>
				                  <!-- /.float-right -->
				                </div>
				                <div class="card-body" style="padding-top:0.3em; padding-bottom:1em;">
				                  <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
				                  		<col width="10%">
										<col width="35%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
									</colgroup>
				                    <thead>
				                      <tr>
				                        <th></th>
										<th class="text-center text-truncate">제목</th>
										<th class="text-center text-truncate">첨부파일</th>
										<th class="text-center text-truncate">작성자</th>
										<th class="text-center text-truncate">작성일</th>
										<th class="text-center text-truncate">조회수</th>
				                      </tr>
				                    </thead>
				                    <tbody style="font-size: 0.9em;">
										<c:forEach items="${noticeMap.noticeImpList}" var="notice">
											<tr onclick="noticeDetail('${notice.noticeCode}')" style="cursor: pointer;">
												<td class="text-center"><span class="badge bg-danger">필독</span></td>
												<td class="text-left"><div style="width: 190px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">&nbsp;${notice.noticeTitle}</div></td>
												<c:if test="${!empty notice.attachList}">
												<td class="text-center text-truncate"><i class="fas fa-paperclip"></i></td>
												</c:if>
												<c:if test="${empty notice.attachList}">
													<td class="text-center text-truncate"></td>
												</c:if>
												<td class="text-center text-truncate">${notice.writerEmp.empName}&nbsp;${notice.writerEmp.positionValue}</td>
												<td class="text-center text-truncate" style="font-size: 0.8em;"><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${notice.noticeDate}" pattern="E"/>)</td>
												<td class="text-center text-truncate">${notice.noticeViewcnt}</td>
											</tr>
										</c:forEach>
				                    </tbody>
				                  </table>
				                </div>
				                <!-- /.card-body -->
				              </div>
							<!-- card -->
						</div>
						<!-- ./ 공지게시판 -->
						<!-- 부서 공지게시판 -->
						<div class="col-lg-6">
						<div class="card card-info card-outline" style="height: 370px;">
				                <div class="card-header" style="padding: 7px 15px;">
				                  <div style="padding:4px; display: inline-block;">
				                    <i class="fas fa-thumbtack"></i>
									<p style="font-size: 1.0em; margin: 0px; display: inline-block;">부서공지</p>
				                  </div>
				                  <div class="float-right">
				                    <div class="btn-group">
				                      <a class="nav-link" href="<%=request.getContextPath() %>/teamNotice/list.do" aria-selected="false">
										  <i class="fas fa-plus text-secondary"></i>
									  </a>
				                    </div>
				                    <!-- /.btn-group -->
				                  </div>
				                  <!-- /.float-right -->
				                </div>
				                <div class="card-body" style="padding-top:0.3em; padding-bottom:1em;">
				                   <table class="table table-sm table-hover" style="font-size:0.8em;">
				                  	<colgroup>
				                  		<col width="10%">
										<col width="35%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
									</colgroup>
				                    <thead>
				                      <tr>
				                        <th></th>
										<th class="text-center text-truncate">제목</th>
										<th class="text-center text-truncate">첨부파일</th>
										<th class="text-center text-truncate">작성자</th>
										<th class="text-center text-truncate">작성일</th>
										<th class="text-center text-truncate">조회수</th>
				                      </tr>
				                    </thead>
				                    <tbody style="font-size: 0.9em;">
										<c:forEach items="${teamNoticeMap.teamNoticeImptList}" var="teamNotice">
											<tr onclick="teamNoticeDetail('${teamNotice.teamNoticeCode}')" style="cursor: pointer;">
												<td class="text-center"><span class="badge bg-danger">필독</span></td>
												<td class="text-left"><div style="width: 190px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">&nbsp;${teamNotice.teamNoticeTitle}</div></td>
												<c:if test="${!empty teamNotice.attachList}">
												<td class="text-center"><i class="fas fa-paperclip"></i></td>
												</c:if>
												<c:if test="${empty teamNotice.attachList}">
													<td class="text-center"></td>
												</c:if>
												<td class="text-center text-truncate">${teamNotice.teamNoticeEmp.empName}&nbsp;${teamNotice.teamNoticeEmp.positionValue}</td>
												<td class="text-center text-truncate" style="font-size: 0.8em;"><fmt:formatDate value="${teamNotice.teamNoticeDate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${teamNotice.teamNoticeDate}" pattern="E"/>)</td>
												<td class="text-center text-truncate">${teamNotice.teamNoticeViewcnt}</td>
											</tr>
										</c:forEach>
				                    </tbody>
				                  </table>
				                </div>
				                <!-- /.card-body -->
				              </div>
							<!-- card -->
						</div>
						<!-- ./ 공지게시판 -->
					</div>
					<!-- ./row -->

				</div>
				<!-- /.마이페이지 공지사항 -->
			</div>


			<!-- 마진을 위한 div -->
			<div style="height: 10px;"></div>



		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
<script>
function mailDetail(code,kindOfmail) {
	location.href = "<%=request.getContextPath()%>/mail/detail.do?mailCode="+code + "&kindOfMail=" + kindOfmail;
}
function teamNoticeDetail(teamNoticeCode) {
	OpenWindow("<%=request.getContextPath()%>/teamNotice/detail.do?teamNoticeCode=" + teamNoticeCode,'부서공지 상세','800','800');
}
function noticeDetail(noticeCode) {
	OpenWindow("<%=request.getContextPath()%>/notice/detail.do?noticeCode="+noticeCode,'사내공지 상세','800','800');
}
function schedulerDetail(scdCode){
	OpenWindow("<%=request.getContextPath()%>/scheduler/detail.do?scdCode="+scdCode,'개인일정 상세','600','550');
}
</script>
</body>