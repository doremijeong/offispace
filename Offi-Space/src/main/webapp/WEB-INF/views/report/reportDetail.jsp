<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
#approvalTable input {
	text-align: center
}
.btn-group{
	margin-right: 5px;
}
.report-input{
	border: none;
	background-color: white;
	color: black;
}
.textarea-input{
	border: none;
	background-color: white;
	color: black;
}
.textarea-input:disabled{
	background-color: white;
}
</style>
</head>
<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper" style="margin: 0px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>보고서 상세</h5>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="card card-default card-outline">
					<div class="card-header d-flex justify-content-end">
<c:if test="${loginUser.empCode eq reportDoc.reportDocWriterInfo.empCode }">
						<div class="btn-group">
							<button class="btn btn-default btn-sm modifyBtn" onclick="getUpdateForm(this)">수정</button>
						</div>
</c:if>
						<div class="btn-group">
							<button class="btn btn-info btn-sm completeBtn" style="display: none;" onclick="updateRegularReport();">완료</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default btn-sm" onclick="javascript:CloseWindow('');">닫기</button>
						</div>
					</div>
					<!-- /.card-header -->
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
										<td>${reportDoc.reportDocWriterInfo.empName}&nbsp;&nbsp;${reportDoc.reportDocWriterInfo.positionValue}</td>
										<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
										<td>${reportDoc.reportDocWriterInfo.groupValue}&nbsp;&nbsp;${reportDoc.reportDocWriterInfo.teamValue}</td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">보고일&nbsp;</td>
										<td >${reportDoc.reportDocDt}</td>
										<td style="text-align: right; font-weight: bold;">운영자&nbsp;</td>
										<td >${reportDoc.reportDocManagerInfo.empName}&nbsp;&nbsp;${reportDoc.reportDocManagerInfo.positionValue}</td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
										<td colspan="3">
											${reportDoc.reportDocTitle}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div>
							<div id="readOnlyContent" class="p-1">
								${reportDoc.reportDocMarkup}
							</div>
							<div id="modifyContent">
								<textarea id="content" name="reportDocMarkup" ></textarea>
							</div>
			        	</div>

					</div>
					<!-- /.card-body -->
					<!-- <div class="card-footer">

				</div> -->
					<!-- /.card-footer -->
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>

<script>
window.onload = function(){
	$("#modifyContent").hide();
	$('textarea#content').summernote('code', `${reportDoc.reportDocMarkup}`);


		/* $('input').prop('readonly',true); */
		//$('input').prop('disabled',true);
		//$('textarea').prop('disabled',true);
		//document.querySelector('input[name="reportDocCode"]').setAttribute("value",'${reportDocCode}');

/* 		let textareaNode = document.querySelectorAll('.textarea-input');
		if(textareaNode != null){
			textareaNode.forEach(input=>{
				let content = input.dataset.content;
				input.value = content;
				input.disabled = true;
			})
		};
		$('.reportDocMarkup').on('keyup', '.textarea-input', function() {
    		var inputText = $(this).val();
    		$(this).attr('data-content',inputText);
    	});

		let modifyBtn = document.querySelector('.modifyBtn');
		/*  일일계획 보고 */
		//let reportWriter = document.querySelector('input[name="reportDocWriter"]').dataset.code;
}
/* window.onload end */
function getUpdateForm(updateBtn){
	$("#readOnlyContent").hide();
	$("#modifyContent").show();

	//$('textarea').prop('disabled',false);
	updateBtn.style.display ="none";
	document.querySelector('.completeBtn').style.display = "";
}
function updateRegularReport(){
	let reportDocCode = '${reportDocCode}';
	//let reportDocMarkup = document.querySelector('.reportDocMarkup').innerHTML;
	let reportDocMarkup = document.querySelector('#content').value;

	let data = {"reportDocCode" : reportDocCode,
				"reportDocMarkup" : reportDocMarkup}


	Swal.fire({
		  title: "보고서 수정",
		  text:  "보고서를 수정 하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '수정',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				 $.ajax({
					url : "<%=request.getContextPath()%>/report/updateRegularReport",
					type : "post",
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function() {
	<%--
						let formDataForReceiver = new FormData();
				 		formDataForReceiver.append("ntCode",'${jobDetail.jobCode}');
				 		formDataForReceiver.append("ntFromEmpCode",'${loginUser.empCode}');
				 		formDataForReceiver.append("empCode",'${jobDetail.jobReceiver.empCode}');
				 		formDataForReceiver.append("ntTitle","업무 피드백");
				 		formDataForReceiver.append("ntMsg","업무 피드백이 도착했습니다.");
				 		formDataForReceiver.append("ntLinkPath","<%=request.getContextPath()%>/job/receivedJobDetail?jobCode="+'${jobDetail.jobCode}');
				 		formDataForReceiver.append("ntMsec",8*1000);
				 		formDataForReceiver.append("ntImportant",'${jobDetail.jobImportance}');

				 		registerNotification(formDataForReceiver);

	 --%>

						Swal.fire({
						  title: '수정사항이 반영되었습니다.',
						  icon: 'info',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							if (result.isConfirmed) {
								location.reload();
							} else if ( result.dismiss === Swal.DismissReason.cancel) {
								callCancel(canTitle,canText);
						 	}
						});

					},
					error : function(xhr) {
						console.log(xhr.status);
					}
				});
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("보고서 수정","보고서 수정을  취소하였습니다.");
		 	}
		});
}
</script>

</body>