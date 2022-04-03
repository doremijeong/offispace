<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<style type="text/css">
		input.replyInput:disabled {
			background-color: white;
		}
	</style>
</head>


<body>

	<!-- Content Header (Page header) -->
	<div class="content-wrapper" style="min-height: 1095px;">
		<!-- Content Header (Page header) -->
		<section class="content-header"></section>


		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- 마진을 위한 div -->
				<div style="height: 3px;"></div>

				<div class="column">
					<div class="card card-info card-outline">
						<div class="card-header ">
							<div class="row d-flex justify-content-between">
								<h4>업무 조회 <c:if test="${jobDetail.jobDenied eq  'Y'}">&nbsp;<span class="badge bg-danger">반려</span></c:if></h4>

								<div>
									<c:if test="${loginUser.chargeCode eq 'R102' }">
										<c:choose>
											<c:when test="${jobDetail.jobIssue eq 'Y' }">
												<button type="button" class="btn btn-warning btn-sm" onclick="removeJobIssue();">이슈 해제  </button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modal-job-issue-register" >이슈 등록 </button>
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>

							</div>
						</div>

						<div class="card-body p-4">

							<div class="table-responsive">
<c:if test="${jobDetail.jobDenied eq  'Y'}">

							<table class="table table-sm table-bordered" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 40%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 30%;">
									</colgroup>

									<tbody>
										<tr>
											<td style="text-align: right; font-weight: bold;">반려 등록일&nbsp;</td>
											<td colspan="3"><fmt:formatDate value="${jobDetail.jobDeniedDate}" pattern="yyyy-MM-dd(E)" /></td>
										</tr>
										<tr>
											<td style="text-align: right; font-weight: bold;">반려 사유&nbsp;</td>
											<td colspan="3">${jobDetail.jobDeniedReason}</td>
										</tr>
									</tbody>
								</table>

</c:if>
<c:if test="${jobDetail.jobIssue eq  'Y'}">

							<table class="table table-sm table-bordered" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 40%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 30%;">
									</colgroup>

									<tbody>

										<tr>
											<td style="text-align: right; font-weight: bold;">이슈 담당자&nbsp;</td>
											<td>${jobDetail.jobIssueEmployee.empName}&nbsp;${jobDetail.jobIssueEmployee.positionValue}</td>
											<td style="text-align: right; font-weight: bold;">이슈 등록일&nbsp;</td>
											<td><fmt:formatDate value="${jobDetail.jobIssueDate}" pattern="yyyy-MM-dd(E)" /></td>
										</tr>
										<tr>
											<td style="text-align: right; font-weight: bold;">이슈 목적&nbsp;</td>
											<td colspan="3">${jobDetail.jobIssueReason}</td>
										</tr>
									</tbody>
								</table>

