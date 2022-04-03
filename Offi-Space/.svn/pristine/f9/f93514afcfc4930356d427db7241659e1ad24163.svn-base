<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>보고서 관리</title>
<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>보고서 관리 </h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">보고서 관리 </li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">

				<!-- 마진을 위한 div -->
				<div style="height: 0px;"></div>

				<!-- compressed list -->
				<div class="row">


					<div class="col-lg-12">
						<div class="card card-info card-outline">
							<div class="card-header p-0 border-bottom-0"></div>
							<div class="card-body">
								<!-- 내부 card -->
								<div class="">
									<div class="card-header">
										<h3 class="card-title">보고서 관리 </h3>
										<div class="card-tools">
										<button type="button" class="btn btn-outline-info btn-sm msg-modal" data-toggle="modal" data-target="#modal-registerReport">
											보고서 생성 </button>
										<button type="button" class="btn btn-outline-secondary btn-sm msg-modal" onclick="openModifyModal();">
											보고서 관리 </button>
										</div>
									</div>
									<!-- /.card-header -->
									<div class="card-body text-center" style="padding-bottom: 0;">
										<table class="table table-sm">
										<colgroup>
											<col width="5%">
											<col width="10%">
											<col width="10%">
											<col width="20%">
											<col width="30%">
										</colgroup>
											<thead>
												<tr style="text-align: center;">
													<th>
														<button type="button" class="btn btn-default btn-md checkbox-toggle">
																<i class="far fa-square"></i>
														</button>
													</th>
													<th>보고서 코드</th>
													<th>보고유형 </th>
													<th>보고서</th>
													<th>상세설명</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="item" items="${reportList}">
													<tr onclick="selectReportcode(this);">
														<td style="text-align: center;">
															<input type="checkbox" name="checkSelect"
															data-report-code='${item.reportCode}'
															data-report-title='${item.reportTitle}'
															data-report-detail='${item.reportDetail}'
															data-report-open='${item.reportOpen}'
															data-report-type='${item.reportType}'
															data-report-day='<c:forEach var="reportDay" items="${item.reportDay}">/${reportDay}</c:forEach>'
															data-report-markup='${item.reportMarkup}'
															class="checkSelect" style="margin: 5px;">
														</td>
														<td style="text-align: center;">${item.reportCode }</td>
														<td style="text-align: center;">
														<c:if test="${item.reportType eq 'I'}">수시 보고서</c:if>
														<c:if test="${item.reportType eq 'D'}">일간 보고서</c:if>
														<c:if test="${item.reportType eq 'W'}">주간 보고서</c:if>
														<c:if test="${item.reportType eq 'M'}">월간 보고서</c:if>
														</td>
														<td >${item.reportTitle}</td>
														<td>${item.reportDetail}</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /. 내부 card -->
							</div>
						</div>
						<!-- /.card -->

					</div>

				</div>
				<!-- ./row -->
				<!-- ./compressed list -->


			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>

