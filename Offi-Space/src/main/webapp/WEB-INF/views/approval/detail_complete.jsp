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
				<div class="btn-group">
					<button id="savePdfBtn" class="btn btn-danger btn-sm">PDF다운로드</button>
				</div>
				</div>
				&nbsp;&nbsp;
				<div>
					<button type="button" class="btn btn-info btn-sm msg-modal" ${!empty approval.attachList ? '' : 'style="display : none;"' } data-toggle="modal" data-target="#file-modal">첨부파일</button>
					<button class="btn btn-default btn-sm" onclick="javascript:CloseWindow('');">닫기</button>
				</div>
			</div>
			<!-- 본문 -->
			<div id="pdfDiv" class="card-body apvMarkupDiv">${approval.apvMarkup }</div>
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



		$('#savePdfBtn').click(function() {

			html2canvas($('#pdfDiv')[0]).then(function(canvas) {

			// 캔버스를 이미지로 변환
			let imgData = canvas.toDataURL('image/png');

			let margin = 10; // 출력 페이지 여백설정
			let imgWidth = 210 - (10 * 2); // 이미지 가로 길이(mm) A4 기준
			let pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
			let imgHeight = canvas.height * imgWidth / canvas.width;
			let heightLeft = imgHeight;

			let doc = new jsPDF('p', 'mm');
			let position = margin;

			// 첫 페이지 출력
			doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight; // 한 페이지 이상일 경우 루프 돌면서 출력
			while (heightLeft >= 20) {
				position = heightLeft - imgHeight;
				doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
				doc.addPage();
				heightLeft -= pageHeight;
			}

			// 파일 저장
			doc.save('${approval.apvTitle}.pdf');

			});

		});


	}



	</script>

</body>
