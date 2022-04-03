<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-light">

            <!-- Control sidebar content goes here -->
            <div class="card card-info card-outline">
				<div class="card-header" style="margin-top: 10px; margin-bottom:10px;">
                	<div class="row" style="justify-content: space-around;">
		               <a class="btn bg-primary" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="mail_go();"><i class="fas fa-envelope"></i></a>
		               <a class="btn bg-warning" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="sendMsgModal();"><i class="far fa-comment-dots"></i></a>
		               <a class="btn bg-danger" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="approval();"><i class="fas fa-file-signature"></i> </a>
		               <a class="btn bg-success" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="job_go();"><i class="fas fa-briefcase"></i> </a>
                	</div>
				</div>
                <div class="card-body" style="padding-top:0">
                   <c:choose>
                   	<%-- <c:when test="${empty attend || attend eq null}"> --%>
                   	<c:when test="${checkAttend eq 'N'}">
                       	<a id="attBtn" href="javascript:homeCheck('A');" class="btn btn-outline-primary btn-block"><b>출근하기</b></a>
                       </c:when>
                       <c:otherwise>
                       	<c:choose>
                        	<%-- <c:when test="${empty attend.attLeavTimeSt || attend.attLeavTimeSt eq null}"> --%>
                        	<c:when test="${checkAttend eq 'Y' && checkLeave eq 'N'}">
                            	<a id="attBtn" href="javascript:homeCheck('B');" class="btn btn-outline-primary btn-block"><b>퇴근하기</b></a>
                            </c:when>
                            <c:otherwise>
                            	<a id="attBtn" href="#" class="btn btn-outline-primary btn-block"><b>업무완료</b></a>
                            </c:otherwise>
                           </c:choose>
                       </c:otherwise>
                   </c:choose>
       				<ul class="list-group list-group-unbordered mb-3">

                        <li class="list-group-item">
                            <div class="">
                                <p class="text-center" style="color:gray;"><b>${loginUser.teamValue } 근무 현황</b></p>
                                <div class="card-body table-responsive p-0 teamAttendListBox" style="height: 360px; ">
                                    <table class="table table-head-fixed text-nowrap teamAttendListTable">
                                    	<c:forEach items="${employeeList}" var="employee">
                                        	<tr>
                                        		<td style="padding: 0;">
	                                        		<div class="info-box" style="margin: 0px; min-height:70px;">
                                                    	<div class="image" style="width: 50px; height: 50px;">
                                                        	<%-- <img src="<%=request.getContextPath() %>/resources/images/01.jpg" style="object-fit: cover; width: 50px; height: 50px;" class="img-size-50 mr-3 img-circle" alt="User Image"> --%>
                                                        	<%-- <img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName=${employee.attachSavename}" style="object-fit: cover; width: 50px; height: 50px;" class="img-size-50 mr-3 img-circle" alt="User Image"> --%>
                                                    	</div>
	                                                    <div class="info-box-content" style="height: 50px;">
		                                                    <span class="info-box-number text-center">${employee.empName }&nbsp;${employee.positionValue }</span>

		                                                    <c:forEach items="${teamAttend }" var="attend">
		                                                    	<c:if test="${attend.empCode eq employee.empCode}">

		                                                    		<c:choose>
			                                                    		<c:when test="${attend.attLeavTime ne null }">
			                                                    			<span class="badge badge-primary">퇴근 후</span>
			                                                    		</c:when>
			                                                    		<c:otherwise>
			                                                    			<c:choose>
			                                                    				<c:when test="${attend.attTime ne null }">
			                                                    					<span class="badge badge-primary">근무 중</span>
					                                                    		</c:when>
					                                                    		<c:otherwise>
					                                                    			<span class="badge badge-primary">출근 전</span>
					                                                    		</c:otherwise>
			                                                    			</c:choose>
			                                                    		</c:otherwise>
		                                                    		</c:choose>

		                                                    	</c:if>
		                                                    </c:forEach>

	                                                    </div>
	                                                    <!-- /.info-box-content -->
                                                	</div>
                                        		</td>
    	                                    </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </li>

                    </ul>
                    <div class="selectBox" style="padding-bottom:8px;">
         				<select class="select2 select2-hidden-accessible"  name="attOption" id="attOption" onchange="att_go();" data-placeholder="근무 상태 선택 " style="height: 100%; width: 100%; font-size: 0.3em; line-height: 20px;"  tabindex="-1" aria-hidden="true">
                        	<option class="attOptions" value="null" <c:if test="${attend.attJobStCode eq null}">selected</c:if>>근무상태선택</option>
                        	<option class="attOptions" value="AJ0001" <c:if test="${attend.attJobStCode eq 'AJ0001'}">selected</c:if>>업무중</option>
                         	<option class="attOptions" value="AJ0002" <c:if test="${attend.attJobStCode eq 'AJ0002'}">selected</c:if>>업무완료</option>
                         	<option class="attOptions" value="AJ0003" <c:if test="${attend.attJobStCode eq 'AJ0003'}">selected</c:if>>회의중</option>
                            <option class="attOptions" value="AJ0004" <c:if test="${attend.attJobStCode eq 'AJ0004'}">selected</c:if>>자리비움</option>
                            <option class="attOptions" value="AJ0005" <c:if test="${attend.attJobStCode eq 'AJ0005'}">selected</c:if>>재택근무</option>
                         	<option class="attOptions" value="AJ0006" <c:if test="${attend.attJobStCode eq 'AJ0006'}">selected</c:if>>외근중</option>
                         	<option class="attOptions" value="AJ0007" <c:if test="${attend.attJobStCode eq 'AJ0007'}">selected</c:if>>출장중</option>
                            <option class="attOptions" value="AJ0008" <c:if test="${attend.attJobStCode eq 'AJ0008'}">selected</c:if>>휴가중</option>
	                  	</select>
                    </div>
	                <button type="button" class="btn btn-outline-info btn-block btn-xs"  ${loginUser.chargeCode eq 'R102' ? 'style="display : inline"':'style="display : none"' } onclick="teamsHomeCheck();">재택근무자 근무확인</button>
					<button type="button" class="btn btn-outline-secondary btn-block btn-xs" onclick="OpenWindow('<%=request.getContextPath()%>/employee/modifyForm.do','개인정보수정','660','900');">사원정보수정</button>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </aside>
        <!-- /.control-sidebar -->
        <!-- Main Footer -->
        <footer class="main-footer" >
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">
               	당신이 있는 곳이 곧 사무실이 됩니다.
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; 2022 <span class="text-info">Offi-Space</span></strong> All rights
            reserved.
        </footer>

    </div>