<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
<script>
let registerMarkupRadio = "";
let modifyMarkupRadio = "";
document.addEventListener('DOMContentLoaded', ()=>{

	summernote_go($('textarea#reportMarkup'), 300);
	summernote_go($('textarea#motifyReportMarkup'), 300);

	let registerReportForm = document.querySelector('#registerReportForm');
	let modifyReportForm =  document.querySelector('#modifyReportForm');

	registerReportForm.querySelectorAll('input[name="reportType"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(   event.currentTarget.value == "R"
	 			||event.currentTarget.value == "D"
	 			||event.currentTarget.value == "W"
	 			||event.currentTarget.value == "M"){
	 			registerReportForm.querySelector('.regularReportBox').style.display="";
			}else{
				registerReportForm.querySelector('.regularReportBox').style.display="none";
			}
		})
	})
	registerReportForm.querySelectorAll('input[name="markup"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(event.currentTarget.value == "Y"){
	 			registerReportForm.querySelector('.markupFormBox').style.display="";
	 			registerMarkupRadio = event.currentTarget.value;
			}else{
				registerReportForm.querySelector('.markupFormBox').style.display="none";
				registerMarkupRadio = event.currentTarget.value;
			}
		})
	})
	modifyReportForm.querySelectorAll('input[name="reportType"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(   event.currentTarget.value == "R"
	 			||event.currentTarget.value == "D"
	 			||event.currentTarget.value == "W"
	 			||event.currentTarget.value == "M"){
	 			modifyReportForm.querySelector('.regularReportBox').style.display="";
			}else{
				modifyReportForm.querySelector('.regularReportBox').style.display="none";
			}
		})
	})
	modifyReportForm.querySelectorAll('input[name="markup"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(event.currentTarget.value == "Y"){
	 			modifyReportForm.querySelector('.markupFormBox').style.display="";
	 			modifyMarkupRadio = event.currentTarget.value;
			}else{
				modifyReportForm.querySelector('.markupFormBox').style.display="none";
				modifyMarkupRadio = event.currentTarget.value;
			}
		})
	})

})

const registerReport = () => {


	let reportTitle = registerReportForm.querySelector('#reportTitle').value;
	let reportDetailInput = registerReportForm.querySelector('#reportDetail').value;
	let reportDetail = reportDetailInput.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	let reportManager = '${loginUser.empCode}';
	let reportOpen = "Y";
	let reportType ="";
	let reportMarkup = registerReportForm.querySelector('#reportMarkup').value;

	if(registerReportForm.querySelector('#reportOpen').checked){
		reportOpen = "N";
	}
	registerReportForm.querySelectorAll('.reportType').forEach(radio=>{
		if(radio.checked == true){
			reportType = radio.value;
		}
	});
	let reportDay = new Array();
	if (reportType == "D"||reportType == "W" || reportType == "M"){
		registerReportForm.querySelectorAll('.reportDay').forEach(checkbox=>{
			if(checkbox.checked == true){
				reportDay.push(checkbox.value);

			}
		});
	}


	if( reportTitle == null || reportTitle == ""){
		callCustomAlert("보고 생성","보고의 제목을 입력하세요.","warning");
		return;
	}
	if( reportType == null || reportType == ""){
		callCustomAlert("보고 생성","보고 유형을 선택하세요.","warning");
		return;
	}
	if( reportType == "R"){
		callCustomAlert("보고 생성","정기 보고 유형을 선택하세요.","warning");
		return;
	}
	if( !reportType == "I"&& reportDay.length == 0){
		callCustomAlert("보고 생성","정기 보고 요일을 선택하세요.","warning");
		return;
	}
	if(registerMarkupRadio == null || registerMarkupRadio == ""){
		callCustomAlert("보고 생성","보고서 양식 사용여부를 선택하세요.","warning");
		return;
	}

	 let formData = {
			"reportTitle"  : reportTitle,
			"reportDetail"   : reportDetail,
			"reportManager": reportManager,
			"reportType"  : reportType,
			"reportMarkup"   : reportMarkup,
			"reportDay": reportDay,
			"reportOpen": reportOpen}

	Swal.fire({
		  title: "보고 생성",
		  text:  "새로운 보고를 생성하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '생성',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('registerReport',{
					method:'POST',
					headers:{
						'Content-Type':'application/json',
					},
					body: JSON.stringify(formData),
				})
				.then(data => {
					console.log('Success:', data);
					formReset();
					Swal.fire({
						  title: "보고 생성 완료",
						  text: "보고 생성 완료하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							$('#modal-registerReport').modal('hide');
							location.reload();
						});
				})
				.catch((error) => {
					console.log('Error:', error);
					callFail();
				});
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("보고 생성","업무 생성을 취소하였습니다.");
		 	}
		});
}

const formReset = () =>{

};

const selectReportcode = element =>{
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			check.click();
		}
	})
	let selected = element.querySelector('.checkSelect');
	selected.click();

};

