<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<script>
function annualForm(){
// 	alert('연차신청서');
	location.href = "<%=request.getContextPath()%>/approval/insert?apvFormCode=AF0011";
}
</script>



	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>연차 내역</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">근태</a></li>
							<li class="breadcrumb-item active">연차 내역 조회</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Default box -->




		<section class="content">
			<div class="container-fluid">
				<div class="card card-info card-outline">

					<!--날짜 네비게이션  -->
					<div>
						<h2 class="title" style="text-align: center; margin-top: 1%;">
						<%-- <a href="<%= request.getContextPath() %>/attend/annual.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}"> <i class="fas fa-angle-double-left"></i>
						</a>

						<a class="before_after_month" href="<%= request.getContextPath() %>/attend/annual.do?year=${today_info.before_year}&month=${today_info.before_month}"> 
							<i class="fas fa-angle-left"></i>
						</a> --%>
						
						<span class="this_month" style="cursor: default;"> &nbsp;${today_info.search_year}. <c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}&nbsp;
						</span>

						<%-- <a class="before_after_month" href="<%= request.getContextPath() %>/attend/annual.do?year=${today_info.after_year}&month=${today_info.after_month}"> <i class="fas fa-angle-right"></i>
						</a>

						<a class="before_after_year" href="<%= request.getContextPath() %>/attend/annual.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}"> <i class="fas fa-angle-double-right"></i>
						</a> --%>
						</h2>
					</div>

					<div class="row" style="justify-content: space-between; padding-left: 15px;">
						<p style="padding-left: 10px;cursor: default;">기본 연차 : ${!empty annual.annStandard ? annual.annStandard : 15} 일</p>
						<div style="padding-right: 30px;">
							<p>
								<a href="javascript:annualForm();"><i class="far fa-file-alt" style="padding-right: 5px;"></i>연차신청서</a>
							</p>
						</div>
					</div>


					<div class="card-body" style="padding-top: 0px; padding-bottom: 0px;">
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col-md-3 col-sm-6 col-12">
										<div class="info-box bg-success">
											<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

											<div class="info-box-content">
												<span class="info-box-number text-center"><h3 style="margin: 0px;cursor: default;">${!empty annual.annTotal ? annual.annTotal : 15 }일</h3></span>
												<span class="info-box-text text-center text-bold" style="cursor: default;">총 연차</span>
											</div>
											<!-- /.info-box-content -->
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-12">
										<div class="info-box bg-info">
											<div class="info-box-content">
												<span class="info-box-number text-center"><h3 style="margin: 0px;cursor: default;">${!empty annual.annOccur ? annual.annOccur : 0 }일</h3></span>
												<span class="info-box-text text-center text-bold" style="cursor: default;">발생 연차</span>
											</div>
											<!-- /.info-box-content -->
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-12">
										<div class="info-box bg-secondary">
											<div class="info-box-content">
												<span class="info-box-number text-center"><h3 style="margin: 0px;cursor: default;">${!empty annual.annTotalUsed ? annual.annTotalUsed : 0 }일</h3></span>
												<span class="info-box-text text-center text-bold" style="cursor: default;">총 사용 연차</span>
											</div>
											<!-- /.info-box-content -->
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-12">
										<div class="info-box bg-warning">
											<div class="info-box-content">
												<span class="info-box-number text-center"><h3 style="margin: 0px;cursor: default;">${!empty annual.annRemains ? annual.annRemains : 15 }일</h3></span>
												<span class="info-box-text text-center text-bold" style="cursor: default;">잔여 연차</span>
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
				</div>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">연차 사용 내역</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="height: auto;">
						<table class="table table-head-fixed text-nowrap">
							<thead>
								<tr>
									<th width="20%">이름</th>
									<th width="20%">부서명</th>
									<th width="20%">연차 사용기간</th>
									<th width="20%" style="text-align: center;">사용 연차</th>
									<th width="20%">휴가사유</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty annualHistory }">
									<tr>
										<td style="text-align: center;" colspan="5">연차 사용 내역이 없습니다.</td>
									</tr>
								</c:if>
								
								<c:if test="${!empty annualHistory }">
									<c:forEach var="history" items="${annualHistory }">
									<tr>
										<td>${history.empName }</td>
										<td>${history.teamValue }</td>
										<td>
											<fmt:formatDate value="${history.annStartDt}" pattern="yyyy-MM-dd"/>
											&nbsp;&nbsp;~&nbsp;&nbsp;
											<fmt:formatDate value="${history.annEndDt}" pattern="yyyy-MM-dd"/>
										</td>
										<td style="text-align: center;">${history.annUsedCnt }</td>
										<td>${history.annReason }</td>
									</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>

				<div class="card">
					<div class="card-header">
						<h3 class="card-title">연차 발생 내역</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="height: auto;">
						<table class="table table-head-fixed text-nowrap">
							<thead>
								<tr>
									<th width="25%">등록일</th>
									<th width="25%">등록자</th>
									<th width="25%">발생 연차일</th>
									<th width="25%">연차 발생 사유</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty annualOccur }">
									<tr>
										<td style="text-align: center;" colspan="4">연차 발생 내역이 없습니다.</td>
									</tr>
								</c:if>
								
								<c:if test="${!empty annualOccur }">
									<c:forEach var="occur" items="${annualOccur }">
									<tr>
										<td>
											<fmt:formatDate value="${occur.annRegisterDt }" pattern="yyyy-MM-dd"/>
										</td>
										<td>${occur.annRegister }</td>
										<td>${occur.annOccurCnt }일</td>
										<td>${occur.annOccurReason }</td>
									</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
			<!-- /.card -->
		</section>
	</div>
</body>