<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%-- <c:set var="irregularReportList" value="${irregularReportList }"/> --%>


<!-- 보고서 선택 Modal start -->
<div class="modal" id="report-form" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h4 class="modal-title">보고서 불러오기</h4>
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	      </button>
	    </div>
	    <div class="modal-body">
	    		<!-- 양식구분탭 -->
	      		<div class="col-12 col-sm-12">
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
		                   <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">수시 보고서</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-four--tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="false">정기 보고서</a>
		                  </li>
		                </ul>
		              </div>
		              <div class="card-body">
		                <div class="tab-content" id="custom-tabs-four-tabContent">
		                  <!-- 수시보고서 리스트 -->
		                  <div class="tab-pane fade active show" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
								<div class="card-body" style="padding: 5px 5px;">
                                  <div class="tab-content" id="custom-tabs-four-tabContent">
                                      <div class="tab-pane fade active show" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
                                          <!-- 내부 table card -->
                                          <div>
                                              <div class="card-header" style="padding: 10px 10px;">
                                              </div>
                                              <!-- /.card-header -->
                                              <div class="card-body p-0">
                                                  <table class="table table-sm">
                                                      <thead style="font-size: 1.05em;">
                                                          <tr>
                                                          	<th></th>
                                                              <th style="width: 40%;">보고서 제목</th>
                                                              <th style="width: 30%;">운영자</th>
                                                              <th></th>
                                                          </tr>
                                                      </thead>
                                                      <tbody style="font-size: 1.0em;">
                                                      	  <!-- 수시보고서 for문 돌릴 곳 -->
                                                      	   <c:if test="${empty irregularReportList }">
                                                      	  	<tr>
																<td colspan="4" class="text-center">
																	<strong>해당하는 보고서가 없습니다.</strong>
																</td>
															</tr>
                                                      	  </c:if>

                                                      	  <c:if test="${!empty irregularReportList }">
                                                      	  	<c:forEach items="${irregularReportList}" var="ireport">
                                                      	  		<tr>
	                                                              <td></td>
	                                                              <td style=" vertical-align: middle;">${ireport.reportTitle}</td>
	                                                              <td style=" vertical-align: middle;">${ireport.managerName} &nbsp; ${ireport.managerPosition}</td>
	                                                              <td>
	                                                              	<div class="row">
	                                                               	<div style="margin-right: 5px;">
	                                                               		<button type="button" class="btn btn-block btn-default btn-sm">미리보기</button>
	                                                               	</div>
	                                                               	<div>
	                                                               		<button type="button" class="btn btn-block btn-info btn-sm show-form" value="${ireport.reportCode }" onclick="showReport('${ireport.reportCode }')">선택</button>
	                                                               	</div>
	                                                              	</div>
	                                                              </td>
	                                                          </tr>
                                                      	  	</c:forEach>
                                                      	  </c:if>
                                                          <!-- /. 수시보고서 for문 돌릴 곳 -->
                                                      </tbody>
                                                  </table>
                                              </div>
                                              <!-- /.card-body -->
                                          </div>
                                          <!-- / .내부 table card -->
                                      </div>
                                  </div>
                              </div>
		                  </div>
		              	  <!-- 정기보고서 리스트 -->
		                  <div class="tab-pane fade" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
								<div class="card-body" style="padding: 5px 5px;">
                                  <div class="tab-content" id="custom-tabs-four-tabContent">
                                      <div class="tab-pane fade active show" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
                                          <!-- 내부 table card -->
                                          <div>
                                              <div class="card-header" style="padding: 10px 10px;">
                                              </div>
                                              <!-- /.card-header -->
                                              <div class="card-body p-0">
                                                  <table class="table table-sm">
                                                      <thead style="font-size: 1.05em;">
                                                          <tr>
                                                          	<th></th>
                                                              <th style="width: 30%;">보고유형</th>
                                                              <th>제목</th>
                                                              <th></th>
                                                          </tr>
                                                      </thead>
                                                      <tbody style="font-size: 1.0em;">
                                                      	  <!-- 정기보고서 for문 돌릴 곳 -->
                                                      	  <c:if test="${empty reportList }">
                                                      	  	<tr>
																<td colspan="4" class="text-center">
																	<strong>해당하는 보고서가 없습니다.</strong>
																</td>
															</tr>
                                                      	  </c:if>
                                                          <c:if test="${!empty reportList }">
                                                      	  	<c:forEach items="${reportList}" var="report">
                                                      	  		<c:if test="${report.reportType ne 'I' }">
	                                                      	  		<tr>
		                                                              <td></td>
		                                                              <td style=" vertical-align: middle;">${report.reportTitle}</td>
		                                                              <td style=" vertical-align: middle;">${report.reportManagerName} &nbsp; ${report.reportManagerPosition}</td>
		                                                              <td>
		                                                              	<div class="row">
		                                                               	<div style="margin-right: 5px;">
		                                                               		<button type="button" class="btn btn-block btn-default btn-sm">미리보기</button>
		                                                               	</div>
		                                                               	<div>
		                                                               		<button type="button" class="btn btn-block btn-info btn-sm show-form" value="${report.reportCode }" onclick="showReport('${report.reportCode }')">선택</button>
		                                                               	</div>
		                                                              	</div>
		                                                              </td>
		                                                          </tr>
                                                      	  		</c:if>
                                                      	  	</c:forEach>
                                                      	  </c:if>
                                                          <!-- /. 정기보고서 for문 돌릴 곳 -->
                                                      </tbody>
                                                  </table>
                                              </div>
                                              <!-- /.card-body -->
                                          </div>
                                          <!-- / .내부 table card -->
                                      </div>
                                  </div>
                              </div>
		                  </div>

		                </div>
		              </div>
		              <!-- /.card -->
		            </div>
		          </div>

	    </div>
	  </div>
	  <!-- /.modal-content -->
	</div>
</div>
<!-- 양식 선택 Madal end -->



