<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head></head>

<body>

	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<div class="row">
							<h5>쪽지</h5>
						</div>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">HOME</a></li>
							<li class="breadcrumb-item active">쪽지</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
		<section class="content">
			<div class="container-fluid">

				<div class="col-lg-12 p-1">
					<!-- 크기조정을 위한 div -->
				</div>

				<div class="row">
					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-success">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center"> 
								<a href="<%=request.getContextPath()%>/message/list.do?kindOfMsg=recieved"	style="color: white;">
										<h3 style="margin: 0px;" id="recMsgCnt"></h3>
								</a>
								</span> <span class="info-box-text text-center text-bold">받은 쪽지</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- col-md-3 -->

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-danger">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center"> 
									<h3 style="margin: 0px;color: white;" id="unreadMsgCnt"></h3>
								</span> <span class="info-box-text text-center text-bold">안 읽은	쪽지</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-warning">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center"> 
										<h3 style="margin: 0px;color: white;" id="imptMsgCnt"></h3>
								</span> 
								<span	class="info-box-text text-center text-bold"	style="color: white;">중요 쪽지</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-info">
							<div class="info-box-content">
								<span class="info-box-number text-center"> 
									<a href="#"	style="color: white;" data-toggle="modal"	data-target="#modal-default">
										<h3 style="margin: 3px;" style="cursor: pointer;">
											<i class="fas fa-edit"></i>
										</h3>
										<span class="info-box-text text-center text-bold" style="cursor: pointer;">쪽지 쓰기</span>
									</a>
								</span> 
							</div> <!-- /.info-box-content -->
						</div> <!-- /.info-box -->
					</div>
				</div>
			</div>

			<div class="col-lg-12 p-1">
				<!-- 크기조정을 위한 div -->
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="card">

						<!-- 받은 쪽지함 -->
						<div class="card-header border-0" style="padding-bottom: 0;">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">받은 쪽지함</h3>
								<div class="btn-group float-right">
									<a href="javascript:getReceivedMsgList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/message/list.do?kindOfMsg=recieved">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>

						<div class="card-body">
							<table class="table table-sm table-hover msgTable" style="table-layout: fixed;">
								<thead>
										<tr>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="9%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="1%"></td>
										</tr>
									</thead>
									
									<tbody class="recMsg"></tbody>
								
							</table>
						</div>
					</div>
				</div><!-- 받은 쪽지함 -->

				<!-- 보낸 쪽지함 -->
				<div class="col-lg-6" style="height: 300px">
					<div class="card">
						<div class="card-header border-0" style="padding-bottom: 0;">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">보낸 쪽지함</h3>
								<div class="btn-group float-right">
									<a href="javascript:getSendMsgList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="<%=request.getContextPath()%>/message/list.do?kindOfMsg=send">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<table class="table table-sm table-hover msgToTable" style="table-layout: fixed;">
									<thead>
										<tr>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="9%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="1%"></td>
										</tr>
									</thead>
									
									<tbody class="sendMsg"></tbody>
								
							</table>
						</div>
					</div>
				</div>
			</div> <!-- 보낸 쪽지함 -->
			
			
			<!-- 개인 보관함 -->
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header border-0" style="padding-bottom: 0;">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">개인 보관함</h3>
								<div class="btn-group float-right">
									<a href="javascript:getPersonalMsgList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/message/list.do?kindOfMsg=personal">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<table class="table table-sm table-hover msgMixedTable" style="table-layout: fixed;">
									<thead>
										<tr>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="2%"></td>
											<td style="visibility:hidden;" class="text-center" width="9%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="5%"></td>
											<td style="visibility:hidden;" class="text-center" width="1%"></td>
										</tr>
									</thead>
									
									<tbody class="personalMsg"></tbody>
								
							</table>
						</div>
					</div>
				</div> <!-- 개인 보관함 -->
				
				
				<!-- 업무 보관함 -->
				<div class="col-lg-6" style="height: 300px">
					<div class="card">
						<div class="card-header border-0" style="padding-bottom: 0;">
							<div class="d-flex justify-content-between">
								<h3 class="card-title">업무 보관함</h3>
								<div class="btn-group float-right">
									<a href="javascript:getWorkMsgList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/message/list.do?kindOfMsg=work">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<table class="table table-sm table-hover msgMixedTable" style="table-layout: fixed;">
								<thead>
									<tr>
										<td style="visibility:hidden;" class="text-center" width="2%"></td>
										<td style="visibility:hidden;" class="text-center" width="2%"></td>
										<td style="visibility:hidden;" class="text-center" width="9%"></td>
										<td style="visibility:hidden;" class="text-center" width="5%"></td>
										<td style="visibility:hidden;" class="text-center" width="5%"></td>
										<td style="visibility:hidden;" class="text-center" width="1%"></td>
									</tr>
								</thead>
								
								<tbody class="workMsg"></tbody>
								
							</table>
						</div>
					</div>
				</div> <!-- 업무 보관함 -->
				
			</div>
		</section>
	</div>


	<!-- 모달창 -->
	<%@ include file="/WEB-INF/views/message/msgModal.jsp"%>
	<%@ include file="/WEB-INF/views/message/messageJS.jsp"%>


</body>


