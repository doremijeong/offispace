<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
</head>
<title></title>
<body>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <h5>보고 현황</h5>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">보고 현황 </li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
    	<div class="card card-info card-outline" style="height: 700px;">
			<div class="card-header">
          		<h3 class="card-title">운영 보고서</h3>
	          	<div class="card-tools">
	            	<div class="input-group input-group-sm">
	            		<input type="date"  class="form-control" onchange="searchByMonth(this.value)">
	            	</div>
	            </div>
	            <!-- /.card-tools -->
	        </div>
	        <!-- /.card-header -->
        <div class="card-body">
          <div class="table-responsive mailbox-messages">
            <table class="table table-sm">
            	<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="25%">
					<col width="25%">
					<col width="10%">
				 </colgroup>

              <thead style="font-size: 0.95em;">
                <tr class="text-center">
                  <th>보고일</th>
                  <th>보고 유형</th>
                  <th>보고자</th>
				  <th>미보고자</th>
				  <th>총 보고인원</th>
                </tr>
              </thead>
            </table>
            <div style="overflow: auto; height: 570px;">
	            <table class="table table-sm">
		           	<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="25%">
						<col width="25%">
						<col width="10%">
					 </colgroup>
	              <tbody style="font-size: 0.8em;">
	<c:choose>
		<c:when test="${(managerReportList ne null)&&(fn:length(managerReportList) ne 0)}">
	 		<c:set var="size" value="${fn:length(managerReportList)}" />
				<c:forEach var="i" begin="0" end="${ size-1 }">
		                <tr style="cursor: pointer;" onclick="OpenWindow('<%=request.getContextPath()%>/report/managerReportDetail?reportCode=${managerReportList[i].reportCode }&reportDt=${managerReportList[i].reportDt }','', '900', '870');">
		                  <td class="text-center">${managerReportList[i].reportDt}(${managerReportList[i].reportDay})</td>
		                  <td style="text-align: center">${managerReportList[i].reportTitle}</td>
		                  <td style="text-align: center">
		        	<c:choose>
		            	<c:when test="${fn:length(managerReportList[i].reported) ne 0 }">
			            	<c:set var="reported" value="${managerReportList[i].reported }"/>
			            	<c:set var="reportedSize" value="${fn:length(reported)}"/>
	
			                <c:choose>
				               	<c:when test="${reportedSize eq 1 }">
				               		${reported[0].empName }&nbsp; ${reported[0].positionValue }
				               	</c:when>
			               		<c:otherwise>
									${reported[0].empName }&nbsp; ${reported[0].positionValue } &nbsp;외&nbsp; ${reportedSize-1 }인
					               <c:forEach var="j" begin="0" end="${reportedSize-1 }">
										<li class="list-inline-item">
	
			                              </li>
				                  	</c:forEach>
	
			               		</c:otherwise>
			               	</c:choose>
		                </c:when>
		                <c:otherwise>
	
		                </c:otherwise>
		            </c:choose>
		                  </td>
		                   <td style="text-align: center">
		        	<c:choose>
		            	<c:when test="${fn:length(managerReportList[i].notReported) ne 0 }">
			            	<c:set var="notReported" value="${managerReportList[i].notReported }"/>
			            	<c:set var="notReportedSize" value="${fn:length(notReported)}"/>
			               	<c:choose>
				               	<c:when test="${notReportedSize eq 1 }">
				               		${notReported[0].empName }&nbsp; ${notReported[0].positionValue }
				               	</c:when>
			               		<c:otherwise>
									${notReported[0].empName }&nbsp; ${notReported[0].positionValue } &nbsp;외 &nbsp;${notReportedSize -1}인
					               <c:forEach var="j" begin="0" end="${notReportedSize-1 }">
										<li class="list-inline-item">
	
			                              </li>
				                  	</c:forEach>
	
			               		</c:otherwise>
			               	</c:choose>
	
		                </c:when>
		                <c:otherwise>
	
		                </c:otherwise>
		            </c:choose>
		                  </td>
		                  <td class="text-center">${fn:length(managerReportList[i].reported)} /${fn:length(managerReportList[i].reported) + fn:length(managerReportList[i].notReported)}인</td>
		                </tr>
		      </c:forEach>
		</c:when>
		<c:otherwise>
	 		<tr>
				<td style="text-align: center;" colspan="5">현재 운영하는 보고서가 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
	              </tbody>
	            </table>
	            <!-- /.table -->
            </div>
          </div>
          <!-- /.mail-box-messages -->
        </div>
        <!-- /.card-body -->
        <div class="card-footer p-0">
          <div class="mailbox-controls">

          </div>
        </div>
      </div>



    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<script>
function searchByMonth (date){
	window.location.href="<%=request.getContextPath()%>/report/managerReportList?searchType=past&date="+date;
}
</script>
</body>