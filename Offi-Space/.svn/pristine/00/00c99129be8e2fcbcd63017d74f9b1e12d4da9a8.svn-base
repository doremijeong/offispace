<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
</style>

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>메일쓰기</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">사내메일함</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="card card-info card-outline">
				<div class="card-header">
					<div class="mailbox-controls">
						<div class="float-left">
							<button type="button" class="btn btn-default btn-sm" onclick="reset()">
								<i class="fas fa-undo-alt"></i>&nbsp;
								초기화
							</button>
							<button type="button" class="btn btn-default btn-sm" onclick="javascript:window.close(); ">
<!-- 						<i class="far fa-window-close"></i> -->
								닫기
							</button>
						</div>

						<div class="d-flex justify-content-end">
							&nbsp;
							<button type="button" class="btn btn-default btn-sm" onclick="main_tempStore()">
								<i class="far fa-save"></i>&nbsp;
								임시저장
							</button>
							&nbsp;
							<button type="button" class="btn btn-default btn-sm" onclick="preview()">
								<i class="far fa-eye"></i>&nbsp;
								미리보기
							</button>
							&nbsp;
							<button type="submit" class="btn btn-info btn-sm" onclick="main_transfer();">
								<i class="far fa-envelope"></i>
								보내기
							</button>
							&nbsp;
						</div>
					</div>
				</div>

				<!-- /.card-header -->
				<div class="card-body">
						<form action="register.do" method="post" enctype="multipart/form-data" name="registerForm">
						<div class="col-md-12">
							<div class="form-group">
								<div class="row">
								<input type="hidden" value="${mail.mailCode}" name="mailCode">
								<input type="hidden" value="${loginUser.empCode}" name="mailFrom">
									<div class="col-md-1">
										<label for="to">받는사람 </label>
									</div>
									<div class="col-md-1">
										<%-- <button type="button" class="btn btn-default btn-sm" onclick="OpenWindow('<%=request.getContextPath()%>/mail/receiverListForm','주소록(받는사람)',800,600);">주소록</button> --%>
										<button type="button" class="btn btn-default btn-sm" onclick="openChildReceiver();">주소록</button>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<select id="mailTo" class="select2bs4 select2-hidden-accessible" name="mailTo" multiple="" style="width: 100%;" tabindex="-1" aria-hidden="true">
												<c:if test="${!empty empList}">
													<c:forEach items="${empList}" var="emp">
														<c:if test="${(emp.empId).indexOf('EMP') ne  0 && emp.empCode ne loginUser.empCode}">
															<option value="${emp.empCode}" style="color : black;"<c:if test="${!empty mail.mailToEmpList}"><c:forEach items="${mail.mailToEmpList}" var="mailTo">${mailTo.empId eq emp.empId ? 'selected' : ''}</c:forEach></c:if>>
																${emp.empId}@offispace.com[${emp.empName}&nbsp;${emp.positionValue}]
															</option>
														</c:if>
													</c:forEach>
												</c:if>
											</select>
											<input type="hidden" value="">
										</div>
										<%-- <input class="form-control form-control-sm" name="mailTo" <c:if test="${!empty mail.mailTo}">value="${mail.mailTo}"</c:if> > --%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<div class="row">
									<div class="col-md-1">
										<label for="reference">참조 </label>
									</div>
									<div class="col-md-1">
										<%-- <button type="button" class="btn btn-default btn-sm" onclick="OpenWindow('<%=request.getContextPath()%>/mail/referencerListForm','주소록(참조자)',800,600);">주소록</button> --%>
										<button type="button" class="btn btn-default btn-sm" onclick="openChildReferencer();">주소록</button>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<select id="mailReference" class="select2bs4 select2-hidden-accessible" name="mailRef" multiple="multiple" style="width: 100%;" tabindex="-1" aria-hidden="true">
												<c:if test="${!empty empList}">
													<c:forEach items="${empList}" var="emp">
														<c:if test="${(emp.empId).indexOf('EMP') ne  0 && emp.empCode ne loginUser.empCode}">
															<option value="${emp.empCode}" <c:if test="${!empty mail.mailRefEmpList}"><c:forEach items="${mail.mailRefEmpList}" var="mailRef">${mailRef.empId eq emp.empId ? 'selected' : ''}</c:forEach></c:if>>
																${emp.empId}@offispace.com[${emp.empName}&nbsp;${emp.positionValue}]
															</option>
														</c:if>
													</c:forEach>
												</c:if>
											</select>
											<input type="hidden" value="">
										</div>
										<%-- <input class="form-control form-control-sm" name="mailReference" <c:if test="${!empty mail.mailReference}">value="${mail.mailReference}"</c:if> value="${mail.mailReference}"> --%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<div class="row">
									<div class="col-md-1">
										<label for="reference">제목 </label>
									</div>
									<div class="col-md-1">
										<input type="checkbox" ${mail.mailImportance eq 'Y' ? 'checked' : '' } value="Y" id="imporCheck" onchange="import_go()">
										<label for="imporCheck">
											중요
											<i class="fas fa-exclamation" style="color: red;"></i>
										</label>
									</div>
									<div class="col-md-10">
										<input class="form-control form-control-sm" name="mailTitle" value="${mail.mailTitle}">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
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
								<div class="col-md-10">
									<div class="row">
										<div class="fileInput" id="preview">
											<ul class="mailbox-attachments" id="fileBox">
											<c:if test="${!empty mail.attachList}">
												<c:forEach items="${mail.attachList}" var="attach" >
		                                            <li style="width: 100%;border: none;" class="attach-item ${attach.attachCode}" id="${attach.attachCode}"  file-name="${attach.attachSavename}">
	                                                    <a class="mailbox-attachment-name" name="attachedFile" href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}"  >
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
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea id="content" name="mailCont" style="height: 300px; display: none;">${mail.mailCont}</textarea>
						</div>
					</form>
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<div class="float-right">
						<button type="button" class="btn btn-default btn-sm" onclick="main_tempStore()">
							<i class="far fa-save"></i>&nbsp;
							임시저장
						</button>
						<button type="button" class="btn btn-default btn-sm" onclick="preview()">
							<i class="far fa-eye"></i>&nbsp;
							미리보기
						</button>
						<button type="button" class="btn btn-info btn-sm" onclick="main_transfer()">
							<i class="far fa-envelope"></i>
							보내기
						</button>
					</div>
					<button type="reset" class="btn btn-default btn-sm" onclick="reset()">
						<i class="fas fa-undo-alt"></i>&nbsp;
						초기화
					</button>
					<button type="button" class="btn btn-default btn-sm" onclick="javascript:window.close();">
