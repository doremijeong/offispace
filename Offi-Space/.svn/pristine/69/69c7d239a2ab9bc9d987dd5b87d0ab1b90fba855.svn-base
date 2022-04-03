<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head></head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>내게쓰기</h5>
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
						<i class="fas fa-undo-alt"></i>
						초기화
					</button>
						<button type="button" class="btn btn-default btn-sm" onclick="javascript:history.go(-1);">
<!-- 								<i class="far fa-window-close"></i> -->
								취소
							</button>
					</div>
						<div class="d-flex justify-content-end">

							&nbsp;
							<button type="button" class="btn btn-default btn-sm" onclick="tempStore()">
								<i class="far fa-save"></i>&nbsp;
								임시저장
							</button>
							&nbsp;
								<button type="button" class="btn btn-default btn-sm" onclick="preview()">
							<i class="far fa-eye"></i>
							미리보기
						</button>
						&nbsp;
							<button type="button" class="btn btn-info btn-sm" onclick="gogo()">
								<i class="far fa-envelope"></i>
								저장
							</button>
							&nbsp;
						</div>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form action="register.do" method="post" enctype="multipart/form-data" name="registerForm">
						<div class="form-group">
							<div class="row">
								<div class="col-md-1">
									<label for="title">제목</label>
								</div>
								<div class="col-md-1">
									<input type="hidden" value="${mail.mailCode}" name="mailCode">
									<input type="hidden" value="${loginUser.empCode}" name="mailTo">
									<input type="hidden" value="${loginUser.empCode}" name="mailFrom">
									<input type="checkbox" ${mail.mailImportance eq 'Y' ? 'checked' : '' } value="Y" onchange="import_go()" id="imporCheck">
									<label for="check1">
										중요
										<i class="fas fa-exclamation" style="color: red;"></i>
									</label>
								</div>
								<div class="col-md-10">
									<input class="form-control form-control-sm" name="mailTitle" value="${mail.mailTitle}">
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
                     	<span class="btn btn-outline-success btn-sm">
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
							<textarea id="content" name="mailCont" class="form-control" style="height: 300px; display: none;">${mail.mailCont}</textarea>
						</div>
					</form>
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
				<div class="float-left">
					<button type="button" class="btn btn-default btn-sm" onclick="reset()">
						<i class="fas fa-undo-alt"></i>
						초기화
					</button>
						<button type="button" class="btn btn-default btn-sm" onclick="javascript:history.go(-1);">
<!-- 								<i class="far fa-window-close"></i> -->
								취소
							</button>
					</div>
					<div class="float-right">
						<button type="button" class="btn btn-default btn-sm" onclick="tempStore()">
							<i class="far fa-save"></i>
							임시저장
						</button>
						<button type="button" class="btn btn-default btn-sm" onclick="preview()">
							<i class="far fa-eye"></i>
							미리보기
						</button>
						<button type="button" class="btn btn-info btn-sm" onclick="gogo()">
							<i class="far fa-envelope"></i>
							저장
						</button>
					</div>

				</div>
				<!-- /.card-footer -->
			</div>
			<!-- /.card -->
		</section>
	</div>

	<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
	<%@ include file="./mailFunction.jsp"%>

	<script>
		window.onload = function() {
			summernote_go($('#content'), 400);

			const attached = document.querySelector('#attached');
			const form = document.querySelector('form[name="registerPostForm"]');
			const newFile = document.querySelector('#newFile');

			attached.style.opacity=0;
			attached.addEventListener('change', updateFileDisplay);

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
