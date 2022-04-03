<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재택근무현황</title>
<style>
.table td, .table th {
	padding: 0.3%;
}
</style>
</head>

<body>

	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>부서재택근무현황</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">재택근무현황</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<div class="card-body" style="padding-top: 0%;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card  card-info card-outline">

							<!--날짜 네비게이션  -->
							<div>
								<!-- 이전해 -->
								<h2 class="title" style="text-align: center; margin-top: 1%;">
									<a
										href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-left"></i>
									</a>

									<!-- 이전달 -->
									<a class="before_after_month"
										href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.before_year}&month=${today_info.before_month}">
										<i class="fas fa-angle-left"></i>
									</a> <span class="this_month">
										&nbsp;${today_info.search_year}. <c:if
											test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
									</span>

									<!-- 다음달 -->
									<a class="before_after_month"
										href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.after_year}&month=${today_info.after_month}">
										<i class="fas fa-angle-right"></i>
									</a>

									<!-- 다음해 -->
									<a class="before_after_year"
										href="<%= request.getContextPath() %>/attend/answerPage.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
										<i class="fas fa-angle-double-right"></i>
									</a>
								</h2>
							</div>



							<div class="card-body" style="padding-top: 0%;">
								<div class="card-header" style="padding-bottom: 0%;">
									<div class="float-left">
										<h3 class="card-title">${loginUser.teamValue }</h3>
									</div>
									<div class="float-right">
										<div class="float-left"
											style="padding-right: 5px; color: green;">
											<p>
												<i class="far fa-grin-beam"></i>상
											</p>
										</div>
										<div class="float-left"
											style="padding-right: 5px; color: blue;">
											<p>
												<i class="far fa-grin-beam-sweat"></i>중
											</p>
										</div>
										<div class="float-left" style="color: red;">
											<p>
												<i class="far fa-grimace"></i>하
											</p>
										</div>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table text-nowrap">
										<c:forEach var="emp" items="${employeeList }">
										
											<thead data-widget="expandable-table" aria-expanded="false">
												<tr style="border-top: 1px solid #00000025;">
													<th colspan="4"
														style="text-align: center; background-color: rgb(196, 196, 196);">재택근무자(${emp.empName })</th>
												</tr>
											</thead>
											
											<tbody class="expandable-body d-none">
												<tr>
													<th>날짜</th>
													<th>응답받은시간</th>
													<th>응답시간</th>
													<th style="text-align: center; border-left: 1px solid #00000025">
														응답횟수(상태)
													</th>
												</tr>
											
											<c:set var="span" value="0"></c:set>
											<c:forEach var="answer" items="${answerList }">
												<c:if test="${emp.empCode eq answer.empCode }">
												
												<tr>
													<td><fmt:formatDate value="${answer.wfhaDate}" pattern="yy-MM-dd"/></td>
													<td><fmt:formatDate value="${answer.wfhaReceiveTime}" pattern="hh:MM:ss"/></td>
													<td><fmt:formatDate value="${answer.wfhaAnsTime}" pattern="hh:MM:ss"/></td>
													
													<c:if test="${span eq '0'}">
														<c:set var="span" value="1"></c:set>
														<c:set var="oh" value="${answer.wfhaDate}"></c:set>
														
														<td rowspan="2" style="text-align: center; vertical-align: middle; border-left: 1px solid #00000025; font-size: xx-large;">
															${emp.empPassword }/4<br/>
															<i class="far fa-grin-beam" style="color: green;"></i>
														</td>
													</c:if>
													<c:if test="${span eq '1' }">
														<c:if test="${oh ne answer.wfhaDate }">
															<c:set var="oh" value="${answer.wfhaDate}"></c:set>	
															<td rowspan="4" style="text-align: center; vertical-align: middle; border-left: 1px solid #00000025; font-size: xx-large;">
																${emp.empPassword }/4<br/>
																<i class="far fa-grin-beam" style="color: green;"></i>
															</td>
														</c:if>	
													</c:if>
												</tr>

												</c:if>
											</c:forEach>
											
											</tbody>
											
										</c:forEach>
									
									</table>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>