<script>
function teamsHomeCheck(){

	Swal.fire({
		  title: '재택근무자의 근태를 확인하시겠습니까?',
// 		  text: text,
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonText: '확인',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('<%=request.getContextPath()%>/attend/teamsHomeCheck.do')
				.then(data=>{
					console.log('Success:', data);
				})
				.catch((error)=>{
					console.log('Error:', error);
				})
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("근태확인","취소하였습니다.");
		 	}
		});


// 	if(confirm('재택근무자의 근태를 확인하시겠습니까?')){
<%-- 		fetch('<%=request.getContextPath()%>/attend/teamsHomeCheck.do') --%>
// 		.then(data=>{
// 			console.log('Success:', data);
// 		})
// 		.catch((error)=>{
// 			console.log('Error:', error);
// 		})
// 	};
}

function mail_go() {
	OpenWindow('<%=request.getContextPath()%>/mail/writeMailForMain.do','','965','850')
}
function job_go(){
	OpenWindow('<%=request.getContextPath()%>/job/registerJobFormOpenWindow.do','','965','850')
}
function approval(){
	document.getElementById('main_iframe').src = "<%=request.getContextPath()%>/approval/insert";
}
</script>


<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<!-- BS-Stepper -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/fullcalendar/main.js?ver=20220110"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js?ver=20220126"></script>


</body>
</html>