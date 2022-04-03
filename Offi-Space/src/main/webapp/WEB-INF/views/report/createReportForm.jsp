<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title></title>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5><i class="fas fa-edit"></i>&nbsp;보고서 추가</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">보고서 추가</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="card card-info card-outline">
					<!-- /.card-header -->
					<!-- form start -->
					<form class="form-horizontal">
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
									<div class="markupFormBox" style="display:none;">
										<div class="border-bottom" style="margin-top:5px; margin-bottom: 10px;"></div>
										<textarea id="reportMarkup" name="reportMarkup" style="height: 300px; display: none;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<button onclick="registerReport()" class="btn btn-info">생성</button>
						</div>
						<!-- /.card-footer -->
					</form>
				</div>
			</div>
		</section>
	</div>
	
<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>	
<script>
document.addEventListener('DOMContentLoaded', ()=>{
	
	summernote_go($('textarea#reportMarkup'), 300);
	
	document.querySelectorAll('input[name="reportType"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(   event.currentTarget.value == "R"
	 			||event.currentTarget.value == "D"
	 			||event.currentTarget.value == "W"
	 			||event.currentTarget.value == "M"){
				document.querySelector('.regularReportBox').style.display="";
			}else{
				document.querySelector('.regularReportBox').style.display="none";
			}
		})	
	})
	document.querySelectorAll('input[name="markup"]').forEach( radio =>{
		radio.addEventListener('click',(event)=>{
	 		if(event.currentTarget.value == "Y"){
				document.querySelector('.markupFormBox').style.display="";
			}else{
				document.querySelector('.markupFormBox').style.display="none";
			}
		})	
	})
	
})

const registerReport = () => {
	let reportTitle = document.querySelector('#reportTitle').value;
	let reportDetail = document.querySelector('#reportDetail').value;
	let reportManager = '${loginUser.empCode}';
	let reportOpen = "Y";
	let reportType ="";
	let reportMarkup = document.querySelector('#reportMarkup').value;

	if(document.querySelector('#reportOpen').checked){
		reportOpen = "N";
	}
	document.querySelectorAll('.reportType').forEach(radio=>{
		if(radio.checked == true){
			reportType = radio.value;
		}
	});
	let reportDay = new Array();
	if (reportType == "D"||reportType == "W" || reportType == "M"){
		document.querySelectorAll('.reportDay').forEach(checkbox=>{
			if(checkbox.checked == true){
				reportDay.push(checkbox.value);
			}
		});
	}
	
	let formData = new FormData();
	formData.append("reportTitle",reportTitle);
	formData.append("reportDetail",reportDetail);
	formData.append("reportManager",reportManager);
	formData.append("reportType",reportType);
	formData.append("reportMarkup",reportMarkup);
	formData.append("reportDay",reportDay);
	formData.append("reportOpen",reportOpen);
	
	fetch('registerReport',{
		method:'POST',
		headers:{},
		body: formData,
	})
	.then(data => {
		console.log('Success:', data);
	})
	.catch((error) => {
		console.log('Error:', error);
	});

}
</script>	