</c:if>






								<table class="table table-sm table-bordered" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 40%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 30%;">
									</colgroup>
									<tbody>

										<tr>

											<td style="text-align: right; font-weight: bold;">업무번호&nbsp;</td>
											<td>${jobDetail.jobCode}</td>

											<td style="text-align: right; font-weight: bold;">상태&nbsp;/&nbsp;중요도&nbsp;</td>
											<td>
												<c:set var="today" value="<%=new java.util.Date() %>"/>
												<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
												<fmt:formatDate var="closing" value="${jobDetail.jobClosingDt}" pattern="yyyyMMdd" />
												<c:choose>
													<c:when test="${jobDetail.jobStatus eq '완료'}">
														<span class="badge bg-secondary">완료</span>
													</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${now gt closing}">
															<span class="badge bg-warning">지연</span>
														</c:when>
														<c:otherwise>
															<c:if test="${jobDetail.jobStatus eq '대기'}">
																<span class="badge bg-success">대기</span>
															</c:if>
															<c:if test="${jobDetail.jobStatus eq '진행'}">
																<span class="badge bg-primary">진행</span>
															</c:if>
														</c:otherwise>
													</c:choose>
													</c:otherwise>
												</c:choose>
												&nbsp;/&nbsp;
												<c:if test="${jobDetail.jobImportance eq 'Y'}">
													<span class="badge bg-primary">중요</span>
												</c:if>
											</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">업무분류&nbsp;</td>
											<td colspan="3">${jobDetail.jobcodeName}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">업무기한&nbsp;</td>
											<td>
												<fmt:formatDate value="${jobDetail.jobStartDt}" pattern="yyyy-MM-dd(E)" />
												&nbsp;~&nbsp;
												<fmt:formatDate value="${jobDetail.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
											</td>
											<td style="text-align: right; font-weight: bold;">등록일&nbsp;</td>
											<td><fmt:formatDate value="${jobDetail.jobRequestDt}" pattern="yyyy-MM-dd(E)" /></td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">요청자&nbsp;</td>
											<td>${jobDetail.jobRequester.empName}&nbsp;${jobDetail.jobRequester.positionValue}</td>
											<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
											<td>${jobDetail.jobRequester.teamValue}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">담당자&nbsp;</td>
											<td>${jobDetail.jobReceiver.empName}&nbsp;${jobDetail.jobReceiver.positionValue}</td>
											<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
											<td>${jobDetail.jobReceiver.teamValue}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">참조자&nbsp;</td>
											<td colspan="3">
												<c:forEach items="${jobDetail.jobRefEmps}" var="empRef">
													${empRef.empName}&nbsp;${empRef.positionValue}[${empRef.teamValue}]&nbsp;
												</c:forEach>
											</td>
										</tr>

									</tbody>
								</table>	<!-- /.table -->

								<table class="table table-sm table-bordered" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 40%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 30%;">
									</colgroup>

									<tbody>

										<tr>
											<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
											<td colspan="3">${jobDetail.jobTitle}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
											<td colspan="3">${jobDetail.jobContent}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">첨부파일&nbsp;</td>
											<td colspan="3">
												<c:if test="${!empty jobDetail.attachList}">
													<c:forEach items="${jobDetail.attachList}" var="attach">
														<a href="#" onclick="location.href='<%=request.getContextPath()%>/job/getFile.do?atCode=${attach.attachCode}';">
															<c:if test="${attach.attachExtension eq 'jpeg' || attach.attachExtension eq 'jpg' || attach.attachExtension eq 'png'}">
																<i class="far fa-image"></i>&nbsp;${attach.attachSavename}&nbsp;&nbsp;&nbsp;
															</c:if>
															<c:if test="${attach.attachExtension eq 'pdf'}">
																<i class="far fa-file-pdf"></i>&nbsp;${attach.attachSavename}&nbsp;&nbsp;&nbsp;
															</c:if>
														</a>
													</c:forEach>
												</c:if>
											</td>
										</tr>
									</tbody>
								</table>	<!-- /.table -->
							</div> <!-- card -->
						</div> <!-- /.mail-box-messages -->
					</div> <!-- 수신 업무 상세 조회-->


					<!-- 처리내역 -->
					<div class="card card-info card-outline">
						<form role="processForm" name="registerJobForm" action="updateProcess" method="post" enctype="multipart/form-data">
						<input type="hidden" name="jobCode" value="${jobDetail.jobCode }" />
						<div class="card-header ">
							<div class="row d-flex justify-content-between">
								<h4 onclick="inputFirst();">처리내역</h4>
								<div>
									<c:if test="${jobDetail.jobReceiver.empCode eq loginUser.empCode}">
										<c:if test="${jobDetail.jobDenied eq  'N'}">
											<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-job-denied-register">반려</button>
											<button type="button" class="btn btn-primary btn-sm" onclick="getUpdateForm(this)">처리</button>
											<button type="button" class="btn btn-info btn-sm completeBtn" style="display: none;" onclick="updateFormFile();">저장</button>
										</c:if>
									</c:if>
									<button type="button" class="btn btn-default btn-sm" onclick="window.close();">닫기</button>
								</div>
							</div>
						</div>

						<div class="card-body">
								<table class="table table-sm table-bordered jobProcess" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 40%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 30%;">
									</colgroup>

									<tbody>
										<tr>
											<td style="text-align: right; font-weight: bold;">담당자&nbsp;</td>
											<td>${jobDetail.jobReceiver.empName}&nbsp;${jobDetail.jobReceiver.positionValue}
												&nbsp;[${jobDetail.jobReceiver.teamValue}]
											</td>
											<td style="text-align: right; font-weight: bold;" onclick="inputSecond();">최종 수정일&nbsp;</td>
											<td>
												<fmt:formatDate value="${jobDetail.jobUpdateDt}" pattern="yyyy-MM-dd(E)" />
											</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">진척율&nbsp;</td>
											<td colspan="3">
												<button type="button" class="btn btn-sm btn-default" style="width: 68px;" onclick="progress20();">20%</button>
												<button type="button" class="btn btn-sm btn-default" style="width: 68px;" onclick="progress40();">40%</button>
												<button type="button" class="btn btn-sm btn-default" style="width: 68px;" onclick="progress60();">60%</button>
												<button type="button" class="btn btn-sm btn-default" style="width: 68px;" onclick="progress80();">80%</button>
												<button type="button" class="btn btn-sm btn-default" style="width: 68px;" onclick="progress100();">100%</button>
												<button type="button" class="btn btn-md btn-default" style="width: 40px; padding: 8px;" onclick="progressReset();">
		                    	<i class="fas fa-redo-alt"></i>
		                    </button>
												<!--progress bar-->
												<div class="col-sm-6 p-0"
													style="margin-top: 15px; margin-bottom: 10px;">
													<div class="progress active">
														<div id="myProgress"	class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="${jobDetail.jobProgress}" aria-valuemin="0"	aria-valuemax="100" style="width: ${jobDetail.jobProgress}%">
																${jobDetail.jobProgress}%
														</div>
														<input id="hiddenProgress" type="hidden" name="jobProgress" value="0">
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
											<td colspan="3" class="p-0">
												<div id="readOnlyContent" class="p-1">${jobDetail.jobNote}</div>
												<div id="modifyContent">
													<textarea id="content" class="form-control" name="jobNote" rows="4" style="resize: none;">${jobDetail.jobNote}</textarea>
												</div>
											</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;" onclick="replyInput();">첨부파일&nbsp;</td>

											<td colspan="3">
												<div class="row" style="border: none; padding-left: 5px;">
													<label for="attached">
														<span	class="btn btn-sm btn-outline-secondary" id="fileUploadBtn">
															<i class="fas fa-plus"></i><span>추가</span>
														</span>
													</label>
													<input multiple="multiple" type="file" name="name="uploadFiles"	id="attached" onchange="fileUpload();" style="display: none;">
												</div>
												<div class="row" style="width: 90%; border: none">
													<div class="fileInput" id="preview">
														<ul class="original-attachments" id="fileBox">
														<c:if test="${!empty jobDetail.attachListByJobCharger}">
															<c:forEach items="${jobDetail.attachListByJobCharger}" var="attach" >
					                                            <li style="width: 100%;border: none;" class="attach-item ${attach.attachCode}" id="${attach.attachCode}"  file-name="${attach.attachSavename}">
				                                                    <a class="mailbox-attachment-name" name="attachedFile" href="<%=request.getContextPath()%>/job/getFile.do?atCode=${attach.attachCode}"  >
				                                                        <i class="fas fa-paperclip"></i>
				                                                        ${attach.attachSavename }&nbsp;&nbsp;
				                                                        <!-- 기존의 함수를 막기 위해서는 여기서 return false;를 줘야함 -->
				                                                        <button type="button" onclick="removeFile_go('${attach.attachCode}'); return false;" style="border:0;outline:0;" class="badge bg-red">X</button>
				                                                    </a>
					                                            </li>
					                                        </c:forEach>
				                                        </c:if>
				                                    	</ul>
				                                        <div id="newFile">

														</div>
			                                    	</div>
												</div>
												<%-- <div style="width: 90%; border: none" id="preview">
													<c:if test="${!empty jobDetail.attachListByJobCharger}">
													<c:forEach items="${jobDetail.attachListByJobCharger}" var="attach">
														<a href="#" onclick="location.href='<%=request.getContextPath()%>/job/getFile.do?atCode=${attach.attachCode}';">
															<c:if test="${attach.attachExtension eq 'jpeg' || attach.attachExtension eq 'jpg' || attach.attachExtension eq 'png'}">
																<i class="far fa-image"></i>&nbsp;${attach.attachSavename}&nbsp;&nbsp;&nbsp;
															</c:if>
															<c:if test="${attach.attachExtension eq 'pdf'}">
																<i class="far fa-file-pdf"></i>&nbsp;${attach.attachSavename}&nbsp;&nbsp;&nbsp;
															</c:if>
														</a>
													</c:forEach>
													</c:if>
												</div> --%>
											</td>
										</tr>
									</tbody>
								</table>
							</form>


							<!-- 댓글 아코디언-->
							<div id="accordion" style="border-radius: 0;">
								<div class="card shadow-none border-secondary" style="border-radius: 0;">
									<div class="card-header p-2 btn btn-link collapsed" id="headingTwo" data-toggle="collapse"
										data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										<h6 class="mb-0 text-center">댓글(<span id="replyCnt">${jobDetail.replyCount}</span>)</h6>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
										<div id="replyBox">

										</div>

										<!--댓글 입력창-->
										<div style="border: 1px solid lightgray;">
											<textarea class="form-control p-1" style="border: none; resize: none;" placeholder="댓글을 입력하세요." id="newReplyText"></textarea>
											<div class="d-flex justify-content-end">
												<a href="#" style="margin-right: 12px; margin-bottom: 8px;" id="addReplyBtn" onclick="addReply_go();">등록</a>
											</div>
										</div>

									</div>
								</div>
							</div> <!-- 댓글 아코디언 -->
						</div><!--처리내역 카드-->

					</div> <!-- column -->
				</div> <!-- /.container-fluid -->
			</section>
		</div> <!-- content-wrapper -->


	<!-- 댓글 등록시 필요한 업무번호 -->
	<form role="replyForm">
		<input type="hidden" name="jobCode" value="${jobDetail.jobCode}" />
	</form>


	<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>

	<script>
