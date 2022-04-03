<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="date"/>
<fmt:formatDate value="${now}" pattern="E" var="today" />
<c:set var="reportDocList" value="${dataMap.reportDocList}"/>

<title>보고메인 </title>
<body>
 <!-- Content Header (Page header) -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h5>보고서</h5>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">보고서 메인</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
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

	<c:if test="${(regularReportListToWrite ne null)&&(fn:length(regularReportListToWrite) ne 0)}">
		<c:set var="size" value="${fn:length(regularReportListToWrite)}" />
		<c:forEach var="i" begin="1" end="${ size/4 }">
                      <li data-target="#carouselExampleIndicators" data-slide-to="${i }" class=""></li>
		</c:forEach>
	</c:if>
                    </ol>

                    <div class="carousel-inner" >


<c:choose>
	<c:when test="${(regularReportListToWrite ne null)&&(fn:length(regularReportListToWrite) ne 0)}">
		<c:set var="size" value="${fn:length(regularReportListToWrite)}" />
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
			                          <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                  <h6>${fn:substring(date,0,4)}</h6>
			                                </div>
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2>
			                                <h5>${regularReportListToWrite[j-1].reportTitle }</h5>
			                                <p style="font-size:0.8em;">운영자 : ${regularReportListToWrite[j-1].reportManager.empName }&nbsp;${regularReportListToWrite[j-1].reportManager.positionValue }</p>
			                                <a href="<%=request.getContextPath()%>/report/writeReport?from=main&reportCode=${regularReportListToWrite[j-1].reportCode}" class="btn btn-outline-primary btn-block"><b>보고하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                          </div><!-- ./col-lg-3 ./Quick Card -->
			 </c:forEach>
	                      </div> <!-- ./row -->
		               </div> <!--  /.carousel-item active -->
		</c:forEach>
		<c:forEach var="i" begin="1" end="${ size/4 }">
					  <div class="carousel-item">
                         <div class="row" alt="${i} slide">
				<c:forEach var="j" begin="${ (i*4)+1}" end="${(i*4)+4 }">
			                          <!-- Quick Card  -->
			                          <div class="col-lg-3">
			                            <div class="card card-info card-outline">
			                              <div class="card-body">
			                                <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                  <div class="row" style="justify-content: space-between; align-items: baseline;">
			                                  <h6>${fn:substring(date,0,4)}</h6>
			                                </div>
			                                <h2>${fn:substring(date,4,6)}/${fn:substring(date,6,8)} (${today})</h2>
			                                <h5>${regularReportListToWrite[j-1].reportTitle }</h5>
			                                <p style="font-size:0.8em;">운영자 : ${regularReportListToWrite[j-1].reportManager.empName }&nbsp;${regularReportListToWrite[j-1].reportManager.positionValue }</p>
			                                <a href="<%=request.getContextPath()%>/report/writeReport?from=main&reportCode=${regularReportListToWrite[j-1].reportCode}" class="btn btn-outline-primary btn-block"><b>보고하기</b></a>
			                              </div><!-- ./card-body -->
			                            </div><!-- ./card -->
			                          </div><!-- ./col-lg-3 ./Quick Card -->
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
	                            	<h5>금일 보고자지정 보고를 모두 완료하였습니다.</h5>
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
		  <div style="height: 15px;"></div>

          <!-- row -->
          <div class="row">
            <!-- list -->
            <div class="col-lg-12">
              <div class="card card-info card-outline" style="height: 400px;">
                <div class="card-header">
                  <h3 class="card-title">
                    <i class="fas fa-edit"></i>
                   	 최근 생성된 보고서
                  </h3>
                  <div class="float-right">
                    <div class="btn-group">
                    	<a class="nav-link" href="javascript:void(0);" onclick="location.href=`<%=request.getContextPath()%>/report/teamReport/list.do`" aria-selected="false"><i class="fas fa-plus text-secondary"></i></a>
                    </div>
                    <!-- /.btn-group -->
                  </div>
                  <!-- /.float-right -->
                </div>
                <div class="card-body" style="padding-top:0.3em; padding-bottom:1em;">
                  <table class="table table-sm" >
                  	<colgroup>
						<col width="15%">
						<col width="25%">
						<col width="30%">
						<col width="15%">
						<col width="15%">
					</colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">보고일</th>
                        <th class="text-center">보고서</th>
                        <th class="text-center">제목</th>
                        <th class="text-center">부서</th>
                        <th class="text-center">보고자</th>
                      </tr>
                    </thead>
                   </table>
                   <div style="overflow: auto;height: 290px;">
					 <table class="table table-sm">
					 	<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="30%">
							<col width="15%">
							<col width="15%">
						</colgroup>
	                    <tbody style="font-size:0.8em;">
		                     <c:choose>
								<c:when test="${empty reportDocList}">
									<tr>
										<td colspan="5" class="text-center">최근 생성된 보고서가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
		
									<c:forEach items="${reportDocList}" var="report">
										<tr>
											<!-- 보고일 -->
											<td class="text-center">${report.reportDocDt}</td>
											<!-- 보고서 -->
											<td class="text-center">${report.reportTitle}</td>
											<!-- 제목 -->
											<td class="text-center" onclick="myReportDetail('${report.reportDocCode}')" style="cursor: pointer;">${report.reportDocTitle}</td>
											<!-- 부서 -->
											<td class="text-center">${report.reportDocWriterInfo.teamValue}</td>
											<!-- 보고자 -->
											<td class="text-center">${report.reportDocWriterInfo.empName}&nbsp;${report.reportDocWriterInfo.positionValue }</td>
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
              <!-- /.card -->
            </div>
            <!-- ./list -->
          </div>
          <!-- ./row -->



        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="optionInCommonCodeSelector" type="text/x-handlebars-template">
	{{#each .}}
		{{#if @first}}
   		 <option disabled="disabled" selected="selected" hidden=""> {{word comCodeGr}} 선택하세요.</option>
   		 {{/if}}
		 <option value="{{comCode}}">{{comCode1}}</option>
	{{/each}}

</script>
<script>
function myReportDetail(reportDocCode){
	OpenWindow('<%=request.getContextPath()%>/report/reportDetail?reportDocCode='+reportDocCode, '', '900', '870');
}

</script>


 </body>
