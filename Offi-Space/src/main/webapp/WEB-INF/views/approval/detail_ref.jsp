<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="btn-group"></div>
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
							<a class="mailbox-attachment-name" href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}">
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
		var apvway;

		/* $('input').prop('readonly',true); */
		$('.apv-input').prop('disabled',true);
		$('.apv-textarea').prop('disabled',true);
		$('.apv-process-modal-content').prop('disabled',true);

		let textareaNode = document.querySelectorAll('.apv-textarea');
		if(textareaNode != null){
			textareaNode.forEach(input=>{
				if(textareaNode == null){
					input.value = "";
				}else{
					text = input.getAttribute('data-textarea');
					input.value = text;
				}
			})
		};

		$('#apvMarkupDiv').ready(function() {
        	$('input[name="approvalCode"]').attr('value',"${approval.apvCode}");
		});




	}

	</script>

</body>
