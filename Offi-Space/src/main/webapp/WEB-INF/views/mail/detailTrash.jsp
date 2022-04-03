<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head></head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-12">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">사내메일</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="card card-info card-outline">
				<div class="card-header">
					<div>
						<h5 class="card-title"  style="margin-top: 5px;">휴지통</h5>
					</div>
					<div class="float-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete" onclick="realRemove('${mail.mailCode}')">
								<i class="far fa-trash-alt"></i>
								영구삭제
							</button>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm" data-container="body" title="return" onclick="restore('${mail.mailCode}')">
								복구
							</button>
							<button type="button" class="btn btn-default btn-sm" data-container="body" title="list" onclick="backToList('trash')">
								목록
							</button>
						</div>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0">
					<div class="mailbox-read-info">
						<div class="row">
							<div class="text-center" style="width: 60px;">
								<c:if test="${mail.mailImportance eq 'Y'}">
									<h4>
										<i class="fas fa-star text-warning"></i>
									</h4>
								</c:if>
								<c:if test="${mail.mailImportance eq 'N'}">
									<h4>
										<i class="far fa-star"></i>
									</h4>
								</c:if>
							</div>
							<div>
								<h4>
									<b>${mail.mailTitle}</b>
								</h4>
							</div>
						</div>
						<div class="row d-flex justify-content-between">
							<div style="font-size: 0.8em;">
								<div class="row" style="margin-left: 5px;">
									<div style="margin-right: 5px;">
										보낸 사람 :
									</div>
									<div>
										${mail.mailFromEmp.empName}&nbsp;${mail.mailFromEmp.positionValue}[${mail.mailFromEmp.empId}@offispace.com]
									</div>
								</div>
								<div class="row" style="margin-left: 5px;">
									<div style="margin-right: 5px;">받는 사람 :</div>
									<div>
									<c:set value="0" var="a"/>
									<c:forEach items="${mail.mailToEmpList}" var="empTo">
										<c:if test="${a gt 0}">,&nbsp;</c:if>
										<c:if test="${a gt 0 && a % 3 eq 0}"><br></c:if>
										${empTo.empName}&nbsp;${empTo.positionValue}[${empTo.empId}@offispace.com]
										<c:set value="${a + 1}" var="a"/>
									</c:forEach>
									</div>
								</div>
								<br />
								<c:set value="0" var="b"/>
								<c:if test="${fn:length(mail.mailRefEmpList) gt 0}">
									<div class="row" style="margin-left: 5px;">
										<div style="margin-right: 5px;">참조자 :</div>
										<div>
										<c:forEach items="${mail.mailRefEmpList}" var="empRef">
											<c:if test="${b gt 0}">,&nbsp;</c:if>
											${empRef.empName}&nbsp;${empRef.positionValue}[${empRef.empId}@offispace.com]
											<c:set value="${b + 1}" var="b"/>
										</c:forEach>
										</div>
									</div>
								</c:if>
							</div>
							<span class="mailbox-read-time float-right">
								<fmt:formatDate value="${mail.mailDate}" pattern="YYYY-MM-dd(E) HH:mm" />&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
						</div>
					</div>
					<div class="mailbox-read-message" style="height: auto; font-size: 0.8em;">
						${mail.mailCont eq null ? '(내용 없음)' : mail.mailCont}
					</div>
					<!-- /.mailbox-read-message -->
				</div>
				<!-- /.card-body -->
				<div class="card-footer bg-white">
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
						<c:if test="${!empty mail.attachList}">
							<c:forEach items="${mail.attachList}" var="attach">
								<li onclick="location.href='<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}';">
									<span class="mailbox-attachment-icon">
										<c:if test="${attach.attachExtension eq 'pdf'}">
											<i class="fas fa-file-pdf"></i>
										</c:if>
										<c:if test="${attach.attachExtension eq 'jpg' || attach.attachExtension eq 'png'}">
											<i class="fas fa-camera"></i>
										</c:if>
										<c:if test="${attach.attachExtension ne 'jpg' && attach.attachExtension ne 'png' && attach.attachExtension ne 'pdf'}">
											<i class="fas fa-camera"></i>
										</c:if>
									</span>

									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name">
											<i class="fas fa-paperclip"></i>
											${attach.attachSavename}
										</a>
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.card-footer -->
				<div class="card-footer">
					<div class="float-right">
						<button type="button" class="btn btn-default btn-sm" onclick="realRemove('${mail.mailCode}')">
							<i class="far fa-trash-alt"></i>
							영구삭제
						</button>
						<button type="button" class="btn btn-default btn-sm" onclick="backToList()">
							<i class="fas fa-list"></i>
							목록
						</button>
					</div>
				</div>
				<!-- /.card-footer -->
			</div>

		</section>
	</div>

	<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
	<%@ include file="./mailFunction.jsp"%>

	<script>
window.onload = function() {
	summernote_go($('textarea#content'));
}
</script>
</body>
