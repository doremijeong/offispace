<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="msgList" value="${dataMap.msgList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="msgCri" value="${dataMap.pageMaker.msgCri}" />

<head></head>

<body>
<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>보낸 쪽지함</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">쪽지</a></li>
							<li class="breadcrumb-item active">보낸 쪽지함</li>
						</ol>
					</div>
				</div>
			</div>
		</section>


		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- 마진을 위한 div -->
				<div style="height: 3px;"></div>

				<!-- 쪽지목록-->
				<div class="column">
					<!-- 검색줄-->
					<div class="card card-info card-outline">
							<div class="card-header">
								<!--전체 선택 체크박스-->
								&nbsp;
								<button type="button" class="btn btn-default btn-md checkbox-toggle">
										<i class="far fa-square"></i>
								</button>
								
								<!-- 쪽지 보내기 버튼 -->
								<button type="button" class="btn btn-default btn-sm msg-modal" onclick="sendMsgModal();">
									쪽지쓰기&nbsp;<i class="fas fa-pen"></i>
								</button>
								
<!-- 								중요한 쪽지만 보기 -->
<!-- 								<button type="button"	class="btn btn-default btn-sm checkbox-toggle2"> -->
<!-- 									<i class="far fa-square"></i>&nbsp; -->
<!-- 									<i class="fas fa-exclamation text-danger"></i> -->
<!-- 								</button> -->
								
