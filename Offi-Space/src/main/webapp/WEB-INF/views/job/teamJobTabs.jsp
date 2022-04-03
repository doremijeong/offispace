<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="teamReceived" value="${dataMap.teamReceived.sortedJobList}" />
<c:set var="teamRequested" value="${dataMap.teamRequested.sortedJobList}" />
<c:set var="receivedPageMaker" value="${dataMap.teamReceived.pageMaker}" />
<c:set var="requestedPageMaker" value="${dataMap.teamRequested.pageMaker}" />
<c:set var="issueListReceived" value="${dataMap.issueListReceived}" />
<c:set var="issueListRequested" value="${dataMap.issueListRequested}" />

<head></head>

<title>부서 업무함</title>
<body>
<script>
loaderShow();
</script>
   <!-- Content Header (Page header) -->
    <div class="content-wrapper" style="min-height: 1602px;">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h5>부서 업무함</h5>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">업무</a></li>
                <li class="breadcrumb-item active">부서 업무함</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>


      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- 마진을 위한 div -->
          <div style="height: 3px;"></div>

          <div class="row">
            <!-- left-list -->
            <div class="col-lg-12">
              <div class="card card-primary card-outline card-outline-tabs">
                <div class="card-header p-0 border-bottom-0">
                  <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="job-tab-for-teamReceived" data-toggle="pill" href="#teamReceived-job-tab"
                        role="tab" aria-controls="teamReceived-job-tab" onclick="setSearchType('teamReceived');" aria-selected="true">수신</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="job-tab-for-teamRequested" data-toggle="pill" href="#teamRequested-job-tab"
                        role="tab" aria-controls="teamRequested-job-tab" onclick="setSearchType('teamRequested');" aria-selected="false">요청</a>
                    </li>
                  </ul>
                </div>
                <div class="card-body">
                	<div class="row" style="justify-content: flex-end; height:47.19px;">
						       		<div class="input-group mb-3 float-right row" style="padding-right:0; box-sizing: content-box;" >
										<div class="col-lg-2 searchToolItems">
											<div style="margin-right:5px;">
												<a href="javascript:void(0);" onclick="resetCondition();" class="btn btn-block btn-sm btn-default">
												검색조건 초기화
												</a>
											</div>
										</div>
										<div class="row col-lg-5 searchToolItems" style="justify-content: flex-end;">
										  	 <div style="margin-right:5px;">
												<a href="javascript:void(0);" onclick="jobStatusSearch('waiting')" class="btn btn-block btn-sm btn-default">
													대기 <span class="badge bg-success waitingBadge"></span>
												</a>
											</div>
											<div style="margin-right:5px;">
												<a  href="javascript:void(0);" onclick="jobStatusSearch('working')"  class="btn btn-block btn-sm btn-default">
													진행 <span class="badge bg-primary workingBadge"></span>
												</a>
											</div>
											<div  href="javascript:void(0);" onclick="jobStatusSearch('late')" style="margin-right:5px;">
												<a  class="btn btn-block btn-sm btn-default">
													지연 <span class="badge bg-warning lateBadge"></span>
												</a>
											</div>
											<div  href="javascript:void(0);" onclick="jobStatusSearch('done')" style="margin-right:5px;">
												<a  class="btn btn-block btn-sm btn-default">
												완료
												</a>
											</div>
										</div>
										<div class="input-group col-lg-5 searchToolItems">
                  		<input type="text" class="form-control" style="height:31.2px;" name="searchKeyword" placeholder="검색">
                  		<div class="input-group-append">
                    		<button class="input-group-text btn-sm btn-primary searchBtn" data-search-type="teamReceived"  onclick="setContition(this)"><i class="fa fa-search"></i></button>
                  		</div>
										</div>
					           		 </div>
									<input type="hidden" class="teamReceivedSearch" data-search-type="teamReceived" data-page="1" data-keyword="" data-waiting="" data-working="" data-late="">
									<input type="hidden" class="teamRequestedSearch" data-search-type="teamRequested" data-page="1" data-keyword="" data-waiting="" data-working="" data-late="">
	                </div>
                  <div class="tab-content" id="custom-tabs-four-tabContent">

                    <!--부서 수신 업무함==================================================================================================-->
                    <div class="tab-pane fade active show teamReceivedListBox" id="teamReceived-job-tab" role="tabpanel" aria-labelledby="teamReceived-job-tab">
                      <table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
                        <thead>
                          <tr>
                            <th class="text-center" style="width:3%"></th>
                            <th class="text-center" style="width:17%">업무</th>
                            <th class="text-center" style="width:14%">제목</th>
                            <th class="text-center" style="width:5%">요청자</th>
                            <th class="text-center" style="width:5%">담당자</th>
                            <th class="text-center" style="width:6%;">등록일</th>
                            <th class="text-center" style="width:6%;">마감일</th>
                            <th class="text-center" style="width:6%;">진척도</th>
                            <th class="text-center" style="width:3%;">상태</th>
                          </tr>
                        </thead>

                        <tbody>