const openModifyModal=()=>{
	let checkedNumber = 0;
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			checkedNumber++;
		}
	})
	if(checkedNumber == 1){
		$('#modal-modifyReport').modal('show');
		let selected;
		document.querySelectorAll('.checkselect').forEach(check=>{
			if(check.checked == true){
				selected = check;
			}
		})

		modifyReportForm.querySelector('input[name="reportCode"]').value = selected.dataset.reportCode;
		modifyReportForm.querySelector('input[name="reportTitle"]').value = selected.dataset.reportTitle;
		modifyReportForm.querySelector('textarea[name="reportDetail"]').value = selected.dataset.reportDetail;

		if(selected.dataset.reportOpen == 'N'){
			modifyReportForm.querySelector('#reportOpen').click();
		}

		let reportType = selected.dataset.reportType;
		if(reportType == 'I'){
			modifyReportForm.querySelector('.type'+reportType).click();
		}else{
			modifyReportForm.querySelector('.typeR').click();
			modifyReportForm.querySelector('.type'+reportType).click();
			let reportDays = selected.dataset.reportDay;
			let reportDay = reportDays.split("/");
			for (var i = 1 ; i< reportDay.length; i++){
				modifyReportForm.querySelector('.day'+reportDay[i]).click();
			}
		}

		if(selected.dataset.reportMarkup != undefined){
			modifyMarkupRadio = "Y";
			modifyReportForm.querySelector('.markupY').click();
			$('textarea#motifyReportMarkup').summernote('code',selected.dataset.reportMarkup);
		}else{
			modifyMarkupRadio = "N";
			modifyReportForm.querySelector('.markupN').click();
		}

	}else{
		callCustomAlert("보고서 관리","관리하실 보고서를 선택해주세요.","warning");
	}
}

const modifyReport = () => {

	let reportCode = modifyReportForm.querySelector('input[name="reportCode"]').value;
	let reportTitle = modifyReportForm.querySelector('input[name="reportTitle"]').value;
	let reportDetailInput = modifyReportForm.querySelector('textarea[name="reportDetail"]').value;
	let reportDetail = reportDetailInput.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	let reportManager = '${loginUser.empCode}';
	let reportOpen = "Y";
	let reportType ="";
	let reportMarkup = modifyReportForm.querySelector('#motifyReportMarkup').value;

	if(modifyReportForm.querySelector('#reportOpen').checked){
		reportOpen = "N";
	}
	modifyReportForm.querySelectorAll('.reportType').forEach(radio=>{
		if(radio.checked == true){
			reportType = radio.value;
		}
	});
	let reportDay = new Array();
	if (reportType == "D"||reportType == "W" || reportType == "M"){
		modifyReportForm.querySelectorAll('.reportDay').forEach(checkbox=>{
			if(checkbox.checked == true){
				reportDay.push(checkbox.value);
			}
		});
	}

	if( reportTitle == null || reportTitle == ""){
		callCustomAlert("보고 수정","보고의 제목을 입력하세요.","warning");
		return;
	}
	if( reportType == null || reportType == ""){
		callCustomAlert("보고 수정","보고 유형을 선택하세요.","warning");
		return;
	}
	if( reportType == "R"){
		callCustomAlert("보고 수정","정기 보고 유형을 선택하세요.","warning");
		return;
	}
	if( !reportType == "I" && reportDay.length == 0){
		callCustomAlert("보고 수정","정기 보고 요일을 선택하세요.","warning");
		return;
	}
	if(modifyMarkupRadio == null || modifyMarkupRadio == ""){
		callCustomAlert("보고 수정","보고서 양식 사용여부를 선택하세요.","warning");
		return;
	}

	let formData = {"reportCode"  : reportCode,
					"reportTitle"  : reportTitle,
					"reportDetail"   : reportDetail,
					"reportManager": reportManager,
					"reportType"  : reportType,
					"reportMarkup"   : reportMarkup,
					"reportDay": reportDay,
					"reportOpen": reportOpen}

	Swal.fire({
		  title: "보고 수정",
		  text:  "선택하신 보고를 수정하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '수정',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('modifyReportFromManage',{
					method:'POST',
					headers:{
						'Content-Type':'application/json',
					},
					body: JSON.stringify(formData),
				})
				.then(data => {
					console.log('Success:', data);
					formReset();
					Swal.fire({
						  title: "보고 수정 완료",
						  text: "보고 수정 완료하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							$('#modal-modifyReport').modal('hide');
							location.reload();
						});
				})
				.catch((error) => {
					console.log('Error:', error);
				});
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("보고 수정","보고 수정 취소하였습니다.");
		 	}
		});
}

