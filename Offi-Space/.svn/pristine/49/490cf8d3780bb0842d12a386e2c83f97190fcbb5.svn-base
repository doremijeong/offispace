<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="teamNoticeList" value="${dataMap.teamNoticeList}" />
<c:set var="teamNoticeImptList" value="${dataMap.teamNoticeImptList}" />
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />


<head></head>

<body>
<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>부서 공지</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">공지 사항</a></li>
							<li class="breadcrumb-item active">사내 공지</li>
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

				<!-- 공지목록-->
				<div class="column">
					<!-- 검색줄-->
					<div class="card card-info card-outline">
						<div class="card-header">
								<!--전체 선택 체크박스-->
								&nbsp;
								<c:if test="${loginUser.chargeCode eq 'R102' }">
									<button type="button" class="btn btn-default btn-md checkbox-toggle">
											<i class="far fa-square"></i>
									</button>
								</c:if>

								<!-- 공지 쓰기 버튼 -->
								<button type="button" class="btn btn-default btn-sm msg-modal" data-toggle="modal" data-target="#modal-registerPost">
									글쓰기&nbsp;<i class="fas fa-pen"></i>
								</button>

								<!-- 글 삭제 버튼 -->
								<c:if test="${loginUser.chargeCode eq 'R102' }">
	                <button type="button" class="btn btn-default btn-sm" onclick="remove_chk();">
										<i class="far fa-trash-alt"></i> 삭제
									</button>
								</c:if>


							<div class="card-tools col-sm-6" style="margin-top: 5px;">
								<div class="input-group input-group-sm">

									<select class="form-control col-sm-3" name="searchType" id="searchType">
										<option>선택</option>
										<option value="title" ${cri.searchType eq 'title' ? 'selected':'' }>제목</option>
										<option value="content" ${cri.searchType eq 'content' ? 'selected':'' }>내용</option>
										<option value="writer" ${cri.searchType eq 'writer' ? 'selected':'' }>작성자</option>
										<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
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

							<!-- 공지 목록 테이블-->
							<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-sm teamNoticeTable" style="table-layout:fixed;font-size: 0.80em;">
									<thead>
										<tr>
											<th class="text-center" width="2%"></th>
											<th class="text-center" width="10%">번호</th>
											<th class="text-center" width="30%">제목</th>
											<th class="text-center" width="6%">첨부파일</th>
											<th class="text-center" width="12%">작성자</th>
											<th class="text-center" width="12%">등록일</th>
											<th class="text-center" width="7%">조회수</th>
										</tr>
									</thead>

									<tbody>
										<c:if test="${!empty teamNoticeImptList}">
<%-- 										<c:set var="i" value="${fn:length(teamNoticeImptList)}"/> --%>
										<c:forEach items="${teamNoticeImptList}" var="teamNoticeImpt">
											<tr onclick="detail_go('${teamNoticeImpt.teamNoticeCode}');" style="cursor: pointer;" class="text-danger">
												<c:if test="${loginUser.chargeCode eq 'R102' }">
													<td onclick="event.cancelBubble=true">
														<input type="checkbox" name="chkBox1[]" value="${teamNoticeImpt.teamNoticeCode}" class="checkSelect" style="margin: 5px;">
													</td>
												</c:if>
												<c:if test="${loginUser.chargeCode ne 'R102' }">
													<td onclick="event.cancelBubble=true"></td>
												</c:if>
												<td class="text-center"><span class="badge bg-danger">필독</span></td>
												<td class="text-left text-truncate">&nbsp;${teamNoticeImpt.teamNoticeTitle}</td>
												
												<c:if test="${!empty teamNoticeImpt.attachList}">
													<td class="text-center"><i class="fas fa-paperclip"></i></td>
												</c:if>
												<c:if test="${empty teamNoticeImpt.attachList}">
													<td class="text-center"></td>
												</c:if>
												
												<td class="text-center">${teamNoticeImpt.teamNoticeEmp.empName}&nbsp;${teamNoticeImpt.teamNoticeEmp.positionValue}</td>
												<td class="text-center"><fmt:formatDate value="${teamNoticeImpt.teamNoticeDate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${teamNoticeImpt.teamNoticeDate}" pattern="E"/>)</td>
												<td class="text-center">${teamNoticeImpt.teamNoticeViewcnt}</td>
											</tr>
<%-- 											<c:set var="i" value="${i-1}"/> --%>
										</c:forEach>
									</c:if>

									</tbody>


									<tbody>
										<c:if test="${empty teamNoticeList}">
											<tr>
												<td colspan="7" class="text-center">
													등록된 공지사항이 없습니다.
												</td>
											</tr>
										</c:if>

										<c:if test="${!empty teamNoticeList}">
