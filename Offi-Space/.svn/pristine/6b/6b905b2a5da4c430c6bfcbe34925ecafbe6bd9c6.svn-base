<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
 <!-- SweetAlert2 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.js"></script>

<title>Insert title here</title>
<style>
body{
	background-size:100% 100%;
	background-image: url("<%=request.getContextPath() %>/resources/css/login_background1.png");
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<div class="offi-login-container">
		<div class="offi-login-box">
			<div class="offi-left-box">
				<div class="off-title-box">
					<p class="offi-title">Offi-Space</p>
					<p class="offi-sub-title">당신이 있는 곳이 곧 사무실이 됩니다.</p>
				</div>
			</div>
			<div class="offi-right-box">

				<div class="offi-login-form">
					<form action="<%=request.getContextPath() %>/common/login.do" method="post">
					<input type="hidden" class="form-control" name="id" placeholder="ID">
					<input type="hidden" class="form-control" name="pwd" placeholder="Password">
				        <div class="input-group mb-3">
				          <input type="text" class="form-control id" placeholder="ID">
				          <div class="input-group-append">
				            <div class="input-group-text">
				              <span class="fas fa-user"></span>
				            </div>
				          </div>
				        </div>
				        <div class="input-group mb-4">
				          <input type="password" class="form-control pwd"  placeholder="Password">
				          <div class="input-group-append">
				            <div class="input-group-text">
				              <span class="fas fa-lock"></span>
				            </div>
				          </div>
				        </div>

				        <div class="social-auth-links text-center mt-2 mb-3">
				        	<button type="button" onclick="loginGo();" class="btn btn-block btn-default loginBtn">로그인</button>
				        </div>
				      </form>
				  </div>

				  <!-- <div class="social-auth-links text-center mt-2 mb-3">
			        <a href="#" class="btn btn-block btn-default">Sign in</a>
			      </div> -->

				  <div class="login_find_box">
				  	  <p class="mb-1">
				        <a class="find_font" href="forgot-password.html">아이디 찾기 &nbsp;&nbsp; | &nbsp;&nbsp;</a>
				      </p>
				      <p class="mb-1 find_font">
				        <a class="find_font" href="forgot-password.html"> 비밀번호 찾기</a>
				      </p>
				  </div>



			</div>
		</div>
	</div>
<script>
window.onload = function(){
	document.querySelector('.pwd').addEventListener('keyup',(event)=>{
		if(event.key =="Enter"){
			document.querySelector(".loginBtn").click();
		}
		
	})
}
const loginGo = () => {
	let id = document.querySelector('.id').value;
	let pwd = document.querySelector('.pwd').value;

	if (id == null || id == ""){
		Swal.fire({
			  title: "로그인 실패",
			  icon: 'warning',
			  text: "올바른 아이디를 입력하세요.",
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}

	if (pwd == null || pwd == ""){
		Swal.fire({
			  title: "로그인 실패",
			  icon: 'warning',
			  text: "올바른 비밀번호를 입력하세요.",
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}
	
	document.querySelector('input[name="id"]').value=id;
	document.querySelector('input[name="pwd"]').value=pwd;
	document.querySelector('.id').value="";
	document.querySelector('.pwd').value="";
	document.querySelector('form').submit();
}
</script>
</body>
</html>