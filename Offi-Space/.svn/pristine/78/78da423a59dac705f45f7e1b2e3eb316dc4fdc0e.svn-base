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
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>결재 수정</h1>
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
							<input type="checkbox" class="form-check-input" style="margin-top: 15px;" id="emergency" onclick="check_emer()">
							<label class="form-check-label" for="emergency" style="margin-top: 8px;">긴급</label>
						</div>
						<div class="form-check" style="margin-right: 40px;">
							<input type="checkbox" class="form-check-input" style="margin-top: 15px;" id="import" onclick="check_import()">
							<label class="form-check-label" for="import" style="margin-top: 8px;">중요</label>
						</div>
						<div class="row">
							<div>
								<label class="col-form-label" for="apvEndDt">결재 기한&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div>
								<input type="date" min="" value="<fmt:formatDate value="${apv.apvEndDt}" pattern="yyyy-MM-dd"/>" class="form-control form-control-sm" id="apvEndDt" style="margin-top: 4px;" onchange="dateChange()">
							</div>
						</div>
					</div>
					<div class="card-tools row">
						<div class="d-flex justify-content-end">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-secondary" onclick="preview()">미리보기</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-secondary" onclick="temp_approval()">임시저장</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-info" onclick="open_line_set()">결재선지정</button>
							</div>
							<div>
								<button type="button" class="btn btn-block btn-danger" onclick="regist_approval()">결재요청</button>
							</div>
						</div>
					</div>
				</div>
				<form action="register.do" name="registerForm" enctype="multipart/form-data" method="post">
					<!-- 결재 기한 날짜 -->
					<input type="hidden" name="apvEndDt" value="<fmt:formatDate value="${apv.apvEndDt}" pattern="yyyy-MM-dd"/>">
					<!-- 긴급여부 -->
					<input type="hidden" name="apvEmergency" id="apvEmergency" value="${apv.apvEmergency}">
					<!-- 중요여부 -->
					<input type="hidden" id="apvImportance" name="apvImportance" value="${apv.apvImportance}">
					<!-- 기안자 -->
					<input type="hidden" name="empCode" value="${apv.empCode}">
					<!-- 기안문 코드 -->
					<input type="hidden" name="apvCode" value="${apv.apvCode}">

					<input type="hidden" id="cnt" value="${apv.apvForm.apvFormCnt}" />
					<input type="hidden" id="cntH" value="${apv.apvForm.apvFormCntH}" />

					<c:forEach items="${apv.apvLineList}" var="apvLine">
						<c:if test="${apvLine.apvKindCode eq 'AK0001'}">
							<input type="hidden" class="line" name="fEmpCode" value="${apvLine.apvLineOrder}${apvLine.empCode}">
						</c:if>
						<c:if test="${apvLine.apvKindCode eq 'AK0002'}">
							<input type="hidden" class="line" name="hEmpCode" value="${apvLine.apvLineOrder}${apvLine.empCode}">
						</c:if>
						<c:if test="${apvLine.apvKindCode eq 'AK0003'}">
							<input type="hidden" class="line" name="rEmpCode" value="${apvLine.apvLineOrder}${apvLine.empCode}">
						</c:if>
					</c:forEach>

					<div class="card-body">
						<div style="margin: auto;" id="approvalFormDiv">${apv.apvMarkup}</div>
						<div class="row">
							<div class="col-md-1">
								<label for="file">첨부파일 </label>
							</div>
							<div class="col-md-1">
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
							<div class="fileInput" id="preview">
								<ul class="mailbox-attachments" id="fileBox">
									<c:if test="${!empty apv.attachList}">
										<c:forEach items="${apv.attachList}" var="attach">
											<li style="width: 100%; border: none;" class="attach-item ${attach.attachCode}" id="${attach.attachCode}" file-name="${attach.attachSavename}">
												<a class="mailbox-attachment-name" name="attachedFile" href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}">
													<i class="fas fa-paperclip"></i>
													${attach.attachSavename }&nbsp;&nbsp;
													<!-- 기존의 함수를 막기 위해서는 여기서 return false;를 줘야함 -->
													<button type="button" onclick="removeFile_go('${attach.attachCode}'); return false;" style="border: 0; outline: 0;" class="badge bg-red">X</button>
												</a>
											</li>
										</c:forEach>
									</c:if>
								</ul>
								<div id="newFile"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- /.card-body -->
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
						<button type="button" class="btn btn-info" onclick="regist_approval()">임시저장</button>
						<button type="button" class="btn btn-danger" onclick="temp_approval()">결재 요청</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</body>