//시연을 위한 자동입력
const autoInput = () => {
	document.querySelector('#modal-registerReport').querySelector('input[name="reportTitle"]').value = '주간 회의록 ';
	document.querySelector('#modal-registerReport').querySelector('textarea[name="reportDetail"]').value = '주간 회의 내용과 그 결정사항을 기록합니다.';
	
	let markup = `<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 1px;"><colgroup><col width="310"><col width="490"></colgroup><tbody><tr><td colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 0px currentcolor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: middle; padding: 0px !important;">회의록</td></tr><tr><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: currentcolor; color: black; font-size: 12px; vertical-align: top; padding: 0px !important;"><table style="border: 1px solid rgb(0, 0, 0); font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 1px;"><colgroup><col width="90"><col width="220"></colgroup><tbody><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">문서번호</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle;"><br></td></tr><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">회의일자</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle;"><br></td></tr><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">작성자</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle;"><br></td></tr></tbody></table></td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: currentcolor; text-align: right; color: black; font-size: 12px; vertical-align: top; padding: 0px !important;">[결재선]</td></tr></tbody></table><table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px;"><colgroup><col width="160"><col width="190"><col width="450"></colgroup><tbody></tbody></table><table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px;"><colgroup><col width="140"><col width="660"></colgroup><tbody><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">제목</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"><br></td></tr><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">참석자</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"><br></td></tr><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">회의 목적</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"><br></td></tr><tr><td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">회의 내용</td><td style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"><br></td></tr></tbody></table>`;
	$('textarea#reportMarkup').summernote('code', markup);
}

