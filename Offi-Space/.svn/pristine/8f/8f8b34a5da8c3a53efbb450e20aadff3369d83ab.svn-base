<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="allList" value="${allList }"/>
<c:set var="requestedList" value="${ requetedAllList}"/>
<c:set var="receivedList" value="${receivedJobList }"/>


<title>업무메인</title>
<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>업무</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">업무 메인</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">

          <!-- 퀵메뉴슬라이드 -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card" style="background-color:hsla(9, 100%, 64%, 0);">
                <!-- /.card-header -->
                <div class="card-body" style="padding-bottom:0.3em;">
                  <div id="carouselExampleIndicators" class="carousel slide"  data-ride="carousel">
                    <ol class="carousel-indicators" style="    margin-bottom: 0;">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>

	<c:if test="${(allList ne null)&&(fn:length(allList) ne 0)}">
		<c:set var="size" value="${fn:length(allList)}" />
		<c:forEach var="i" begin="1" end="${(size/4) - 1 }">
			<li data-target="#carouselExampleIndicators" data-slide-to="${i}" class=""></li>
		</c:forEach>
	</c:if>
                    </ol>

                    <div class="carousel-inner" >

<c:choose>
<c:when test="${(allList ne null)&&(fn:length(allList) ne 0)}">
	<c:set var="size" value="${fn:length(allList)}" />
		<c:forEach var="i" begin="0" end="0">
					  <div class="carousel-item active">
                         <div class="row" alt="${i} slide">

	     	<c:choose>
	         	<c:when test="${ size <= 4}">
					<c:set var="endPoint" value="${size }"/>
				</c:when>
	             <c:otherwise>
					<c:set var="endPoint" value="${(i*4)+4 }"/>
	             </c:otherwise>
	        </c:choose>

	 		<c:forEach var="j" begin="${ (i*4)+1}" end="${endPoint }">

	 			<c:if test="${allList[j-1].jobIssue eq 'Y'}">
			                          <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                          <div class="position-relative ">
					 			        <div class="ribbon-wrapper">
				                        	<div class="ribbon bg-danger">긴급</div>
				                         </div>
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                	<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="yyyyMMdd" var="date"/>
												<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="E" var="today" />
			                                   	<h6>${fn:substring(date,0,4)}</h6>
			                                </div>
			                                <div class="row" style="align-items: baseline;">
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2><span style="color:gray">&nbsp;&nbsp;마감</span>
			                                </div>			                                <c:set var="jobTitle" value="${allList[j-1].jobTitle}"/>
			                                <c:if test="${jobTitle.length() ge 15}">
			                              		<h6>${fn:substring(jobTitle,0,12)}...</h6>
			                                </c:if>
			                                <c:if test="${jobTitle.length() lt 15}">
			                                	<h6>${jobTitle }</h6>
			                              	</c:if>
			                                <p style="font-size:0.8em;">요청자 : ${allList[j-1].jobRequester.empName }&nbsp;${allList[j-1].jobRequester.positionValue }</p>
			                                <a href="javascript:void(0);" onclick="myReceivedJobDetail('${allList[j-1].jobCode}');" class="btn btn-outline-primary btn-block"><b>업무하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                            </div>
			                          </div><!-- ./col-lg-3 ./Quick Card -->
	 			</c:if>
	 			<c:if test="${allList[j-1].jobIssue eq 'N'}">

			                          <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                	<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="yyyyMMdd" var="date"/>
												<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="E" var="today" />
			                                   	<h6>${fn:substring(date,0,4)}</h6>
                      	<c:if test="${allList[j-1].jobImportance eq 'Y' }">
				                                   	<span class="badge badge-danger">중요</span>
                       	</c:if>

			                                </div>
			                                <div class="row" style="align-items: baseline;">
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2><span style="color:gray">&nbsp;&nbsp;마감</span>
			                                </div>			                                <c:set var="jobTitle" value="${allList[j-1].jobTitle}"/>
			                                <c:if test="${jobTitle.length() ge 15}">
			                              		<h6>${fn:substring(jobTitle,0,12)}...</h6>
			                                </c:if>
			                                <c:if test="${jobTitle.length() lt 15}">
			                                	<h6>${jobTitle }</h6>
			                              	</c:if>
			                                <p style="font-size:0.8em;">요청자 : ${allList[j-1].jobRequester.empName }&nbsp;${allList[j-1].jobRequester.positionValue }</p>
			                                <a href="javascript:void(0);" onclick="myReceivedJobDetail('${allList[j-1].jobCode}');" class="btn btn-outline-primary btn-block"><b>업무하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                          </div><!-- ./col-lg-3 ./Quick Card -->
	 			</c:if>
			 </c:forEach>
	                      </div> <!-- ./row -->
		               </div> <!--  /.carousel-item active -->
		</c:forEach>


		<c:forEach var="i" begin="1" end="${ (size/4) - 1 }">
					  <div class="carousel-item">
                      	<div class="row" alt="${i} slide">

             <c:choose>
	         	<c:when test="${ size <= (i*4)}">
					<c:set var="endPoint" value="${size }"/>
				</c:when>
	             <c:otherwise>
					<c:set var="endPoint" value="${(i*4)+4 }"/>
	             </c:otherwise>
	        </c:choose>

				<c:forEach var="j" begin="${ (i*4)+1}" end="${(i*4)+4 }">
			    	<c:if test="${allList[j-1] ne null  && allList[j-1].jobCode ne '' }">

				    	<c:if test="${allList[j-1].jobIssue eq 'Y'}">
			                          <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                          <div class="position-relative " style="height: 180px">
					 			        <div class="ribbon-wrapper">
				                        	<div class="ribbon bg-danger">긴급</div>
				                         </div>
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                	<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="yyyyMMdd" var="date"/>
												<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="E" var="today" />
			                                   	<h6>${fn:substring(date,0,4)}</h6>
			                                </div>
			                                <div class="row" style="align-items: baseline;">
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2><span style="color:gray">&nbsp;&nbsp;마감</span>
			                                </div>			                                <c:set var="jobTitle" value="${allList[j-1].jobTitle}"/>
			                                <c:if test="${jobTitle.length() ge 15}">
			                              		<h6>${fn:substring(jobTitle,0,12)}...</h6>
			                                </c:if>
			                                <c:if test="${jobTitle.length() lt 15}">
			                                	<h6>${jobTitle }</h6>
			                              	</c:if>
			                                <p style="font-size:0.8em;">요청자 : ${allList[j-1].jobRequester.empName }&nbsp;${allList[j-1].jobRequester.positionValue }</p>
			                                <a href="javascript:void(0);" onclick="myReceivedJobDetail('${allList[j-1].jobCode}');" class="btn btn-outline-primary btn-block"><b>업무하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                            </div>
			                          </div><!-- ./col-lg-3 ./Quick Card -->
	 				</c:if>
	 				<c:if test="${allList[j-1].jobIssue eq 'N'}">



				                      <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                	<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="yyyyMMdd" var="date"/>
												<fmt:formatDate value="${allList[j-1].jobRequestDt}" pattern="E" var="today" />
			                                   	<h6>${fn:substring(date,0,4)}</h6>
                      	<c:if test="${allList[j-1].jobImportance eq 'Y' }">
				                                   	<span class="badge badge-danger">중요</span>
                       	</c:if>

			                                </div>
			                                <div class="row" style="align-items: baseline;">
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2><span style="color:gray">&nbsp;&nbsp;마감</span>
			                                </div>
			                                <c:set var="jobTitle" value="${allList[j-1].jobTitle}"/>
			                                <c:if test="${jobTitle.length() ge 15}">
			                              		<h6>${fn:substring(jobTitle,0,12)}...</h6>
			                                </c:if>
			                                <c:if test="${jobTitle.length() lt 15}">
			                                	<h6>${jobTitle }</h6>
			                              	</c:if>
			                                <p style="font-size:0.8em;">요청자 : ${allList[j-1].jobRequester.empName }&nbsp;${allList[j-1].jobRequester.positionValue }</p>
			                                <a href="javascript:void(0);" onclick="myReceivedJobDetail('${allList[j-1].jobCode}');" class="btn btn-outline-primary btn-block"><b>업무하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                          </div><!-- ./col-lg-3 ./Quick Card -->
			    	</c:if>
			    </c:if>
			    </c:forEach>
	                      </div> <!-- ./row -->
		               </div> <!--  /.carousel-item active -->

		</c:forEach>




	</c:when>
    <c:otherwise>
						<div class="carousel-item active">
	                        <!-- row -->
	                        <div class="row" alt="1slide">
	                         <!-- Quick Card  -->
	                          <div class="col-lg-12" >
	                            <div class="card " style="align-items:center; justify-content:center; height:237px; background-color:hsla(9, 100%, 64%, 0); margin:0;">
	                            	<h5>금일 수신 업무를 모두 처리하였습니다.${allList[0].jobTitle }</h5>
	                          	</div><!-- ./card -->
	                          </div><!-- ./col-lg-12 ./Quick Card -->
	    				   </div><!-- ./row -->
	                    </div><!--  /.carousel-item active -->


    </c:otherwise>
