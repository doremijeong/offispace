<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title>주소록</title>

<body>
	<div class="content-wrapper">
	
	<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>주소록</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">주소록</a></li>
							<li class="breadcrumb-item active">메인</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
    	<section class="content">
    		<div class="container-fluid">
        		<div class="card card-info card-outline">
            		<div class="card-header">
                		<div class="row">
                    		<h3 class="col-lg-6 card-title">통합 주소록</h3>
                      		<div class="col-lg-2">
                      		</div>
                      		<div class="col-lg-4 card-tools">  
	                        	<div class="input-group input-group-sm">    
	                            	<div class="input-group-append">
	                            	</div>
	                        	</div>
                      		</div>
                  		</div>
                		<!-- /.card-tools -->
                	</div>
                	<!-- /.card-header -->
      
                	<div class="card-body p-0">
                		<!-- <div class="mailbox-controls">
                    		Check all button
                    		<button type="button" class="btn btn-default btn-sm checkbox-toggle">
                    			<i class="far fa-square"></i>
                    		</button>
                    		<div class="btn-group">
                      			<button type="button" class="btn btn-default btn-sm">
                        			<i class="fas fa-envelope"></i>
                      			</button>
                    		</div>
                    
                    		/.btn-group
                    		<div class="float-right">
                    			<div class="btn-group">
                      				<button type="button" class="btn btn-default btn-sm">전체</button>
                      				<button type="button" class="btn btn-default btn-sm">ㄱ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㄴ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㄷ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㄹ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅁ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅂ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅅ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅇ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅈ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅊ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅋ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅌ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅍ</button>
                      				<button type="button" class="btn btn-default btn-sm">ㅎ</button>
                      				<button type="button" class="btn btn-default btn-sm">a-z</button>
                      				<button type="button" class="btn btn-default btn-sm">0-9</button>
                      				<button type="button" class="btn btn-default btn-sm">etc</button>
                      				<button type="button" class="btn btn-default btn-sm">즐겨찾기</button>
                    			</div>
                    		</div>
                    		/.float-right
                  		</div> -->
                  		
                  		<div class="table-responsive mailbox-messages">
	              			<table class="table table-hover table-sm">
		            			<tbody>
			            			<tr>
			                			<!-- <th>
			                    			<div class="icheck-primary">
			                        			<input type="checkbox" value="" id="check1">
			                            		<label for="check1"></label>
			                        		</div>
			                    		</th> -->
			                    		<th>사 진</th>
			                    		<th>이 름</th>
			                    		<th>직 급</th>
			                    		<th>소 속</th>
			                    		<th>직 책</th>
			                    		<th>휴대 전화</th>
			                    		<th>이메일</th>
			                    		<th>상 태</th>
			                		</tr>
			                      
			                		<c:if test="${empty employeeList }">
			                			<tr>
			                				<td colspan="8">
                  								<h2 style="text-align: center;">등록된 주소록이 없습니다.</h2>
                  							</td>
                  						</tr>
                  					</c:if>
                  					
                  					<c:if test="${!empty employeeList }">
	                  					<c:forEach items="${employeeList }" var="emp">
			                    			<tr>
			                        			<!-- <td>
		                            				<input type="checkbox" value="" id="" class="checking">
			                        			</td> -->
			                        			
			                        			<td class="mailbox-name">
			                            			<%-- <img src="<%=request.getContextPath() %>/resources/images/01.jpg" class="img-circle img-sm" alt="User Image"> --%>
			                            			<img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName=${emp.attachSavename}" class="img-circle img-sm" alt="User Image">
			                        			</td>
			                        			<td>${emp.empName }</td>
			                        			<td>${emp.positionValue }</td>
			                        			<td>${emp.teamValue }</td>
			                        			<td>${emp.chargeValue }</td>
			                        			<td>${emp.empTelephone }</td>
			                        			<td>${emp.empEmail }</td>
			                        			<td>${emp.statusValue }</td>
			                      			</tr>
			                      		</c:forEach>
                  					</c:if>
		                		</tbody>
		            		</table>
                  		</div>
                  		<!-- /.mail-box-messages -->
                	</div>
                	<!-- /.card-body -->
                	
<!--                 	<div class="card-footer p-0"> -->
<!--             			<div class="mailbox-controls"> -->
                    		<!-- Check all button -->
                    		<!-- /.btn-group -->
                    		
							<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
<!--                 		</div> -->
<!--         			</div> -->
        		</div>
        	</div>
    	</section>
    	
    </div>
    
    <script>
    
    window.onload=function(){
    	//adminlte 긁어옴.
        $('.checkbox-toggle').click(function () {
    	  	var clicks = $(this).data('clicks')
    	    if (clicks) {
    	        //Uncheck all checkboxes
    	        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
    	        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
    	    } else {
    	        //Check all checkboxes
    	        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
    	        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
    	    }
    	    $(this).data('clicks', !clicks)
    	});
    };
  
    </script>
    
</body>