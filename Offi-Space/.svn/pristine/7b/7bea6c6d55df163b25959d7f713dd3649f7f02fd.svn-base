<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<script>
function homeForm(){
// 	alert('재택근무신청서');
	location.href = "<%=request.getContextPath()%>/approval/insert?apvFormCode=AF0012";
}
</script>



	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>개인 근태</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">근태</a></li>
							<li class="breadcrumb-item active">개인 근태 조회</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-info card-outline">

							<!-- <div>
								<h2 class="title" style="text-align: center; margin-top: 1%;">
									<a href="#"><i class="fas fa-chevron-left"></i></a>&nbsp;&nbsp;&nbsp;2021.01&nbsp;&nbsp;&nbsp;<a href="#"><i class="fas fa-chevron-right"></i></a>
								</h2>
							</div> -->

							<!--날짜 네비게이션  -->
							<div>
								<!-- 이전해 -->
								<h2 class="title" style="text-align: center; margin-top: 1%;">
									<a href="<%= request.getContextPath() %>/attend/personalAttend.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-left"></i>
									</a>

									<!-- 이전달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/personalAttend.do?year=${today_info.before_year}&month=${today_info.before_month}">
										<i class="fas fa-angle-left"></i>
									</a>

									<span class="this_month" style="cursor: default;">
										&nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}&nbsp;
									</span>

									<!-- 다음달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/personalAttend.do?year=${today_info.after_year}&month=${today_info.after_month}">
										<i class="fas fa-angle-right"></i>
									</a>

									<!-- 다음해 -->
									<a class="before_after_year" href="<%= request.getContextPath() %>/attend/personalAttend.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</h2>
							</div>



							<!-- card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-12">
												<div class="info-box bg-success">
													<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
													<div class="info-box-content">
														<span class="info-box-number text-center">
															<h3 style="margin: 0px;cursor: default;">${totalTime }시간</h3>
														</span> 
														<span class="info-box-text text-center text-bold" style="cursor: default;">이번달 총 근무</span>
													</div>
													<!-- /.info-box-content -->
												</div>
												<!-- /.info-box -->
											</div>
											<!-- /.col -->
											<div class="col-md-3 col-sm-6 col-12">
												<div class="info-box bg-warning">
													<div class="info-box-content">
														<span class="info-box-number text-center">
															<h3 style="margin: 0px;cursor: default;">${late }</h3>
														</span> <span class="info-box-text text-center text-bold" style="cursor: default;">지각</span>
													</div>
													<!-- /.info-box-content -->
												</div>
												<!-- /.info-box -->
											</div>
											<!-- /.col -->
											<div class="col-md-3 col-sm-6 col-12">
												<div class="info-box bg-info">
													<div class="info-box-content">
														<span class="info-box-number text-center">
															<h3 style="margin: 0px;cursor: default;">${leave }</h3>
														</span> <span class="info-box-text text-center text-bold" style="cursor: default;">조퇴</span>
													</div>
													<!-- /.info-box-content -->
												</div>
												<!-- /.info-box -->
											</div>
											<!-- /.col -->
											<div class="col-md-3 col-sm-6 col-12">
												<div class="info-box bg-danger">
													<div class="info-box-content">
														<span class="info-box-number text-center">
															<h3 style="margin: 0px;cursor: default;">${absence }</h3>
														</span> <span class="info-box-text text-center text-bold" style="cursor: default;">결근</span>
													</div>
													<!-- /.info-box-content -->
												</div>
												<!-- /.info-box -->
											</div>
											<!-- /.col -->
										</div>
									</div>
								</div>
							</div>


							<!-- /.card-body -->
							<div class="card-body">
								<div class="card">
									<div class="card-body p-0">
										<div class="col-12 d-flex justify-content-end">
											<div class="row" style="padding: 10px;">
												<span><a href="javascript:homeForm();"><i class="far fa-file-alt" style="margin-right: 5px;"></i>재택근무신청서</a></span>
											</div>
										</div>

										<c:set var="weekend" value="1"></c:set>

										<table class="table table-hover">
											<tbody>

												<tr data-widget="expandable-table" aria-expanded="false" bgcolor="#CECECE">
													<td>
														<div class="row">
															<div class="col-12">

																<div class="row">
																	<div class="col-6">

																		<div class="row">
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">주차</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold sun">일</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">월</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">화</span>
																				</div>
																			</div>

																		</div>
																	</div>

																	<div class="col-6">

																		<div class="row">

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">수</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">목</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold">금</span>
																				</div>
																			</div>

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<span class="info-box-text text-center text-bold sat">토</span>
																				</div>
																			</div>

																			</div>
																			</div>

																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>


												<tr data-widget="expandable-table" aria-expanded="false">
													<td>
														<div class="row">
															<div class="col-12">

																<div class="row">
																	<div class="col-6">

																		<div class="row">

















												<!-- for문 시작 -->

												<c:forEach items="${dateList}" var="dateList2" varStatus="date_status" >

													<c:choose>

													<c:when test="${date_status.index%7==0}">
														<div class="col-md-3 col-sm-6 col-12">
															<div>
																<span class="info-box-text text-center text-bold">${weekend }주차</span>
															</div>
														</div>

														<c:set var="weekend" value="${weekend+1 }"></c:set>

														<div class="col-md-3 col-sm-6 col-12">
															<div>
																<c:choose>
																	<c:when test="${dateList2.attend.attPerStCode eq 'AP0001' }">
																		<span class="info-box-text text-center sun text-bold badge badge-success">${dateList2.date}</span>
																	</c:when>

																	<c:when test="${dateList2.attend.attPerStCode eq 'AP0002' }">
																		<span class="info-box-text text-center sun text-bold badge badge-warning">${dateList2.date}</span>
																	</c:when>

																	<c:when test="${dateList2.attend.attPerStCode eq 'AP0003' }">
																		<span class="info-box-text text-center sat text-bold badge badge-info">${dateList2.date}</span>
																	</c:when>

																	<c:when test="${dateList2.attend.attPerStCode eq 'AP0004' }">
																		<span class="info-box-text text-center sat text-bold badge badge-danger">${dateList2.date}</span>
																	</c:when>

																	<c:otherwise>
																		<span class="info-box-text text-center sun text-bold">${dateList2.date}</span>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</c:when>

														<c:when test="${date_status.index%7==6}">

																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<c:choose>
																						<c:when test="${dateList2.attend.attPerStCode eq 'AP0001' }">
																							<span class="info-box-text text-center sat text-bold badge badge-success">${dateList2.date}</span>
																							<%-- <span style="border-radius:100%;" class="info-box-text text-center sat text-bold badge badge-success">${dateList2.date}</span> --%>
																						</c:when>

																						<c:when test="${dateList2.attend.attPerStCode eq 'AP0002' }">
																							<span class="info-box-text text-center sat text-bold badge badge-warning">${dateList2.date}</span>
																						</c:when>

																						<c:when test="${dateList2.attend.attPerStCode eq 'AP0003' }">
																							<span class="info-box-text text-center sat text-bold badge badge-info">${dateList2.date}</span>
																						</c:when>

																						<c:when test="${dateList2.attend.attPerStCode eq 'AP0004' }">
																							<span class="info-box-text text-center sat text-bold badge badge-danger">${dateList2.date}</span>
																						</c:when>

																						<c:otherwise>
																							<span class="info-box-text text-center sat text-bold">${dateList2.date}</span>
																						</c:otherwise>
																					</c:choose>
																				</div>
																			</div>

																			</div>
																			</div>

																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>















												<tr class="expandable-body d-none">
													<td>
														<div class="p-0" style="display: none;">
															<table class="table table-hover">
																<tbody>
																	<tr data-widget="expandable-table" aria-expanded="false">
																		<td>
																			<div class="row">
																				<div class="col-12">
																					<div class="row">

																						<div class="col-6">
																							<div class="row">



																							<c:forEach items="${dateList}" var="temp" varStatus="temp_status" begin="${date_status.index-6 }" end="${date_status.index }" >
																								<c:choose>
																									<c:when test="${temp_status.index%7==0}">
																										<div class="col-md-3 col-sm-6 col-12">
																											<div>
																												<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																												<div>
																													<!-- <span class="info-box-text text-center text-bold"> 업무시작<br /> 업무종료<br /> 초과시간<br /> 총 근무시간
																													</span> -->
																													<span class="info-box-text text-center text-bold"> 업무시작<br /> 업무종료<br /> 총 근무시간
																													</span>
																												</div>
																												<!-- /.info-box-content -->
																											</div>
																											<!-- /.info-box -->
																										</div>

																										<div class="col-md-3 col-sm-6 col-12">
																											<div>
																												<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																												<div>
																													<c:if test="${temp.attend ne null}">
																														<span class="info-box-text text-center text-bold">
																															${temp.attend.attTimeSt }<br/>
																															${temp.attend.attLeavTimeSt }<br/>
																															<%-- ${temp.attend.attExWorkTimeSt }(시간)<br/> --%>
																															${temp.attend.attTotalWorkTimeSt }(시간)
																														</span>
																													</c:if>
																												</div>
																												<!-- /.info-box-content -->
																											</div>
																											<!-- /.info-box -->
																										</div>

																									</c:when>

																									<c:when test="${temp_status.index%7==6}">
																										<div class="col-md-3 col-sm-6 col-12">
																											<div>
																												<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																												<div>
																													<c:if test="${temp.attend ne null}">
																														<span class="info-box-text text-center text-bold">
																															${temp.attend.attTimeSt }<br/>
																															${temp.attend.attLeavTimeSt }<br/>
																															<%-- ${temp.attend.attExWorkTimeSt }(시간)<br/> --%>
																															${temp.attend.attTotalWorkTimeSt }(시간)
																														</span>
																													</c:if>
																												</div>
																												<!-- /.info-box-content -->
																											</div>
																											<!-- /.info-box -->
																										</div>



																							</div>
																						</div>
																									</c:when>

																									<c:when test="${temp_status.index%7==2}">
																										<div class="col-md-3 col-sm-6 col-12">
																											<div>
																												<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																												<div>
																													<c:if test="${temp.attend ne null}">
																														<span class="info-box-text text-center text-bold">
																															${temp.attend.attTimeSt }<br/>
																															${temp.attend.attLeavTimeSt }<br/>
																															<%-- ${temp.attend.attExWorkTimeSt }(시간)<br/> --%>
																															${temp.attend.attTotalWorkTimeSt }(시간)
																														</span>
																													</c:if>
																												</div>
																												<!-- /.info-box-content -->
																											</div>
																											<!-- /.info-box -->
																										</div>



																									</div>
																								</div>

																								<div class="col-6">
																									<div class="row">
																									</c:when>

																									<c:otherwise>
																										<div class="col-md-3 col-sm-6 col-12">
																											<div>
																												<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																												<div>
																													<c:if test="${temp.attend ne null}">
																														<span class="info-box-text text-center text-bold">
																															${temp.attend.attTimeSt }<br/>
																															${temp.attend.attLeavTimeSt }<br/>
																															<%-- ${temp.attend.attExWorkTimeSt }(시간)<br/> --%>
																															${temp.attend.attTotalWorkTimeSt }(시간)
																														</span>
																													</c:if>
																												</div>
																												<!-- /.info-box-content -->
																											</div>
																											<!-- /.info-box -->
																										</div>
																									</c:otherwise>
																								</c:choose>
																							</c:forEach>


																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</td>
												</tr>

















												<tr data-widget="expandable-table" aria-expanded="false">
													<td>
														<div class="row">
															<div class="col-12">

																<div class="row">
																	<div class="col-6">

																		<div class="row">

														</c:when>



														<c:when test="${date_status.index%7==3}">
																	</div>
																</div>

																<div class="col-6">
																	<div class="row">
																		<div class="col-md-3 col-sm-6 col-12">
																			<div>
																				<c:choose>
																					<c:when test="${dateList2.attend.attPerStCode eq 'AP0001' }">
																						<span class="info-box-text text-center text-bold badge badge-success">${dateList2.date}</span>
																					</c:when>

																					<c:when test="${dateList2.attend.attPerStCode eq 'AP0002' }">
																						<span class="info-box-text text-center text-bold badge badge-warning">${dateList2.date}</span>
																					</c:when>

																					<c:when test="${dateList2.attend.attPerStCode eq 'AP0003' }">
																						<span class="info-box-text text-center sat text-bold badge badge-info">${dateList2.date}</span>
																					</c:when>

																					<c:when test="${dateList2.attend.attPerStCode eq 'AP0004' }">
																						<span class="info-box-text text-center sat text-bold badge badge-danger">${dateList2.date}</span>
																					</c:when>

																					<c:otherwise>
																						<span class="info-box-text text-center text-bold">${dateList2.date}</span>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</div>
														</c:when>




														<c:otherwise>
															<div class="col-md-3 col-sm-6 col-12">
																<div>
																	<c:choose>
																		<c:when test="${dateList2.attend.attPerStCode eq 'AP0001' }">
																			<span class="info-box-text text-center text-bold badge badge-success">${dateList2.date}</span>
																		</c:when>

																		<c:when test="${dateList2.attend.attPerStCode eq 'AP0002' }">
																			<span class="info-box-text text-center text-bold badge badge-warning">${dateList2.date}</span>
																		</c:when>

																		<c:when test="${dateList2.attend.attPerStCode eq 'AP0003' }">
																			<span class="info-box-text text-center sat text-bold badge badge-info">${dateList2.date}</span>
																		</c:when>

																		<c:when test="${dateList2.attend.attPerStCode eq 'AP0004' }">
																			<span class="info-box-text text-center sat text-bold badge badge-danger">${dateList2.date}</span>
																		</c:when>

																		<c:otherwise>
																			<span class="info-box-text text-center text-bold">${dateList2.date}</span>
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</c:otherwise>
													</c:choose>

												</c:forEach>

																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>

											</tbody>
										</table>

										<!-- 복잡 -->



									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>