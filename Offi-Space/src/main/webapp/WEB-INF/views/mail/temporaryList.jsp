<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="mailList" value="${dataMap.sendTempMailList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="mailCri" value="${dataMap.pageMaker.mailCri}" />
<c:set var="notReadCnt" value="${mailCntMap.notReadCnt}" />
<c:set var="mailCnt" value="${pageMaker.totalCount}" />

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
		width: 7%;
		margin-right: 15px;
	}
	.mailbox-star{
		width: 5%;
	}
	.mailbox-name{
		width: 25%;
	}
	.mailbox-subject{
		width: 38%;
	}
	.mailbox-attachment{
		width: 5%;
	}
	.mailbox-date{
		width: 20%;
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
				<div class="row mb-2">
					<div class="col-sm-6">
						<div class="row">
							<h5>임시 보관함</h5>
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
									<button type="button" class="btn btn-default btn-sm">전달</button>
									<button type="button" class="btn btn-default btn-sm" onclick="refresh()">
										<i class="fas fa-sync-alt"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-tools">
								<div class="input-group input-group-sm">
									<button type="button" class="btn btn-default btn-sm" id="btn_detail_search">상세검색</button>
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
												<div class="row justify-content-between">
													<div onclick="importance_go('${mail.mailCode}')" style="margin-right: 20px;">
														<c:if test="${mail.mailImportance eq 'Y'}">
															<i class="fas fa-star text-warning"></i>
														</c:if>
														<c:if test="${mail.mailImportance eq 'N'}">
															<i class="far fa-star"></i>
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
											<td class="mailbox-subject" onclick="tempGO('${mail.mailCode}');" style="cursor: pointer;">
												<div class="mailTitle" style="width: 100%;">
													<c:if test="${!empty mail.mailTitle}">
														<b>${mail.mailTitle}</b>
													</c:if>
													<c:if test="${empty mail.mailTitle}">
														<b>(제목없음)</b>
													</c:if>
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
<script type="text/javascript">
window.onload = function() {
		loaderHide();
		setTooltips();

		if(${from eq "regist"}){
			 Swal.fire({
				  title: '메일을 임시저장하였습니다.',
				  icon: 'success',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
		
}
</script>
</body>