</script>
	<div class="modal fade" id="modal-registerReport" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <form id="registerReportForm">
	            <div class="modal-header">
	              <h4 class="modal-title" onclick="autoInput();">보고 생성</h4>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">×</span>
	              </button>
	            </div>
	            <div class="modal-body">
		            <div class="card card-info card-outline">
						<!-- /.card-header -->
						<!-- form start -->
						<div class="form-horizontal">
							<div class="card-body">
								<div class="form-group row">
									<label for="reportTitle" class="col-sm-2 col-form-label">제목 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="reportTitle" id="reportTitle"
											placeholder="제목을 입력하세요.">
									</div>
								</div>
								<div class="form-group row">
									<label for="reportDetail" class="col-sm-2 col-form-label">설명 </label>
									<div class="col-sm-10">
									<textarea rows="" cols=""  class="form-control" name="reportDetail" id="reportDetail" placeholder="설명을 입력하세요"></textarea>
									</div>
								</div>
								<div class="form-group row">
								<label for="reportOpen" class="col-sm-2 col-form-label">비공개 설정 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input type="checkbox" class="form-check-input" id="reportOpen" value="N">
											<label class="form-check-label" for="reportOpen"> 비공개 </label>
										</div>
									</div>
								</div>
								<div class="border-bottom" style="margin-bottom:22px;"></div>

								<div class="form-group row">
									<label for="reportManager" class="col-sm-2 col-form-label">운영자 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="reportManager" value="${loginUser.empName} &nbsp; ${loginUser.positionValue}" readOnly >
									</div>
								</div>
								<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">유형 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
											<input class="form-check-input reportType" type="radio" value="R" name="reportType">
											<label class="form-check-label">정기 보고서 </label>
										</div>
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input class="form-check-input reportType" type="radio" name="reportType" value="I">
											<label class="form-check-label">수시 보고서 </label>
										</div>
										<div class="regularReportBox" style="display:none;">
								            <div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
												<input class="form-check-input reportType" type="radio" name="regularReportType" value="D">
												<label class="form-check-label">일일 보고서 </label>
											</div>
											<div class="form-check"
													style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
												<input class="form-check-input reportType" type="radio" name="regularReportType" value="W">
												<label class="form-check-label">주간 보고서 </label>
											</div>
											<div class="form-check"
													style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
												<input class="form-check-input reportType" type="radio" name="regularReportType" value="M">
												<label class="form-check-label">월간 보고서 </label>
											</div>
											<div role="regular-reporting-selector-box">
									            <div role="weekly-reporting-selector-box">
													<div class="border-bottom" style="margin-top:5px; margin-bottom: 10px;"></div>
										            <div class="row">
										            	<div class="form-group">
									                        <select class="custom-select" style="width:50px;">
									                          <option selected="selected">1</option>
									                          <option>2</option>
									                          <option>3</option>
									                          <option>4</option>
									                        </select>
									                        <label style="margin-right:22px;">주 마다 </label>
									                      </div>
									                      <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px; ">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="0">
															<label class="form-check-label" for="exampleCheck2" >일  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px; ">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="1">
															<label class="form-check-label" for="exampleCheck2"> 월 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="2">
															<label class="form-check-label" for="exampleCheck2"> 화 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="3" >
															<label class="form-check-label" for="exampleCheck2"> 수  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="4">
															<label class="form-check-label" for="exampleCheck2"> 목  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="5">
															<label class="form-check-label" for="exampleCheck2"> 금 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay" name="reportDay" value="6">
															<label class="form-check-label" for="exampleCheck2"> 토  </label>
														</div>

											        </div>
									            </div>
									        </div>
										</div>
									</div>
								</div>

								<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">보고양식 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
											<input class="form-check-input" type="radio" name="markup" value="N">
											<label class="form-check-label">사용하지 않음 </label>
										</div>
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input class="form-check-input" type="radio" name="markup" value="Y">
											<label class="form-check-label">사용함 </label>
										</div>
									</div>
									<div class="col-sm-12 markupFormBox" style="display:none;">
										<div class="border-bottom" style="margin-top:5px; margin-bottom: 10px;"></div>
										<textarea id="reportMarkup" name="reportMarkup" style="height: 300px; display: none;"></textarea>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>

	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal" onclick="formReset();">취소</button>
	              <button type="button" onclick="registerReport();" class="btn btn-info">등록</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>


	<div class="modal fade" id="modal-modifyReport" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <form id="modifyReportForm">
                <input type="hidden" name="reportCode">
	            <div class="modal-header">
	              <h4 class="modal-title">보고 관리</h4>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">×</span>
	              </button>
	            </div>
	            <div class="modal-body">
		            <div class="card card-info card-outline">
						<!-- /.card-header -->
						<!-- form start -->
						<div class="form-horizontal">
							<div class="card-body">
								<div class="form-group row">
									<label for="reportTitle" class="col-sm-2 col-form-label">제목 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="reportTitle" id="reportTitle"
											placeholder="제목을 입력하세요.">
									</div>
								</div>
								<div class="form-group row">
									<label for="reportDetail" class="col-sm-2 col-form-label">설명 </label>
									<div class="col-sm-10">
									<textarea rows="" cols=""  class="form-control" name="reportDetail" id="reportDetail" placeholder="설명을 입력하세요"></textarea>
									</div>
								</div>
								<div class="form-group row">
								<label for="reportOpen" class="col-sm-2 col-form-label">비공개 설정 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input type="checkbox" class="form-check-input" id="reportOpen" value="N">
											<label class="form-check-label" for="reportOpen"> 비공개 </label>
										</div>
									</div>
								</div>
								<div class="border-bottom" style="margin-bottom:22px;"></div>

								<div class="form-group row">
									<label for="reportManager" class="col-sm-2 col-form-label">운영자 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="reportManager" value="${loginUser.empName} &nbsp; ${loginUser.positionValue}" readOnly >
									</div>
								</div>
								<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">유형 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
											<input class="form-check-input reportType typeR" type="radio" value="R" name="reportType" >
											<label class="form-check-label">정기 보고서 </label>
										</div>
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input class="form-check-input reportType typeI" type="radio" name="reportType" value="I" >
											<label class="form-check-label">수시 보고서 </label>
										</div>
										<div class="regularReportBox" style="display:none;">
								            <div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
												<input class="form-check-input reportType typeD" type="radio" name="regularReportType" value="D" >
												<label class="form-check-label">일일 보고서 </label>
											</div>
											<div class="form-check"
													style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
												<input class="form-check-input reportType typeW" type="radio" name="regularReportType" value="W" >
												<label class="form-check-label">주간 보고서 </label>
											</div>
											<div class="form-check"
													style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
												<input class="form-check-input reportType typeM" type="radio" name="regularReportType" value="M" >
												<label class="form-check-label">월간 보고서 </label>
											</div>
											<div role="regular-reporting-selector-box">
									            <div role="weekly-reporting-selector-box">
													<div class="border-bottom" style="margin-top:5px; margin-bottom: 10px;"></div>
										            <div class="row">
										            	<div class="form-group">
									                        <select class="custom-select" style="width:50px;">
									                          <option selected="selected">1</option>
									                          <option>2</option>
									                          <option>3</option>
									                          <option>4</option>
									                        </select>
									                        <label style="margin-right:22px;">주 마다 </label>
									                      </div>
									                      <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px; ">
															<input type="checkbox" class="form-check-input reportDay day0" name="reportDay" value="0">
															<label class="form-check-label" for="exampleCheck2" >일  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px; ">
															<input type="checkbox" class="form-check-input reportDay day1" name="reportDay" value="1">
															<label class="form-check-label" for="exampleCheck2"> 월 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay day2" name="reportDay" value="2">
															<label class="form-check-label" for="exampleCheck2"> 화 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay day3" name="reportDay" value="3" >
															<label class="form-check-label" for="exampleCheck2"> 수  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay day4" name="reportDay" value="4">
															<label class="form-check-label" for="exampleCheck2"> 목  </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay day5" name="reportDay" value="5">
															<label class="form-check-label" for="exampleCheck2"> 금 </label>
														</div>
														 <div class="form-check"
														style="padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
															<input type="checkbox" class="form-check-input reportDay day6" name="reportDay" value="6">
															<label class="form-check-label" for="exampleCheck2"> 토  </label>
														</div>

											        </div>
									            </div>
									        </div>
										</div>
									</div>
								</div>

								<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">보고양식 </label>
									<div class="col-sm-10">
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px); margin-right:22px;">
											<input class="form-check-input markupN" type="radio" name="markup" value="N">
											<label class="form-check-label">사용하지 않음 </label>
										</div>
										<div class="form-check"
												style="display:inline; padding-top: calc(0.375rem + 1px); padding-bottom: calc(0.375rem + 1px);">
											<input class="form-check-input markupY" type="radio" name="markup"  value="Y">
											<label class="form-check-label">사용함 </label>
										</div>
									</div>
									<div class="col-sm-12 markupFormBox" style="display:none;">
										<div class="border-bottom" style="margin-top:5px; margin-bottom: 10px;"></div>
										<textarea id="motifyReportMarkup" name="reportMarkup" style="height: 300px; display: none;"></textarea>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>

	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal" onclick="formReset();">취소</button>
	              <button type="button" onclick="modifyReport();" class="btn btn-info">등록</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>





</body>
