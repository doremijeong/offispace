<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="apvList" value="${apvList }" />
<c:set var="apvReqList" value="${dataMap.requestList}" />

<style>
.apvTitle-div{
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
<title>전자결재</title>
<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header" style="padding-bottom: 0px;">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>전자결재</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">Home</a>
							</li>
							<li class="breadcrumb-item active">전자결재 메인</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">

				<!-- 위젯 -->
				<div class="row">
					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-info">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="waitCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">결재할 문서</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-success">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="habCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">합의할 문서</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-warning">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="ingCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">진행중 문서</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-secondary">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="tempCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">임시보관함</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-danger">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="refuseCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">반려된 문서</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-2 col-sm-6 col-12">
						<div class="info-box bg-primary">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h5 style="margin: 0px;" id="requestCnt">0</h5>
								</span>
								<span class="info-box-text text-center text-bold">기안한 문서</span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
				</div>

				<!-- 퀵메뉴슬라이드 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card" style="background-color: hsla(9, 100%, 64%, 0);">
							<!-- /.card-header -->
							<div class="card-body" style="padding-bottom: 0.3em;">
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators" style="margin-bottom: 0;">
										<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>

										<c:set var="size" value="${fn:length(apvList)}" />
										<c:if test="${(apvList ne null)&&(fn:length(apvList) ne 0) && size > 4}">
											<c:forEach var="i" begin="1" end="${(size/4)}">
												<li data-target="#carouselExampleIndicators" data-slide-to="${i}" class=""></li>
											</c:forEach>
										</c:if>
									</ol>

									<div class="carousel-inner">

										<c:choose>
											<c:when test="${(apvList ne null)&&(fn:length(apvList) ne 0)}">
												<c:set var="size" value="${fn:length(apvList)}" />
												<c:forEach var="i" begin="0" end="0">
													<div class="carousel-item active">
														<div class="row" alt="${i} slide">

															<c:choose>
																<c:when test="${ size <= 4}">
																	<c:set var="endPoint" value="${size }" />
																</c:when>
																<c:otherwise>
																	<c:set var="endPoint" value="${(i*4)+4 }" />
																</c:otherwise>
															</c:choose>

															<c:forEach var="j" begin="${ (i*4)+1}" end="${endPoint }">
																	<c:if test="${apvList[j-1].apvEmergency eq 'Y'}">
																		<!-- Quick Card  -->
																		<div class="col-lg-3" style="height: 250px;">
																			<div class="position-relative " style="height: 180px">
																				<div class="ribbon-wrapper">
																					<div class="ribbon bg-danger">긴급</div>
																				</div>
																				<div class="card card-info card-outline">
																					<div class="card-body">
																						<div class="row" style="justify-content: space-between; align-items: baseline;">
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="yyyyMMdd" var="date" />
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="E" var="today" />
																							<h6>${fn:substring(date,0,4)}</h6>
																						</div>
																						<div class="row" style="align-items: baseline;">
																							<h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)}(${today})</h2>
																							<span style="color: gray">&nbsp;&nbsp;마감</span>
																						</div>
																						<c:set var="apvTitle" value="${apvList[j-1].apvTitle}" />
																						<c:if test="${apvTitle.length() ge 11}">
																							<h6>${fn:substring(apvTitle,0,12)}...</h6>
																						</c:if>
																						<c:if test="${apvTitle.length() lt 11}">
																							<h6>${apvTitle }</h6>
																						</c:if>
																						<c:if test="${empty apvTitle}">
																							<h6>${apvList[j-1].apvForm.apvFormName}&nbsp;신청</h6>
																						</c:if>
																						<p style="font-size: 0.8em;">기안자 : ${apvList[j-1].dratfEmp.empName }&nbsp;${apvList[j-1].dratfEmp.positionValue }</p>
																						<a href="javascript:void(0);" onclick="detail('${apvList[j-1].apvCode}');" class="btn btn-outline-primary btn-block">
																							<c:if test="${apvList[j-1].kindCode eq 'AK0001'}">
																								<b>결재하기</b>
																							</c:if>
																							<c:if test="${apvList[j-1].kindCode eq 'AK0002'}">
																								<b>합의하기</b>
																							</c:if>
																						</a>
																					</div>
																					<!-- ./card-body -->
																				</div>
																				<!-- ./card -->
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${apvList[j-1].apvEmergency eq 'N'}">
																		<!-- Quick Card  -->
																		<div class="col-lg-3" style="height: 250px;">
																			<div class="position-relative " style="height: 180px">
																				<div class="card card-info card-outline">
																					<div class="card-body">
																						<div class="row" style="justify-content: space-between; align-items: baseline;">
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="yyyyMMdd" var="date" />
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="E" var="today" />
																							<h6>${fn:substring(date,0,4)}</h6>
																							<c:if test="${apvList[j-1].apvImportance eq 'Y'}">
																								<span class="badge badge-danger">중요</span>
																							</c:if>
																						</div>
																						<div class="row" style="align-items: baseline;">
																							<h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)}(${today})</h2>
																							<span style="color: gray">&nbsp;&nbsp;마감</span>
																						</div>
																						<c:set var="apvTitle" value="${apvList[j-1].apvTitle}" />
																						<c:if test="${apvTitle.length() ge 11}">
																							<h6>${fn:substring(apvTitle,0,12)}...</h6>
																						</c:if>
																						<c:if test="${apvTitle.length() lt 11}">
																							<h6>${apvTitle}</h6>
																						</c:if>
																						<c:if test="${empty apvTitle}">
																							<h6>${apvList[j-1].apvForm.apvFormName}&nbsp;신청</h6>
																						</c:if>
																						<p style="font-size: 0.8em;">기안자 : ${apvList[j-1].dratfEmp.empName }&nbsp;${apvList[j-1].dratfEmp.positionValue }</p>
																						<a href="javascript:void(0);" onclick="detail('${apvList[j-1].apvCode}');" class="btn btn-outline-primary btn-block">
																							<c:if test="${apvList[j-1].kindCode eq 'AK0001'}">
																								<b>결재하기</b>
																							</c:if>
																							<c:if test="${apvList[j-1].kindCode eq 'AK0002'}">
																								<b>합의하기</b>
																							</c:if>
																						</a>
																					</div>
																					<!-- ./card-body -->
																				</div>
																				<!-- ./card -->
																			</div>
																		</div>
																	</c:if>
															</c:forEach>
														</div>
														<!-- ./row -->
													</div>
													<!--  /.carousel-item active -->
												</c:forEach>

												<c:if test="${size > 4}">
												<c:forEach var="i" begin="1" end="${ (size/4)}">
													<div class="carousel-item">
														<div class="row" alt="${i} slide">

															<c:choose>
																<c:when test="${ size <= (i*4)}">
																	<c:set var="endPoint" value="${size }" />
																</c:when>
																<c:otherwise>
																	<c:set var="endPoint" value="${(i*4)+4 }" />
																</c:otherwise>
															</c:choose>

															<c:forEach var="j" begin="${ (i*4)+1}" end="${endPoint }">
																<c:if test="${apvList[j-1] ne null  && apvList[j-1].apvCode ne '' }">
																	<c:if test="${apvList[j-1].apvEmergency eq 'Y'}">
																		<!-- Quick Card  -->
																		<div class="col-lg-3" style="height: 250px;">
																			<div class="position-relative " style="height: 180px">
																				<div class="ribbon-wrapper">
																					<div class="ribbon bg-danger">긴급</div>
																				</div>
																				<div class="card card-info card-outline">
																					<div class="card-body">
																						<div class="row" style="justify-content: space-between; align-items: baseline;">
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="yyyyMMdd" var="date" />
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="E" var="today" />
																							<h6>${fn:substring(date,0,4)}</h6>
																						</div>
																						<div class="row" style="align-items: baseline;">
																							<h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)}(${today})</h2>
																							<span style="color: gray">&nbsp;&nbsp;마감</span>
																						</div>
																						<c:set var="apvTitle" value="${apvList[j-1].apvTitle}" />
																						<c:if test="${apvTitle.length() ge 11}">
																							<h6>${fn:substring(apvTitle,0,12)}...</h6>
																						</c:if>
																						<c:if test="${apvTitle.length() lt 11}">
																							<h6>${apvTitle }</h6>
																						</c:if>
																						<c:if test="${empty apvTitle}">
																							<h6>${apvList[j-1].apvForm.apvFormName}&nbsp;신청</h6>
																						</c:if>
																						<p style="font-size: 0.8em;">기안자 : ${apvList[j-1].dratfEmp.empName }&nbsp;${apvList[j-1].dratfEmp.positionValue }</p>
																						<a href="javascript:void(0);" onclick="detail('${apvList[j-1].apvCode}');" class="btn btn-outline-primary btn-block">
																							<c:if test="${apvList[j-1].kindCode eq 'AK0001'}">
																								<b>결재하기</b>
																							</c:if>
																							<c:if test="${apvList[j-1].kindCode eq 'AK0002'}">
																								<b>합의하기</b>
																							</c:if>
																						</a>
																					</div>
																					<!-- ./card-body -->
																				</div>
																				<!-- ./card -->
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${apvList[j-1].apvEmergency eq 'N'}">
																		<!-- Quick Card  -->
																		<div class="col-lg-3" style="height: 250px;">
																			<div class="position-relative " style="height: 180px">
																				<div class="card card-info card-outline">
																					<div class="card-body">
																						<div class="row" style="justify-content: space-between; align-items: baseline;">
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="yyyyMMdd" var="date" />
																							<fmt:formatDate value="${apvList[j-1].apvEndDt}" pattern="E" var="today" />
																							<h6>${fn:substring(date,0,4)}</h6>
																							<c:if test="${apvList[j-1].apvImportance eq 'Y'}">
																								<span class="badge badge-danger">중요</span>
																							</c:if>
																						</div>
																						<div class="row" style="align-items: baseline;">
																							<h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)}(${today})</h2>
																							<span style="color: gray">&nbsp;&nbsp;마감</span>
																						</div>
																						<c:set var="apvTitle" value="${apvList[j-1].apvTitle}" />
																						<c:if test="${apvTitle.length() ge 11}">
																							<h6>${fn:substring(apvTitle,0,12)}...</h6>
																						</c:if>
																						<c:if test="${apvTitle.length() lt 11}">
																							<h6>${apvTitle}</h6>
																						</c:if>
																						<c:if test="${empty apvTitle}">
																							<h6>${apvList[j-1].apvForm.apvFormName}&nbsp;신청</h6>
																						</c:if>
																						<p style="font-size: 0.8em;">기안자 : ${apvList[j-1].dratfEmp.empName }&nbsp;${apvList[j-1].dratfEmp.positionValue }</p>
																						<a href="javascript:void(0);" onclick="detail('${apvList[j-1].apvCode}');" class="btn btn-outline-primary btn-block">
																							<c:if test="${apvList[j-1].kindCode eq 'AK0001'}">
																								<b>결재하기</b>
																							</c:if>
																							<c:if test="${apvList[j-1].kindCode eq 'AK0002'}">
																								<b>합의하기</b>
																							</c:if>
																						</a>
																					</div>
																					<!-- ./card-body -->
																				</div>
																				<!-- ./card -->
																			</div>
																		</div>
																	</c:if>
																</c:if>
															</c:forEach>
														</div>
														<!-- ./row -->
													</div>
													<!--  /.carousel-item active -->
												</c:forEach>
											 </c:if>
											</c:when>
											<c:otherwise>
												<div class="carousel-item active">
													<!-- row -->
													<div class="row" alt="1slide">
														<!-- Quick Card  -->
														<div class="col-lg-12">
															<div class="card " style="align-items: center; justify-content: center; height: 237px; background-color: hsla(9, 100%, 64%, 0); margin: 0;">
																<h5>결재할 문서가 없습니다.</h5>
															</div>
															<!-- ./card -->
														</div>
														<!-- ./col-lg-12 ./Quick Card -->
													</div>
													<!-- ./row -->
												</div>
												<!--  /.carousel-item active -->


											</c:otherwise>
										</c:choose>
									</div>
									<!-- / ./carousel-inner -->
								</div>
								<!-- / #carouselExampleIndicators -->
								<a class="carousel-control-prev" style="margin-left: 5px; width: 15px; color: lightgray;" href="#carouselExampleIndicators" role="button" data-slide="prev">
									<span class="carousel-control-custom-icon" aria-hidden="true">
										<i class="fas fa-chevron-left" data-slide="prev"></i>
									</span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" style="margin-right: 10px; width: 15px; color: lightgray;" href="#carouselExampleIndicators" role="button" data-slide="next">
									<span class="carousel-control-custom-icon" aria-hidden="true">
										<i class="fas fa-chevron-right"></i>
									</span>
									<span class="sr-only">Next</span>
								</a>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- ./col=lg-12 -->
				</div>
				<!-- ./row -->
				<!-- ./퀵메뉴슬라이드 -->


				<!-- 마진을 위한 div -->
				<!-- <div style="height: 5px;"></div> -->

				<!-- compressed list -->
				<div class="row">
					<!-- left-list -->
					<div class="col-lg-7">
						<div class="card card-info card-outline card-outline-tabs" style="height: 320px;">
							<div class="card-header p-0 border-bottom-0">
								<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist" style="font-size: 0.9em;">
									<li class="nav-item">
										<a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-wait" role="tab" aria-controls="custom-tabs-four-wait" aria-selected="true">기안문서</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-work" role="tab" aria-controls="custom-tabs-four-work" aria-selected="false">결재문서</a>
									</li>
								</ul>
							</div>
							<div class="card-body" style="padding: 5px 5px;">
								<div class="tab-content" id="custom-tabs-four-tabContent">
									<!-- 기안문서 -->
									<div class="tab-pane fade active show" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
										<!-- 내부 table card -->
										<div>
											<!-- /.card-header -->
												<div class="card-body p-0">
													<table class="table table-sm">
														<colgroup>
															<col width="15%">
															<col width="36%">
															<col width="16%">
															<col width="12%">
															<col width="25%">
														 </colgroup>
														<thead style="font-size: 0.9em;">
															<tr>
																<th class="text-center text-truncate"></th>
																<!-- <th class="text-center" style="width:17%;">양식명</th> -->
																<th class="text-center text-truncate">제목</th>
																<th class="text-center text-truncate">기안일</th>
																<th class="text-center text-truncate">결재상태</th>
																<th class="text-center text-truncate">현결재자</th>
															</tr>
														</thead>
													</table>
													<div style="overflow: auto;height: 230px;">
														<table class="table table-sm">
															<colgroup>
																<col width="15%">
																<col width="36%">
																<col width="16%">
																<col width="12%">
																<col width="25%">
															 </colgroup>
															<tbody style="font-size: 0.75em;">
															<c:choose>
																<c:when test="${empty apvReqList}">
																	<tr>
																		<td colspan="6" class="text-center">기안한 문서가 없습니다.</td>
																	</tr>
																</c:when>
																<c:otherwise>

																	<c:forEach items="${apvReqList}" var="apv">
																		<tr>
																			<!-- 긴급,중요여부 -->
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
																			<!-- 양식명 -->
																			<%-- <td class="text-center apvFormName">${apv.apvForm.apvFormName}</td> --%>
																			<!-- 제목 -->
																			<c:if test="${!empty apv.apvTitle}">
																				<td onclick="requestDetail('${apv.apvCode}')" style="width:35%;cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width:100%; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvTitle}</div></td>
																			</c:if>
																			<c:if test="${empty apv.apvTitle}">
																				<td onclick="requestDetail('${apv.apvCode}')" style="width:35%;cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width:100%; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvForm.apvFormName} 신청</div></td>
																			</c:if>
																			<!-- 기안일 -->
																			<td class="text-center apvDraftDt"><fmt:formatDate value="${apv.apvDraftDt}" pattern="YYYY-MM-dd"/>(<fmt:formatDate value="${apv.apvDraftDt}" pattern="E"/>) </td>
																			<!-- 기안상태 -->
																			<td class="text-center">${apv.stateValue }</td>
																			<!-- 현결재자 -->
																			<td class="text-center">${apv.nowEmp.empName }&nbsp;${apv.nowEmp.positionValue }</td>
																		</tr>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
															</tbody>
														</table>
													</div>
												</div>
											<!-- /.card-body -->
										</div>
										<!-- / .내부 table card -->
									</div>
									<!-- 결재문서 -->
									<div class="tab-pane fade" id="custom-tabs-four-work" role="tabpanel" aria-labelledby="custom-tabs-four-work-tab">
										<!-- 내부 table card -->
										<div>
											<!-- /.card-header -->
											<div class="card-body p-0">
												<table class="table table-sm">
													<thead style="font-size: 0.9em;">
														<tr>
															<th class="text-center text-truncate" style="width:10%;"></th>
																<!-- <th class="text-center" style="width:17%;">양식명</th> -->
																<th class="text-center text-truncate" style="width:35%;">제목</th>
																<th class="text-center text-truncate" style="width:15%;">기안자</th>
																<th class="text-center text-truncate" style="width:20%;">결재기한</th>
																<th class="text-center text-truncate" style="width:20%;">현결재자</th>
														</tr>
													</thead>
												</table>
												<div style="overflow: auto;height: 230px;">
													<table class="table table-sm">
														<colgroup>
															<col width="10%">
															<col width="35%">
															<col width="15%">
															<col width="20%">
															<col width="20%">
														 </colgroup>
														<tbody style="font-size: 0.75em;">
														<c:choose>
															<c:when test="${empty apvList}">
																<tr>
																	<td colspan="6" class="text-center">결재할 문서가 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>

																<c:forEach items="${apvList}" var="apv">
																	<tr>
																		<!-- 긴급,중요여부 -->
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
																		<!-- 양식명 -->
																		<%-- <td class="text-center apvFormName">${apv.apvForm.apvFormName}</td> --%>
																		<!-- 제목 -->
																		<c:if test="${!empty apv.apvTitle}">
																			<td onclick="detail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 100%;margin:0px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvTitle}</div></td>
																		</c:if>
																		<c:if test="${empty apv.apvTitle}">
																			<td onclick="detail('${apv.apvCode}')" style="cursor: pointer;" class="apvTitle"><div class="apvTitle-div" style="width: 100%;margin:0px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${apv.apvForm.apvFormName} 신청</div></td>
																		</c:if>
																		<!-- 기안자 -->
																		<td class="text-center">${apv.dratfEmp.empName }&nbsp;${apv.dratfEmp.positionValue }</td>
																		<!-- 결재기한 -->
																		<td class="text-center apvDraftDt"><fmt:formatDate value="${apv.apvEndDt}" pattern="YYYY-MM-dd"/>(<fmt:formatDate value="${apv.apvEndDt}" pattern="E"/>) </td>
																		<!-- 현결재자 -->
																		<td class="text-center">${apv.nowEmp.empName }&nbsp;${apv.nowEmp.positionValue }</td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														</tbody>
													</table>
												</div>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- / .내부 table card -->
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- ./left-list -->
					<!-- right-list -->
					<div class="col-lg-5">
						<div class="card card-info card-outline card-outline-tabs" style="height: 320px;">
							<div class="card-header p-0 border-bottom-0">
								<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist" style="font-size: 0.9em;">
									<li class="nav-item">
										<a class="nav-link active" id="custom-tabs-three-weekly-tab" data-toggle="pill" href="#custom-tabs-three-weekly" role="tab" aria-controls="custom-tabs-three-weekly" aria-selected="true">주간 결재 현황</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="custom-tabs-three-monthly-tab" data-toggle="pill" href="#custom-tabs-three-monthly" role="tab" aria-controls="custom-tabs-three-monthly" aria-selected="false">월간 결재 현황</a>
									</li>
								</ul>
							</div>
							<div class="card-body" style="height: 275px">
								<div class="tab-content" id="custom-tabs-three-tabContent">
									<div class="tab-pane fade active show" id="custom-tabs-three-weekly" role="tabpanel" aria-labelledby="custom-tabs-three-weekly-tab">
										<div class="card">
											<div class="card-body p-0">
												<canvas id="weeklyApvChart"></canvas>
											</div>
											<!-- /.card-body -->
										</div>
									</div>
									<div class="tab-pane fade" id="custom-tabs-three-monthly" role="tabpanel" aria-labelledby="custom-tabs-three-monthly-tab">
										<div class="card">
											<div class="card-body p-0">
												<canvas id="monthlyApvChart"></canvas>
											</div>
											<!-- /.card-body -->
										</div>
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- ./right-list -->
				</div>
				<!-- ./row -->
				<!-- ./compressed list -->



			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
