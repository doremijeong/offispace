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
						<h1>재기안</h1>
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
								<button type="button" class="btn btn-block btn-info" onclick="open_line_set()">결재선지정</button>
							</div>
							<div>
								<button type="button" class="btn btn-block btn-danger" onclick="again_go()">재요청</button>
							</div>
						</div>
					</div>
				</div>
				<form action="modifyApv.do" name="registerForm" enctype="multipart/form-data" method="post">
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

					<input type="hidden" id="cnt" value="${apv.apvForm.apvFormCnt}"/>
					<input type="hidden" id="cntH" value="${apv.apvForm.apvFormCntH}"/>

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

					<div class="card-body" style="margin: auto;" id="approvalFormDiv">
						${apv.apvMarkup}
					</div>
					<!-- /.card-body -->
				</form>
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
					<div id="formMarkUp" ></div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<div>
						<button type="button" class="btn btn-danger" onclick="again_go()">재요청</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<script>
		window.onload = function() {
			 // 임시보관함에서 수정하러 왔을때 중요도랑 긴급 기본값 주기
            if('${apv.apvEmergency}' == 'Y'){
				$('#emergency').attr('checked', true);
            }
			if('${apv.apvImportance}' == 'Y'){
				$('#emergency').attr('checked', true);
            }

			for (var i = 0; i < ${apv.apvForm.apvFormCnt}; i++) {
				$('#f_apline_sign_' + i).empty();
			}
			for (var i = 0; i < ${apv.apvForm.apvFormCntH}; i++) {
				$('#h_apline_sign_' + i).empty();
			}

			$('.apv-input').prop('disabled',false);
			$('.apv-textarea').prop('disabled',false);
			$('.apv-process-modal-content').prop('disabled',false);

			  //타자 칠 때마다 input value에 값 입력
            $('#approvalFormDiv').on('keyup', 'input', function() {
        		var inputText = $(this).val();
        		$(this).attr('value',inputText);
        	});

         	//타자 칠 때마다 textarea value에 값 입력
            $('#approvalFormDiv').on('keyup', 'textarea', function() {
        		var textareaText = $(this).val();
        		$(this).attr('data-textarea',textareaText);
        	});

            //타자 칠때마다 input칸 늘어나게
            $('#approvalFormDiv').on('keydown', 'input', function() {
        		$(this).attr('size', $(this).val().length * 2);
        	});

            // date타입 오늘날짜부터 선택하도록 최소값 주기
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1; // 1월이면 0을 반환해서 +1 해주기
            var day = today.getDate();

            // 10보다 작을 경우 '0' 붙여주기
            if(month<10){
            	month='0'+month
            }
            if(day<10){
            	day='0'+day
            }

            var minDate = year + "-" + month + "-" + day; // 2022-01-27 형태로 만들기

            $('input#apvEndDt').attr('min',minDate); // min속성 주기


		}

		function again_go() {
			var input = $('<input>').attr({'type' : 'hidden','name' : 'apvTemporary', 'value' : 'N'});
			$('form[name="registerForm"]').append(input);

			var markUp = $('#approvalFormDiv').html();
			var title = $('.approval-title').val();

			var markUpInput = $('<input>').attr({'type' : 'hidden','name' : 'apvMarkUp', 'value' : markUp});
			$('form[name="registerForm"]').append(markUpInput);

			var titleInput = $('<input>').attr({'type' : 'hidden','name' : 'apvTitle', 'value' : title});
			$('form[name="registerForm"]').append(titleInput);

			$('form[name="registerForm"]').submit();
		}
	</script>
</body>



