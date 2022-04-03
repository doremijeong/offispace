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
          <h5>임시 보관함</h5>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">임시 보관함 </li>
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
<!--           <h3 class="card-title">임시보고서함</h3> -->
          <div class="card-tools">
            <div class="input-group input-group-sm">
            	<!-- <div class="mailbox-controls">
		            Check all button
		            <button type="button" class="btn btn-default btn-sm checkbox-toggle">
		              <i class="far fa-square"></i>
		            </button>
		            <div class="btn-group">
		              <button type="button" class="btn btn-default btn-sm">
		                <i class="far fa-trash-alt"></i>
		              </button>
		              <button type="button" class="btn btn-default btn-sm">
		                <i class="fas fa-reply"></i>
		              </button>
		              <button type="button" class="btn btn-default btn-sm">
		                <i class="fas fa-share"></i>
		              </button>
		            </div>
		            /.btn-group
		            <button type="button" class="btn btn-default btn-sm">
		              <i class="fas fa-sync-alt"></i>
		            </button>
		            /.float-right
	           </div> -->
               <select class="custom-select col-sm-5" id="inputGroupSelect01">
					<option value="rptTitle">보고유형</option>
					<option value="rptDocTitle">제목</option>
	  			</select>
	  			&nbsp;
              <input type="text" class="form-control" name="keyword" placeholder="Search" name="searchType">
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
                  <th style="width: 10%;"></th>
                  <th style="width: 20%;">보고 유형</th>
                  <th style="width: 50%;">제목</th>
                  <th style="width: 20%;">임시저장일</th>
                </tr>
              </thead>
              <tbody style="font-size: 0.8em;">
              		<c:if test="${empty reportDocList}">
              			<tr style="padding: 3px;">
							<td colspan="5" class="text-center">
								해당하는 보고서가 없습니다.
							</td>
						</tr>
              		</c:if>
              		<c:if test="${!empty reportDocList}">
              			<c:forEach items="${reportDocList}" var="reportDoc">
	              				<tr>
	              					<td></td>
									<td class="text-center">${reportDoc.reportTitle}</td>
									<td class="text-left" onclick="tempReport_go('${reportDoc.reportDocCode}')" style="cursor: pointer;">${reportDoc.reportDocTitle}</td>
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
function tempReport_go(reportDocCode){

	location.href = '<%=request.getContextPath()%>/report/modifyReportShow?reportDocCode=' + reportDocCode;
	
	
	/* $.ajax({
		url : "tempReportModify?reportDocCode="+reportDocCode,
		type : "get",
		dataType : "json",
		success : function(result) {
			//alert(result.reportMarkup);
			$('.show-form-div').html(result.reportMarkup);
			$('#report-form').modal('hide');
		},
		error : function(xhr) {
			alert("양식 불러오기 실패..ㅠㅠㅠ");
		}
	}); */
	
}
</script>
</body>