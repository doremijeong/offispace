<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="date"/>
<fmt:formatDate value="${now}" pattern="E" var="day" />
<c:set var="yyyy" value="${fn:substring(date,0,4)}"/>
<c:set var="MM" value="${fn:substring(date,5,7)}"/>
<c:set var="dd" value="${fn:substring(date,8,10)}"/>


<head>
<style>
.report-input{
	border: none;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
<input type="hidden" name="reportCode" />
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
	    	<div class="row mb-2">
	        	<div class="col-sm-6">
	           		<h5 style="margin: 0px;" onclick="autoInput();">보고하기</h5>
	          	</div>
	          	<div class="col-sm-6">
	            	<ol class="breadcrumb float-sm-right">
	              		<li class="breadcrumb-item"><a href="#">Home</a></li>
	              		<li class="breadcrumb-item active">보고서</li>
	            	</ol>
	          	</div>
	        </div>
	     </div><!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">

	<!-- Default box -->
		<div class="card">
	    	<div class="card-header">
				<div class="row  justify-content-end">
			  		<div style="margin-right: 5px;">
						<button type="button" class="btn btn-block btn-default">미리보기</button>
					</div>
					<div style="margin-right: 5px;">
						<button type="button" class="btn btn-block btn-default" onclick="report_form_modal_show()">양식선택</button>
					</div>
					<div style="margin-right: 5px;">
						<button type="button" class="btn btn-block btn-default" onclick="regist_report_doc('temp')">임시저장</button>
					</div>
			  		<div style="margin-right: 5px;">
			  			<button type="button" class="btn btn-block btn-info" onclick="regist_report_doc('report')">보고하기</button>
			  		</div>
			  	</div>
	        </div>
	        <div class="card-body">
				<div class="table-responsive">
					<table class="table table-sm table-bordered">
						<colgroup>
							<col style="width: 15%; background-color: lightgray;">
							<col style="width: 35%;">
							<col style="width: 15%; background-color: lightgray;">
							<col style="width: 35%;">
						</colgroup>

						<tbody>
							<tr>
								<td style="text-align: right; font-weight: bold;">보고자&nbsp;</td>
								<td>${loginUser.empName}&nbsp;&nbsp;${loginUser.positionValue}</td>
								<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
								<td>${loginUser.groupValue}&nbsp;&nbsp;${loginUser.teamValue}</td>
							</tr>
							<tr>
								<td style="text-align: right; font-weight: bold;">보고일&nbsp;</td>
								<td >${yyyy}년 ${MM}월 ${dd}일</td>
								<td style="text-align: right; font-weight: bold;">운영자&nbsp;</td>
								<td class="reportManager"></td>
							</tr>
							<tr>
								<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
								<td colspan="3">
									<input type="text" name="reportDocTitle" style="height: 100%; width: 100%; border: #ddd;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		        <div>
		        	<textarea id="content" rows="" cols=""></textarea>
		        </div>
	        </div>

<!-- 	        <div class="card-body show-form-div report-doc-html" style="margin: auto;">
	        </div> -->
	        <!-- /.card-body -->
	     </div>
	     <!-- /.card -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>

<script>
window.onload = function() {
	summernote_go($('textarea#content'), 500);

	if('${from}'=="main"){		
		let reportCode = '${regularReport.reportCode}';
		showReport(reportCode);

	}else if ('${from}'=="menu"){
		$('#report-form').modal('show');
    }

}
/* window.onload End */


//보고서 가져오기
const getReport = reportCode => {
	return new Promise(resolve => {
		fetch(`<%=request.getContextPath()%>/report/getReport?searchType=reportCode&keyword=`+reportCode)
		.then(response => response.json())
		.then(data => {
			resolve(data);
		});
	})
}

function report_form_modal_show(){
	$('#report-form').modal('show');
}

//보고서 가져오기 반영
const showReport = reportCode => {
	$('#report-form').modal('hide');
	getReport(reportCode).then(data=>{
		console.log(data);
		$('textarea#content').summernote('code', data.report.reportMarkup);
		document.querySelector('.reportManager').innerHTML = data.report.reportManagerName+" "+data.report.reportManagerPosition;
		document.querySelector('input[name="reportCode"]').value= data.report.reportCode;
	})
}


//일일계획보고서 화면 출력
function showRegularForm(reportCode){
	return new Promise(resolve => {
					fetch('<%=request.getContextPath()%>/report/showReportForm?reportCode='+reportCode)
					.then(response => response.json())
    				.then(data => {
    					resolve(data);
    				});
    			})
}


//수시보고서 양식 선택 시 화면에 출력
function show_form(reportCode){
	document.querySelector('input[name="reportCodeToRegister"]').value = reportCode;
	$('#report-form').modal('hide');

	const form = document.querySelector('.show-form-div');
  	showRegularForm(reportCode).then(data=>{
   	$('textarea#content').summernote('code', data.reportMarkup);
   })
}


//보고서 등록
function regist_report_doc(param){
	let reportDocTitle = document.querySelector('input[name="reportDocTitle"]').value;
	let reportDocHtml = document.querySelector('#content').value;
	let reportCode = document.querySelector('input[name="reportCode"]').value

	if (reportDocTitle == null || reportDocTitle == ""){
		callCustomAlert("보고서 등록","보고서 제목을 입력하세요. ","warning");
		return;
	}
	if (reportDocHtml == null || reportDocHtml == ""){
		callCustomAlert("보고서 등록","보고서를 양식에 맞게 입력하세요. ","warning");
		return;
	}
	if (reportCode == null || reportCode == ""){
		callCustomAlert("보고서 등록","보고서 유형을 선택하세요. ","warning");
		return;
	}

	var data = {"reportDocTitle" : reportDocTitle,
				"reportDocMarkup" : reportDocHtml,
				"reportCode" : reportCode}


	Swal.fire({
		  title: "보고서 등록",
		  text:  "보고서를 등록 하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '등록',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {

				$.ajax({
					url : "registReportDoc?param=" + param,
					type : "post",
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function() {
						if(param=='report'){

							Swal.fire({
								  title: '보고서가 등록되었습니다.',
								  icon: 'info',
								  confirmButtonText: '확인',
								  reverseButtons: false
								})
								.then((result) => {
										location.href = '<%=request.getContextPath()%>/report/myReport/list.do';
								});

						}else{

							Swal.fire({
							  title: '보고서가 임시저장되었습니다.',
							  icon: 'info',
							  confirmButtonText: '확인',
							  reverseButtons: false
							})
							.then((result) => {
								location.href = '<%=request.getContextPath()%>/report/tempReport/list.do';
							});

						}
					},
					error : function(xhr) {
						callFail();
					}
				});

			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("보고서 등록","보고서 등록을  취소하였습니다.");
		 	}
		});
}