<!-- 								안 읽은 쪽지만 보기 -->
<!-- 								<button type="button" class="btn btn-default btn-sm checkbox-toggle3"> -->
<!-- 									<i class="far fa-square"></i>&nbsp; -->
<!-- 									<i class="fas fa-envelope text-gray"></i> -->
<!-- 								</button> -->

								<!-- 쪽지 삭제 버튼 -->
								<button type="button" class="btn btn-default btn-sm" onclick="moveToBinBtn();">
									<i class="far fa-trash-alt"></i> 삭제
								</button>
								
								<!-- 쪽지 이동 버튼 -->
								<a class="nav-link" data-toggle="dropdown" href="#" style="display: inline-block; padding: 0">
									<button type="button" class="btn btn-default btn-sm">
										이동&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>
									</button>
								</a>
								<!-- 이동함 목록 -->
								<div class="dropdown-menu dropdown-menu dropdown-menu-left">
									<a href="javascript:moveToPersonalBtn();" class="dropdown-item">
										<p style="font-size: 0.8em; margin: 0;">개인 보관함</p>
									</a>
									
									<div class="dropdown-divider" style="margin: 0;"></div>
									<a href="javascript:moveToWorkBtn();" class="dropdown-item">
										<p style="font-size: 0.8em; margin: 0;">업무 보관함</p>
									</a>
									
									<div class="dropdown-divider" style="margin: 0;"></div>
									<a href="javascript:moveToBinBtn();" class="dropdown-item">
										<p style="font-size: 0.8em; margin: 0;">휴지통</p>
									</a>
								</div>
								
								
							
							<div class="card-tools col-sm-6" style="margin-top: 5px;">
								<div class="input-group input-group-sm">
									 
									<select class="form-control col-sm-3" name="searchType" id="searchType">
										<option>선택</option>
										<option value="content"	${msgCri.searchType eq 'content' ? 'selected':''}>내용</option>
										<option value="from" ${msgCri.searchType eq 'from' ? 'selected':''}>보낸사람</option>
									</select> &nbsp; 
									
									<input type="text" name="keyword" class="form-control" placeholder="검색">
									<div class="input-group-append">
										<div class="btn btn-primary" onclick="list_go(1);">
											<i class="fas fa-search" style="padding:3px;"></i>
										</div>
									</div> <!-- 검색버튼 -->
								</div> <!-- input-group input-group-sm -->
							</div> <!-- /.card-tools -->
							
						</div> <!-- /.card-header -->


							<div class="card-body p-0">

							<!-- 쪽지 목록 테이블-->
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-sm msgToTable" style="table-layout:fixed">
									<thead style="font-size: 0.85em;">
										<tr>
											<th class="text-center" width="2%"></th>
											<th class="text-center" width="3%">중요도</th>
											<th class="text-center" width="2%">상태</th>
											<th class="text-center" width="4%">받는사람</th>
											<th class="text-center" width="20%">내용</th>
											<th class="text-center" width="8%">날짜</th>
											<th style="visibility:hidden;" width="1%"></th>
										</tr>
									</thead>

									<tbody>
									<!-- 받은 쪽지가 없을 경우 -->
										<c:if test="${empty msgList}">
											<tr>
												<td colspan="6" class="text-center">받은 쪽지가 없습니다.</td>
											</tr>
										</c:if>
										
										<!-- 받은 쪽지가 있을 경우 -->
										<c:if test="${!empty msgList}">
											<c:forEach items="${msgList}" var="msg">
													<!-- 받은 사람이 쪽지를 안 읽었다면 -->
												<c:if test="${msg.msgRead eq 0}">
													<tr class="text-primary" style="font-size: 0.85em; cursor:pointer;">
													
														<td onclick="event.cancelBubble=true">
															<!-- 체크 박스 -->
																<input type="checkbox" name="chkBox1[]" value="${msg.msgCode}" class="checkSelect" style="margin: 5px;"> 
														</td>
	
														<td class="text-center" onclick="event.cancelBubble=true">
															<c:if test="${msg.msgImpt eq 1}">
																<p  style="margin: 2px;">
																	<i class="fas fa-exclamation text-danger"></i>
																</p>
															</c:if>
														</td>
	
														<td class="text-center">
															<c:if test="${msg.msgRead eq 1}">
																<p  style="margin: 2px;">
																  <i class="far fa-envelope-open text-info"></i>
																</p>
															</c:if> 
															<c:if test="${msg.msgRead eq 0}">
																<p  style="margin: 2px;">
																	<i class="fas fa-envelope text-info"></i>
																</p>
															</c:if>
														</td>
														
														<td class="mailbox-name text-center" onclick="event.cancelBubble=true"><nobr>
															<p style="margin: 2px;">${msg.msgToName}&nbsp;${msg.msgToPosition}</p>
														</td>
					
														<td class="mailbox-subject" width="100" style="text-overflow:ellipsis; overflow:hidden; white-space: nowrap;">
															 <p class="modal_msgDetail text-truncate" style="margin:2px;">${msg.msgContent}</p>
														</td>
														
														<td class="text-center">
															<fmt:formatDate value="${msg.msgDt}" pattern="YYYY-MM-dd(E) HH:mm" />
														</td>
														
														<td class="msgCode" style="visibility:hidden;position:absolute;">${msg.msgCode}</td>
													</tr>
												</c:if>
													
													
														<!-- 받은 사람이 쪽지를 읽었다면 -->
												<c:if test="${msg.msgRead eq 1}">
													<tr class="text-secondary" style="font-size: 0.85em; cursor:pointer;">
													
														<td onclick="event.cancelBubble=true">
															<!-- 체크 박스 -->
																<input type="checkbox" name="chkBox1[]" value="${msg.msgCode}" class="checkSelect" style="margin: 5px;"> 
														</td>
	
														<td class="text-center" onclick="event.cancelBubble=true">
															<c:if test="${msg.msgImpt eq 1}">
																<p  style="margin: 2px;">
																	<i class="fas fa-exclamation text-danger"></i>
																</p>
															</c:if>
														</td>
	
														<td class="text-center">
															<c:if test="${msg.msgRead eq 1}">
																<p  style="margin: 2px;">
																  <i class="far fa-envelope-open text-info"></i>
																</p>
															</c:if> 
															<c:if test="${msg.msgRead eq 0}">
																<p  style="margin: 2px;">
																	<i class="fas fa-envelope text-info"></i>
																</p>
															</c:if>
														</td>
														
														<td class="mailbox-name text-center" onclick="event.cancelBubble=true"><nobr>
															<p style="margin: 2px;">${msg.msgToName}&nbsp;${msg.msgToPosition}</p>
														</td>
					
														<td class="mailbox-subject" width="100" style="text-overflow:ellipsis; overflow:hidden; white-space: nowrap;">
															 <p class="modal_msgDetail text-truncate" style="margin:2px;">${msg.msgContent}</p>
														</td>
														
														<td class="text-center">
															<fmt:formatDate value="${msg.msgDt}" pattern="YYYY-MM-dd(E) HH:mm" />
														</td>
														
														<td class="msgCode" style="visibility:hidden;position:absolute;">${msg.msgCode}</td>
													</tr>
												</c:if>
												
										
											</c:forEach>
										</c:if>

									</tbody>
								</table> <!-- /.table -->
							</div> <!-- /.mail-box-messages -->
						</div> <!-- /.card-body-->


						<!--페이징-->
							<%@ include file="/WEB-INF/views/message/msgPagination.jsp"%>
						<!--페이징-->

					</div>
					<!-- card -->
				</div>
				<!-- ./column -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
		</div>


	<!-- 모달창 -->
	<%@ include file="/WEB-INF/views/message/msgModal.jsp"%>
	<%@ include file="/WEB-INF/views/message/messageJS.jsp"%>


</body>