<c:if test="${!empty issueListReceived}">
	<c:forEach items="${issueListReceived }" var="job">
		<tr onclick="myReceivedJobDetail('${job.jobCode}');" style="cursor: pointer;"  bgcolor="#ffb1ab">
									<c:if test="${job.jobImportance eq 'Y'}">
										<td class="text-center">
											<span class="badge bg-primary">중요</span>
										</td>
									</c:if>
									<c:if test="${job.jobImportance eq 'N'}">
										<td class="text-center"></td>
									</c:if>

									<td class="text-left text-truncate">${job.jobcodeName}</td>
									<td class="text-left text-truncate">${job.jobTitle}</td>

									<td class="text-center text-truncate">
										<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
										data-emp-name='${job.jobRequester.empName }'
										data-emp-telephone='${job.jobRequester.empTelephone }'
										data-emp-email='${job.jobRequester.empEmail }'
										data-position-value='${job.jobRequester.positionValue }'
										data-team-value='${job.jobRequester.teamValue }'
										data-group-value='${job.jobRequester.groupValue }'
										data-attach-savename='${job.jobRequester.attachSavename }'
										>
								  		${job.jobRequester.empName}&nbsp;${job.jobRequester.positionValue}
									</a>
									</td>
									<td class="text-center text-truncate">
										<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
										data-emp-name='${job.jobReceiver.empName }'
										data-emp-telephone='${job.jobReceiver.empTelephone }'
										data-emp-email='${job.jobReceiver.empEmail }'
										data-position-value='${job.jobReceiver.positionValue }'
										data-team-value='${job.jobReceiver.teamValue }'
										data-group-value='${job.jobReceiver.groupValue }'
										data-attach-savename='${job.jobReceiver.attachSavename }'
										>
								  		${job.jobReceiver.empName}&nbsp;${job.jobReceiver.positionValue}
									</a>
									</td>

									<!-- 업무 등록일(보낸/받은 날짜) -->
									<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
										<fmt:formatDate value="${job.jobRequestDt}" pattern="yyyy-MM-dd(E)" />
									</td>

									<!-- 업무 마감일 -->
									<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
										<fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
									</td>

									<!-- 업무 진척도 -->
									<td class="text-center">
										<div class="progress progress-xs" style="margin-top: 6px;">
											<div class="progress-bar progress-bar-danger"	style="width: ${job.jobProgress}%"></div>
										</div>
									</td>

									<!-- 업무 상태 -->
									<td class="text-center">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${job.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
	<c:when test="${job.jobStatus eq '완료'}">
																<span class="badge bg-secondary">완료</span>
	</c:when>
	<c:otherwise>
	<c:if test="${job.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${job.jobDenied eq 'N'}">
			<c:choose>
				<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
				</c:when>
				<c:otherwise>
																	<c:if test="${job.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${job.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:otherwise>
</c:choose>
									</td>
								</tr>
	</c:forEach>
</c:if>
                       <c:if test="${empty teamReceived}">
							<tr>
								<td colspan="7" class="text-center">수신한 업무가 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${!empty teamReceived}">
							<c:forEach items="${teamReceived}" var="job">
								<tr onclick="myReceivedJobDetail('${job.jobCode}');" style="cursor: pointer;">
									<c:if test="${job.jobImportance eq 'Y'}">
										<td class="text-center">
											<span class="badge bg-primary">중요</span>
										</td>
									</c:if>
									<c:if test="${job.jobImportance eq 'N'}">
										<td class="text-center"></td>
									</c:if>

									<td class="text-left text-truncate">${job.jobcodeName}</td>
									<td class="text-left text-truncate">${job.jobTitle}</td>
									<td class="text-center text-truncate">
										<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
										data-emp-name='${job.jobRequester.empName }'
										data-emp-telephone='${job.jobRequester.empTelephone }'
										data-emp-email='${job.jobRequester.empEmail }'
										data-position-value='${job.jobRequester.positionValue }'
										data-team-value='${job.jobRequester.teamValue }'
										data-group-value='${job.jobRequester.groupValue }'
										data-attach-savename='${job.jobRequester.attachSavename }'
										>
								  		${job.jobRequester.empName}&nbsp;${job.jobRequester.positionValue}
									</a>
									</td>
									<td class="text-center text-truncate">
										<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
										data-emp-name='${job.jobReceiver.empName }'
										data-emp-telephone='${job.jobReceiver.empTelephone }'
										data-emp-email='${job.jobReceiver.empEmail }'
										data-position-value='${job.jobReceiver.positionValue }'
										data-team-value='${job.jobReceiver.teamValue }'
										data-group-value='${job.jobReceiver.groupValue }'
										data-attach-savename='${job.jobReceiver.attachSavename }'
										>
								  		${job.jobReceiver.empName}&nbsp;${job.jobReceiver.positionValue}
									</a>
									</td>


									<!-- 업무 등록일(보낸/받은 날짜) -->
									<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
										<fmt:formatDate value="${job.jobRequestDt}" pattern="yyyy-MM-dd(E)" />
									</td>

									<!-- 업무 마감일 -->
									<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
										<fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
									</td>

									<!-- 업무 진척도 -->
									<td class="text-center">
										<div class="progress progress-xs" style="margin-top: 6px;">
											<div class="progress-bar progress-bar-danger"	style="width: ${job.jobProgress}%"></div>
										</div>
									</td>

									<!-- 업무 상태 -->
									<td class="text-center">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${job.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
	<c:when test="${job.jobStatus eq '완료'}">
																<span class="badge bg-secondary">완료</span>
	</c:when>
	<c:otherwise>
	<c:if test="${job.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${job.jobDenied eq 'N'}">
			<c:choose>
				<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
				</c:when>
				<c:otherwise>
																	<c:if test="${job.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${job.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:otherwise>
</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:if>
                        </tbody>
                      </table>

                      <!--페이징-->
            <div class="card-footer p-2 navBox">
						<nav aria-label="Navigation">
							<ul class="pagination  pagination-sm justify-content-center m-0">

								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamReceived',1,'${receivedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
								<i class="fas fa-angle-double-left"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamReceived','${receivedPageMaker.prev ? receivedPageMaker.startPage - 1 : receivedPageMaker.jobKeywordSearchCriteria.page}','${receivedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
										<i class="fas fa-angle-left"></i>
									</a>
								</li>
								<c:forEach var="pageNum" begin="${receivedPageMaker.startPage}" end="${receivedPageMaker.endPage}" step="1">
									<li class="page-item ${receivedPageMaker.jobKeywordSearchCriteria.page ==  pageNum ? 'active' : ''}">
										<a class="page-link" style="display:inline" href="javascript:pageSearch('teamReceived',${pageNum},'${receivedPageMaker.jobKeywordSearchCriteria.jobStatus}');"> ${pageNum}</a>
									</li>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamReceived','${receivedPageMaker.next ? receivedPageMaker.endPage + 1 : receivedPageMaker.jobKeywordSearchCriteria.page},'${receivedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
										<i class="fas fa-angle-right"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamReceived',${receivedPageMaker.realEndPage},'${receivedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
												<i class="fas fa-angle-double-right">&nbsp;</i>
									</a>
								</li>
							</ul>
						</nav>
						<!--페이징-->
                    </div>
                    </div>
					<!--  tab-pane-->

                    <!--요청 업무함==================================================================================================-->
                    <div class="tab-pane fade teamRequestedListBox" id="teamRequested-job-tab" role="tabpanel" aria-labelledby="teamRequested-job-tab">
                     	<table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
							<thead>
								<tr>
									<th class="text-center" style="width: 3%"></th>
									<th class="text-center" style="width: 17%">업무</th>
									<th class="text-center" style="width: 15%">제목</th>
									<th class="text-center" style="width: 6%">요청자</th>
									<th class="text-center" style="width: 6%">수신자</th>
									<th class="text-center" style="width: 7%;">마감일</th>
									<th class="text-center" style="width: 7%;">진척도</th>
									<th class="text-center" style="width: 3%;">상태</th>
								</tr>
							</thead>

							<tbody>
<c:if test="${!empty issueListRequested}">
	<c:forEach items="${issueListRequested }" var="reqJob">
							<tr onclick="myRequestedJobDetail('${reqJob.jobCode}');" style="cursor: pointer;"  bgcolor="#ffb1ab">
								<c:if test="${reqJob.jobImportance eq 'Y'}">
									<td class="text-center">
										<span class="badge bg-primary">중요</span>
									</td>
								</c:if>
								<c:if test="${reqJob.jobImportance eq 'N'}">
									<td class="text-center"></td>
								</c:if>

								<td class="text-left text-truncate">${reqJob.jobcodeName}</td>
								<td class="text-left text-truncate">${reqJob.jobTitle}</td>
								<td class="text-center text-truncate">
									<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
									data-emp-name='${reqJob.jobRequester.empName }'
									data-emp-telephone='${reqJob.jobRequester.empTelephone }'
									data-emp-email='${reqJob.jobRequester.empEmail }'
									data-position-value='${reqJob.jobRequester.positionValue }'
									data-team-value='${reqJob.jobRequester.teamValue }'
									data-group-value='${reqJob.jobRequester.groupValue }'
									data-attach-savename='${reqJob.jobRequester.attachSavename }'
									>
							  	${reqJob.jobRequester.empName}&nbsp;${reqJob.jobRequester.positionValue}
								</a>
								</td>
								<td class="text-center text-truncate">
									<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
									data-emp-name='${reqJob.jobReceiver.empName }'
									data-emp-telephone='${reqJob.jobReceiver.empTelephone }'
									data-emp-email='${reqJob.jobReceiver.empEmail }'
									data-position-value='${reqJob.jobReceiver.positionValue }'
									data-team-value='${reqJob.jobReceiver.teamValue }'
									data-group-value='${reqJob.jobReceiver.groupValue }'
									data-attach-savename='${reqJob.jobReceiver.attachSavename }'
									>
							  	${reqJob.jobReceiver.empName}&nbsp;${reqJob.jobReceiver.positionValue}
								</a>
								</td>

								<!-- 업무 마감일 -->
								<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
									<fmt:formatDate value="${reqJob.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
								</td>

								<td class="text-center">
									<div class="progress progress-xs" style="margin-top: 6px;">
										<div class="progress-bar progress-bar-danger"	style="width: ${reqJob.jobProgress}%"></div>
									</div>
								</td>

								<!-- 업무 상태 -->
								<td class="text-center">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${reqJob.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
<c:when test="${reqJob.jobStatus eq '완료'}">
									<span class="badge bg-secondary">완료</span>
</c:when>
<c:otherwise>
	<c:if test="${reqJob.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${reqJob.jobDenied eq 'N'}">
								<c:choose>
								<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
								</c:when>
								<c:otherwise>
																	<c:if test="${reqJob.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${reqJob.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
								</c:otherwise>
								</c:choose>
		</c:if>
</c:otherwise>
</c:choose>
								</td>
								</tr>
	</c:forEach>
</c:if>

												<c:if test="${empty teamRequested}">
													<tr>
														<td colspan="7" class="text-center">요청한 업무가 없습니다.</td>
													</tr>
												</c:if>


												<c:if test="${!empty teamRequested}">
													<c:forEach items="${teamRequested}" var="reqJob">
														<tr onclick="myRequestedJobDetail('${reqJob.jobCode}');" style="cursor: pointer;">
															<c:if test="${reqJob.jobImportance eq 'Y'}">
																<td class="text-center">
																	<span class="badge bg-primary">중요</span>
																</td>
															</c:if>
															<c:if test="${reqJob.jobImportance eq 'N'}">
																<td class="text-center"></td>
															</c:if>

															<td class="text-left text-truncate">${reqJob.jobcodeName}</td>
															<td class="text-left text-truncate">${reqJob.jobTitle}</td>
															<td class="text-center text-truncate">
																<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
																data-emp-name='${reqJob.jobRequester.empName }'
																data-emp-telephone='${reqJob.jobRequester.empTelephone }'
																data-emp-email='${reqJob.jobRequester.empEmail }'
																data-position-value='${reqJob.jobRequester.positionValue }'
																data-team-value='${reqJob.jobRequester.teamValue }'
																data-group-value='${reqJob.jobRequester.groupValue }'
																data-attach-savename='${reqJob.jobRequester.attachSavename }'
																>
														  	${reqJob.jobRequester.empName}&nbsp;${reqJob.jobRequester.positionValue}
															</a>
															</td>
															<td class="text-center text-truncate">
																<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
																data-emp-name='${reqJob.jobReceiver.empName }'
																data-emp-telephone='${reqJob.jobReceiver.empTelephone }'
																data-emp-email='${reqJob.jobReceiver.empEmail }'
																data-position-value='${reqJob.jobReceiver.positionValue }'
																data-team-value='${reqJob.jobReceiver.teamValue }'
																data-group-value='${reqJob.jobReceiver.groupValue }'
																data-attach-savename='${reqJob.jobReceiver.attachSavename }'
																>
														  	${reqJob.jobReceiver.empName}&nbsp;${reqJob.jobReceiver.positionValue}
															</a>
															</td>



															<!-- 업무 마감일 -->
															<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
																<fmt:formatDate value="${reqJob.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
															</td>

															<td class="text-center">
																<div class="progress progress-xs" style="margin-top: 6px;">
																	<div class="progress-bar progress-bar-danger"	style="width: ${reqJob.jobProgress}%"></div>
																</div>
															</td>

															<!-- 업무 상태 -->
															<td class="text-center">
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate var="now" type="date" value="${today }" pattern="yyyyMMdd"/>
<fmt:formatDate var="closing" value="${reqJob.jobClosingDt}" pattern="yyyyMMdd" />
<c:choose>
<c:when test="${reqJob.jobStatus eq '완료'}">
									<span class="badge bg-secondary">완료</span>
</c:when>
<c:otherwise>
	<c:if test="${reqJob.jobDenied eq 'Y'}">
																	<span class="badge bg-danger">반려</span>
		</c:if>
		<c:if test="${reqJob.jobDenied eq 'N'}">
								<c:choose>
								<c:when test="${now gt closing}">
																	<span class="badge bg-warning">지연</span>
								</c:when>
								<c:otherwise>
																	<c:if test="${reqJob.jobStatus eq '대기'}">
																		<span class="badge bg-success">대기</span>
																	</c:if>
																	<c:if test="${reqJob.jobStatus eq '진행'}">
																		<span class="badge bg-primary">진행</span>
																	</c:if>
								</c:otherwise>
								</c:choose>
		</c:if>
</c:otherwise>
</c:choose>
															</td>
														</tr>
													</c:forEach>
												</c:if>

											</tbody>
										</table>

                      <!--페이징-->
                      <div class="card-footer p-2 navBox">
						<nav aria-label="Navigation">
							<ul class="pagination  pagination-sm justify-content-center m-0">
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamRequested',1,'${requestedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
								<i class="fas fa-angle-double-left"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamRequested','${requestedPageMaker.prev ? requestedPageMaker.startPage - 1 : requestedPageMaker.jobKeywordSearchCriteria.page}','${requestedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
										<i class="fas fa-angle-left"></i>
									</a>
								</li>
								<c:forEach var="pageNum" begin="${requestedPageMaker.startPage}" end="${requestedPageMaker.endPage}" step="1">
									<li class="page-item ${requestedPageMaker.jobKeywordSearchCriteria.page ==  pageNum ? 'active' : ''}">
										<a class="page-link" style="display:inline" href="javascript:pageSearch('teamRequested',${pageNum},'${requestedPageMaker.jobKeywordSearchCriteria.jobStatus}');"> ${pageNum}</a>
									</li>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamRequested','${requestedPageMaker.next ? requestedPageMaker.endPage + 1 : requestedPageMaker.jobKeywordSearchCriteria.page},'${requestedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
										<i class="fas fa-angle-right"></i>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" style="display:inline" href="javascript:pageSearch('teamRequested',${requestedPageMaker.realEndPage},'${requestedPageMaker.jobKeywordSearchCriteria.jobStatus}');">
												<i class="fas fa-angle-double-right">&nbsp;</i>
									</a>
								</li>
							</ul>
						</nav>
						<!--페이징-->
                    </div>
                    </div>
					<!--  tab-pane-->

                  </div>
                  <!--tab-content-->
                </div>
                <!-- /.card-body -->
              </div>
              <!--card-->
            </div>
            <!--col-lg-12(탭 크기)-->
          </div>
          <!-- row -->
        </div>

  </div> <!-- /.container-fluid -->
  </section> <!-- /.content -->
  </div> <!-- content-wrapper -->


  <script>
	window.onload  = function() {

		//새로고침할 때 탭 유지(임시)
		$(document).ready(function(){
		    $('a[ data-toggle="pill"]').on('show.bs.tab', function(e) {
		        localStorage.setItem('activeTab', $(e.target).attr('href'));
		    });
		    var activeTab = localStorage.getItem('activeTab');
		    if(activeTab){
		        $('#custom-tabs-four-tab a[href="' + activeTab + '"]').tab('show');
		    }
		})

		/*  툴팁 활성화 */
		setTooltips();
		setSearchType("teamRequested");resetCondition();
		setTimeout(()=>{
		setSearchType("teamReceived");resetCondition();
		loaderHide();
		},800);
	};


	function myReceivedJobDetail(jobCode){
		OpenWindow('<%=request.getContextPath()%>/job/receivedJobDetail?jobCode='+jobCode, '', '950', '830');
	};

	function myRequestedJobDetail(jobCode){
		OpenWindow('<%=request.getContextPath()%>/job/requestedJobDetail?jobCode='+jobCode, '', '950', '830');
	};


	/*  탭 클릭시, 검색창의 조건을 해당 수신, 요청, 참조로 설정하고, 대기 지연 진행의 수를 세팅하도록 함 */
	const setSearchType = searchType => {
		setStatusTagNumber(searchType);
		document.querySelector('.searchBtn').dataset.searchType = searchType;
	};

	/*  검색 조건 초기화 및 목록 초기화 */
	const resetCondition = () => {
		document.querySelector('input[name="searchKeyword"]').value="";
		document.querySelector('.searchBtn').dataset.keword="";
		document.querySelector('.searchBtn').dataset.jobStatus="";
		getJobListByKeawordSearch(document.querySelector('.searchBtn').dataset.searchType);
	};

	/*  페이지네이션에서 클릭시 새로운 목록을 로드하는 */
	const pageSearch = (searchType, page, status) =>  {
		let keyword = document.querySelector('.'+searchType+'Search').dataset.keyword;

		//console.log(searchType, keyword,page,status);
		fetch('sortedjobList?searchType='+searchType+'&keyword='+keyword+"&page="+page+"&jobStatus="+status)
		.then(response => response.json())
		.then(data => {
			console.log('Sunccess:',data);
			setPrintOption(data.pageMaker.jobKeywordSearchCriteria.searchType,data);
		})
		.catch(error => {
			console.log('Error:', error);
		});
	};
	/*  업무 상태 버튼 클릭 시 목록을 로드하는 */
	const jobStatusSearch = status => {
		let searchType = document.querySelector('.searchBtn').dataset.searchType;
		let keyword =document.querySelector('.'+searchType+'Search').dataset.keyword;
		let page=1;

		//console.log(searchType, keyword,page,status);
		fetch('sortedjobList?searchType='+searchType+'&keyword='+keyword+"&page="+page+"&jobStatus="+status)
		.then(response => response.json())
		.then(data => {
			console.log('Sunccess:',data);
			setPrintOption(data.pageMaker.jobKeywordSearchCriteria.searchType,data);
		})
		.catch(error => {
			console.log('Error:', error);
		});
	};

	/*  버튼 클릭 시 검색 조건을 저장하고 목록리로드 호출 */
	const setContition = ( searchBtn ) => {
		let searchType = searchBtn.dataset.searchType;
		let keyword = document.querySelector('input[name="searchKeyword"]').value;
		document.querySelector('.'+searchType+'Search').dataset.keyword = keyword;

		getJobListByKeawordSearch(searchType);
	};

	/*  검색 조건에 의해서 목록 리로드 */
	const getJobListByKeawordSearch = ( searchType ) => {
		let keyword = document.querySelector('.'+searchType+'Search').dataset.keyword;
		let page=1;

		//console.log(searchType, keyword,page);
		fetch('sortedjobList?searchType='+searchType+'&keyword='+keyword+"&page="+page)
		.then(response => response.json())
		.then(data => {
			console.log('Sunccess:',data);
			setPrintOption(data.pageMaker.jobKeywordSearchCriteria.searchType,data);
			setStatusNumber(data.pageMaker.jobKeywordSearchCriteria.searchType, data);
		})
		.catch(error => {
			console.log('Error:', error);
		});
	};


	/* 목록의 데이터를 화면에 출력하도록 조건을 세팅하는   */
	const setPrintOption =  (searchType, data)=>{
		let	target = document.querySelector('.'+searchType+'ListBox');
		let	templateObject = $('#'+searchType+'Template');

		//console.log(target, templateObject, length);
		// 검색 결과가 0일
		if(data.sortedJobList.length != 0 || data.issueList.length != 0){
			printSortedJobList(data,target,templateObject);
		}else{
			if(target.querySelector('table')){
				target.querySelector('table').remove();
			}
			if(target.querySelector('nav')){
				target.querySelector('nav').remove();
			}
			if(searchType == "teamReceived"){
				html =`<table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
						<thead>
							<tr>
				        	<th class="text-center" style="width:3%"></th>
				            <th class="text-center" style="width:17%">업무</th>
				            <th class="text-center" style="width:14%">제목</th>
				            <th class="text-center" style="width:5%">요청자</th>
				            <th class="text-center" style="width:5%">담당자</th>
				            <th class="text-center" style="width:6%;">등록일</th>
				            <th class="text-center" style="width:6%;">마감일</th>
				            <th class="text-center" style="width:6%;">진척도</th>
				            <th class="text-center" style="width:3%;">상태</th>
							</tr>
					    </thead>
						<tbody>
							<tr>
							<td colspan="9" class="text-center">검색 결과에 일치하는 업무가 없습니다.</td>
							</tr>
						</tbody>
					</table>`;
				$(target).append(html);
			}
			if(searchType == "teamRequested"){
				html =`<table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
					<thead>
						<tr>
						<th class="text-center" style="width: 3%"></th>
						<th class="text-center" style="width: 17%">업무</th>
						<th class="text-center" style="width: 15%">제목</th>
						<th class="text-center" style="width: 6%">요청자</th>
						<th class="text-center" style="width: 6%">수신자</th>
						<th class="text-center" style="width: 7%;">마감일</th>
						<th class="text-center" style="width: 7%;">진척도</th>
						<th class="text-center" style="width: 3%;">상태</th>
						</tr>
				    </thead>
					<tbody>
						<tr>
						<td colspan="8" class="text-center">검색 결과에 일치하는 업무가 없습니다.</td>
						</tr>
					</tbody>
				</table>`;
			$(target).append(html);
			}
		};
	}
	/*  세팅된 조건을 받아 화면에 출력 */
	const printSortedJobList = (data, target, templateObject)=>{
	/*  핸들바 함*/
		Handlebars.registerHelper("getFormatedDt",function(dt){
			let formatedDt = formatDate(dt);
			return formatedDt;
		});
		Handlebars.registerHelper("getStatus",function(status){
			if(status=="완료"){
				return new Handlebars.SafeString(`<span class="badge bg-secondary">완료</span>`);
			}else{
				if(this.jobDenied =='Y'){
					return new Handlebars.SafeString(`<span class="badge bg-danger">반려</span>`);
				}else{
					if(isDelay(this.jobClosingDt)){
						return new Handlebars.SafeString(`<span class="badge bg-warning">지연</span>`);
					}else{
						if(status=="대기"){
							return new Handlebars.SafeString(`<span class="badge bg-success">대기</span>`);
						}
						if(status=="진행"){
							return new Handlebars.SafeString(`<span class="badge bg-primary">진행</span>`);
						};
					};
				}
			};
		});
		Handlebars.registerHelper("getImportance",function(importance){
			if(importance =="Y"){
				return new Handlebars.SafeString(`<span class="badge bg-primary">중요</span>`);
			};
		});
		Handlebars.registerHelper("prev",function(prev){
			if(this.pageMaker.prev){
				return this.pageMaker.startPage-1;
			}else{
				return this.pageMaker.jobKeywordSearchCriteria.page;
			};
		});
		Handlebars.registerHelper("next",function(next){
			if(this.pageMaker.next){
				return this.pageMaker.endPage+1;
			}else{
				return this.pageMaker.jobKeywordSearchCriteria.page;
			};
		});
		Handlebars.registerHelper("pageNum", function(){
			let list ="";
			for (i = this.pageMaker.startPage; i <= this.pageMaker.endPage; i++) {
				if(this.pageMaker.jobKeywordSearchCriteria.page == i){
					list += `<li class="page-item active">
								<a class="page-link" style="display:inline" href="javascript:pageSearch('`+this.pageMaker.jobKeywordSearchCriteria.searchType+`',`+i+`,'`+this.pageMaker.jobKeywordSearchCriteria.jobStatus+`');"> `+i+` </a>
							</li>`;
				}else{
					list += `<li class="page-item">
						<a class="page-link" style="display:inline" href="javascript:pageSearch('`+this.pageMaker.jobKeywordSearchCriteria.searchType+`',`+i+`,'`+this.pageMaker.jobKeywordSearchCriteria.jobStatus+`');"> `+i+` </a>
					</li>`;
				};
			}
			return new Handlebars.SafeString(list);
		});

		let pagination = $("#pagination-template").html();
		let template = Handlebars.compile(templateObject.html());
		Handlebars.registerPartial('pagination', pagination);
		let html = template(data);

		if(target.querySelector('table')){
			target.querySelector('table').remove();
		}
		if(target.querySelector('.navBox')){
			target.querySelector('.navBox').remove();
		}
		$(target).append(html);

		setTooltips();
	};
	/* 목록의 데이터를 받아 각 업무의 상태의 개수를 저장하는   */
	const setStatusNumber = (searchType, data) => {
		let waiting=0;
		let working=0;
		let late=0;
		let list = data.sortedJobList;
		let issueList = data.issueList;
		for(let i = 0; i< list.length; i++){
			if(list[i].jobStatus =="대기"){waiting++;}
			if(list[i].jobStatus =="진행"){working++;}
			if(list[i].jobStatus !="완료" && isDelay(list[i].jobClosingDt)){late++;}
		}
		for(let i = 0; i< issueList.length; i++){
			if(issueList[i].jobStatus =="대기"){waiting++;}
			if(issueList[i].jobStatus =="진행"){working++;}
			if(issueList[i].jobStatus !="완료" && isDelay(issueList[i].jobClosingDt)){late++;}
		}
		document.querySelector('.'+searchType+'Search').dataset.waiting= waiting;
		document.querySelector('.'+searchType+'Search').dataset.working= working;
		document.querySelector('.'+searchType+'Search').dataset.late=late;

		setStatusTagNumber(searchType);
	};

	/* 리스트의 업무들의 업무상태 개수 출력  */
	const setStatusTagNumber = (searchType) => {
		let searchCondition = document.querySelector('.'+searchType+'Search');
		document.querySelector('.waitingBadge').textContent = searchCondition.dataset.waiting;
		document.querySelector('.workingBadge').textContent = searchCondition.dataset.working;
		document.querySelector('.lateBadge').textContent = searchCondition.dataset.late;
	};

	/*  날짜를 원하는 스트링으로 변환하는 */
	function formatDate(dt){
		let week = ['일', '월', '화', '수', '목', '금', '토'];

		let date = new Date(dt);
	    let year = date.getFullYear();
	    let month = ("0" + (1 + date.getMonth())).slice(-2);
	    let day = ("0" + date.getDate()).slice(-2);
	    let dayOfWeek = week[date.getDay()];

	    return year + "-" + month + "-" + day + "("+ dayOfWeek +")";
	};
	/* 해당 날짜가 지연인지 반환하 */
	function isDelay(dt){
		let date = new Date(dt)
		let today = new Date()

		date = getStringDate(date);
		today = getStringDate(today);

		//console.log (date, today, date < today);
		return (date < today);
	};

	function getStringDate(dt){
		const year = dt.getFullYear();
		const month = leftPad(dt.getMonth() + 1);
		const day = leftPad(dt.getDate());

		return [year, month, day].join("-");

	}

	function leftPad(value) {
		if (value >= 10) {
			return value;
			}
		return '0'+value;
	}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="teamReceivedTemplate" type="text/x-handlebars-template">

<table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
	<thead>
		<tr>
        	<th class="text-center" style="width:3%"></th>
            <th class="text-center" style="width:17%">업무</th>
            <th class="text-center" style="width:14%">제목</th>
            <th class="text-center" style="width:5%">요청자</th>
            <th class="text-center" style="width:5%">담당자</th>
            <th class="text-center" style="width:6%;">등록일</th>
            <th class="text-center" style="width:6%;">마감일</th>
            <th class="text-center" style="width:6%;">진척도</th>
            <th class="text-center" style="width:3%;">상태</th>
		</tr>
	</thead>

	<tbody>
{{#each issueList}}
<tr onclick="myReceivedJobDetail('{{jobCode}}');" style="cursor: pointer;" bgcolor="#ffb1ab" >
	<td class="text-center">
		{{getImportance jobImportance}}
	</td>
	<td class="text-left text-truncate">{{jobcodeName}}</td>
	<td class="text-left text-truncate">{{jobTitle}}</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobRequester.empName }}'
		data-emp-telephone='{{jobRequester.empTelephone }}'
		data-emp-email='{{jobRequester.empEmail }}'
		data-position-value='{{jobRequester.positionValue }}'
		data-team-value='{{jobRequester.teamValue }}'
		data-group-value='{{jobRequester.groupValue }}'
		data-attach-savename='{{jobRequester.attachSavename }}'
		>
  	{{jobRequester.empName}}&nbsp;{{jobRequester.positionValue}}
	</a>
	</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobReceiver.empName }}'
		data-emp-telephone='{{jobReceiver.empTelephone }}'
		data-emp-email='{{jobReceiver.empEmail }}'
		data-position-value='{{jobReceiver.positionValue }}'
		data-team-value='{{jobReceiver.teamValue }}'
		data-group-value='{{jobReceiver.groupValue }}'
		data-attach-savename='{{jobReceiver.attachSavename }}'
		>
  	{{jobReceiver.empName}}&nbsp;{{jobReceiver.positionValue}}
	</a>
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobRequestDt}}
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobClosingDt}}
	</td>
	<td class="text-center">
		<div class="progress progress-xs" style="margin-top: 6px;">
			<div class="progress-bar progress-bar-danger"	style="width: {{jobProgress}}"></div>
		</div>
	</td>
	<td class="text-center">
		{{getStatus jobStatus}}
	</td>
</tr>
{{/each}}

{{#each sortedJobList}}
<tr onclick="myReceivedJobDetail('{{jobCode}}');" style="cursor: pointer;">
	<td class="text-center">
		{{getImportance jobImportance}}
	</td>
	<td class="text-left text-truncate">{{jobcodeName}}</td>
	<td class="text-left text-truncate">{{jobTitle}}</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobRequester.empName }}'
		data-emp-telephone='{{jobRequester.empTelephone }}'
		data-emp-email='{{jobRequester.empEmail }}'
		data-position-value='{{jobRequester.positionValue }}'
		data-team-value='{{jobRequester.teamValue }}'
		data-group-value='{{jobRequester.groupValue }}'
		data-attach-savename='{{jobRequester.attachSavename }}'
		>
  	{{jobRequester.empName}}&nbsp;{{jobRequester.positionValue}}
	</a>
	</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobReceiver.empName }}'
		data-emp-telephone='{{jobReceiver.empTelephone }}'
		data-emp-email='{{jobReceiver.empEmail }}'
		data-position-value='{{jobReceiver.positionValue }}'
		data-team-value='{{jobReceiver.teamValue }}'
		data-group-value='{{jobReceiver.groupValue }}'
		data-attach-savename='{{jobReceiver.attachSavename }}'
		>
  	{{jobReceiver.empName}}&nbsp;{{jobReceiver.positionValue}}
	</a>
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobRequestDt}}
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobClosingDt}}
	</td>
	<td class="text-center">
		<div class="progress progress-xs" style="margin-top: 6px;">
			<div class="progress-bar progress-bar-danger"	style="width: {{jobProgress}}%"></div>
		</div>
	</td>
	<td class="text-center">
		{{getStatus jobStatus}}
	</td>
