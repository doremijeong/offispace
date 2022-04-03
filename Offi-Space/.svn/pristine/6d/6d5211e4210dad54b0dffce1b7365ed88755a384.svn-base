<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
</head>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<h5>전자결재 설정</h5>
						</div>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">전자결재</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<div class="card" style="height: 680px;">
							<div class="card-header">
								<div class="row d-flex justify-content-between">
									<div>
										<h6 style="font-size: 1.05em; margin-bottom: 0px; margin-left:5px; line-height: 31px;">대결자 지정</h6>
									</div>
									<div class="">
										<button class="btn btn-info btn-sm" onclick="saveAgency()">저장</button>
									</div>
								</div>
							</div>
							<div class="card-body" style="font-size: 0.9em;">
								<input type="hidden" name="empCode" id="empCode" value="${loginUser.empCode}">
								<div class="form-group row">
									<label for="scdTitle" class="col-md-2 col-form-label">사유</label>
									<div class="col-md-9">
										<input type="text" class="form-control form-control-md" id="reason">
									</div>
								</div>
								<div class="form-group row">
									<label for="scdTitle" class="col-md-2 col-form-label">대결자</label>
									<div class="col-md-9 input-group">
										<input type="text" class="form-control form-control-md" id="zozicdo" readonly="readonly">
										<button type="button" class="btn btn-info btn-sm" onclick="zozicdo()">선택</button>
									</div>
								</div>

								<div class="form-group row">
									<label for="scdStartDt" class="col-md-2 col-form-label">시작일</label>
									<div class="col-md-9">
										<input type="date" id="start" class="form-control form-control-md">
									</div>
								</div>


								<div class="form-group row">
									<label for="scdEndDt" class="col-md-2 col-form-label">종료일</label>
									<div class="col-md-9">
										<input type="date" id="end" class="form-control form-control-md">
									</div>
								</div>

								<hr />

								<div style="border: 1px solid lightgray; height: 60%; border-radius: 5px;">
									<table class="table table-sm">
										<tr class="text-center" style="font-size: 0.9em;">
											<th>기간</th>
											<th>사유</th>
											<th>대결자</th>
										</tr>
										<c:forEach items="${agencyList}" var="agency">
											<tr  style="font-size: 0.85em;">
												<td class="text-center">
													<fmt:formatDate value="${agency.agenStartDt}" pattern="YYYY-MM-dd(E)"/>&nbsp;~&nbsp;<fmt:formatDate value="${agency.agenEndDt}" pattern="YYYY-MM-dd(E)"/>
												</td>
												<td>
													${agency.agenReason}
												</td>
												<td class="text-center">
													${agency.toEmp.empName}&nbsp;${agency.toEmp.positionValue}(${agency.toEmp.teamValue})
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="column">

							<div class="col-lg-12">
								<div class="card" style="height: 290px;">
									<div class="card-header">
										<h6 style="font-size: 1.05em; margin-bottom: 0px; margin-left:5px; line-height: 31px;">결재 인증</h6>
									</div>
									<div class="card-body">
										<div class="col-sm-12 row">
											<div class="col-sm-4" style="padding-top: 5px;">
												<b style="font-size: 0.9em;">인증 방법</b>
											</div>
											<div class="col-sm-8">
												<div class="form-group clearfix d-flex justify-content-between">
													<div class="icheck-info d-inline">
														<input type="radio" name="r3" ${certify.apvCertify eq 'P' ? 'checked' : ''} id="radioSuccess1" onclick="changeApvCertify('P')">
														<label for="radioSuccess1"><b style="font-size: 0.9em;">비밀번호</b></label>
													</div>
													<div class="icheck-info d-inline">
														<input type="radio" name="r3" ${certify.apvCertify eq 'O' ? 'checked' : ''} id="radioSuccess2" onclick="changeApvCertify('O')">
														<label for="radioSuccess2"><b style="font-size: 0.9em;">Google OTP</b></label>
													</div>
												</div>
											</div>
										</div>
										<hr style="margin: 0px 0px 15px 0px;">
										<div class="col-sm-12 row p-0">
											<div class="col-sm-4" style="padding-top: 5px;">
												<b style="font-size: 0.9em;margin-left: 7px;">결재 비밀번호</b>
											</div>
											<div class="col-sm-8">
												<div class="form-group row">
													<div>
														<input type="password" style="width: 170px;" placeholder="${!empty certify.apvPassword ? '비밀번호 수정' : '비밀번호 등록'}" name="apvPassword" class="form-control form-control-md" maxlength="6" onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode: disabled;">
													</div>
													&nbsp;&nbsp;
													<button type="button" id="pwdRegi" class="btn btn-info btn-sm" onclick="apvPwd_go();">등록</button>
													&nbsp;&nbsp;
													<button type="button" id="pwdUpdate" class="btn btn-warning btn-sm" onclick="apvPwd_Again();">재등록</button>
												</div>
											</div>
										</div>
										<hr style="margin: 0px 0px 15px 0px;">
										<div class="col-sm-12 row  p-0">
											<div class="col-sm-4" style="padding-top: 5px;">
												<b style="font-size: 0.9em;margin-left: 7px;">Google OTP</b>
											</div>
											<div class="col-sm-8">
												<div class="form-group row">
													<div>
														<input type="text" style="width: 170px; font-size: 0.8em;" value="${certify.otpKey}" name="otpKey" class="form-control form-control-md" disabled="disabled" id="encodedKey">
													</div>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-info btn-sm" id="otpRegi" onclick="otp_go();">발급</button>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-warning btn-sm" id="otpUpdate" onclick="otpAgin();">재발급</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="card" style="height: 374px;">
									<div class="card-header">
										<div class="row">
											<div class="col-md-6">
												<h6 style="font-size: 1.05em; margin-bottom: 0px; margin-left:5px; line-height: 31px;">자주쓰는 결재선</h6>
											</div>
											<div class="col-md-6">
												<div class="d-flex justify-content-end">
													<button type="button" class="btn btn-info btn-sm" onclick="open_line_set()">추가</button>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-danger btn-sm" onclick="deleteJApvLine()">삭제</button>
												</div>
											</div>
										</div>
									</div>

									<div class="card-body">
										<!-- 자주 쓰는 결재선 테이블 목록 가져오기 삭제와 등록 버튼 두기 -->
										<div class="col-md-12" style="padding: 0px;">
											<select class="form-control" name="jApvLines" onchange="jApvLine()" style="font-size: 14px; padding-left: 5px; width: 100%; height: 35px;">
												<option>선택하세요.</option>
												<c:if test="${!empty jApvLineList}">
													<c:forEach items="${jApvLineList}" var="jApvLine">
														<option value="${jApvLine.jApvLineCode}">${jApvLine.jApvLineName}</option>
													</c:forEach>
												</c:if>
											</select>
										</div>
										<div id="jApvLineDiv" class="col-md-12" style="padding: 1px; border: 1px solid lightgray; margin: auto; margin-top:10px; height: 230px; border-radius: 5px;"></div>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
		</section>
	</div>
	<script>