//시연을 위한 자동입력
const autoInput = ()=> {
	console.log('au');
	document.querySelector('input[name="reportDocTitle"]').value = "금일 일일업무계획을 보고합니다.";	
	let reportMarkup = `
		<table class="__se_tbl" style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><!-- Header --> 
			<tbody>
				<tr>
					<td style="width:300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						일일 업무 계획 보고서
					</td>
				</tr>
				<tr>
					<td style="width:300px; border: 0; padding: 0 !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						
						
						
					</td>
					<td style="text-align: right; padding: 0px!important; border: 0!important; vertical-align: top !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

					</td>
				</tr>
			</tbody>
		</table>

		<br>

		<table style="width: 800px; margin-top:10px; border-collapse: collapse !important; color: #000; background: #fff; font-size: 12px; border: 0; font-family: malgun gothic,dotum,arial,tahoma;">
			<colgroup> 
				<col width="10%"> 
				<col width="50%"> 
				<col width="10%"> 
				<col width="20%"> 
		 </colgroup> 
		 
		 <tbody>
			 <tr>
				 <td colspan="4" style="padding: 3px; height: 20px;  vertical-align: middle" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					 
		1. 주간업무목표
				 </td>
			 </tr>
			 <tr>
				 <td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
					분류
				 </td>
				 <td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
					목표
			 	</td>
			 	<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
					진척도(%)
		 		</td>
		 		<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
					비고
				</td>
				</tr><tr style="height: 130px;">
					<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; text-align: center;">
						주간 <br> 업무 목표
					</td>
					<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">&lt;산출물 작성&gt;</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.1 수행계획서 수정사항 업데이트</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.2 요구사항정의목록 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.3 단위업무정의목록 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.4 유스케이스 다이어그램 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.5 용어사전 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.6 자료사전 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.7 메뉴구조도 작성</span><br style="font-family: Verdana, sans-serif;"><span style="font-family: Verdana, sans-serif;">1.8 프로세스흐름도 작성</span></p></td>
					<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">&lt;산출물 작성&gt;</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.1 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.2 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.3 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.4 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.5 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.6 100%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.7 50%</span><br style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.8 50%</span></p></td>
					<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><br></td>	
				</tr>
				 
				 
		 </tbody>
		</table>


		<table style="width: 800px; margin-top:10px; border-collapse: collapse !important; color: #000; background: #fff; font-size: 12px; border: 0; font-family: malgun gothic,dotum,arial,tahoma;">
			<colgroup> 
					<col width="11%"> 
					<col width="35%"> 
					<col width="35%"> 
					<col width="19%"> 
			 </colgroup> 
			 
		 <tbody>
			 <tr>
				 <td colspan="4" style="padding: 3px; height: 20px; vertical-align: middle" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					 
		2. 금일업무 계획 및 진행현황
				 </td>
			 </tr>
			 <tr>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 분류
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 오전
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 오후
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 비고
			 </td>
			 </tr><tr style="height: 200px;">
				 <td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle;  text-align: center;">
					금일 <br> 업무 계획
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;">1.7 메뉴구조도 작성</span></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;">- 메뉴 구조도 작성 최종본 작성</span></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;">- 메뉴 구조도, 김혜윤 대리에게 송부</span></p></td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;">1.8 프로세스흐름도 작성</span></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;">- 프로세스 흐름도 최종본 전송</span></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif;"><br></span></p></td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><br></td>	
			 </tr>
			 <tr style="height: 200px;">
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle;  text-align: center;">
					금일 <br> 진행 현황
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.7 메뉴구조도 작성</span></p><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">- 메뉴 구조도 작성 최종본 작성 - 완료</span></p><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">- 메뉴 구조도, 김혜윤 대리에게 송부&nbsp;</span>&nbsp;- 완료</p></td>	
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">1.8 프로세스흐름도 작성 -&nbsp;</span>&nbsp;완료</p><p><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);">- 프로세스 흐름도 최종본 전송 -&nbsp;</span>&nbsp;완료</p><div><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51);"><br></span></div></td>	
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><br></td>
			</tr>



		 </tbody>
		</table>


		<table style="width: 800px; margin-top:10px; border-collapse: collapse !important; color: #000; background: #fff; font-size: 12px; border: 0; font-family: malgun gothic,dotum,arial,tahoma;">

				<colgroup> 
					<col width="11%"> 
					<col width="35%"> 
					<col width="35%"> 
					<col width="19%">  
				 </colgroup> 

		 
		 <tbody>
			 <tr>
				 <td colspan="4" style="padding: 3px; height: 20px; vertical-align: middle" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					 
		3. 익일예정사항
				 </td>
			 </tr>
			 <tr>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 분류
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 오전
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 오후
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle; background: #ddd; text-align: center">			 
				 비고
			 </td>
			 </tr><tr style="height: 130px;">
				 <td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle;  text-align: center;">
					익일  <br>업무 계획
				</td>
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle">차주 고객사와의 미팅 프레젠테이션 작성</td>	
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle">프레젠테이션 자료 송부</td>	
				<td style="padding: 3px; height: 20px; border: 1px solid #000; vertical-align: middle"><br></td>		
			 </tr>
		 </tbody>
		</table>
`
	$('textarea#content').summernote('code', reportMarkup);
}

</script>

<%@ include file="/WEB-INF/views/report/reportModal.jsp"%>
</body>