</tr>
{{/each}}

	</tbody>
</table>

{{#> pagination}}
{{/pagination}}
</script>
<script id="teamRequestedTemplate" type="text/x-handlebars-template">

<table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
	<thead>
		<tr>
			<th class="text-center" style="width: 3%"></th>
			<th class="text-center" style="width: 17%">업무</th>
			<th class="text-center" style="width: 15%">제목</th>
			<th class="text-center" style="width: 6%">요청자</th>
			<th class="text-center" style="width: 6%">수신자</th>
			<th class="text-center" style="width: 7%;">마감일</th>
			<th class="text-center" style="width: 7%;">진척도</th>
			<th class="text-center" style="width: 3%;">상태</th>
		</tr>
	</thead>

	<tbody>
{{#each issueList}}
<tr onclick="myRequestedJobDetail('{{jobCode}}');" style="cursor: pointer;" bgcolor="#ffb1ab">
	<td class="text-center">
		{{getImportance jobImportance}}
	</td>
	<td class="text-left text-truncate">{{jobcodeName}}</td>
	<td class="text-left text-truncate">{{jobTitle}}</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobRequester.empName }}'
		data-emp-telephone='{{jobRequester.empTelephone }}'
		data-emp-email='{{jobRequester.empEmail }}'
		data-position-value='{{jobRequester.positionValue }}'
		data-team-value='{{jobRequester.teamValue }}'
		data-group-value='{{jobRequester.groupValue }}'
		data-attach-savename='{{jobRequester.attachSavename }}'
		>
  	{{jobRequester.empName}}&nbsp;{{jobRequester.positionValue}}
	</a>
	</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobReceiver.empName }}'
		data-emp-telephone='{{jobReceiver.empTelephone }}'
		data-emp-email='{{jobReceiver.empEmail }}'
		data-position-value='{{jobReceiver.positionValue }}'
		data-team-value='{{jobReceiver.teamValue }}'
		data-group-value='{{jobReceiver.groupValue }}'
		data-attach-savename='{{jobReceiver.attachSavename }}'
		>
  	{{jobReceiver.empName}}&nbsp;{{jobReceiver.positionValue}}
	</a>
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobClosingDt}}
	</td>
	<td class="text-center">
		<div class="progress progress-xs" style="margin-top: 6px;">
			<div class="progress-bar progress-bar-danger"	style="width: {{jobProgress}}"></div>
		</div>
	</td>
	<td class="text-center">
		{{getStatus jobStatus}}
	</td>
