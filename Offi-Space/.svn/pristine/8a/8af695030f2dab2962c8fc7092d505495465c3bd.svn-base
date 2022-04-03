<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- REQUIRED SCRIPTS -->
<!-- 툴팁관련 자바스크립트 -->
<script>
const setTooltips = () => {
	 $('.tooltipCaller').tooltip();
	  let tooltips = document.querySelectorAll('.tooltipCaller');
	  tooltips.forEach(tooltip=>{
		  let empName = tooltip.dataset.empName;
	  	  let empTelephone = tooltip.dataset.empTelephone;
	  	  let empEmail = tooltip.dataset.empEmail;
	  	  let positionValue = tooltip.dataset.positionValue;
	  	  let teamValue = tooltip.dataset.teamValue;
	  	  let groupValue = tooltip.dataset.groupValue;
	      let attachSavename = tooltip.dataset.attachSavename;
		  let imgSrc = "<%=request.getContextPath() %>/resources/images/01.jpg"
	      if(attachSavename != ""){
	      	imgSrc = "<%=request.getContextPath() %>/common/getPicture.do?attachSaveName="+attachSavename;
	      }
	      //console.log(empName, empTelephone, empEmail, positionValue, teamValue, groupValue,imgSrc);
		  let content = setContent(empName, empTelephone, empEmail, positionValue, teamValue, groupValue, imgSrc);
		  //console.log(content);
		  tooltip.dataset.originalTitle = content;
	  })

}


const setContent = (empName, empTelephone, empEmail, positionValue, teamValue, groupValue, imgSrc) => {

let content = `
<div class="card" >
   <div class="card-body" >
	    <div class="row firstRow">
	        <div class="col-lg-4 text-center">
	        <img src="`+imgSrc+`"
	  			class="img-size-50 mr-3 img-circle" alt="User Image">
	        </div>
	        <div class="col-lg-8">
	        	<p class="text-muted text-sm">`+empName+`&nbsp;`+positionValue+`</p>
	            <p class="text-muted text-sm">`+teamValue+`</p>

	        </div>
	    </div>
	    <div class="row" >
	        <ul class="ml-4 mb-0 fa-ul text-muted">
		        <li><span class="fa-li" ><i class="fas fa-envelope text-muted"></i></span>`+empEmail+`</li>
	    	    <li><span class="fa-li" ><i class="fas fa-phone text-muted"></i></span>`+empTelephone+`</li>
	    	</ul>
	    </div>
   </div>
</div>`;

return content;
}
/*  알림 등록 */
const registerNotification = (formData) => {
	fetch('<%=request.getContextPath()%>/notification/registerNotiFromNoti',{
			method:'POST',
			headers:{},
			body: formData,
		})
		.then(data => {
			console.log('Success:', data);
		})
		.catch((error) => {
			console.log('Error:', error);
		});
}
/* UI가 적용된 알림창  */
const callCustomAlert = (title, text, icon)=>{
	Swal.fire({
		  title: title,
		  icon: icon,
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}

const callSuccess = (title, text) => {
	Swal.fire({
		  title: title,
		  icon: 'success',
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}
const callCancel = (title, text) => {
	Swal.fire({
		  title: title,
		  icon: 'error',
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}

const callFail = () => {
	Swal.fire({
		  title: "요청 실패",
		  icon: 'error',
		  text: "서버가 요청사항을 수행할 수 없습니다.",
		  showConfirmButton: false,
		  timer: 1500
		});
}
const callConfirmSimple = (title, text, conText,canText) =>{
	Swal.fire({
		  title: title,
		  text: text,
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: conText,
		  cancelButtonText: canText,
		  reverseButtons: false
		})
}
const callConfirm = (title,text,conTitle,conText,canTitle,canText) => {
	Swal.fire({
	  title: title,
	  text: text,
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonText: '확인',
	  cancelButtonText: '취소',
	  reverseButtons: false
	})
	.then((result) => {
		if (result.isConfirmed) {
			callSuccess(conTitle,conText);
		} else if ( result.dismiss === Swal.DismissReason.cancel) {
			callCancel(canTitle,canText);
	 	}
	});
}
</script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<!-- BS-Stepper -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/fullcalendar/main.js?ver=20220110"></script>
<!-- jsTree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<!-- common js -->
<script src="<%=request.getContextPath() %>/resources/js/common.js?ver=20220126"></script>
<!-- jspdf.min.js -->
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>
<!-- html2canvas.js -->
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<!-- ionicons -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>
</html>