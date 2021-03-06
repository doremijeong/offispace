<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>내정보</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  
  <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  
</head>
<body class="">

<!-- REQUIRED SCRIPTS -->

	<div class="" style="min-height: 660px;">

		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>내정보</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Mypage</a></li>
							<li class="breadcrumb-item active">MyInformation</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
		
			<form  name="registerEmployee" action="registerEmployee" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="inputName">이름 </label>
                    <input type="text" class="form-control" name="empName" id="inpuName" placeholder="홍길동">
                  </div>
                  <div class="form-group">
                    <label for="inputRRN">사원아이디 </label>
                    <input type="number" class="form-control" name="empReginum" id="inputRRN" placeholder="a001">
                  </div>
				  <div class="form-group">
                    <label for="inputHireDate">입사일 </label>
                    <input type="date" class="form-control" name="empHireDt" id="inputHireDate" placeholder="입사일을 입력하세요 ">
                  </div>
                                  
                  <div class="form-group">
                  	<label for="inputHeadOffice">본부   </label>
                    <select name="headOfficeCode" class="custom-select rounded-0" id="inputHeadOffice">
	                    <option> 경영혁신본부</option>
	                    <option>Value 2</option>
	                    <option>Value 3</option>
                  	</select> 
                  </div>
                  <div class="form-group">
                    <label for="inputGroup">그룹  </label>
                    <select name="groupCode" class="custom-select rounded-0" id="inputGroup">
	                    <option>인재개발그룹</option>
	                    <option>Value 2</option>
	                    <option>Value 3</option>
                  	</select>
                  </div>
                  <div class="form-group">
                    <label for="inputDepartment">부서  </label>
                    <select name="departmentCode" class="custom-select rounded-0" id="inputDepartment">
	                    <option>인사팀</option>
	                    <option>Value 2</option>
	                    <option>Value 3</option>
                  	</select>
                  </div>
                  <div class="form-group">
                    <label for="inputPosition">직급  </label>
                    <select name="positionCode" class="custom-select rounded-0" id="inputPosition">
	                    <option> 사원</option>
	                    <option>Value 2</option>
	                    <option>Value 3</option>
                  	</select>
                  </div>


                  <div class="form-group">
                    <label for="inputPhoto">사진</label>
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="customFile">
                      <label class="custom-file-label" for="customFile">사진을 등록하세요.</label>
                    </div>
                  </div>                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" onclick="gogo();" class="btn btn-primary">등록</button>
                </div>
              </form>
		
		</section>
	</div>

<script>
function gogo(){

	let newForm =document.querySelector('form[name="registerEmployee"]');
	

	console.log(newForm);
	newForm.submit();

}
</script>








	<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<!-- Summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>

</body>
</html>