window.onload  = function() {

	$.ajax({
		url : '<%=request.getContextPath()%>/approval/mainCnt.do?empCode=${loginUser.empCode}',
		dataType : 'json',
		method : 'get',
		success : function(result) {
			$('#tempCnt').text(result.tempCnt);
			$('#requestCnt').text(result.requestCnt);
			$('#waitCnt').text(result.waitCnt);
			$('#ingCnt').text(result.ingCnt);
			$('#refuseCnt').text(result.refuseCnt);
			$('#habCnt').text(result.habCnt);
		},
		error: function(msg) {
		}
	})

	/*  툴팁 활성화 */
	setTooltips();

}

function detail(apvCode) {
	OpenWindow('waitDetail?apvCode='+apvCode,'','900','870')
}

function requestDetail(apvCode){
	OpenWindow('<%=request.getContextPath()%>/approval/request/detail?apvCode='+ apvCode, '', '900', '870');
}



/* 리스트의 업무들의 업무상태 개수 출력  */
/* const setStatusTagNumber = (searchType) => {
	let searchCondition = document.querySelector('.'+searchType+'Search');
	document.querySelector('.waitingBadge').textContent = searchCondition.dataset.waiting;
	document.querySelector('.workingBadge').textContent = searchCondition.dataset.working;
	document.querySelector('.lateBadge').textContent = searchCondition.dataset.late;
} */

