<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.id_input_re_1, .pwd_input_re_1, .pwdConfirm_input_re_1{
	color : green;
	display : none;
}
.id_input_re_2, .pwdConfirm_input_re_2{
	color : red;
	display: none;
}

</style>

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		</section>
		<section class="content">
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title">개인정보입력</h3>
				</div>
				<div class="card-body p-0">
					<div class="bs-stepper linear">
						<div class="bs-stepper-header" role="tablist">
							<!-- your steps here -->
							<div class="step" data-target="#logins-part">
								<button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger" aria-selected="false" disabled="disabled">
									<span class="bs-stepper-circle">1</span>
									<span class="bs-stepper-label" onclick="insertFirst();">필수 정보 입력</span>
								</button>
							</div>
							<div class="line"></div>
							<div class="step " data-target="#information-part">
								<button type="button" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger" aria-selected="true">
									<span class="bs-stepper-circle">2</span>
									<span class="bs-stepper-label" onclick="insertSecond();">추가 정보 입력</span>
								</button>
							</div>
						</div>


						<div class="bs-stepper-content">
							<form action="initloginGo.do" name="initLogin" method="post">
								<!-- your steps content here -->
								<input type="hidden" name="empCode" value="${empCode }">
								<div id="logins-part" class="content" role="tabpanel" aria-labelledby="logins-part-trigger">
									<div class="form-group">
										<label for="id">아이디</label>
										<div>
											<div>
												<input type="text" class="form-control id_input" name="empId" id="id" placeholder="ID" value="">
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
											<input type="password" class="form-control" name="empPassword" id="pwd" placeholder="Password">
										</div>
										<span class="pwd_input_re_1">사용 가능한 비밀번호입니다.</span>
										<span class="pwd_input_re_2">영문, 숫자, 특수문자를 혼합하여 8~20자리 이내로 입력해주세요.</span>
									</div>
									<div class="form-group">
										<label for="pwd">비밀번호 확인</label>
										<div>
											<input type="password" class="form-control" id="pwdConfirm" placeholder="Password Confirm">
										</div>
										<span class="pwdConfirm_input_re_1">비밀번호가 일치합니다.</span>
										<span class="pwdConfirm_input_re_2">비밀번호가 일치하지 않습니다.</span>
									</div>
									<button type="button" class="btn btn-info next-btnbtn" onclick="stepper.next()">다음</button>
								</div>
								<div id="information-part" class="content active dstepper-block" role="tabpanel" aria-labelledby="information-part-trigger">
									<div class="form-group">
										<label for="addrBtn">주소</label>
										<div class="row d-flex justify-content-between" style="width: 644px; margin: 0px;">
											<div>
												<input type="text" class="form-control" name="empAddress1" id="addr1" placeholder="Address" style="width: 580px;" readonly="readonly">
											</div>
											<div>
												<button type="button" class="btn btn-default" onclick="addrApi()">검색</button>
											</div>
											<div>
												<input type="text" class="form-control" name="empAddress2" id="addr2" placeholder="DetailAddress" style="width: 644px; margin-top: 5px; ">
												<input type="hidden" class="form-control" name="empAddress" id="addr">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="phone">전화번호</label>
										<div>
											<input type="text" oninput="autoHyphen(this)" maxlength="13" class="form-control" name="empTelephone" id="phone" placeholder="Phone">
										</div>
										<span class="tel_input_re_1">숫자 11자리를 입력해주세요.</span>
									</div>
									<div class="form-group">
										<label for="email">이메일</label>
										<div>
											<input type="text" class="form-control" name="empEmail" id="email" placeholder="Email">
										</div>
										<span class="email_input_re_1">(ex/merry123@christ.mas)</span>
									</div>
									<button type="button" class="btn btn-info" onclick="stepper.previous()">이전</button>
									<button type="button" onclick="loginInit();" class="btn btn-info btn-submit">등록</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
const insertFirst = ()=>{
	document.querySelector('#id').value="first123 ";
	document.querySelector('#pwd').value="first123!!";
	document.querySelector('#pwdConfirm').value ="first123!!";
}
const insertSecond = ()=>{
	document.querySelector('#phone').value="01098723648 ";
	document.querySelector('#email').value ="first123@offispace.com ";
}
const loginInit = () => {
	Swal.fire({
		  title: "사원 정보 등록",
		  text: "사원 정보 등록을 하겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '등록',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
					  title: "사원 정보 등록",
					  text: "등록을 완료하였습니다.",
					  icon: 'success',
					  showCancelButton: false,
					  confirmButtonText: '확인',
					  reverseButtons: false
					})
					.then((result) => {
						
						document.querySelector('form').submit();
					});
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("사원 정보 등록","등록을 취소하였습니다.");
		 	}
		});
}
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

					//$('input[name=zipcd]').val(data.zonecode);      // 우편번호(5자리)
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



		// BS-Stepper Init
		document.addEventListener('DOMContentLoaded', function() {
			window.stepper = new Stepper(document.querySelector('.bs-stepper'))
		})
	</script>
</body>