</c:choose>
                    </div> <!-- / ./carousel-inner -->
                  </div> <!-- / #carouselExampleIndicators -->
                  <a class="carousel-control-prev" style="margin-left:5px; width:15px; color:lightgray; " href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-custom-icon" aria-hidden="true">
                      <i class="fas fa-chevron-left" data-slide="prev"></i>
                    </span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" style="margin-right:10px; width: 15px; color:lightgray; " href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-custom-icon" aria-hidden="true">
                      <i class="fas fa-chevron-right"></i>
                    </span>
                    <span class="sr-only">Next</span>
                  </a>
                </div><!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- ./col=lg-12 -->
          </div>
          <!-- ./row -->
          <!-- ./퀵메뉴슬라이드 -->


				<!-- 마진을 위한 div -->
				<div style="height: 20px;"></div>

				<!-- compressed list -->
				<div class="row">
					<!-- left-list -->
					<div class="col-lg-7">
						<div class="card card-info card-outline card-outline-tabs">
							<div class="card-header p-0 border-bottom-0">
								<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist"  style="display: flex; justify-content: space-between;">
									<li>
										<ul class="nav">
											<li class="nav-item"><a class="nav-link active"
												id="custom-tabs-four-profile-tab" data-toggle="pill"
												href="#custom-tabs-four-work" role="tab"
												aria-controls="custom-tabs-four-work" aria-selected="false">수신업무</a>
											</li>
											<li class="nav-item"><a class="nav-link"
												id="custom-tabs-four-home-tab" data-toggle="pill"
												href="#custom-tabs-four-wait" role="tab"
												aria-controls="custom-tabs-four-wait" aria-selected="true">요청업무</a>
											</li>
										</ul>
									<li>
									<li class="nav-item" >
										<a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/job/myJobTabs.do`" aria-selected="false"><i class="fas fa-plus text-secondary"></i></a>
									</li>
								</ul>
							</div>
							
							
							<div class="card-body" style="padding: 5px 5px;">
								<div class="tab-content" id="custom-tabs-four-tabContent">
								<div class="tab-pane fade active show" id="custom-tabs-four-work"
										role="tabpanel" aria-labelledby="custom-tabs-four-work-tab">
										<!-- 내부 table card -->
										<div>
											<!-- /.card-header -->
											<div class="card-body p-0" style="height:265px;">
												<table class="table table-sm">
													<colgroup>
														<col width="8%">
														<col width="32%">
														<col width="20%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
													 </colgroup>
													<thead>
														<tr class="text-center">
															<th></th>
															<th>제목</th>
															<th>요청자</th>
															<th>요청일</th>
															<th>마감일</th>
															<th class="text-truncate">상태</th>

														</tr>
													</thead>
													</table>
													<div style="overflow: auto; height: 240px;">
													<table class="table table-sm" >
													<colgroup>
														<col width="8%">
														<col width="32%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="10%">
													 </colgroup>
													<tbody style="font-size: 0.8em;">
													<c:choose>
														<c:when test="${empty receivedList}">
															<tr>
																<td colspan="6" class="text-center">요청한 업무가 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${receivedList}" var="job">
																											<tr onclick="myReceivedJobDetail('${job.jobCode}');" style="cursor: pointer;">
																												<td class="text-center">
																<c:choose>
																	<c:when test="${ job.jobIssue eq 'Y'} ">
																													<span class="badge bg-danger">긴급</span>
																	</c:when>
																	<c:otherwise>
																		<c:if test="${ job.jobImportance eq 'Y'}">
																													<span class="badge bg-primary">중요</span>
																		</c:if>
																	</c:otherwise>
																</c:choose>
															</td>
															<td class="text-left">${job.jobTitle }</td>
															<td class="text-center">
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
																<fmt:formatDate value="${job.jobRequestDt}" pattern="yyyy-MM-dd(E)" />
															</td>
															<td class="text-center text-truncate">
																<fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
															</td>
															<td  class="text-center">
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
	</c:otherwise>
</c:choose>


													</tbody>
												</table>
												</div>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- / .내부 table card -->
									</div>
									
									<div class="tab-pane fade"
										id="custom-tabs-four-wait" role="tabpanel"
										aria-labelledby="custom-tabs-four-wait-tab">
										<!-- 내부 table card -->
										<div>
											<!-- /.card-header -->
											<div class="card-body p-0" style="height:265px;">
												<table class="table table-sm" >
													<colgroup>
														<col width="8%">
														<col width="32%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="10%">
													 </colgroup>

													<thead>
														<tr class="text-center">
															<th></th>
															<th class="text-truncate">제목</th>
															<th class="text-truncate">담당자</th>
															<th class="text-truncate">마감일</th>
															<th class="text-truncate">진척도</th>
															<th class="text-truncate">상태</th>
														</tr>
													</thead>
													</table>
													<div style="overflow: auto; height: 240px;">
													<table class="table table-sm" >
													<colgroup>
														<col width="8%">
														<col width="32%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="10%">
													 </colgroup>
													<tbody style="font-size: 0.8em;">
<c:choose>
	<c:when test="${empty requestedList}">
		<tr>
			<td colspan="6" class="text-center">요청한 업무가 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>

		<c:forEach items="${requestedList}" var="job">
														<tr onclick="myRequestedJobDetail('${job.jobCode}');" style="cursor: pointer;">
															<td class="text-left">
			<c:choose>
				<c:when test="${ job.jobIssue eq 'Y'} ">
																<span class="badge bg-danger" >긴급</span>
				</c:when>
				<c:otherwise>
					<c:if test="${ job.jobImportance eq 'Y'}">
																<span class="badge bg-primary" >중요</span>
					</c:if>
				</c:otherwise>
			</c:choose>
															</td>
															<td class="text-left">${job.jobTitle }</td>
															<td class="text-center">
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
															<td class="text-center text-truncate">
																<fmt:formatDate value="${job.jobClosingDt}" pattern="yyyy-MM-dd(E)" />
															</td>
															<td  class="text-center">
																<div class="progress progress-xs" style="margin-top: 6px;">
																	<div class="progress-bar progress-bar-danger"	style="width: ${job.jobProgress}%"></div>
																</div>
															</td>
															<td  class="text-center">
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
	</c:otherwise>
</c:choose>
													</tbody>
												</table>
												</div>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- / .내부 table card -->
									</div>
									
									
									

								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- ./left-list -->
					<!-- right-list -->
					<div class="col-lg-5">
						<div class="card card-info card-outline card-outline-tabs">
							<div class="card-header p-0 border-bottom-0">
								<ul class="nav nav-tabs" id="custom-tabs-three-tab"
									role="tablist">
									<li class="nav-item">
										<a class="nav-link active"
										id="custom-tabs-three-weekly-tab" data-toggle="pill"
										href="#custom-tabs-three-weekly" role="tab"
										aria-controls="custom-tabs-three-weekly" aria-selected="true">주간
											업무 현황</a></li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-three-monthly-tab" data-toggle="pill"
										href="#custom-tabs-three-monthly" role="tab"
										aria-controls="custom-tabs-three-monthly"
										aria-selected="false">월간 업무 현황</a></li>
								</ul>
							</div>
							<div class="card-body" style="height:275px">
								<div class="tab-content" id="custom-tabs-three-tabContent">
									<div class="tab-pane fade active show" id="custom-tabs-three-weekly"
										role="tabpanel" aria-labelledby="custom-tabs-three-weekly-tab">
										<div class="card">
											<div class="card-body p-0">
												<canvas id="weeklyJobChart" ></canvas>
											</div>
											<!-- /.card-body -->
										</div>
									</div>
									<div class="tab-pane fade" id="custom-tabs-three-monthly"
										role="tabpanel"
										aria-labelledby="custom-tabs-three-monthly-tab">
										<div class="card">
											<div class="card-body p-0">
												<canvas id="monthlyJobChart" ></canvas>
											</div>
											<!-- /.card-body -->
										</div>
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- ./right-list -->
				</div>
				<!-- ./row -->
				<!-- ./compressed list -->



			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
window.onload  = function() {
	/*  툴팁 활성화 */
	setTooltips();
}

function myReceivedJobDetail(jobCode){
	OpenWindow('<%=request.getContextPath()%>/job/receivedJobDetail?jobCode='+jobCode, '', '950', '830');
};

function myRequestedJobDetail(jobCode){
	OpenWindow('<%=request.getContextPath()%>/job/requestedJobDetail?jobCode='+jobCode, '', '950', '830');
};



/* 리스트의 업무들의 업무상태 개수 출력  */
const setStatusTagNumber = (searchType) => {
	let searchCondition = document.querySelector('.'+searchType+'Search');
	document.querySelector('.waitingBadge').textContent = searchCondition.dataset.waiting;
	document.querySelector('.workingBadge').textContent = searchCondition.dataset.working;
	document.querySelector('.lateBadge').textContent = searchCondition.dataset.late;
}

const labels = [
    '대기',
    '진행',
    '지연',
    '완료'
  ];

const weeklydata = {
  labels: labels,
  datasets: [{
    label: '주간 업무 현황',
    data: ['${jobCount.weeklyWaiting}', '${jobCount.weeklyWorking}', '${jobCount.weeklyLate}', '${jobCount.weeklyDone}'],
    backgroundColor: [
       'rgb(255, 205, 86)',
  	   'rgb(54, 162, 235)',
  	   'rgb(255, 99, 132)',
  	   'rgb(201, 203, 207)'
    ],
    borderColor: [
      'rgb(255, 205, 86)',
      'rgb(54, 162, 235)',
      'rgb(255, 99, 132)',
      'rgb(201, 203, 207)'
    ],
    borderWidth: 1,
    categoryPercentage: 1.0,
    barPercentage: 0.5
  }]
};
const monthlydata = {
		  labels: labels,
		  datasets: [{
		    label: '월간 업무 현황',
		    data: ['${jobCount.monthlyWaiting}', '${jobCount.monthlyWorking}', '${jobCount.monthlyLate}', '${jobCount.monthlyDone}'],
		    backgroundColor: [
		       'rgb(255, 205, 86)',
		  	   'rgb(54, 162, 235)',
		  	   'rgb(255, 99, 132)',
		  	   'rgb(201, 203, 207)'
		    ],
		    borderColor: [
		      'rgb(255, 205, 86)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 99, 132)',
		      'rgb(201, 203, 207)'
		    ],
		    borderWidth: 1,
		    categoryPercentage: 1.0,
		    barPercentage: 0.5
		  }]
		};


  const weeklyConfig = {
		  type: 'bar',
		  data: weeklydata,
		  options: {
		    scales: {
		    	x: {
		            grid: {
		              offset: true
		            }
		        },
  		        y: {
		          beginAtZero: true
		        }
		    }
		  },
		};
  options = {
		    scales: {
		        x: {
		            grid: {
		              offset: true
		            }
		        }
		    }
		};
  const monthlyConfig = {
		  type: 'bar',
		  data: monthlydata,
		  options: {
		    scales: {
		    	x: {
		            grid: {
		              offset: true
		            }
		        },
  		        y: {
		          beginAtZero: true
		        }
		    }
		  },
		};
  options = {
		    scales: {
		        x: {
		            grid: {
		              offset: true
		            }
		        }
		    }
		};
const myWeeklyChart = new Chart(
			document.getElementById('weeklyJobChart'),weeklyConfig);
const myMonthlyChart = new Chart(
			document.getElementById('monthlyJobChart'),monthlyConfig);




</script>


</body>
