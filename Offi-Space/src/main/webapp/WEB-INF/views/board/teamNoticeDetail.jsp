<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<head>
	<style type="text/css">
		.notiContent {
			height: 400px;
			overflow-y: scroll;
		}
	</style>
</head>

<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper" style="min-height: 800px;">
		<!-- Content Header (Page header) -->
		<section class="content-header"></section>


		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- 마진을 위한 div -->
				<div style="height: 3px;"></div>

				<div class="column">
					<div class="card card-info card-outline">
						<div class="card-header ">
							<div class="row d-flex justify-content-between">
								<h4>부서 공지</h4>
								<div>
									<c:if test="${teamNotice.teamNoticeEmp.empCode eq loginUser.empCode}">
										<button type="button" class="btn btn-warning btn-sm" onclick="modify()">수정</button>
										<button type="button" class="btn btn-danger btn-sm" onclick="remove_go();">삭제</button>
									</c:if>
										<button type="button" class="btn btn-default btn-sm" onclick="${!empty from ? 'window.close()' : 'CloseWindow()'};">닫기</button>
								</div>

							</div>
						</div>

						<div class="card-body p-4">
							<div class="table-responsive">
								<table class="table table-bordered table-sm" style="font-size: 0.8em;">
									<colgroup>
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 35%;">
										<col style="width: 15%; background-color: lightgray;">
										<col style="width: 35%;">
									</colgroup>
									<tbody>

										<tr>
											<td style="text-align: right; font-weight: bold;">공지번호&nbsp;</td>
											<c:set var="notiCode" value="${teamNotice.teamNoticeCode}"/>
											<td>${fn:substring(notiCode,2,6) }</td>

											<td style="text-align: right; font-weight: bold;">조회수</td>
											<td>${teamNotice.teamNoticeViewcnt}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
											<td colspan="3">${teamNotice.teamNoticeTitle}</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">작성일&nbsp;</td>
											<td><fmt:formatDate value="${teamNotice.teamNoticeDate}" pattern="yyyy-MM-dd(E)" /></td>
											<td style="text-align: right; font-weight: bold;">게시기간&nbsp;</td>
											<td>
											<fmt:formatDate value="${teamNotice.teamNoticeSdate}" pattern="yyyy-MM-dd(E)" />
												&nbsp;~&nbsp;
											<fmt:formatDate value="${teamNotice.teamNoticeEdate}" pattern="yyyy-MM-dd(E)" />
											</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">작성자&nbsp;</td>
											<td>${teamNotice.teamNoticeEmp.empName}&nbsp;${teamNotice.teamNoticeEmp.positionValue}</td>
											<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
											<td>${teamNotice.teamNoticeEmp.groupValue}&nbsp;&nbsp;${teamNotice.teamNoticeEmp.teamValue }</td>
										</tr>

										<tr>
											<td style="text-align: right; font-weight: bold;">첨부파일&nbsp;</td>
											<td colspan="3">
												<c:if test="${!empty teamNotice.attachList}">
														<c:forEach items="${teamNotice.attachList}" var="attach">
															<p>
																<a class="mailbox-attachment-name"  href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}"  >
																<i class="fas fa-paperclip"></i>&nbsp;${attach.attachSavename}&nbsp;&nbsp;
																</a>
															</p>
														</c:forEach>
												</c:if>
												<c:if test="${empty teamNotice.attachList}">
													등록된 첨부파일이 없습니다.
												</c:if>
											</td>
										</tr>

										<tr style="background-color: white;">
											<td colspan="4" class="notiContent">${teamNotice.teamNoticeContent}</td>
										</tr>

									</tbody>
								</table>	<!-- /.table -->


							</div> <!-- card -->
						</div> <!-- /.mail-box-messages -->
					</div> <!-- 수신 업무 상세 조회-->

					</div> <!-- column -->
				</div> <!-- /.container-fluid -->
			</section>
		</div> <!-- content-wrapper -->

<script>
	function modify() {
		location.href ="modifyForm?teamNoticeCode=${teamNotice.teamNoticeCode}";
	}

	function remove_go() {
		Swal.fire({
		      title: '공지사항 삭제',
		      text: '삭제하시겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '삭제',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
		    			url : 'remove?teamNoticeCode=${teamNotice.teamNoticeCode}',
		    			method : 'get',
						success : function() {
							callSuccess('공지사항 삭제', '삭제에 성공하였습니다.');
							CloseWindow();
						},
						error : function() {
							console.log("에러에러")
						}
		    		})
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            callCancel(canTitle,canText);
		         }
		    });
	}
</script>


</body>
