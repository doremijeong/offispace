<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.id_input_re_1, .pwd_input_re_1, .pwdConfirm_input_re_1 {
	color: green;
	display: none;
}

.id_input_re_2, .pwdConfirm_input_re_2 {
	color: red;
	display: none;
}
</style>

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>사원정보 수정 </h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">마이페이지 </a></li>
							<li class="breadcrumb-item active">사원정보 수정</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<section class="content">
			<div class="card">
				<form action="modifyEmp.do" name="modify" method="post" enctype="multipart/form-data">
					<div class="card-header">
						<h3 class="card-title">사원 정보수정</h3>
						<div class="float-right">
							<button type="button" class="btn btn-info" onclick="gogo()">수정</button>
							<button type="button" class="btn btn-default" onclick="CloseWindow()">닫기</button>
						</div>
					</div>
				<div class="card-body row">
					<div class="col-lg-12 row" style="justify-content: center;">
						<input type="hidden" name="empCode" value="${emp.empCode}">
						<div class="form-group">
            			    <label>사진</label>
							<!-- 나중에 삭제하기 위해서 기존의 파일명을 넣어놓음 -->
							<input type="hidden" name="oldPicture" value="${emp.attachSavename}" />
							<!-- 기존파일 -->
							<input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display: none" />
							<!-- 선택한 파일  : 선택한 파일의 이미지를 미리 보여주기 위해서 onchange함수 콜 -->
							<div class="input-group">
								<div class="clearfix" style="text-align: center;">
									<div class="" id="pictureView" style="border: 1px solid lightgray; height: 200px; width: 140px; margin:0 auto 15px auto;"></div>
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-outline-info btn-sm btn-flat input-group-addon">사진변경</label>
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" readonly value="" />
										<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 border-right">						
						<div class="form-group">
							<label for="id">아이디</label>
							<div>
								<div>
									<input type="text" class="form-control id_input" name="empId" id="id" value="${emp.empId}">
								</div>
								<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
								<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
								<span class="id_input_re_3">영문+숫자 6자리 이상 입력해주세요.</span>
								<!-- <div>
												<button type="button" class="btn btn-success" onclick="stepper.previous()">중복확인</button>
											</div> -->
							</div>
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호</label>
							<div>
								<input type="password" class="form-control" name="empPassword" id="pwd" value="${emp.empPassword}">
							</div>
							<span class="pwd_input_re_1">사용 가능한 비밀번호입니다.</span>
							<span class="pwd_input_re_2">영문, 숫자, 특수문자를 혼합하여 8~20자리 이내로 입력해주세요.</span>
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호 확인</label>
							<div>
								<input type="password" class="form-control" id="pwdConfirm" value="${emp.empPassword}">
							</div>
							<span class="pwdConfirm_input_re_1">비밀번호가 일치합니다.</span>
							<span class="pwdConfirm_input_re_2">비밀번호가 일치하지 않습니다.</span>
						</div>
					</div><!-- /.col-lg-6 border-right -->
					<div class="col-lg-6">	
						<div class="form-group">
							<label for="addrBtn">주소</label>							
							<div class="input-group">
								<input type="text" class="form-control" name="empAddress1" id="addr1" value="${fn:split(emp.empAddress,'$')[0]}" readonly="readonly">
								<span class="input-group-append">
									<button type="button" class="btn btn-default" onclick="addrApi()">검색</button>
								</span>
							</div>									
							
							<div class="input-group">
								<input type="text" class="form-control" name="empAddress2" id="addr2" value="${fn:split(emp.empAddress,'$')[1]}" style="margin-top: 5px;">
								<input type="hidden" class="form-control" name="empAddress" id="addr" value="${emp.empAddress}">
							</div>
						</div>
						<div class="form-group">
							<label for="phone">전화번호</label>
							<div>
								<input type="text" oninput="autoHyphen(this)" maxlength="13" class="form-control" name="empTelephone" id="phone" value="${emp.empTelephone}">
							</div>
							<span class="tel_input_re_1">숫자 11자리를 입력해주세요.</span>
						</div>
						<div class="form-group">
							<label for="email">이메일</label>
							<div>
								<input type="text" class="form-control" name="empEmail" id="email" value="${emp.empEmail}">
							</div>
							<span class="email_input_re_1">(ex/merry123@christ.mas)</span>
						</div>
					</div><!-- ./col-lg-6 -->
				</div><!-- card-body row -->
					<div class="card-footer">
						<button type="button" class="btn btn-info" onclick="gogo()">수정</button>
						<button type="button" class="btn btn-default" onclick="CloseWindow()">닫기</button>
					</div><!-- card-footer -->
				</form>
			</div><!--card  -->
		</section>
	</div><!--content-wrapper  -->
	<script>

		window.onload = function(){

			$('.next-btnbtn').attr("disabled",true);
			$('.btn-submit').attr("disabled",true);

			$('.id_input_re_1').css("display", "none");
			$('.id_input_re_2').css("display", "none");
			$('.id_input_re_3').css("display", "none");

			$('.pwd_input_re_2').css("display", "none");
			$('.pwd_input_re_1').css("display", "none");

			$('.tel_input_re_1').css("display", "none");

			$('.email_input_re_1').css("display", "none");

			var targetObj = $('div#pictureView')[0];

			targetObj.style.backgroundImage = "url('<%=request.getContextPath()%>/employee/getPicture.do?empCode=${emp.empCode}')";
			targetObj.style.backgroundPosition = "center";
			targetObj.style.backgroundRepeat = "no-repeat";
			targetObj.style.backgroundSize = "cover";

		}


		//아이디 중복검사
		$('.id_input').on("propertychange change keyup paste input", function(){

			/* console.log("keyup 테스트"); */


			var empId = $('.id_input').val();// .id_input에 입력되는 값
			var data = {empId : empId}	// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			$('.id_input').attr('value',empId);

			idreg = /^[a-z]+[a-z0-9]{5,19}$/g;

			$.ajax({
				type : "post",
				url : "employeeCheck.do",
				data : data,
				success : function(result){
					/* console.log("성공여부" + result); */


					if(!(idreg.test(empId))){
						$('.id_input').css('border', '2px solid red');

						$('.id_input_re_3').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");
						$('.id_input_re_2').css("display", "none");
						$('.next-btnbtn').attr("disabled",true);

				    }
				    else{
				    	$('.id_input').css('border', '2px solid blue');

				    	if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");
							$('.id_input_re_3').css("display", "none");

						} else {
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");
							$('.id_input_re_3').css("display", "none");
							$('.next-btnbtn').attr("disabled",true);
						}

				    }

				}
			});

		});

		var empPwd
		//비밀번호 정규식
		$('#pwd').on("propertychange change keyup paste input", function(){

			empPwd = $('#pwd').val(); // #pwd에 입력되는 값

			// 영문, 숫자, 특수문자를 혼합하여 8~20자리 이내
			var pwdIdreg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;

			if(!(pwdIdreg.test(empPwd))){
				$('#pwd').css('border', '2px solid red');

				$('.pwd_input_re_2').css("display","inline-block");
				$('.pwd_input_re_1').css("display", "none");
				$('.next-btnbtn').attr("disabled",true);

			}else{
				$('#pwd').css('border', '2px solid blue');

				$('.pwd_input_re_1').css("display","inline-block");
				$('.pwd_input_re_2').css("display", "none");
			}

		});


		//비밀번호 확인
		$('#pwdConfirm').on("propertychange change keyup paste input", function(){

			var empConfirmPwd = $('#pwdConfirm').val(); // #pwdConfirm에 입력되는 값

			if(!(empPwd == empConfirmPwd)){
				$('#pwdConfirm').css('border', '2px solid red');

				$('.pwdConfirm_input_re_2').css("display","inline-block");
				$('.pwdConfirm_input_re_1').css("display", "none");

			}else{
				$('#pwdConfirm').css('border', '2px solid blue');

				$('.pwdConfirm_input_re_1').css("display","inline-block");
				$('.pwdConfirm_input_re_2').css("display", "none");
				$('.next-btnbtn').attr("disabled",false);

			}

		});


		//전화번호 정규식
		$('#phone').on("propertychange change keyup paste input", function(){

			var empTel = $('#phone').val(); // #phone에 입력되는 값

			// 영문, 숫자, 특수문자를 혼합하여 8~20자리 이내
			var telIdreg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

			if(!(telIdreg.test(empTel))){
				$('#phone').css('border', '2px solid red');

				$('.tel_input_re_1').css("display","inline-block");
				$('.btn-submit').attr("disabled",true);

			}else{
				$('#phone').css('border', '2px solid blue');

				$('.tel_input_re_1').css("display", "none");
			}


		});


		const autoHyphen = (target) => {
			 target.value = target.value
			   .replace(/[^0-9]/, '')
			   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			}



		//이메일 정규식
		$('#email').on("propertychange change keyup paste input", function(){

			var empEmail = $('#email').val(); // #email에 입력되는 값

			// 영문, 숫자, 특수문자를 혼합하여 8~20자리 이내
			var emailIdreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/ ;

			if(!(emailIdreg.test(empEmail))){
				$('#email').css('border', '2px solid red');

				$('.email_input_re_1').css("display","inline-block");
				$('.btn-submit').attr("disabled",true);

			}else{
				$('#email').css('border', '2px solid blue');

				$('.email_input_re_1').css("display", "none");
				$('.btn-submit').attr("disabled",false);
			}


		});

		function addrApi(){

			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // http://postcode.map.daum.net/guide 에서 예제를 활용하여 커스텀

					//$('input[name=zipcd]').val(data.zonecode);    // 우편번호(5자리)
					$('input[name=empAddress1]').val(data.address);   // 기본주소
					$('input[name=empAddress2]').val(data.buildingName);    // 건물명
		        }
		    }).open();

		}

		$('#addr2').on("propertychange change keyup paste input", function(){

			var sumAddr = $('#addr1').val() + "$" + $('#addr2').val();
			console.log("합친주소 : " + sumAddr);
			$('#addr').val(sumAddr);

		});

		//사진이 변경된 경우에만 나타남 같은 사진이면 실행안됨
		function changePicture_go() {
			var picture = $('input#inputFile')[0]; // 자바스크립트 객체 여야만 파일을 다룰 수 있음

			var fileFormat = picture.value.substr(
					picture.value.lastIndexOf(".") + 1).toUpperCase();

			// 이미지 확장자 체크
			if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
				alert("이미지는 JGP형식만 가능합니다.");
				return;
			}

			// 이미지 사이즈 체크
			if (picture.files[0].size > 1024 * 1024 * 1) {
				alert("사진 용량은 1MB이하만 가능합니다.");
				return;
			}

			document.getElementById('inputFileName').value = picture.files[0].name;

			if (picture.files && picture.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('div#pictureView').css({
						'background-image' : 'url(' + e.target.result + ')',
						'background-position' : 'center',
						'background-size' : 'cover',
						'background-repeat' : 'no-repeat'
					});
				}
				reader.readAsDataURL(picture.files[0]);
			}
			// 변경을 했는지 확인하기 위해서 선택한 파일의 이름을 값에 심어줌
			$('input[name="uploadPicture"]').val(picture.files[0].name);
		}

	function gogo() {
		$('form[name="modify"]').submit();
	}
	</script>
</body>