<!-- 								<i class="far fa-window-close"></i> -->
						닫기
					</button>
				</div>
				<!-- /.card-footer -->
			</div>
			<!-- /.card -->
		</section>
	</div>



	<%@ include file="./mailFunction.jsp" %>
	<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>

	<script>
	window.onload = function() {
			summernote_go($('textarea#content'), 300);

			$(document).ready(function() {
				$('.select2bs4').select2({
			        	theme: 'bootstrap4',
						allowClear: true,
						tags: true,
					    tokenSeparators: [',', ' '],
					    maximumSelectionLength: 5
				});
			 });

			const attached = document.querySelector('#attached');
			const form = document.querySelector('form[name="registerPostForm"]');
			const newFile = document.querySelector('#newFile');

			attached.style.opacity=0;
			attached.addEventListener('change', updateFileDisplay);
	}

	var opening;

	function openChildReceiver()
	{
		opening=window.open('<%=request.getContextPath()%>/mail/receiverListForm','받는 사람 열림','width=800,height=600');
	}

	function openChildReferencer()
	{
		opening=window.open('<%=request.getContextPath()%>/mail/referencerListForm','받는 사람 열림','width=800,height=600');
	}

	function setChildReceiver()
	{
		var temp=opening.document.getElementById('final').value;
		addList=temp.split(",");
		console.log(addList);
		//${emp.empId}@offispace.com[${emp.empName}&nbsp;${emp.positionValue}]
		for (var i=0;i<addList.length;i++)
		{
			//$('#mailTo').append('<option value="" selected>'+addList[i]+'offispace.com[]&nbsp;</option>');
			var emp=addList[i];
			$.ajax({
	        	url:'<%=request.getContextPath()%>/mail/addReceiver?empCode='+emp,
	            type:'get',
	            success:function(success){
	            	//alert(success[0].empName);
	                if(success) //있으면
	                {
	                	$('#mailTo').append('<option value="'+success.empCode+'" selected>'+success.empId+'@offispace.com['+success.empName+'&nbsp;'+success.positionValue+']</option>');
	                }
	            },
	            error:function(error){
	            	//alert("시스템장애로 가입이 불가합니다.");
	            	AjaxErrorSecurityRedirectHandler(error.status);
	        	}
	    	});
		}
	}

	function setChildReferencer()
	{
		var temp=opening.document.getElementById('final').value;
		addList=temp.split(",");
		console.log(addList);
		//${emp.empId}@offispace.com[${emp.empName}&nbsp;${emp.positionValue}]
		for (var i=0;i<addList.length;i++)
		{
			//$('#mailTo').append('<option value="" selected>'+addList[i]+'offispace.com[]&nbsp;</option>');
			var emp=addList[i];
			$.ajax({
	        	url:'<%=request.getContextPath()%>/mail/addReceiver?empCode='+emp,
	            type:'get',
	            success:function(success){
	            	//alert(success[0].empName);
	                if(success) //있으면
	                {
	                	$('#mailReference').append('<option value="'+success.empCode+'" selected>'+success.empId+'@offispace.com['+success.empName+'&nbsp;'+success.positionValue+']</option>');
	                }
	            },
	            error:function(error){
	            	//alert("시스템장애로 가입이 불가합니다.");
	            	AjaxErrorSecurityRedirectHandler(error.status);
	        	}
	    	});
		}
	}

	</script>

<!-- 미리보기 모달 -->
	<div class="modal fade show" id="previewModal" aria-modal="true" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">미리보기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
					<b>제목</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="preMailTitle"></div>
					</div>
					<div class="row">
					<b>받는 사람</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="preMailTo"></div>
					</div>
					<div class="row">
					<b>보내는 사람</b> &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="preMailFrom">${loginUser.empName} &nbsp;[<b>${loginUser.empId}@offispace.com</b>]</div>
					</div>
					<div class="row">
					<b>참조자</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
							<div id="preMailReference"></div>
					</div>
					<hr>
					<div class="row">
					<b>첨부파일</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
							<div id="preMailFile"></div>
					</div>
					<hr>
					<p><b>내용</b></p>
					<div id="preMailContent" style="height: 400px;"></div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">전송하기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>


</body>
