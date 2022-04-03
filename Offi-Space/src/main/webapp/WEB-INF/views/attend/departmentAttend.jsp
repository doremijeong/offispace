<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<h5>부서 근태</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">근태</a></li>
							<li class="breadcrumb-item active">부서 근태 </li>
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


							<!--날짜 네비게이션  -->
							<div>
								<!-- 이전해 -->
								<h2 class="title" style="text-align: center; margin-top: 1%;">
									<a href="<%= request.getContextPath() %>/attend/departmentAttend.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}"> <i class="fas fa-angle-double-left"></i>
									</a>

									<!-- 이전달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/departmentAttend.do?year=${today_info.before_year}&month=${today_info.before_month}"> <i class="fas fa-angle-left"></i>
									</a> <span class="this_month" style="cursor: default;"> &nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}&nbsp;
									</span>

									<!-- 다음달 -->
									<a class="before_after_month" href="<%= request.getContextPath() %>/attend/departmentAttend.do?year=${today_info.after_year}&month=${today_info.after_month}"> <i class="fas fa-angle-right"></i>
									</a>

									<!-- 다음해 -->
									<a class="before_after_year" href="<%= request.getContextPath() %>/attend/departmentAttend.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}"> <i class="fas fa-angle-double-right"></i>
									</a>
								</h2>
							</div>


							<div class="card-header" style="padding-bottom: 0px;">
								<div class="d-flex justify-content-between">
									<div>
										<div class="float-left">
											<p align="left" style="font-size: 0.8em; margin-bottom: 0px;">
												<span class="badge badge-success"><ion-icon name="walk-sharp"></ion-icon></span>&nbsp;&nbsp;정상근무
											</p>
										</div>
										<div class="float-left" style="margin-left: 10px; font-size: 0.8em; margin-bottom: 0px;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-warning"><ion-icon name="time-outline"></ion-icon></span>&nbsp;&nbsp;지각
											</p>
										</div>
										<div class="float-left" style="margin-left: 10px; font-size: 0.8em; margin-bottom: 0px;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-info"><ion-icon name="triangle-outline"></ion-icon></span>&nbsp;&nbsp;조퇴
											</p>
										</div>
										<div class="float-left" style="margin-left: 10px; font-size: 0.8em;">
											<p align="left" style="margin-bottom: 0px;">
												<span class="badge badge-danger"><ion-icon name="close-sharp"></ion-icon></ion-icon></span>&nbsp;&nbsp;결근
											</p>
										</div>
									</div>
<!-- 									<div> -->
<!-- 										<a href="javascript:attendSet();"><i class="fas fa-cog"></i>근태타입설정</a> -->
<!-- 									</div> -->
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>부서원</th>
												<th>부서(팀)</th>


												<%-- <c:forEach var="dateList" items="${dateList}" varStatus="date_status">
													<th style="padding: 6px; padding-bottom: 16px;">${dateList.date}</th>
												</c:forEach> --%>
												
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
											<c:forEach var="emp" items="${empList }">
												<tr>
													<td>
														<%-- <img src="<%=request.getContextPath()%>/resources/images/sample.jpg" style="object-fit: cover; width: 30px; height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image"> ${emp.empName } --%>
														<img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName=${emp.attachSavename}" style="object-fit: cover; width: 30px; height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image"> ${emp.empName }
														<input type="hidden" value="${emp.empId }" />
													</td>
													<td>${emp.teamValue}&nbsp;${emp.chargeValue }</td>

													<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
														<td style="padding: 0px; padding-top: 16px;">
															<c:forEach var="attend" items="${attendList}" varStatus="date_status">
																<c:if test="${attend.dt eq dateList.date && attend.empCode eq emp.empCode && attend.empName eq emp.empName && attend.teamValue eq emp.teamValue}">
																	<c:if test="${attend.attPerStCode eq 'AP0001' }">
																		<span class="badge badge-success"><ion-icon name="walk-sharp"></ion-icon></span><!-- 정상출근 -->
																	</c:if>
																	<c:if test="${attend.attPerStCode eq 'AP0002' }">
																		<span class="badge badge-warning"><ion-icon name="time-outline"></ion-icon></span><!-- 지각 -->
																	</c:if>
																	<c:if test="${attend.attPerStCode eq 'AP0003' }">
																		<span class="badge badge-info"><ion-icon name="triangle-outline"></ion-icon></span><!-- 조퇴 -->
																	</c:if>
																	<c:if test="${attend.attPerStCode eq 'AP0004' }">
																		<span class="badge badge-danger"><ion-icon name="close-sharp"></ion-icon></span><!-- 결근 -->
																	</c:if>
																</c:if>
															</c:forEach>
														</td>
													</c:forEach>
												</tr>
											</c:forEach>

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