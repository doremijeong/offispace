<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="recievedMailList" value="${dataMap.recievedMailList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="mailCri" value="${dataMap.pageMaker.mailCri}" />
<c:set var="notReadCnt" value="${dataMap.notReadMailCount}"/>
<c:set var="mailCnt" value="${dataMap.totalCount}" />


<head>
<style>
	.mailTitle {
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
		width: 20%;
	}
	.mailbox-subject{
		width: 45%;
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
<script>
loaderShow();
</script>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<h5>받은 메일함</h5>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<ol class="breadcrumb float-sm-left" >
								<li class="breadcrumb-item">
									<span style="color: blue;">${notReadCnt}</span>
								</li>
								<li class="breadcrumb-item active">${mailCnt}</li>
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
									<button type="button" class="btn btn-default btn-sm" onclick="replyCheck()">답장</button>
									<button type="button" class="btn btn-default btn-sm" onclick="relayCheck()">전달</button>
									<button type="button" class="btn btn-default btn-sm" onclick="moveToStoreCheck()">보관</button>
									<!-- <button type="button" class="btn btn-default btn-sm">중요메일보기</button> -->
									<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
										<i class="fas fa-sync-alt"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-tools">
								<div class="input-group input-group-sm">
									<button type="button" class="btn btn-default btn-sm" id="btn_detail_search" onclick="searchDetail()">상세검색</button>
									<select class="custom-select input-group input-group-sm" name="kindOfMail" id="kindOfMail" onchange="stateChange()">
										<option>상태</option>
										<option value="notRead" ${cri.kindOfMail eq 'notRead' ? 'selected' : ''}>안읽음</option>
										<option value="import" ${cri.kindOfMail eq 'import' ? 'selected' : ''}>중요</option>
									</select>
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
								<c:if test="${empty recievedMailList}">
									<tr style="padding: 3px;">
										<td colspan="5" class="text-center">
											해당하는 메일이 없습니다.
										</td>
									</tr>
								</c:if>
								<c:if test="${!empty recievedMailList}">
									<c:forEach items="${recievedMailList}" var="mail">
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
									                      		data-emp-name='${mail.mailFromEmp.empName }'
									                      		data-emp-telephone='${mail.mailFromEmp.empTelephone }'
									                      		data-emp-email='${mail.mailFromEmp.empEmail }'
									                      		data-position-value='${mail.mailFromEmp.positionValue }'
									                      		data-team-value='${mail.mailFromEmp.teamValue }'
									                      		data-group-value='${mail.mailFromEmp.groupValue }'
									                      		data-attach-savename='${mail.mailFromEmp.attachSavename }'
									                      		>
													${mail.mailFromEmp.empName}&nbsp;${mail.mailFromEmp.positionValue}[${mail.mailFromEmp.empId}@offispace.com]
												</a>
											</td>
											<td class="mailbox-subject" onclick="mailDetail('${mail.mailCode}','${mailCri.kindOfMail}');" style="cursor: pointer;">
												<div style="width: 100%;" class="mailTitle">
													<b>${mail.mailTitle}</b>
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
				<%@ include file="mailPageNation.jsp" %>
				<%@ include file="mailFunction.jsp" %>
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

	loaderHide();
	setTooltips();
}

function stateChange() {
	$("[name='kindOfMail']").val($('#kindOfMail option:selected').val());
	list_go(1);
	loaderShow();
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
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary btn-sm" style="margin-right: 5px;" onclick="search_go();">검색</button>
				</div>
		</div>
	</div>
</div>
</body>
