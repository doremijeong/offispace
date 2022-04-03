<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="date" />
<fmt:formatDate value="${now}" pattern="E" var="day" />
<c:set var="yyyy" value="${fn:substring(date,0,4)}" />
<c:set var="MM" value="${fn:substring(date,5,7)}" />
<c:set var="dd" value="${fn:substring(date,8,10)}" />

<head>
<style>
input {
	border: none;
}

textarea {
	border: none;
}
</style>
</head>
<body>
	<div class="content-wrapper" style="min-height: 1604.44px;">
		<!-- Content Header (Page header) -->
		<section class="content-header" style="padding-bottom: 0px;">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5 style="margin: 0px;" onclick="dataGo()">새결재 진행</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">Home</a>
							</li>
							<li class="breadcrumb-item active">전자결재</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">

			<!-- Default box -->
			<div class="card">
				<div class="card-header">
					<div class="row float-left">
						<div class="form-check" style="margin-right: 20px;">
							<input type="checkbox" name="chkchk" class="form-check-input" style="margin-top: 15px;" id="emergency" onclick="check_emer(this)">
							<label class="form-check-label" for="emergency" style="margin-top: 9px;">긴급</label>
						</div>
						<div class="form-check" style="margin-right: 40px;">
							<input type="checkbox" name="chkchk" class="form-check-input" style="margin-top: 15px;" id="import" onclick="check_import(this)">
							<label class="form-check-label" for="import" style="margin-top: 9px;">중요</label>
						</div>
						<div class="row">
							<div>
								<label class="col-form-label" for="apvEndDt">결재 기한&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div>
								<input type="date" min="" class="form-control form-control-sm" id="apvEndDt" style="margin-top: 4px;" onchange="dateChange()">
							</div>
						</div>
					</div>
					<div class="card-tools row">
						<div class="d-flex justify-content-end">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default" onclick="preview()">미리보기</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default" onclick="temp_approval()">임시저장</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default" onclick="apv_form_modal_show()">양식선택</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-success" onclick="open_line_set()">결재선지정</button>
							</div>
							<div>
								<button type="button" class="btn btn-block btn-info" onclick="regist_approval()">결재요청</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 결재  insert -->
				<form action="register.do" name="registerForm" enctype="multipart/form-data" method="post">
					<!-- 결재 기한 날짜 -->
					<input type="hidden" name="apvEndDt" value="">
					<!-- 긴급여부 -->
					<input type="hidden" name="apvEmergency" id="apvEmergency" value="N">
					<!-- 중요여부 -->
					<input type="hidden" id="apvImportance" name="apvImportance" value="N">
					<!-- 기안자 -->
					<input type="hidden" name="empCode" value="${loginUser.empCode}">
					<input type="hidden" id="cnt">
					<input type="hidden" id="cntH">
					<div class="card-body" style="margin: auto;" id="approvalFormDiv"></div>
					<div class="form-group">
						<div class="row" style="margin-left: 190px;">
							<div style="width: 80px;">
								<label for="file">첨부파일 </label>
							</div>
							<div style="width: 80px;">
								<div class="row">
									<label for="attached">
										<span class="btn btn-outline-success">
											<i class="fas fa-plus"></i>
											<span>추가</span>
										</span>
									</label>
									<input multiple="multiple" type="file" name="uploadFiles" id="attached" onchange="fileUpload();">
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="fileInput" id="preview">
										<div id="newFile"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				<!-- 재택근무 insert -->
				<form action="" name="WFHregisterForm" enctype="multipart/form-data" method="post"></form>

				<!-- 연차신청 insert -->
				<form action="" name="ANregisterForm" enctype="multipart/form-data" method="post"></form>
			</div>
			<!-- /.card -->
		</section>
		<!-- /.content -->
	</div>

	<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>

	<!-- 전자결재 관련 script function 모아둔 파일 -->
	<%@ include file="approvalFunction.jsp"%>

	<%@ include file="/WEB-INF/views/approval/approvalModal.jsp"%>
	<!-- 미리보기 모달 -->
	<div class="modal fade show" id="previewModal" aria-modal="true" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 950px; height: auto;">
				<div class="modal-header">
					<h4 class="modal-title">미리보기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="formMarkUp"></div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<div>
						<button type="button" class="btn btn-info" onclick="regist_approval">임시저장</button>
						<button type="button" class="btn btn-danger" onclick="temp_approval">결재 요청</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<script>
function dataGo() {
	$('#apvEndDt').attr('value', "2022-02-23");
	$('#emergency').attr('checked', 'checked');
	$('.apv-home-team').attr('value', "ICT개발 1팀");
	$('.apv-home-position').attr('value', "사원");
	$('.apv-home-time').attr('value', "9시 ~ 6시(12~1시 점심시간)");
	$('.apv-home-reason').attr('value', "동거가족 코로나 확진으로 인한 자가격리를 권고 받아 재택근무를 신청합니다.");
	$('.apv-home-reason').val("동거가족 코로나 확진으로 인한 자가격리를 권고 받아 재택근무를 신청합니다.");
	$('textarea.apv-home-reason').attr('data-textarea',"동거가족 코로나 확진으로 인한 자가격리를 권고 받아 재택근무를 신청합니다.");
	$('#input-date1').attr('value', "2022-02-24");
	$('#input-date2').attr('value', "2022-03-01");
	$('input[name="apvEndDt"]').val("2022-02-23");
	$('#apvEmergency').val('Y');
	console.log("데이터 입력 완료")
}
</script>
</body>



