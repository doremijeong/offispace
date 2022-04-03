<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
#approvalTable input {
	text-align: center
}

.apv-input {
	border: none;
	background-color: white;
	color: black;
}

.apv-textarea {
	border: none;
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<section class="content">
		<div class="card card-default card-outline">
			<!-- 버튼 -->
			<div class="card-header d-flex justify-content-end">
				<div class="btn-group">
					<button class="btn btn-warning btn-sm" onclick="reason()">반려사유</button>
					<button class="btn btn-info btn-sm" onclick="againDratf()">재기안</button>
				</div>
				&nbsp;&nbsp;
				<div>
					<button type="button" class="btn btn-info btn-sm msg-modal" ${!empty approval.attachList ? '' : 'style="display : none;"' } data-toggle="modal" data-target="#file-modal">첨부파일</button>
					<button class="btn btn-default btn-sm" onclick="javascript:CloseWindow('');">닫기</button>
				</div>
			</div>
			<!-- 본문 -->
			<div class="card-body apvMarkupDiv">${approval.apvMarkup }</div>
			<!-- /.card-body -->
		</div>
	</section>

	<!-- 결재인증 모달 -->
	<div class="modal" id="reason-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>반려사유</h3>
				</div>
				<!--header-->
				<div class="modal-body" style="margin: auto;">
						<div class="col-sm-12">
							<div class="form-group row">
								<div>
									<c:if test="${empty approval.apvRefuse}">
										반려사유 없음
									</c:if>
									<c:if test="${!empty approval.apvRefuse}">
										${approval.apvRefuse}
									</c:if>
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

		<!-- 파일 모달 -->
	<div class="modal" id="file-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>첨부파일</h3>
				</div>
				<!--header-->
				<div class="modal-body" style="margin: auto;">
					<c:forEach items="${approval.attachList}" var="attach">
						<p>
							<a class="mailbox-attachment-name"  href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}"  >
							<i class="fas fa-paperclip"></i>${attach.attachSavename}&nbsp;&nbsp;
							</a>
						</p>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	window.onload = function(){

	}

	// 반려사유 보여주는 모달 보여주는 애
	function reason() {
		$('#reason-modal').modal('show');
	}

	// 재기안 하는 함수
	function againDratf() {
		window.opener.location.href = "<%=request.getContextPath()%>/approval/dratfAgain.do?apvCode=${approval.apvCode}";
		window.close();
	}
	</script>

</body>
