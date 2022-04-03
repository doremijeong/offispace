<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="reportDocList" value="${dataMap.reportDocList}"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />
<c:set var="reportDocCnt" value="${reportDocMap.reportCnt}" />


<title></title>
<body>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <h5>부서 보고함</h5>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">부서 보고함 </li>
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
<!--           <h3 class="card-title">부서보고서함</h3> -->
          <div class="card-tools">
            <div class="input-group input-group-sm">
               <select class="form-control col-sm-5" id="inputGroupSelect01" name="searchType">
				 <option value="rptTitle">보고유형</option>
				 <option value="rptDocTitle">제목</option>
				 <option value="rptWriter">보고자</option>
				 <!-- option value="rptDate">보고일</option> -->
	  		   </select>
	  			&nbsp;
              <input type="text" class="form-control" name="keyword" placeholder="Search">
              <div class="input-group-append">
                <div class="btn btn-info" onclick="list_go(1);">
                  <i class="fas fa-search" style="margin-top: 3px;"></i>
                </div>
              </div>
            </div>
          </div>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-sm">
              <thead style="font-size: 0.95em;">
                <tr class="text-center">
                  <th style="width: 1%;"></th>
                  <th style="width: 19%;">보고 유형</th>
                  <th style="width: 45%;">제목</th>
                  <th style="width: 15%;">보고자</th>
                  <th style="width: 20%;">보고일</th>
                </tr>
              </thead>
              <tbody style="font-size: 0.8em;">
              		<c:if test="${empty reportDocList}">
              			<tr style="padding: 3px;" class="text-center">
							<td colspan="5">
								해당하는 보고서가 없습니다.
							</td>
						</tr>
              		</c:if>
              		<c:if test="${!empty reportDocList}">
              			<c:forEach items="${reportDocList}" var="reportDoc">
              					<tr onclick="myReportDetail('${reportDoc.reportDocCode}')" style="cursor: pointer;" >
	              					<td></td>
									<td class="text-center">${reportDoc.reportTitle}</td>
									<td class="text-lest"> ${reportDoc.reportDocTitle}</td>
									<td class="text-center">${reportDoc.reportDocWriterInfo.empName}&nbsp;${reportDoc.reportDocWriterInfo.positionValue}</td>
	              					<td class="text-center">${reportDoc.reportDocDt}</td>
	              				</tr>
              			</c:forEach>
              		</c:if>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
          <!-- /.mail-box-messages -->
        </div>
        <!-- /.card-body -->
        	<%@ include file="../common/pagination.jsp" %>
      </div>


    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>

<script>
function myReportDetail(reportDocCode){
	OpenWindow('<%=request.getContextPath()%>/report/reportDetail?reportDocCode='+reportDocCode, '', '900', '870');
}
</script>
</body>