<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<style>
		.sat {
			color: #529dbc;
		}
		
		.sun {
			color: red;
		}	
	</style>
</head>

<title></title>

<body>
	<div class="content-wrapper">
	
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>부서 재택 근무 현황</h5>
					</div>
					
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">근태</a></li>
							<li class="breadcrumb-item active">부서 재택 근무 현황</li>
						</ol>
					</div>
				</div>
			</div>
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-info card-outline">

							<!--날짜 네비게이션  -->
							<div>
								<!-- 이전해 -->
								<h2 class="title" style="text-align: center; margin-top: 1%;">
									<a href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}"> <i class="fas fa-angle-double-left"></i>
									</a>

									<!-- 이전달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.before_year}&month=${today_info.before_month}"> <i class="fas fa-angle-left"></i>
									</a> <span class="this_month" style="cursor: default;"> &nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}&nbsp;
									</span>

									<!-- 다음달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.after_year}&month=${today_info.after_month}">
										<i class="fas fa-angle-right"></i>
									</a>

									<!-- 다음해 -->
									<a class="before_after_year" href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</h2>
							</div>

							<div class="card-header" style="padding-bottom: 0px;">
								<div class="d-flex justify-content-between">
									<div>
										<div class="float-left">
											<p align="left" style="font-size: 0.8em; margin-bottom: 0px;">
												<span class="badge badge-success"><i class="far fa-grin-beam"></i></span>&nbsp;&nbsp;상
											</p>
										</div>
										<div class="float-left" style="margin-left: 10px; font-size: 0.8em; margin-bottom: 0px;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-warning"><i class="far fa-grin-beam-sweat"></i></span>&nbsp;&nbsp;중
											</p>
										</div>
										<!-- <div class="float-left" style="margin-left: 10px; font-size: 0.8em; margin-bottom: 0px;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-info"><ion-icon name="triangle-outline"></ion-icon></span>&nbsp;&nbsp;덜불량
											</p>
										</div> -->
										<div class="float-left" style="margin-left: 10px; font-size: 0.8em;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-danger"><i class="far fa-grimace"></i>
													</ion-icon></span>&nbsp;&nbsp;하
											</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card-body">
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>부서원</th>
												<th>부서(팀)</th>

												<c:forEach var="dateList" items="${dateListForColor}" varStatus="date_status">
													<c:if test="${!empty dateList.date &&dateList.date ne null }">
														<c:choose>
															<c:when test="${date_status.index%7==0 }">
																<th class="sun" style="padding: 6px; padding-bottom: 16px;">${dateList.date}</th>
															</c:when>
															<c:when test="${date_status.index%7==6 }">
																<th class="sat" style="padding: 6px; padding-bottom: 16px;">${dateList.date}</th>
															</c:when>
															<c:otherwise>
																<th style="padding: 6px; padding-bottom: 16px;">${dateList.date}</th>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</tr>
										</thead>

										<tbody>
											<c:if test="${empty empList }">
												<tr>
													<td colspan="50" style="text-align: center">재택근무하는 사원이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty empList }">
											
											<c:forEach var="emp" items="${empList }">
												<tr>
													<%-- <td><img src="<%=request.getContextPath()%>/resources/images/sample.jpg" style="object-fit: cover; width: 30px; height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image"> ${emp.empName } <input type="hidden" value="${emp.empId }" /></td> --%>
													<td><img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName=${emp.attachSavename}" style="object-fit: cover; width: 30px; height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image"> ${emp.empName } <input type="hidden" value="${emp.empId }" /></td>
													<td>${emp.teamValue}&nbsp;${emp.chargeValue }</td>

													<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
														<c:if test="${!empty dateList.date &&dateList.date ne null }">
															<c:set var="stand" value="0"></c:set>
															<td style="padding: 0px; padding-top: 16px;"><c:forEach var="answer" items="${answerList}" varStatus="date_status">
																	<c:if test="${answer.dt eq dateList.date && answer.empCode eq emp.empCode && stand eq '0'}">
																		<c:set var="stand" value="1"></c:set>

																		<a data-toggle="dropdown" href="#">
																			<div class="image">
																			 	
																				<!-- 상 : 응답횟수 = 전체횟수 -->
																				<c:if test="${answer.cnt eq answer.total }">
																					<span class="badge badge-success"> <i class="far fa-grin-beam"></i>
																					</span>
																				</c:if>

																				<!-- 중 : 1 <= 응답횟수 < 전체횟수 -->
																				<c:if test="${answer.cnt lt answer.total && answer.cnt ge 1}">
																					<span class="badge badge-warning"><i class="far fa-grin-beam-sweat"></i>
																					</span>
																				</c:if>

																				<!-- 하 : 응답횟수 = 0 -->
																				<c:if test="${answer.cnt eq 0 }">
																					<span class="badge badge-danger"><i class="far fa-grimace"></i>
																					</span>
																				</c:if>

																			</div>
																		</a>

																		<div class="dropdown-menu" style="margin: 0px; padding: 0px;">
																			<div class="card bg-light d-flex flex-fill" style="margin: 0px;">

<!-- 																				<div class="card-body" style="padding: 0px;"> -->
																					<table>
																						<thead>
																							<tr>
																								<th>체크시간</th>
																								<th>응답시간</th>
																							</tr>
																						</thead>
																						<tbody>
																							<c:forEach var="each" items="${answer.context}">
																								<tr>
																									<td><fmt:formatDate value="${each.wfhaReceiveTime }" pattern="HH:mm:ss" /></td>
																									<td><fmt:formatDate value="${each.wfhaAnsTime }" pattern="HH:mm:ss" /></td>
																								</tr>
																							</c:forEach>
																						</tbody>
																					</table>
<!-- 																				</div> -->

<!-- 																				<div class="card-footer bg-light" style="padding: 0.25em;"> -->
<!-- 																					<div class="text-right"> -->
<!-- 																						<a href="" class="dropdown-item btn btn-sm bg-teal" style="padding: 0;"> -->
<!-- 																							<a href="javascript:alert('쪽지보내기');" class="btn btn-sm bg-teal"> -->
<!-- 																								<i class="fas fa-comment-dots"></i> 쪽지하기 -->
<!-- 																							</a> -->
<!-- 																						</a> -->
<!-- 																					</div> -->
<!-- 																				</div> -->

																			</div>
																		</div>

																	</c:if>
																</c:forEach></td>
														</c:if>
													</c:forEach>
												</tr>
											</c:forEach>
											
											</c:if>

											<%-- <c:forEach var="cnt" begin="1" end="31">
													<td style="padding: 6px; padding-top: 16px;">
														<span class="badge badge-success">O</span>
													</td>
												</c:forEach> --%>

										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
							</div>
						</div>
						<!-- /.card -->
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
function attendSet(){
	OpenWindow('<%=request.getContextPath()%>/attend/attendSet.do','일정상세조회','600','550');
}
</script>
</body>