<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="mailList" value="${dataMap.sendMailList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="mailCri" value="${dataMap.pageMaker.mailCri}" />
<c:set var="mailCnt" value="${pageMaker.totalCount}" />


<head>
<style>
	.mailTitle {
		width: 400px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	table{
		font-size: 0.8em;
	}
	.icheck-primary{
		width: 5%;
		margin-right: 15px;
	}
	.mailbox-star{
		width: 10%;
	}
	.mailbox-name{
		width: 25%;
	}
	.mailbox-subject{
		width: 40%;
	}
	.mailbox-attachment{
		width: 5%;
	}
	.mailbox-date{
		width: 15%;
	}
</style>
</head>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<div class="row">
							<h5>보낸 메일함</h5>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<ol class="breadcrumb float-sm-left" style="margin-top: 10px;">
								<li class="breadcrumb-item active" style="line-height: 6px;">${mailCnt}</li>
							</ol>
						</div>
					</div>
					<div class="col-sm-6">
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
					<div class="row">
						<div class="col-md-6 ">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<!-- /.btn-group -->
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm checkbox-toggle">
										<i class="far fa-square"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm" onclick="moveToTrachCheck()">
										<i class="far fa-trash-alt"></i>
										삭제
									</button>
									<button type="button" class="btn btn-default btn-sm">답장</button>
									<button type="button" class="btn btn-default btn-sm">전달</button>
									<button type="button" class="btn btn-default btn-sm" onclick="moveToStoreCheck()">보관</button>
									<!-- <button type="button" class="btn btn-default btn-sm">중요메일보기</button> -->
									<button type="button" class="btn btn-default btn-sm" onclick="refresh();">
										<i class="fas fa-sync-alt"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-tools">
								<div class="input-group input-group-sm">
									<button type="button" class="btn btn-default btn-sm" id="btn_detail_search" onclick="searchDetail()">상세검색</button>
									<select class="custom-select input-group input-group-sm" name="searchType" id="searchType">
										<option>검색분류</option>
										<option value="all" ${cri.searchType eq 'all' ? 'selected' : ''}>전체검색</option>
										<option value="title" ${cri.searchType eq 'title' ? 'selected' : ''}>제목</option>
										<option value="content" ${cri.searchType eq 'content' ? 'selected' : ''}>내용</option>
									</select>
									<input type="text" class="form-control input-group-sm float-right" style="width: 100px;" placeholder="검색어를 입력하세요." name="keyword">
									<div class="input-group-append input-group-sm">
										<button type="button" class="btn btn-info btn-sm" onclick="list_go(1);">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-tools -->
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0">

					<div class="table-responsive mailbox-messages">
						<table class="table table-sm table-hover">
							<tbody>
								<c:if test="${empty mailList}">
									<tr>
										<td colspan="5" class="text-center">
											해당하는 메일이 없습니다.
										</td>
									</tr>
								</c:if>
								<c:if test="${!empty mailList}">
									<c:forEach items="${mailList}" var="mail">
										<script>
									</script>
										<tr>
											<td onclick="event.cancelBubble=true;">
												<input type="checkbox" value="${mail.mailCode}" name="checkBox1[]" class="checkSelect">
											</td>
											<td class="mailbox-star text-center">
												<div class="row justify-content-center">
													<div onclick="importance_go('${mail.mailCode}')" style="margin-right: 20px;">
														<c:if test="${mail.mailImportance eq 'Y'}">
															<i class="fas fa-star text-warning"></i>
														</c:if>
														<c:if test="${mail.mailImportance eq 'N'}">
															<i class="far fa-star"></i>
														</c:if>
													</div>
													<div>
															<c:if test="${mail.mailStatus eq 'N'}">
															<i class="fas fa-envelope text-info"></i>
														</c:if>
														<c:if test="${mail.mailStatus eq 'Y'}">
															<i class="far fa-envelope-open text-info"></i>
														</c:if>
													</div>
												</div>
											</td>
											<td class="mailbox-name">
												<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
									                      		data-emp-name='${mail.mailToEmpList[0].empName }'
									                      		data-emp-telephone='${mail.mailToEmpList[0].empTelephone }'
									                      		data-emp-email='${mail.mailToEmpList[0].empEmail }'
									                      		data-position-value='${mail.mailToEmpList[0].positionValue }'
									                      		data-team-value='${mail.mailToEmpList[0].teamValue }'
									                      		data-group-value='${mail.mailToEmpList[0].groupValue }'
									                      		data-attach-savename='${mail.mailToEmpList[0].attachSavename }'
									                      		>
													${mail.mailToEmpList[0].empName}&nbsp;${mail.mailToEmpList[0].positionValue}[${mail.mailToEmpList[0].empId}@offispace.com]
													<c:if test="${fn:length(mail.mailToEmpList) gt 1}">
														외&nbsp;${mail.mailToCount -  1}명
													</c:if>
												</a>
											</td>
											<td class="mailbox-subject"  onclick="mailDetail('${mail.mailCode}', '${mailCri.kindOfMail}');" style="cursor: pointer;">
												<div class="float-left" style="width: 100%">
												<div class="mailTitle">
													<b>${mail.mailTitle}</b>
												</div>
												</div>
											</td>
											<td class="mailbox-attachment">
												<c:if test="${!empty mail.attachList }">
													<i class="fas fa-paperclip"></i>
												</c:if>
											</td>
											<td class="mailbox-date">
												<fmt:formatDate value="${mail.mailDate}" pattern="YYYY-MM-dd(E) HH:mm" />
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<!-- /.table -->
					</div>
					<!-- /.mail-box-messages -->
				</div>
				<!-- /.card-body -->
				<%@ include file="./mailPageNation.jsp" %>
	<%@ include file="./mailFunction.jsp" %>
<script>
window.onload = function() {
	$(document).ready(function() {
		$('.select2bs4').select2({
	        	theme: 'bootstrap4',
				allowClear: true,
				tags: true,
			    tokenSeparators: [',', ' '],
			    maximumSelectionLength: 5
		});
	 });

	setTooltips();

	if(${from eq "regist"}){
		Swal.fire({
			  title: '메일을 전송하였습니다.',
			  icon: 'success',
			  showConfirmButton: false,
			  timer: 1500
			});
	}
}

</script>
	<div class="modal" id="searchDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="row">
					<h5 style="margin: 0; display: inline-block;">상세검색</h5>
				</div>
			</div>
			<!-- modal header-->
				<input type="hidden" name="empCode" value="${loginUser.empCode}" />
				<div class="modal-body">
					<div class="form-group row">
						<label for="scdTitle" class="col-sm-2 col-form-label">수신자</label>
						<div class="col-sm-10">
							<select id="to" class="select2bs4 select2-hidden-accessible" name="to" style="width: 100%;" tabindex="-1" aria-hidden="true">
								<option value="" style="color: black;">선택</option>
								<c:if test="${!empty empList}">
									<c:forEach items="${empList}" var="emp">
										<c:if test="${(emp.empId).indexOf('EMP') ne  0 && emp.empCode ne loginUser.empCode}">
											<option value="${emp.empCode}" style="color: black;">${emp.empName}&nbsp;${emp.positionValue}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
							<input type="hidden" value="">
						</div>
					</div>

					<div class="form-group row">
						<label for="scdTitle" class="col-sm-2 col-form-label">발신자</label>
						<div class="col-sm-10">
							<select id="from" class="select2bs4 select2-hidden-accessible" name="from" style="width: 100%;" tabindex="-1" aria-hidden="true">
								<option value="" style="color: black;">선택</option>
								<c:if test="${!empty empList}">
									<c:forEach items="${empList}" var="emp">
										<c:if test="${(emp.empId).indexOf('EMP') ne  0 && emp.empCode ne loginUser.empCode}">
											<option value="${emp.empCode}" style="color: black;">${emp.empName}&nbsp;${emp.positionValue}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
							<input type="hidden" value="">
						</div>
					</div>

					<div class="form-group row">
						<label for="scdTitle" class="col-sm-2 col-form-label">기간</label>
						<div class="col-sm-10 row">
							<div class="col-sm-5">
								<input type="date" name="sDate" id="sDate" class="form-control form-control-sm">
							</div>
							<div class="col-sm-1 text-center">
								~
							</div>
							<div class="col-sm-5">
								<input type="date" name="eDate" id="eDate" class="form-control form-control-sm">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row d-flex justify-content-end">
						<button type="button" class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="search_go();">검색</button>
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">닫기</span>
						</button>
					</div>
				</div>
		</div>
	</div>
</div>
</body>
