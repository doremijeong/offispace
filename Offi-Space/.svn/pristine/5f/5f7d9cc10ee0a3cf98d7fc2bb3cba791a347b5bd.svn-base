<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="tempList" value="${dataMap.tempList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />

<head>
<style type="text/css">
.emergency{
	width: 10%;
}
.importance{
	width: 10%;
}
.apvFormName{
	width: 20%;
}
.apvTitle{
	width: 40%;
}
.teamValue{
	width: 15%;
}
.apvDraftDt{
	width: 15%;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-4">
						<div class="row">
							<h5>임시보관함</h5>
						</div>
					</div>
					<div class="col-sm-8">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">전자결재</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="card card-info card-outline" style="height: 700px;">
				<div class="card-header">
					<div class="row">
						<div class="col-md-5 ">
							<div class="mailbox-controls">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="col-md-7">
							<div class="card-tools row d-flex justify-content-end">
								<div class="input-group" style="width: 100px;">
									<select class="form-control form-control-sm" id="stateSelect" onchange="state_go()">
										<option value="">상태</option>
										<option ${cri.option eq 'e' ? 'selected' : ''} value="e">긴급</option>
										<option ${cri.option eq 'i' ? 'selected' : ''} value="i">중요</option>
									</select>
								</div>
								&nbsp;
								<select class="form-control form-control-sm" style="width: 150px;" id="formSelect" onchange="formSelect()">
									<option value="">양식명</option>
									<option ${cri.formKind eq 'AF0009' ? 'selected' : ''} value="AF0009">외근신청서</option>
									<option ${cri.formKind eq 'AF0005' ? 'selected' : ''} value="AF0005">품의서</option>
									<option ${cri.formKind eq 'AF0004' ? 'selected' : ''} value="AF0004">기안문</option>
									<option ${cri.formKind eq 'AF0006' ? 'selected' : ''} value="AF0006">재직증명서</option>
									<option ${cri.formKind eq 'AF0007' ? 'selected' : ''} value="AF0007">경력증명서</option>
									<option ${cri.formKind eq 'AF0010' ? 'selected' : ''} value="AF0010">협조문</option>
									<option ${cri.formKind eq 'AF0011' ? 'selected' : ''} value="AF0011">연차신청서</option>
									<option ${cri.formKind eq 'AF0012' ? 'selected' : ''} value="AF0012">재택근무신청서</option>
									<option ${cri.formKind eq 'AF00013' ? 'selected' : ''} value="AF00013">사직서</option>
									<option ${cri.formKind eq 'AF0001' ? 'selected' : ''} value="AF0001">시말서</option>
									<option ${cri.formKind eq 'AF0002' ? 'selected' : ''} value="AF0002">휴가신청서</option>
									<option ${cri.formKind eq 'AF0003' ? 'selected' : ''} value="AF0003">출장신청서</option>
									<option ${cri.formKind eq 'AF0008' ? 'selected' : ''} value="AF0008">연장근무신청서</option>
								</select>
								&nbsp;
								<div class="input-group-append input-group-sm" style="width: 300px;">
									<input type="text" name="keyword" class="form-control float-right" placeholder="검색">

									<div class="input-group-append">
										<button type="submit" class="btn btn-info" style="border-radius:0px 3px 3px 0px;">
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
							<thead style="font-size: 0.95em;">
								<tr class="text-center">
									<th></th>
									<th>양식명</th>
									<th>제목</th>
									<th>기안부서</th>
									<th>기안일</th>
								</tr>
							</thead>
							<tbody style="font-size: 0.8em;">
								<c:if test="${empty tempList}">
									<tr class="text-center">
										<td colspan="5">임시보관 중인 기안문이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty tempList}">
									<c:forEach items="${tempList}" var="apv">
										<tr onclick="temp_go('${apv.apvCode}')">
											<c:if test="${apv.apvEmergency eq 'Y'}">
												<td class="text-center emergency">
													<span class="badge bg-danger">긴급</span>
												</td>
											</c:if>
											<c:if test="${apv.apvImportance eq 'Y'}">
												<td class="text-center importance">
													<span class="badge bg-primary">중요</span>
												</td>
											</c:if>
											<c:if test="${apv.apvImportance ne 'Y' && apv.apvEmergency eq 'N'}">
												<td class="text-center importance">
												</td>
											</c:if>
											<td class="text-center apvFormName">${apv.apvForm.apvFormName}</td>
											<c:if test="${!empty apv.apvTitle}">
												<td class="apvTitle">${apv.apvTitle}</td>
											</c:if>
											<c:if test="${empty apv.apvTitle}">
												<td class="apvTitle">${apv.apvForm.apvFormName} 신청</td>
											</c:if>
											<td class="text-center teamValue">${apv.dratfEmp.teamValue}</td>
											<td class="text-center apvDraftDt"><fmt:formatDate value="${apv.apvDraftDt}" pattern="YYYY-MM-dd"/>(<fmt:formatDate value="${apv.apvDraftDt}" pattern="E"/>) </td>
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
					<%@ include file="pagination.jsp"%>

				<script>
		window.onload = function() {
			if('${from}'){
				Swal.fire({
					  title: '결재를 임시저장하였습니다.',
					  icon: 'success',
					  showConfirmButton: false,
					  timer: 1500
					});
			}
		}

		function temp_go(apvCode) {
			location.href = "<%=request.getContextPath()%>/approval/temp?apvCode=" + apvCode;
		}

		// 상태 검색 함수
		function state_go() {
			var jobForm = $('#jobForm');
			jobForm.find("[name='option']").val($('#stateSelect option:selected').val());
			list_go(1);
		}

		// 양식 검색
		function formSelect() {
			var jobForm = $('#jobForm');
			jobForm.find("[name='formKind']").val($('#formSelect option:selected').val());
			list_go(1);
		}



	</script>
</body>
