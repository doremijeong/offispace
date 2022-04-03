<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>개인근태</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">개인근태</li>
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
									<a href="<%= request.getContextPath() %>/attendance/personalAttendance.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-left"></i>
									</a> 
									
									<!-- 이전달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attendance/personalAttendance.do?year=${today_info.before_year}&month=${today_info.before_month}">
										<i class="fas fa-angle-left"></i>
									</a>
									
									<span class="this_month">
										&nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
									</span> 
									
									<!-- 다음달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attendance/personalAttendance.do?year=${today_info.after_year}&month=${today_info.after_month}">
										<i class="fas fa-angle-right"></i>
									</a> 
									
									<!-- 다음해 -->
									<a class="before_after_year" href="<%= request.getContextPath() %>/attendance/personalAttendance.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
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
															<h3 style="margin: 0px;">30시간</h3>
														</span> <span class="info-box-text text-center text-bold">이번달 총 근무</span>
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
															<h3 style="margin: 0px;">1</h3>
														</span> <span class="info-box-text text-center text-bold">지각</span>
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
															<h3 style="margin: 0px;">1</h3>
														</span> <span class="info-box-text text-center text-bold">조퇴</span>
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
															<h3 style="margin: 0px;">1</h3>
														</span> <span class="info-box-text text-center text-bold">결근</span>
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
							
							<%-- <c:forEach var="dateList" items="${dateList}" varStatus="date_status" >
								<div>${dateList.date}</div>
							</c:forEach> --%>
							
							<!-- /.card-body -->
							<div class="card-body">
								<div class="card">
									<div class="card-body p-0">
										<div class="col-12 d-flex justify-content-between">
											<div style="margin-top: 2%;">
												<p>(근무타입)A형</p>
											</div>
											<div class="row" style="margin-top: 2%;">
												<span><a href="#"><i class="far fa-file-alt"></i>선택적근무신청서</a></span>&nbsp;&nbsp; <span><a href="#"><i class="far fa-file-alt"></i>재택근무신청서</a></span>&nbsp;&nbsp;
											</div>
										</div>
										
										
										
										<!-- 달력 -->
										<table>
											<thead>
												<tr bgcolor="#CECECE">
													<td>일</td>
													<td>월</td>
													<td>화</td>
													<td>수</td>
													<td>목</td>
													<td>금</td>
													<td>토</td>
												</tr>
											</thead>
											
											<tbody>
												<tr>
													<c:forEach items="${dateList}" var="dateList" varStatus="date_status" >
														<c:choose>
															<c:when test="${dateList.value=='today'}">
																<td class="today">
																	<div class="date">${dateList.date}</div>
																	<div></div>
																</td>
															</c:when>
															
															<c:when test="${date_status.index%7==6}">
																<td class="sat_day">
																	<div class="sat">${dateList.date}</div>
																	<div></div>
																</td>
															</c:when>
															<c:when test="${date_status.index%7==0}">
												</tr>
												
												<tr>
																<td class="sun_day">
																	<div class="sun">${dateList.date}</div>
																	<div></div>
																</td>
															</c:when>
															
															<c:otherwise>
																<td class="normal_day">
																	<div class="date">${dateList.date}</div>
																	<div></div>
																</td>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</tbody>
										</table>
																	
										
										
										
										
										<table class="table table-hover">
											<tbody>

												<tr data-widget="expandable-table" aria-expanded="false">
													<td>
														<div class="row">
															<div class="col-12">
																<div class="row">

																	<div class="col-6">
																		<div class="row">


																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">1주차</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div class="badge badge-danger">
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>



																		</div>
																	</div>

																	<div class="col-6">
																		<div class="row">


																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
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


																								<div class="col-md-3 col-sm-6 col-12">
																									<div>
																										<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																										<div>
																											<span class="info-box-text text-center text-bold"> 업무시작<br /> 업무종료<br /> 초과시간<br /> 총 근무시간
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
																											</span>
																										</div>
																										<!-- /.info-box-content -->
																									</div>
																									<!-- /.info-box -->
																								</div>



																							</div>
																						</div>

																						<div class="col-6">
																							<div class="row">


																								<div class="col-md-3 col-sm-6 col-12">
																									<div>
																										<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																										<div>
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
																											</span>
																										</div>
																										<!-- /.info-box-content -->
																									</div>
																									<!-- /.info-box -->
																								</div>
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


																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">2주차</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>



																		</div>
																	</div>

																	<div class="col-6">
																		<div class="row">


																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div class="badge badge-info">
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div class="badge badge-warning">
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div>
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
																			</div>
																			<div class="col-md-3 col-sm-6 col-12">
																				<div>
																					<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																					<div">
																						<span class="info-box-text text-center text-bold">26일(일)</span>
																					</div>
																					<!-- /.info-box-content -->
																				</div>
																				<!-- /.info-box -->
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


																								<div class="col-md-3 col-sm-6 col-12">
																									<div>
																										<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																										<div>
																											<span class="info-box-text text-center text-bold"> 업무시작<br /> 업무종료<br /> 초과시간<br /> 총 근무시간
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
																											</span>
																										</div>
																										<!-- /.info-box-content -->
																									</div>
																									<!-- /.info-box -->
																								</div>
																							</div>
																						</div>

																						<div class="col-6">
																							<div class="row">


																								<div class="col-md-3 col-sm-6 col-12">
																									<div>
																										<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
																										<div>
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
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
																											<span class="info-box-text text-center text-bold"> 08:40<br /> 18:00<br /> 02:00(시간)<br /> 10:00(시간)
																											</span>
																										</div>
																										<!-- /.info-box-content -->
																									</div>
																									<!-- /.info-box -->
																								</div>
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
											</tbody>
										</table>
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