<%-- 										<c:set var="i" value="${fn:length(teamNoticeList)}"/> --%>
										<c:forEach items="${teamNoticeList}" var="teamNotice">
											<tr onclick="detail_go('${teamNotice.teamNoticeCode}');" style="cursor: pointer;">
												<c:if test="${loginUser.chargeCode eq 'R102' }">
													<td onclick="event.cancelBubble=true">
														<input type="checkbox" name="chkBox1[]" value="${teamNotice.teamNoticeCode}" class="checkSelect" style="margin: 5px;">
													</td>
												</c:if>
												<c:if test="${loginUser.chargeCode ne 'R102' }">
													<td onclick="event.cancelBubble=true"></td>
												</c:if>
												
<%-- 												<td class="text-center">${i}</td> --%>
												<c:set var="notiCode" value="${teamNotice.teamNoticeCode}"/>
												<td class="text-center">${fn:substring(notiCode,2,6) }</td>

												<c:if test="${teamNotice.teamNoticeImportance eq 'Y'}">
													<td class="text-left text-truncate"><span class="badge bg-danger">필독</span>&nbsp;${teamNotice.teamNoticeTitle}</td>
												</c:if>
												<c:if test="${teamNotice.teamNoticeImportance eq 'N'}">
													<td class="text-left text-truncate">${teamNotice.teamNoticeTitle}</td>
												</c:if>
												
												<c:if test="${!empty teamNotice.attachList}">
													<td class="text-center"><i class="fas fa-paperclip"></i></td>
												</c:if>
												<c:if test="${empty teamNotice.attachList}">
													<td class="text-center"></td>
												</c:if>
											
												<td class="text-center">${teamNotice.teamNoticeEmp.empName}&nbsp;${teamNotice.teamNoticeEmp.positionValue}</td>
												<td class="text-center"><fmt:formatDate value="${teamNotice.teamNoticeDate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${teamNotice.teamNoticeDate}" pattern="E"/>)</td>
												<td class="text-center">${teamNotice.teamNoticeViewcnt}</td>
											</tr>
<%-- 											<c:set var="i" value="${i-1}"/> --%>
										</c:forEach>
									</c:if>

									</tbody>

								</table> <!-- /.table -->
							</div> <!-- /.mail-box-messages -->
						</div> <!-- /.card-body-->


						<!--페이징-->
							<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
						<!--페이징-->

					</div> <!-- card -->
				</div> <!-- ./column -->
			</div> <!-- /.container-fluid -->
		</section> <!-- /.content -->
	</div> <!-- content-wrapper -->


	<%@ include file="/WEB-INF/views/board/teamNoticeModal.jsp"%>

	<script>
	
	
		function detail_go(teamNoticeCode) {
			$.ajax({
				url : 'increaseViewCnt?teamNoticeCode='+ teamNoticeCode,
				method : 'get',
				success : function() {
					OpenWindow('detail.do?teamNoticeCode='+teamNoticeCode, '', '950', '830');
				},
				error : function() {

				}
			})
		}
	
	
		// 체크박스로 삭제
		function remove_chk() {

			var sendArray = new Array();
			var sendCnt = 0;
			var chkBox = $(".checkSelect");

			for (i = 0; i < chkBox.length; i++) {
				if (chkBox[i].checked == true) {
					sendArray[sendCnt] = chkBox[i].value;
					sendCnt++;
				}
			}
			

			 if(sendCnt == 0){
		        Swal.fire({
						  icon: 'warning',
						  text: "선택된 글이 없습니다.",
						  showConfirmButton: false,
						  timer: 1500
						});
		     } else {
		    	 
		    		Swal.fire({
		    			  text: "글을 삭제하시겠습니까?",
		    			  icon: 'warning',
		    			  showCancelButton: true,
		    			  confirmButtonText: '확인',
		    			  cancelButtonText: '취소',
		    			  reverseButtons: false
		    			})
		    			.then((result) => {
		    				if (result.isConfirmed) {
		    					//alert(sendArray);
		    					$.ajax({
		    		 	    		url : "chkBoxRemove.do",
		    		 	    		type : "post",
		    		 	    		data : {"sendArray" : sendArray},
		    		 	    		success: function(data){
		    		 	    			location.reload();
		    		 	    		},
		    		 	    		error: function(xhr) {
		    		 	    			callFail();
		    		 	    		}
		    		 	    	}); //ajax
		    				} else if ( result.dismiss === Swal.DismissReason.cancel) {
		    					callCancel(canTitle,canText);
		    			 	}
		    			});
		     }; //else
		};
	</script>

</body>