</tr>
{{/each}}


{{#each sortedJobList}}
<tr onclick="myRequestedJobDetail('{{jobCode}}');" style="cursor: pointer;">
	<td class="text-center">
		{{getImportance jobImportance}}
	</td>
	<td class="text-left text-truncate">{{jobcodeName}}</td>
	<td class="text-left text-truncate">{{jobTitle}}</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobRequester.empName }}'
		data-emp-telephone='{{jobRequester.empTelephone }}'
		data-emp-email='{{jobRequester.empEmail }}'
		data-position-value='{{jobRequester.positionValue }}'
		data-team-value='{{jobRequester.teamValue }}'
		data-group-value='{{jobRequester.groupValue }}'
		data-attach-savename='{{jobRequester.attachSavename }}'
		>
  	{{jobRequester.empName}}&nbsp;{{jobRequester.positionValue}}
	</a>
	</td>
	<td class="text-center text-truncate">
		<a class="tooltipCaller"  style="width:10%; height: 100%; color: black;" data-toggle="tooltip" data-html="true" title=""
		data-emp-name='{{jobReceiver.empName }}'
		data-emp-telephone='{{jobReceiver.empTelephone }}'
		data-emp-email='{{jobReceiver.empEmail }}'
		data-position-value='{{jobReceiver.positionValue }}'
		data-team-value='{{jobReceiver.teamValue }}'
		data-group-value='{{jobReceiver.groupValue }}'
		data-attach-savename='{{jobReceiver.attachSavename }}'
		>
  	{{jobReceiver.empName}}&nbsp;{{jobReceiver.positionValue}}
	</a>
	</td>
	<td class="text-center" style="font-size: 0.9em; padding-top: 9px;">
		{{getFormatedDt jobClosingDt}}
	</td>
	<td class="text-center">
		<div class="progress progress-xs" style="margin-top: 6px;">
			<div class="progress-bar progress-bar-danger"	style="width: {{jobProgress}}%"></div>
		</div>
	</td>
	<td class="text-center">
		{{getStatus jobStatus}}
	</td>