window.onload = function() {

	//댓글 목록 불러오기
	getJobReplyList();

	const attached = document.querySelector('#attached');
	const preview = document.querySelector('#preview');
	attached.style.opacity=0;
	attached.addEventListener('change', updateFileDisplay);


	$(".jobProcess").find("*").attr("disabled", "disabled");
	$("#modifyContent").hide();

	//summernote
    $('#content').summernote({
      placeholder: '내용을 입력하세요.',
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline']],
        ['fontname', ['fontname']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
      ],
      height: 190,
    });

  $('.fileInput').on('change','input[type="file"]',function(event){
		//alert(this.files[0].size);
		if(this.files[0].size > 1024*1024*40) {
			Swal.fire({
				  icon: 'warning',
				  text: '파일 용량이 40MB를 초과했습니다.',
				  showConfirmButton: false,
				  timer: 1500
			});
			this.value = "";
			$(this).click();
			return false;
		}
	});


  //댓글 삭제
  $('#replyBox').on('click','.rdel', function(){

	   event.preventDefault(); //a태그 href 막기
	   var jobReplyCode = $(this).parents('.jobReplyLi').find('.hiddenJobReplyCode').val();

	   Swal.fire({
    		  text: "댓글을 삭제하시겠습니까?",
    		  icon: 'warning',
    		  showCancelButton: true,
    		  confirmButtonText: '확인',
    		  cancelButtonText: '취소',
    		  reverseButtons: false
    		})
    		.then((result) => {
    			if (result.isConfirmed) {
    				$.ajax({
    		 	   		url : "removeJobReply.do",
    		 	   		type : "post",
    		 	   		data : {"jobReplyCode" : jobReplyCode},
    		 	   		success : function(result) {
    			 	   		Swal.fire({
    							  text: "댓글을 삭제하였습니다.",
    							  icon: 'success',
    							  confirmButtonText: '확인',
    							  reverseButtons: false
    							})
    							.then((result) => {
    								getJobReplyList();
    							});
    		 	   		},
    		 	   		error : function(xhr) {
    		 	   			callFail();
    		 	   		}
    	 	    	}); // ajax
    			} else if ( result.dismiss === Swal.DismissReason.cancel) {
    				callCancel(canTitle,canText);
    		 	}
    		});
 	});

//댓글 수정 버튼 클릭
  $('#replyBox').on('click','.rModi', function(){
	  event.preventDefault(); //a태그 href 막기
	  var jobReplyCode = $(this).parents('.jobReplyLi').find('.hiddenJobReplyCode').val();

	  //수정, 삭제, 등록, 취소 버튼
	  $(this).parents('.jobReplyLi').find('.rdel').css({"display":"none"});
	  $(this).parents('.jobReplyLi').find('.rModi').css({"display":"none"});
	  $(this).parents('.jobReplyLi').find('.rCanl').css({"display":""});
	  $(this).parents('.jobReplyLi').find('.rRegi').css({"display":""});

	  $(this).parents('.jobReplyLi').find('.replyInput').removeAttr('disabled');
	  $(this).parents('.jobReplyLi').find('.replyInput').css({"border":"1px solid lightgray", "border-radius":"0px"});
	  $(this).parents('.jobReplyLi').find('.replyInput').focus();
  });


 //댓글 수정 취소
  $('#replyBox').on('click','.rCanl', function(){
	  event.preventDefault(); //a태그 href 막기

	  //수정, 삭제, 등록, 취소 버튼
	  $(this).parents('.jobReplyLi').find('.rdel').css({"display":""});
	  $(this).parents('.jobReplyLi').find('.rModi').css({"display":""});
	  $(this).parents('.jobReplyLi').find('.rCanl').css({"display":"none"});
	  $(this).parents('.jobReplyLi').find('.rRegi').css({"display":"none"});

	  $(this).parents('.jobReplyLi').find('.replyInput').css({"border":"none", "border-radius":"0px"});
	  $(this).parents('.jobReplyLi').find('.replyInput').attr("disabled", "disabled");
	  getJobReplyList();
  });


  //댓글 수정(등록)
  $('#replyBox').on('click','.rRegi', function(){
	  event.preventDefault(); //a태그 href 막기

	  var jobReplyCode = $(this).parents('.jobReplyLi').find('.hiddenJobReplyCode').val();
	  var jobReplyContent = $(this).parents('.jobReplyLi').find('.replyInput').val();

	  var datas = {
				"jobReplyCode" : jobReplyCode,
				"jobReplyContent" : jobReplyContent
		}

	  console.log(datas);

		$.ajax({
			url : "updateJobReply.do",
			type : "post",
			data : JSON.stringify(datas),
			contentType: "application/json",
			success:function(data){
				Swal.fire({
					  text: "댓글이 수정되었습니다.",
					  icon: 'success',
					  confirmButtonText: '확인',
					  reverseButtons: false
					})
					.then((result) => {
						getJobReplyList();
					});
				
			},
			error : function(error) {
				callFail();
				//AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

  });

}; //===================================window============================================


	//수정 버튼 누르면 처리내역 부분 활성화
	function getUpdateForm(updateBtn) {
		$('.jobProcess').find("*").prop('disabled', false);
		$("#readOnlyContent").hide();
		$("#modifyContent").show();
		updateBtn.style.display ="none"; //수정 버튼 숨기기
		document.querySelector('.completeBtn').style.display = ""; //저장 버튼 활성

		//첨부파일 "추가" 버튼 색 바꾸기
		document.querySelector("#fileUploadBtn").classList.remove("btn-outline-secondary")
		document.querySelector("#fileUploadBtn").classList.add("btn-outline-success");
	};


    //진척율========================================================================
    function progress20() {
      document.getElementById("myProgress").setAttribute("aria-valuenow", 20);
      document.getElementById("myProgress").style.width = "20%";
      document.getElementById("myProgress").innerHTML = "20%";

      var mysave = $('#myProgress').attr('aria-valuenow');
      $('#hiddenProgress').val(mysave);
    }
    function progress40() {
      document.getElementById("myProgress").setAttribute("aria-valuenow", 40);
      document.getElementById("myProgress").style.width = "40%";
      document.getElementById("myProgress").innerHTML = "40%";

      var mysave = $('#myProgress').attr('aria-valuenow');
      $('#hiddenProgress').val(mysave);
    }
    function progress60() {
      document.getElementById("myProgress").setAttribute("aria-valuenow", 60);
      document.getElementById("myProgress").style.width = "60%";
      document.getElementById("myProgress").innerHTML = "60%";

      var mysave = $('#myProgress').attr('aria-valuenow');
      $('#hiddenProgress').val(mysave);
    }
    function progress80() {
      document.getElementById("myProgress").setAttribute("aria-valuenow", 80);
      document.getElementById("myProgress").style.width = "80%";
      document.getElementById("myProgress").innerHTML = "80%";

      var mysave = $('#myProgress').attr('aria-valuenow');
      $('#hiddenProgress').val(mysave);
    }
    function progress100() {
      document.getElementById("myProgress").setAttribute("aria-valuenow", 100);
      document.getElementById("myProgress").style.width = "100%";
      document.getElementById("myProgress").innerHTML = "100%";

      var mysave = $('#myProgress').attr('aria-valuenow');
      $('#hiddenProgress').val(mysave);
    }
    function progressReset() {
        document.getElementById("myProgress").setAttribute("aria-valuenow", 0);
        document.getElementById("myProgress").style.width = "0%";
        document.getElementById("myProgress").innerHTML = "0%";

        var mysave = $('#myProgress').attr('aria-valuenow');
        $('#hiddenProgress').val(mysave);
    }


	/*  파일 업로드 */
	function updateFileDisplay (){
		while(newFile.firstChild) {
			newFile.removeChild(newFile.firstChild);
	  	}

	  const originFiles = document.getElementsByClassName('attach-item');

	  const curFiles = attached.files;

	  var fileCnt = originFiles.length + curFiles.length;

	  if(fileCnt === 0) {
	    const para = document.createElement('p');
	    para.textContent = '첨부된 파일이 없습니다.';
	    newFile.appendChild(para);
	  } else if(fileCnt > 5){

		  Swal.fire({
			  title: '파일 등록은 5개까지만 가능합니다.',
			  icon: 'error',
			  showConfirmButton: false,
			  timer: 1500
			});
		  return;

	  }  else {
	    const list = document.createElement('ol');
	    newFile.appendChild(list);

	    for(const file of curFiles) {

	      const listItem = document.createElement('li');
	      const para = document.createElement('p');

	      if(validFileType(file)) {
	        para.textContent = file.name+', size:'+returnFileSize(file.size)+'.';
	        para.className = 'attachFile';
	        //const image = document.createElement('img');
	        //image.src = URL.createObjectURL(file);

	       // listItem.appendChild(image);
	        listItem.appendChild(para);
	      } else {
	        para.textContent = file.name+', size:'+returnFileSize(file.size)+'.';
	        listItem.appendChild(para);
	      }

	      list.appendChild(listItem);
	    }
	  }
	}

    const fileTypes = [
    	  "image/apng",
    	  "image/bmp",
    	  "image/gif",
    	  "image/jpeg",
    	  "image/pjpeg",
    	  "image/png",
    	  "image/svg+xml",
    	  "image/tiff",
    	  "image/webp",
    	  "image/x-icon"
    	];

    function validFileType(file) {
      return fileTypes.includes(file.type);
    }

    function returnFileSize(number) {
      if(number < 1024) {
        return number + 'bytes';
      } else if(number >= 1024 && number < 1048576) {
        return (number/1024).toFixed(1) + 'KB';
      } else if(number >= 1048576) {
        return (number/1048576).toFixed(1) + 'MB';
      }
    }

    function fileUpload(){
    	let files = attached.files;
    	files.forEach(file=>{
    		console.log(file.name);
    	});
    }
    /* 파일업로드에 관한 function 마침 */

   function updateForm() {
      var form=$('form[role="processForm"]');
      form.submit();
      window.opener.location.reload(true);
   }


   function closeWindow() {
   	window.close();
	 	window.opener.location.reload(true);
   }


 //댓글 등록================================================================================
	function addReply_go() {
		event.preventDefault(); //a태그 href 막기

		var replytext = $('#newReplyText').val();
		var jobCode = $('input[name="jobCode"]').val();

		if(!replytext) {
			Swal.fire({
				  icon: 'warning',
				  text: '내용은 필수입니다.',
				  showConfirmButton: false,
				  timer: 1500
			});
			return;
		}

		var data = {
				"jobCode":jobCode,
				"jobReplyWriter": "${loginUser.empCode}",
				"jobReplyContent":replytext
		}

		$.ajax({
			url : "registerJobReply.do",
			type : "post",
			data : JSON.stringify(data),
			contentType: "application/json",
			success:function(data){
				/* 댓글 알림 보내기 */
				if('${jobDetail.jobRequester.empCode}' == '${loginUser.empCode}'){
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
				} 
				if('${jobDetail.jobReceiver.empCode}' == '${loginUser.empCode}'){
			 		let formDataForRequester = new FormData();
			 		formDataForRequester.append("ntCode",'${jobDetail.jobCode}');
			 		formDataForRequester.append("ntFromEmpCode",'${loginUser.empCode}');
			 		formDataForRequester.append("empCode",'${jobDetail.jobRequester.empCode}');
					formDataForRequester.append("ntTitle","업무 피드백");					
			 		formDataForRequester.append("ntMsg","업무 피드백이 도착했습니다.");
			 		formDataForRequester.append("ntLinkPath","<%=request.getContextPath()%>/job/requestedJobDetail?jobCode="+'${jobDetail.jobCode}');
			 		formDataForRequester.append("ntMsec",8*1000);
			 		formDataForRequester.append("ntImportant",'${jobDetail.jobImportance}');
	
			 		registerNotification(formDataForRequester);
				}
				
				
				Swal.fire({
					  text: "댓글이 등록되었습니다.",
					  icon: 'success',
					  confirmButtonText: '확인',
					  reverseButtons: false
					})
					.then((result) => {
						getJobReplyList();
						$('#newReplyText').val(""); //댓글 등록창 비워주기
					});
				
			},
			error : function(error) {
				callFail();
				//AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	//댓글 목록================================================================
	function getJobReplyList() {

		var replyUrl = "<%=request.getContextPath()%>/job/jobReplyList/";
		var jobCode = "${jobDetail.jobCode}"

		$.ajax({
			url : replyUrl+jobCode,
			type : 'post',
			dataType : 'json',
			success : function(result) {
			//console.log(result);
			var num = result.length;

				var reply = "";
				if(result.length < 1) {
					reply = "<br><div class='text-center'>등록된 댓글이 없습니다.</div><br>";
				}else {
					$.each(result, function(i, v) {
							reply += "<div class='card-body p-1 jobReplyLi' style='padding-top: 12px;'>";
							reply += "<input type='hidden' class='hiddenJobReplyCode' value='"+result[i].jobReplyCode+"'>";
							reply += "<p class='m-0 p-1' style='font-weight: bold; display: inline-block;''>"+result[i].jobReplier.empName+"&nbsp;"+result[i].jobReplier.positionValue+"&nbsp;["+result[i].jobReplier.teamValue+"]</p>";
							reply += "<span class='text-gray' style='font-size: 0.8em;''>";
							reply += "&nbsp;<i class='far fa-clock'></i>&nbsp;"+result[i].replyModifyDate;
							reply += "</span>";
							reply += "<div style='display: inline-block;' class='float-right btnGroup'>";
							if("${loginUser.empCode}"== result[i].jobReplier.empCode){
							reply += "<a href='#' style='margin-right: 12px; margin-bottom: 8px;' class='text-danger rdel'>삭제</a>";
							reply += "<a href='#' style='margin-right: 12px; margin-bottom: 8px; display:none;' class='text-danger rCanl'>취소</a>";
							reply += "<a href='#' style='margin-right: 12px; margin-bottom: 8px;' class='rModi'>수정</a>";
							reply += "<a href='#' style='margin-right: 12px; margin-bottom: 8px; display:none;' class='rRegi'>등록</a>";
							}
							reply += "</div>";
							reply += "<div class='replyContentBox'><input class='form-control p-1 replyInput' style='border: none;' value='"+result[i].jobReplyContent+"' disabled></div>";
							reply += "<div class='dropdown-divider'></div>";
							reply += "</div>";
					})
				}
				getReplyCount(num);
				$('#replyBox').html(reply);
			},
			error : function() {
				callFail();
			}
		});
	};


	function getReplyCount(num) {
		document.getElementById("replyCnt").textContent=num;
	}

	const registerJobIssue = () => {

		let content = document.querySelector("#jobIssueReason").value;
		if (content == ""){
			callCustomAlert("등록 실패","이슈 목적을 입력하세요.","warning");
		    return;
		}

		content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		//document.querySelector("#jobIssueReason").value = content;
		let jobCode = document.querySelector('input[name="jobCode"]').value;

		let jobIssueFormData = new FormData();
		jobIssueFormData.append("jobCode",jobCode);
		jobIssueFormData.append("jobIssueReason",content);
		jobIssueFormData.append("jobIssueEmpCode",'${loginUser.empCode}');

		fetch('registerJobIssue',{
			method:'POST',
			body: jobIssueFormData,
		})
		.then(data =>{
			console.log('Success:', data);
			/* 업무 이슈 알림 보내기 - 요청자  */
	 		let formDataForRequester = new FormData();
	 		formDataForRequester.append("ntFromEmpCode",'${loginUser.empCode}');
	 		formDataForRequester.append("empCode",'${jobDetail.jobRequester.empCode}');
	 		formDataForRequester.append("ntCode",'${jobDetail.jobCode}');
	 		formDataForRequester.append("ntTitle","업무 이슈");
	 		formDataForRequester.append("ntMsg","해당 업무가 이슈업무로 등록되었습니다.");
	 		formDataForRequester.append("ntLinkPath","<%=request.getContextPath()%>/job/requestedJobDetail?jobCode="+'${jobDetail.jobCode}');
	 		formDataForRequester.append("ntMsec",8*1000);
	 		formDataForRequester.append("ntImportant",'Y');

	 		registerNotification(formDataForRequester);
	 		
			/* 업무 이슈 알림 보내기  - 담당자 */
	 		let formDataForReceiver = new FormData();
	 		formDataForReceiver.append("ntFromEmpCode",'${loginUser.empCode}');
	 		formDataForReceiver.append("empCode",'${jobDetail.jobReceiver.empCode}');
	 		formDataForReceiver.append("ntCode",'${jobDetail.jobCode}');
	 		formDataForReceiver.append("ntTitle","업무 이슈");
	 		formDataForReceiver.append("ntMsg","해당 업무가 이슈업무로 등록되었습니다.");
	 		formDataForReceiver.append("ntLinkPath","<%=request.getContextPath()%>/job/receivedJobDetail?jobCode="+'${jobDetail.jobCode}');
	 		formDataForReceiver.append("ntMsec",8*1000);
	 		formDataForReceiver.append("ntImportant",'Y');

	 		registerNotification(formDataForReceiver);
		
			Swal.fire({
				  title: "업무이슈 등록",
				  text: "업무 이슈등록을 완료하였습니다.",
				  icon: 'success',
				  confirmButtonText: '확인',
				  reverseButtons: false
				})
				.then((result) => {
					window.location.reload();
					window.opener.location.reload();
				});
		})
		.catch((error) => {
			console.log('Error:', error);
			callFail();
		})


	}
	const removeJobIssue = () => {
		Swal.fire({
			  title: "이슈해제",///텍스트 대체 가능
			  text: "해당 업무를 이슈 해제 하시겠습니까?",//텍스트 대체 가능
			  icon: 'warning',//대체가능
			  showCancelButton: true,
			  confirmButtonText: '해제',//텍스트 대체 가능
			  cancelButtonText: '취소',//텍스트 대체 가능
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					let jobCode = document.querySelector('input[name="jobCode"]').value;
					fetch('removeJobIssue?jobCode='+jobCode)
					.then(data => {
						console.log('Success:', data);
						Swal.fire({
							  title: "업무이슈 해제",
							  text: "업무 이슈 해제를 완료하였습니다.",
							  icon: 'success',
							  confirmButtonText: '확인',
							  reverseButtons: false
							})
							.then((result) => {
								window.location.reload();
								window.opener.location.reload();
							});

					})
					.catch((error) => {
					console.log('Error:', error);
					callFail();
					})
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					callCancel("업무이슈 해제","업무 이슈 해제를 취소하였습니다.");
			 	}
			});
	};

	const registerJobDenied = () => {

		let content = document.querySelector("#jobDeniedReason").value;
		if (content == ""){
			callCustomAlert("반려 실패","반려 사유를 입력하세요.","warning");
		    return;
		}
		Swal.fire({
			  title:"업무 반려",///텍스트 대체 가능
			  text: "반려된 업무는 취소가 불가능 합니다. \n반려하시겠습니까?",//텍스트 대체 가능
			  icon: 'warning',//대체가능
			  showCancelButton: true,
			  confirmButtonText: '반려',//텍스트 대체 가능
			  cancelButtonText: '취소',//텍스트 대체 가능
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');

					let jobCode = document.querySelector('input[name="jobCode"]').value;

					let jobDeniedFormData = new FormData();
					jobDeniedFormData.append("jobCode",jobCode);
					jobDeniedFormData.append("jobDeniedReason",content);

					fetch('registerJobDenied',{
						method:'POST',
						body: jobDeniedFormData,
					})
					.then(data =>{
						console.log('Success:', data);
						
						/* 업무 처리 알림 보내기 */
				 		let formDataForRequester = new FormData();
				 		formDataForRequester.append("ntFromEmpCode",'${loginUser.empCode}');
				 		formDataForRequester.append("empCode",'${jobDetail.jobRequester.empCode}');
				 		formDataForRequester.append("ntCode",'${jobDetail.jobCode}');
				 		formDataForRequester.append("ntTitle","업무 반려");
				 		formDataForRequester.append("ntMsg","요청한 업무가 반려 되었습니다.");
				 		formDataForRequester.append("ntLinkPath","<%=request.getContextPath()%>/job/requestedJobDetail?jobCode="+'${jobDetail.jobCode}');
				 		formDataForRequester.append("ntMsec",8*1000);
				 		formDataForRequester.append("ntImportant",'${jobDetail.jobImportance}');

				 		registerNotification(formDataForRequester);
					
						Swal.fire({
							  title: "업무반려",
							  text: "업무를 반려하였습니다.",
							  icon: 'success',
							  confirmButtonText: '확인',
							  reverseButtons: false
							})
							.then((result) => {
								window.location.reload();
								window.opener.location.reload();
							});
					})
					.catch((error) => {
						console.log('Error:', error);
						callFail();
					})
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					callCancel("업무 반려","업무 반려를 취소하였습니다.");
			 	}
			});

	}

const updateFormFile = () => {
	let jobCode = document.querySelector('input[name="jobCode"]').value
	let jobProgress = document.querySelector('input[name="jobProgress"]').value;
	let jobNote = document.querySelector('textarea[name="jobNote"]').value;
	let deleteFiles = document.querySelectorAll("input[name='deleteFiles']");

	const updateFormData = new FormData();
	updateFormData.append("jobCode",jobCode)
	updateFormData.append("jobProgress",jobProgress)
	updateFormData.append("jobNote",jobNote)
	if (deleteFiles != null && deleteFiles.length >0){
		deleteFiles.forEach(file =>{
			updateFormData.append("deleteFiles",file.value);
		})
	}
	for(var file of attached.files){
		updateFormData.append("attached",file,file.name);
	};
	
	Swal.fire({
		  title:"업무 처리",
		  text: "해당 업무 처리내역을 저장하시겠습니까?",//텍스트 대체 가능
		  icon: 'warning',//대체가능
		  showCancelButton: true,
		  confirmButtonText: '저장',//텍스트 대체 가능
		  cancelButtonText: '취소',//텍스트 대체 가능
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('updateProcessFile',{
					method:'POST',
					headers:{},
					body: updateFormData,
				})
				.then(data => {
					console.log('Success:', data);
					/* 업무 처리 알림 보내기 */
			 		let formDataForRequester = new FormData();
			 		formDataForRequester.append("ntFromEmpCode",'${loginUser.empCode}');
			 		formDataForRequester.append("empCode",'${jobDetail.jobRequester.empCode}');
			 		formDataForRequester.append("ntCode",'${jobDetail.jobCode}');
					if(jobProgress == 100){
				 		formDataForRequester.append("ntTitle","업무 완료");					
				 		formDataForRequester.append("ntMsg","담당자가 요청하신 업무를 완료습니다.");
					}else{
				 		formDataForRequester.append("ntTitle","업무 업데이트");					
				 		formDataForRequester.append("ntMsg","요청한 업무가 업데이트 되었습니다.");
					}
			 		formDataForRequester.append("ntLinkPath","<%=request.getContextPath()%>/job/requestedJobDetail?jobCode="+'${jobDetail.jobCode}');
			 		formDataForRequester.append("ntMsec",8*1000);
			 		formDataForRequester.append("ntImportant",'${jobDetail.jobImportance}');

			 		registerNotification(formDataForRequester);
					
					Swal.fire({
						  title: "처리 내역 저장",
						  text: "저장을 완료하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							window.location.reload();
							window.opener.location.reload();
						});
				})
				.catch((error) => {
					console.log('Error:', error);
					callFail();
				})
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("업무 처리","취소하였습니다.");
		 	}
		})
}


function removeFile_go(attachCode) {
	var li = $('li.' + attachCode);
	Swal.fire({
	      text: li.attr("file-name") +'를 삭제하시겠습니까?',
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonText: '삭제',
	      cancelButtonText: '취소',
	      reverseButtons: false
	    })
	    .then((result) => {
	        if (result.isConfirmed) {
				li.remove();
				// 사용자가 어떤 파일을 지웠는지 확인하기 위한 정보를 서버에 보내기 위해서 hidden으로 심어 놓음
				// 서버는 ano를 받아서 해당 파일의 저장경로를 받아와 파일을 지우고 새로운 파일 저장
				var input = $('<input>').attr({
					"type" : "hidden",
					"name" : "deleteFiles",
					"value" : attachCode
				});
				$('#preview').prepend(input);
	        } else if ( result.dismiss === Swal.DismissReason.cancel) {
	            callCancel(canTitle,canText);
	         }
	    });
}
// 시연을 위한 자동입력  반려 
const deniedInput = () => {
	document.querySelector('#jobDeniedReason').value="업무 분담에 해당하지 않는 업무입니다. 다시 확인 부탁드립니다.";
}

// 시연을 위한 자동입력 업무 처리 - 담당자 
const inputFirst = () => {
	let markup = `<p><b>산출물 목록&nbsp;</b></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.1 수행계획서 - </span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.2 요구사항정의목록&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">&nbsp;-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.3 단위업무정의목록&nbsp;</span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.4 유스케이스 다이어그램&nbsp;</span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.5 용어사전&nbsp;</span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.6 자료사전&nbsp;</span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.7 메뉴구조도&nbsp;</span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.8 프로세스흐름도&nbsp;</span></p>`;
	$('textarea#content').summernote('code', markup);
}
const inputSecond = () =>{
	let markup = `<p><b>산출물 목록&nbsp;</b></p><p><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.1 수행계획서 - </span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.2 요구사항정의목록&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">&nbsp;-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.3 단위업무정의목록&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.4 유스케이스 다이어그램&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.5 용어사전&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.6 자료사전&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.7 메뉴구조도&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span><br style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;"><span style="color: rgb(51, 51, 51); font-family: Verdana, sans-serif; font-size: 12px;">1.8 프로세스흐름도&nbsp;</span><span style="font-family: Verdana, sans-serif; color: rgb(51, 51, 51); font-size: 12px;">-&nbsp;</span><span style="color: inherit; font-family: Verdana, sans-serif; font-size: 12px; background-color: rgb(255, 255, 0);"><font color="#000000">완료</font></span></p>`;
	$('textarea#content').summernote('code', markup);	
}
//시연을 위한 자동 입력 이슈 
const issueInput = () => {
	document.querySelector("#jobIssueReason").value="업무일정이 촉박하므로 업무당사자들간의 실시간 피드백과 반영 필요";
}
//시연을 위한 자동 입력 댓글 -부장 
const replyInput = () => {
	document.querySelector('#newReplyText').value="말씀하신 사항을 반영하여 처리 하였습니다.";
}

</script>


<!-- 업무이슈화 모달   -->
<div class="modal fade" id="modal-job-issue-register" style="display: none;" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"  onclick="issueInput();" >이슈 업무 등록</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">

        <label for="jobIssueReason">이슈 목적  </label>
        <div style="padding: 3px; height: 150px; border: 1px solid #000; vertical-align: middle" >
			<textarea style="height:100%; width:100%; border:#ddd; resize:none; font-size: 0.85em;" id="jobIssueReason"></textarea>
		</div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기 </button>
        <button type="button" class="btn btn-primary" onclick="registerJobIssue();">등록</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- 반력 모달   -->
<div class="modal fade" id="modal-job-denied-register" style="display: none;" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" onclick="deniedInput();">업무 반려</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">

        <label for="jobDeniedReason">반려 사유 </label>
        <div style="padding: 3px; height: 150px; border: 1px solid #000; vertical-align: middle" >
			<textarea style="height:100%; width:100%; border:#ddd; resize:none; font-size: 0.85em;" id="jobDeniedReason"></textarea>
		</div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기 </button>
        <button type="button" class="btn btn-primary" onclick="registerJobDenied();">등록</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>


</body>
