<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
#approvalTable input {
	text-align: center
}

.apv-input {
	border: none;
	background-color: white;
	color: black;
}

.apv-textarea {
	border: none;
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<section class="content">
		<div class="card card-default card-outline">
			<!-- 버튼 -->
			<div class="card-header d-flex justify-content-end">
				<c:if test="${!empty approval.apvLineList}">
					<c:forEach items="${approval.apvLineList}" var="apvLine">
						<c:if test="${apvLine.apvKindCode eq 'AK0002' && apvLine.empCode eq loginUser.empCode}">
							<div class="btn-group">
								<button type="button" class="btn btn-info btn-sm msg-modal" data-toggle="modal" data-target="#hab-modal">합의</button>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<div>
					<button type="button" class="btn btn-info btn-sm msg-modal" ${!empty approval.attachList ? '' : 'style="display : none;"' } data-toggle="modal" data-target="#file-modal">첨부파일</button>
					<button type="button" class="btn btn-info btn-sm msg-modal" ${approval.nowEmp.empCode eq loginUser.empCode ? '' : 'style="display : none;"' } data-toggle="modal" data-target="#approval-modal">결재처리</button>
				</div>
				&nbsp;&nbsp;
				<div class="btn-group">
					<button class="btn btn-default btn-sm" onclick="javascript:CloseWindow('');">닫기</button>
				</div>
			</div>
			<!-- 본문 -->
			<div class="card-body apvMarkupDiv">${approval.apvMarkup }</div>
			<!-- /.card-body -->
		</div>
	</section>

	<!-- 결재처리 모달 -->
	<div class="modal" id="approval-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>결재처리</h3>
				</div>
				<!--header-->

				<div class="modal-body">
					<div class="row">
						<div class="col-md-12 d-flex justify-content-center">
							<div class="mailbox-controls">
								<div class="" style="display: inline-block;">
									<input type="radio" id="radio-one" name="notaswitch" value="승인" onclick="radioCheck(this)"/>
									<label for="radio-one" style="margin: 0;">승인</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="radio-two" name="notaswitch" value="반려" onclick="radioCheck(this)"/>
									<label for="radio-two" style="margin: 0;">반려</label>
								</div>
							</div>
							<!--mailbox-controls-->
						</div>
					</div>
					<!--row-->
					<div class="input-group input-group-sm">
						<textarea class="form-control apv-process-modal-content" rows="8" style="resize: none; margin-top: 8px;" placeholder="사유입력"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary" onclick="confirm_go()">결재</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 결재인증 모달 -->
	<div class="modal" id="confirm-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>결재처리</h3>
				</div>
				<!--header-->
				<div class="modal-body" style="margin: auto;">
						<div class="col-sm-12">
							<label>${certify.apvCertify ne 'O' ? '결재 비밀번호를 입력해주세요.' : 'OTP인증 번호를 입력해주세요.'}</label>
						</div>
						<div class="col-sm-12">
							<div class="form-group row">
								<div>
									<input type="text" name="code" class="form-control form-control-md" maxlength="6" onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
								</div>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-info btn-sm"  ${certify.apvCertify ne 'O' ? 'onclick="confirmPwd();"' : 'onclick="confirmOtp();"'}>확인</button>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 파일 모달 -->
	<div class="modal" id="file-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>첨부파일</h3>
				</div>
				<!--header-->
				<div class="modal-body" style="margin: auto;">
					<c:forEach items="${approval.attachList}" var="attach">
						<p>
							<a class="mailbox-attachment-name"  href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}"  >
							<i class="fas fa-paperclip"></i>${attach.attachSavename}&nbsp;&nbsp;
							</a>
						</p>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 합의 모달 -->
	<div class="modal" id="hab-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>합의</h3>
				</div>
				<!--header-->

				<div class="modal-body">
					<div class="row">
						<div class="col-md-12 d-flex justify-content-center">
							<div class="mailbox-controls">
								<div class="" style="display: inline-block;">
									<input type="radio" id="radio-one" name="notaswitch" value="합의승인" onclick="radioCheck(this)"/>
									<label for="radio-one" style="margin: 0;">승인</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="radio-two" name="notaswitch" value="합의미승인" onclick="radioCheck(this)"/>
									<label for="radio-two" style="margin: 0;">미승인</label>
								</div>
							</div>
							<!--mailbox-controls-->
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary" onclick="confirm_go()">확인</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	window.onload = function(){
		var apvway;

		/* $('input').prop('readonly',true); */
		$('.apv-input').prop('disabled',true);
		$('.apv-textarea').prop('disabled',true);
		$('.apv-process-modal-content').prop('disabled',true);

		let textareaNode = document.querySelectorAll('.apv-textarea');
		if(textareaNode != null){
			textareaNode.forEach(input=>{
				if(textareaNode == null){
					input.value = "";
				}else{
					text = input.getAttribute('data-textarea');
					input.value = text;
				}
			})
		};

		$('#apvMarkupDiv').ready(function() {
        	$('input[name="approvalCode"]').attr('value',"${approval.apvCode}");
		});




	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	/* 결재 순서 */
	var order = '${apvLineOrder}';

	/* 결재도장 */
	console.log("순서 가져오니 : " + order);
	var fsign = 'f_apline_sign_';
	var hsign = 'h_apline_sign_';

	var Ystamp = "<img style='width: 40px;height: 40px;' alt='stamp.png' src='<%=request.getContextPath() %>/resources/images/전결승인도장.jpg'>";
	var Nstamp = "<img style='width: 40px;height: 40px;' alt='stamp.png' src='<%=request.getContextPath() %>/resources/images/미승인.jpg'>";

	/* 결재선 클래스 순서 */
	var fsigning = fsign + (order-1);
	var hsigning = hsign + (order-1);

	/* 반려사유 */
	var apvRefuseValue;

	/* 마크업 */
	var apvMarkup;

	/* 결재승인여부 */
	var apvConfirm;

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ



	function radioCheck(radio) {

		document.querySelectorAll('input[name=notaswitch]').forEach(r=>{
			if(r.getAttribute("checked")){
				r.setAttribute("checked",false);
			}
		})
		radio.setAttribute("checked",true);

		apvway = radio.getAttribute("value");
		//console.log("처리방식 가져오니이 : " + apvway)

		//반려사유 textarea 변경
		$("input:radio[name=notaswitch]").click(function(){
	        if(apvway=='승인'){
	        	$('.apv-process-modal-content').val('');
	        	$('.apv-process-modal-content').prop('disabled',true);
	        }else if(apvway=='반려'){
	        	$('.apv-process-modal-content').prop('disabled',false);
	        }
	    });

		if(apvway == '승인'){
			apvConfirm = 'A';
		}else if(apvway == '반려'){
			apvConfirm = 'R';
		}else if(apvway == '합의승인'){
			apvConfirm = 'Y';
		}else if(apvway == '합의미승인'){
			apvConfirm = 'N';
		}else{
			apvConfirm = 'U';
		}
		//console.log("결재승인여부 설정 잘됐니!: " + apvConfirm);

	}


	function confirm_go() {
		$('#approval-modal').modal('hide');
		$('#hab-modal').modal('hide');
		$('#confirm-modal').modal('show');
	}

	function fn_press(event, type) {
		if(type == "numbers"){
			if(event.keyCode < 48 ||event.keyCode > 57) return false;
		}
	}

	function fn_press_han(obj) {
		if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46) return;
		obj.value = obj.value.replace(/[\ㄱ-ㅎ ㅏ-ㅣ 가-힣]/g,'');
	}




	function confirmOtp() {

		var code = $('input[name="code"]').val();

		$.ajax({
			url : '<%=request.getContextPath()%>/approval/confirmOtp?empCode=${loginUser.empCode}' ,
			type : 'post',
			data :{'code' : code},
			dataType : 'text',
			success : function(abc) {


				if(apvConfirm == 'A'){
					$('#'+fsigning).html(Ystamp);
				}else if(apvConfirm == 'Y'){
					$('#'+hsigning).html(Ystamp);
				}else if(apvConfirm == 'R'){
					$('#'+fsigning).html(Nstamp);
				}else if(apvConfirm == 'N'){
					$('#'+fsigning).html(Nstamp);
				}

				apvMarkup = document.querySelector('.apvMarkupDiv').innerHTML;
				//apvRefuseValue = document.querySelector('.apv-process-modal-content').getAttribute("value");
				apvRefuseValue = $('.apv-process-modal-content').val()
				console.log("반려사유 가져오닝 : " + apvRefuseValue);

				let data = {
								"empCode"      : '${loginUser.empCode}',
								"apvCode"      : '${approval.apvCode}',
								"apvRefuse"    : apvRefuseValue,
								"apvMarkup"    : apvMarkup,
								"apvConfirm"   : apvConfirm,
								"apvLineOrder" : order
							}

				console.log("------------------------------");
				console.log("empCode : " + '${loginUser.empCode}');
				console.log("apvCode : " + '${approval.apvCode}');
				console.log("apvRefuse : " + apvRefuseValue);
				console.log("apvMarkup : " + apvMarkup);
				console.log("apvConfirm : " + apvConfirm);
				console.log("apvLineOrder : " + order);
				console.log("------------------------------");


				$.ajax({
					url : "<%=request.getContextPath()%>/approval/modifyForApvProcessing",
					type : "post",
					data : JSON.stringify(data),
					dataType : 'text',
					contentType : 'application/json',
					success : function(msg) {
							alert(msg);
							CloseWindow();
					},
					error : function(xhr) {
						alert("에러다 에러 삐용삐용");
					}

				});


			},
			error : function(e) {
				alert("인증에 실패하였습니다.");
			}
		})
	}

	function confirmPwd() {

		var pwd = $('input[name="code"]').val();

		$.ajax({
			url : '<%=request.getContextPath()%>/approval/confirmPwd?empCode=${loginUser.empCode}',
			type : 'post',
			data : {'pwd' : pwd},
			dataType : 'text',
			success : function(abc) {

				if(apvConfirm == 'A'){
					$('#'+fsigning).html(Ystamp);
				}else if(apvConfirm == 'Y'){
					$('#'+hsigning).html(Ystamp);
				}else if(apvConfirm == 'R'){
					$('#'+fsigning).html(Nstamp);
				}else if(apvConfirm == 'N'){
					$('#'+fsigning).html(Nstamp);
				}

				apvMarkup = document.querySelector('.apvMarkupDiv').innerHTML;
				//apvRefuseValue = document.querySelector('.apv-process-modal-content').getAttribute("value");
				apvRefuseValue = $('.apv-process-modal-content').val()
				console.log("반려사유 가져오닝 : " + apvRefuseValue);

				let data = {
								"empCode"      : '${loginUser.empCode}',
								"apvCode"      : '${approval.apvCode}',
								"apvRefuse"    : apvRefuseValue,
								"apvMarkup"    : apvMarkup,
								"apvConfirm"   : apvConfirm,
								"apvLineOrder" : order
							}

				console.log("------------------------------");
				console.log("empCode : " + '${loginUser.empCode}');
				console.log("apvCode : " + '${approval.apvCode}');
				console.log("apvRefuse : " + apvRefuseValue);
				console.log("apvMarkup : " + apvMarkup);
				console.log("apvConfirm : " + apvConfirm);
				console.log("apvLineOrder : " + order);
				console.log("------------------------------");


				$.ajax({
					url : "<%=request.getContextPath()%>/approval/modifyForApvProcessing",
					type : "post",
					data : JSON.stringify(data),
					dataType : 'text',
					contentType : 'application/json',
					success : function(msg) {
							alert(msg);
							CloseWindow();
					},
					error : function(xhr) {
						alert("에러다 에러 삐용삐용");
					}

				});



			},
			error : function(e) {
				alert("인증에 실패하였습니다.");
			}
		})
	}

	// 한글 입력 방지
	function fn_press(event, type) {
		if(type == "numbers"){
			if(event.keyCode < 48 ||event.keyCode > 57) return false;
		}
	}

	// 한글 입력 방지
	function fn_press_han(obj) {
		if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46) return;
		obj.value = obj.value.replace(/[\ㄱ-ㅎ ㅏ-ㅣ 가-힣]/g,'');
	}


	</script>

</body>