const labels = [
    '결재대기',
    '결재진행',
    '결재완료',
    '총결재건수'
  ];

const weeklydata = {
  labels: labels,
  datasets: [{
    label: '주간 결재 현황',
    data: ['${apvCount.weeklyWaiting}', '${apvCount.weeklyWorking}', '${apvCount.weeklyDone}', '${apvCount.weeklyTotal}'],
    backgroundColor: [
       'rgb(255, 205, 86)',
  	   'rgb(54, 162, 235)',
  	   'rgb(255, 99, 132)',
  	   'rgb(201, 203, 207)'
    ],
    borderColor: [
      'rgb(255, 205, 86)',
      'rgb(54, 162, 235)',
      'rgb(255, 99, 132)',
      'rgb(201, 203, 207)'
    ],
    borderWidth: 1,
    categoryPercentage: 1.0,
    barPercentage: 0.5
  }]
};
const monthlydata = {
		  labels: labels,
		  datasets: [{
		    label: '월간 결재 현황',
		    data: ['${apvCount.monthlyWaiting}', '${apvCount.monthlyWorking}', '${apvCount.monthlyDone}', '${apvCount.monthlyTotal}'],
		    backgroundColor: [
		       'rgb(255, 205, 86)',
		  	   'rgb(54, 162, 235)',
		  	   'rgb(255, 99, 132)',
		  	   'rgb(201, 203, 207)'
		    ],
		    borderColor: [
		      'rgb(255, 205, 86)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 99, 132)',
		      'rgb(201, 203, 207)'
		    ],
		    borderWidth: 1,
		    categoryPercentage: 1.0,
		    barPercentage: 0.5
		  }]
		};


  const weeklyConfig = {
		  type: 'bar',
		  data: weeklydata,
		  options: {
		    scales: {
		    	x: {
		            grid: {
		              offset: true
		            }
		        },
  		        y: {
		          beginAtZero: true
		        }
		    }
		  },
		};
  options = {
		    scales: {
		        x: {
		            grid: {
		              offset: true
		            }
		        }
		    }
		};
  const monthlyConfig = {
		  type: 'bar',
		  data: monthlydata,
		  options: {
		    scales: {
		    	x: {
		            grid: {
		              offset: true
		            }
		        },
  		        y: {
		          beginAtZero: true
		        }
		    }
		  },
		};
  options = {
		    scales: {
		        x: {
		            grid: {
		              offset: true
		            }
		        }
		    }
		};
const myWeeklyChart = new Chart(
			document.getElementById('weeklyApvChart'),weeklyConfig);
const myMonthlyChart = new Chart(
			document.getElementById('monthlyApvChart'),monthlyConfig);




</script>


</body>