window.onload = function() {

	if('${certify.apvPassword}'){
		$('#pwdRegi').attr('disabled', true);
		$('#pwdUpdate').attr('disabled', false);
	}else{
		$('#pwdUpdate').attr('disabled', true);
		$('#pwdRegi').attr('disabled', false);
	}

	if('${certify.otpKey}'){
		$('#otpRegi').attr('disabled', true);
		$('#otpUpdate').attr('disabled', false);
	}else{
		$('#otpUpdate').attr('disabled', true);
		$('#otpRegi').attr('disabled', false);
	}
}

	function otp_go() {
		$.ajax({
			url : "<%=request.getContextPath()%>/approval/makeOtp.do",
			type : 'get',
			contentType : 'application/json',
			dataType : 'json',
			success : function(abc) {
				$('#encodedKey').val(abc.encodedKey);
				OpenWindow(abc.QrUrl,'','500','500');
			},
			error : function(e) {
				alert(e.message);
			}
		})
	}

	function otpAgin() {
		$.ajax({
			url : "<%=request.getContextPath()%>/approval/remakeOtp.do",
			type : 'get',
			contentType : 'application/json',
			dataType : 'json',
			success : function(abc) {
				$('#encodedKey').val(abc.encodedKey);
				OpenWindow(abc.QrUrl,'','500','500');
			},
			error : function(e) {
				alert(e.message);
			}
		})
	}

	function apvPwd_go() {

		pwd = $('input[name="apvPassword"]').val();

		$.ajax({
			url : "<%=request.getContextPath()%>/approval/makeApvPwd.do?pwd=" + pwd,
			type : 'get',
			contentType : 'application/json',
			dataType : 'json',
			success : function(abc) {
				$('input[name="apvPassword"]').val(abc);
				//alert("결재 비밀번호가 설정되었습니다.")
				callCustomAlert('결재 비밀번호가 설정되었습니다.','','success');
			},
			error : function(e) {
				alert(e.message);
			}
		})
	}

	function apvPwd_Again() {

		pwd = $('input[name="apvPassword"]').val();

		$.ajax({
			url : "<%=request.getContextPath()%>/approval/remakeApvPwd.do?pwd=" + pwd,
			type : 'get',
			contentType : 'application/json',
			dataType : 'json',
			success : function(abc) {
				$('input[name="apvPassword"]').val(abc);
				//alert("결재 비밀번호가 재설정되었습니다.")
				callCustomAlert('결재 비밀번호가 재설정되었습니다.','','success');
			},
			error : function(e) {
				alert(e.message);
			}
		})
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

	function changeApvCertify(apvCertify) {

		$.ajax({
			url : "<%=request.getContextPath()%>/approval/changeApvCertify.do?apvCertify=" + apvCertify,
			type : 'get',
			contentType : 'application/json',
			dataType : 'text',
			success : function(abc) {

				if(abc == 'P'){
					//alert("비밀번호로 결재방법이 설정되었습니다.")
					callCustomAlert('비밀번호로 결재방법이 설정되었습니다.','','success');
				}

				if(abc == 'O'){
					//alert("OTP로 결재방법이 설정되었습니다.")
					callCustomAlert('OTP로 결재방법이 설정되었습니다.','','success');
				}

				if(abc == 'P'){
					$('#P').attr('checked', true);
					$('#O').attr('checked', false);
				}

				if(abc == 'O'){
					$('#O').attr('checked', true);
					$('#P').attr('checked', false);
				}


			},
			error : function(e) {

			}
		})
	}

	function jApvLine() {
		var jApvCode = $("select[name=jApvLines] option:selected").val();
		$.ajax({
			url : '<%=request.getContextPath()%>/approval/getJApvLine?jApvLineCode=' + jApvCode,
			dataType : 'json',
			success : function(data) {
				printOptionInCommonCodeSelector(data, $('#jApvLineDiv'), $('#jApvLineShow'))
			},
			error : function() {
				alert("에러발생")
			}
		})
	}

	function printOptionInCommonCodeSelector(data, target, templateObject){

		Handlebars.registerHelper("word",function(jApvLineInfoKind){
			if (jApvLineInfoKind == 'AK0001'){
				return "결재";
			}else if(jApvLineInfoKind == 'AK0002'){
				return "합의";
			}else if(jApvLineInfoKind == 'AK0003'){
				return "참조";
			}else{
				return "";
			}

		})

		let template = Handlebars.compile(templateObject.html());
		let html = template(data);
		$('#jApvLineDiv').empty();
		$(target).append(html);
	}

	function deleteJApvLine() {
		var jApvCode = $("select[name=jApvLines] option:selected").val();
		$.ajax({
			url : '<%=request.getContextPath()%>/approval/removeJApvLine?jApvLineCode=' + jApvCode,
			success : function() {
				//alert("삭제에 성공했습니다.");
				callCustomAlert('삭제에 성공했습니다.','','success');
				location.reload();
			},
			error : function() {
				alert("삭제에 실패하였습니다.");
			}
		})
	}

	 // 결재선 지정
    function open_line_set(){
    	OpenWindow('<%=request.getContextPath()%>/approval/approvalLineSetForSetting', '', '900', '615');
    }

	function zozicdo() {
		OpenWindow('<%=request.getContextPath()%>/approval/zozicdo', '', '445', '575');
	}

	function saveAgency() {
		var agenReason = $('#reason').val();
		var agenStartDt = $('#start').val();
		var agenEndDt = $('#end').val();
		var giveEmpCode = $('input[name="giveEmpCode"]').val();
		var empCode = $('#empCode').val();

		let data = {
				"agenReason"     : agenReason,
				"agenStartDt"    : agenStartDt,
				"agenEndDt"      : agenEndDt,
				"giveEmpCode"    : giveEmpCode,
				"empCode"   	 : empCode
			}

		$.ajax({
			url : "<%=request.getContextPath()%>/approval/saveAgency.do",
			type : "post",
			data : JSON.stringify(data),
			dataType : 'text',
			contentType : 'application/json',
			success : function(msg) {
					//alert(msg);

					Swal.fire({
					  title: msg,
					  //text: text,
					  icon: 'success',
					  //showCancelButton: true,
					  confirmButtonText: '확인',
					 // cancelButtonText: '취소',
					  reverseButtons: true
					})
					.then((result) => {
						if (result.isConfirmed) {
							location.reload();
						} else if ( result.dismiss === Swal.DismissReason.cancel) {
							callCancel(canTitle,canText);
					 	}
					});

			},
			error : function(xhr) {
			}

		});
	}

</script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script id="jApvLineShow" type="text/x-handlebars-template">
	<ol>
	{{#each .}}
		<li>{{word jApvLineInfoKind}}&nbsp;&nbsp;&nbsp;{{emp.empName}}&nbsp;&nbsp;&nbsp;{{emp.positionValue}}/{{emp.chargeValue}}/{{emp.teamValue}}</li>
	{{/each}}
	</ol>

</script>

</body>