</tr>
{{/each}}


	</tbody>
</table>

{{#> pagination}}
{{/pagination}}
</script>
<script id="pagination-template" type="text/x-handlebars-template">
<div class="card-footer p-2 navBox">
<nav aria-label="Navigation">
	<ul class="pagination  pagination-sm justify-content-center ">

		<li class="page-item">
			<a class="page-link" style="display:inline" href="javascript:pageSearch('{{pageMaker.jobKeywordSearchCriteria.searchType}}',1,'{{pageMaker.jobKeywordSearchCriteria.jobStatus}}');">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" style="display:inline" href="javascript:pageSearch('{{pageMaker.jobKeywordSearchCriteria.searchType}}',{{prev pageMaker.prev}},'{{pageMaker.jobKeywordSearchCriteria.jobStatus}}');">
				<i class="fas fa-angle-left"></i>
			</a>
		</li>
		{{pageNum}}
		<li class="page-item">
			<a class="page-link" style="display:inline" href="javascript:pageSearch('{{pageMaker.jobKeywordSearchCriteria.searchType}}',{{next pageMaker.next}},'{{pageMaker.jobKeywordSearchCriteria.jobStatus}}');">
				<i class="fas fa-angle-right"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" style="display:inline" href="javascript:pageSearch('{{pageMaker.jobKeywordSearchCriteria.searchType}}',{{pageMaker.realEndPage}},'{{pageMaker.jobKeywordSearchCriteria.jobStatus}}');">
				<i class="fas fa-angle-double-right">&nbsp;</i>
			</a>
		</li>
	</ul>
</nav>
</div>
</script>
</body>
