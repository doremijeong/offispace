<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사원 등록 </title>

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
						<h1>사원등록 </h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">admin</a></li>
							<li class="breadcrumb-item active">Register Employee</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">

			<form role="form" name="registerEmployee" action="registerEmployee" method="post">
				<input type="hidden" name="empPicture" />

                <div class="card-body row">
	                <div class="col-lg-6 border-right">
    		            <div class="form-group">
            			    <label>사진</label>
		                  	<input type="hidden" name="picture" />
							<div class="form-group">
								<div class="clearfix" style="text-align: center;">
									<div class="has-img" id="pictureView" style="border: 1px solid lightgray; height: 200px; width: 140px; margin:0 auto 15px auto;"></div>
									<div class="">
										<div class="input-group input-group-sm">
											<label for="inputFile" class=" btn btn-outline-info btn-sm btn-flat input-group-addon">사진선택</label>
											<input id="inputFileName" class="form-control" type="text" name="tempPicture" readonly/>
											<span class="input-group-append-sm">
												<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>
											</span>
										</div>
									</div>
								</div>
						  	</div>
		      			</div>
	                  	<div class="form-group">
	                    	<label for="inputName">이름 </label>
	                    	<input type="text" class="form-control" name="empName" id="inpuName" placeholder="이름을 입력하세요. ">
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="inputReginum">주민등록번호 </label>
	                   	 	<input type="number" class="form-control" name="empReginum" id="inputReginum" placeholder="주민등록번호 13자리를 입력하세요 ">
	                  	</div>
					  	<div class="form-group">
	                    	<label for="inputHireDate">입사일 </label>
	                    	<input type="date" class="form-control" name="empHireDt" id="inputHireDate" placeholder="입사일을 입력하세요 ">
	                  	</div>
	               	</div><!-- col-lg-6 left -->

	               	<div class="col-lg-6">
	               	<div style="margin-top:45px;"></div>
	                  	<div class="form-group">
	                  		<label for="inputHeadOffice">본부   </label>
	                    	<select name="headOfficeCode" class="custom-select rounded-0" id="inputHeadOffice" onchange="getGroupListInHeadOffice(this);">
	                    		<option disabled="disabled" selected="selected" hidden="">본부를 선택하세요.</option>
								<c:forEach var="item" items="${headOfficeList}">
									<option value="${item.comCode }">${item.comCode1}</option>
								</c:forEach>
	                  		</select>
	                  	</div>
		                <div class="form-group">
		                	<label for="inputGroup">그룹  </label>
		                    <select name="groupCode" class="custom-select rounded-0" id="inputGroup" onchange="getTeamListInGroup(this);">
		                    <option disabled="disabled" selected="selected" hidden="">그룹을 선택하세요.</option>
		                  	</select>
		                </div>
	                  	<div class="form-group">
	                    	<label for="inputTeam">팀</label>
	                    	<select name="TeamCode" class="custom-select rounded-0" id="inputTeam">
	                    	<option disabled="disabled" selected="selected" hidden="">팀을 선택하세요.</option>
	                  		</select>
	                  	</div>
	                 	<div class="form-group">
	                    	<label for="inputPosition">직급  </label>
	                    	<select name="positionCode" class="custom-select rounded-0" id="inputPosition">
	                    	<option disabled="disabled" selected="selected" hidden="">직급을 선택하세요.</option>
								<c:forEach var="item" items="${positionList}">
									<option value="${item.comCode }">${item.comCode1}</option>
								</c:forEach>
	                  		</select>
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="inputCharge">직책   </label>
	                    	<select name="chargeCode"class="custom-select rounded-0" id="inputCharge">
	                    	<option disabled="disabled" selected="selected" hidden="">직책을 선택하세요.</option>
								<c:forEach var="item" items="${chargeList}">
									<option value="${item.comCode }">${item.comCode1}</option>
								</c:forEach>
	                  		</select>
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="inputAuthority">권한   </label>
	                    	<select name="authorityCode"class="custom-select rounded-0" id="inputAuthority">
	                    	<option disabled="disabled" selected="selected" hidden="">권한을 선택하세요.</option>
								<c:forEach var="item" items="${authorityList}">
									<option value="${item.comCode }">${item.comCode1}</option>
								</c:forEach>
	                  		</select>
	                  	</div>
               		</div><!--col-lg-6 right  -->
	        	</div><!-- card-body -->
                <div class="card-footer">
                	<button type="button" onclick="register_go();" class="btn btn-primary">등록</button>
                </div>
           	</form>


           	<form role="imageForm" action="">
			  	<input type="file"   name="pictureFile" id="inputFile" class="form-control" onchange="picture_go();" style="display:none;"/>
				<input type="hidden" name="oldPicture"  id="oldFile" value=""/>
				<input type="hidden" name="checkUpload" value="0" />
	  		</form>

		</section>
	</div>

<script>

var formData="";

function picture_go(){

	formData=new FormData($('form[role="imageForm"]')[0]);
	var form=$('form[role="imageForm"]'); //picture를 위한 jquery
	var picture=form.find('[name="pictureFile"]')[0];
//	var picture=$('form[role="imageForm"] input[name="pictureFile"]')[0]; //완전체

	var fileFormat=picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();

// 	if(!(fileFormat=="JPG"||fileFormat=="JPEG"))
// 	{
// 		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
// 		picture.value="";
// 		return;
// 	};

	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1)
	{
		alert("사진 용량은 1MB 이하만 가능합니다.");
		picture.value="";
		return;
	};

	//업로드 확인변수 초기화(사진변경)
	form.find('[name="checkUpload"]').val(0);

	document.getElementById('inputFileName').value=picture.files[0].name;

	if(picture.files&&picture.files[0]) //리스트, 객체.(metadata)
	{
		var reader=new FileReader();
		reader.onload=function(e){
			$('div#pictureView').css({
				'background-image':'url('+e.target.result+')',
				'background-position':'center',
				'background-size':'cover', //'container'
				'background-repeat':'no-repeat'
			});
		}
		reader.readAsDataURL(picture.files[0]);
	}
}


function upload_go()
{
	//if($('input[name="pictureFile"]').val()=="")
	if(!$('input[name="pictureFile"]').val())
	{
		alert("사진을 선택하세요.");
		$('input[name="pictureFile"]').click();
		return;
	};

	if($('input[name="checkUpload"]').val()==1)
	{
		alert("이미 업로드 된 사진입니다.");
		return;
	}

	$.ajax({
		url:'picture.do',
		data:formData,
		type:'post',
		processData:false,
		contentType:false,
		success:function(data){
			//data는 로컬 폴더에 저장된 uuid$$fileName.

			//업로드했음을 알려주는 상태값 1 넣어준다.
			$('input[name="checkUpload"]').val(1);

			//저장된 파일명 저장.
			$('input#oldFile').val(data); //변경시 삭제될 파일명
			$('form[role="form"] input[name="empPicture"]').val(data);
			alert("사진이 업로드 되었습니다.");
		},
		error:function(error){
			alert("현재 사진 업로드가 불가합니다. \n관리자에게 연락바랍니다.");
			//AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}


function register_go(){

	if($('input[name="checkUpload"]').val()=="0"){
		alert("사진 업로드는 필수 입니다.");
		return;
	}
	if($('input[name="empName"]').val()==""){
		alert("이름 입력은 필수 입니다.");
		return;
	}
	/* 숫자 및 영문, 자음 사용 금지 구문 */
	for (var i=0; i<$('input[name="empName"]').val().length; i++)  {
	    var chk = $('input[name="empName"]').val().substring(i,i+1);
	    if(chk.match(/[0-9]|[a-z]|[A-Z]/)) {
	    	alert("이름을 정확히 입력해주세요");
	        return;
	    }

	    if(chk.match(/([^가-힣\x20])/i)){
	    	alert("이름을 정확히 입력해주세요");
	        return;
	    }
	}
	if($('input[name="empReginum"]').val()==""){
		alert("주민등록번호 입력은 필수 입니다.");
		return;
	}
    if($('input[name="empReginum"]').val().length != 13){
        alert("올바른 주민등록 번호를 입력하여 주세요.");
        return;
    }
	if($('input[name="empHireDt"]').val()=="" || $('input[name="empHireDt"]').val()== null){
		alert("입사일 입력은 필수 입니다.");
		return;
	}

	let newForm = document.querySelector('form[name="registerEmployee"]');

	event.preventDefault();

	  const formData = new URLSearchParams(new FormData(newForm));

	fetch('registerEmployee',{
		method:'POST',
		headers:{},
		body: formData,
	})
	.then(data =>{
		console.log('Success:', data);
		alert("회원등록에 성공하였습니다.");
		if(confirm('회원등록을 계속 하시겠습니까?')){
			window.location.reload();
		}else{
			window.close();
		}
	})
	.catch(error=>{
		console.log("Error:", error);
		alert("회원등록에 실패하였습니다.");
	});

}


function getCommonCodeListToRegister(searchType,  keyword) {
	return new Promise(resolve => {
		fetch('<%=request.getContextPath()%>/common/getCommonCodeList/' + searchType + '/' + keyword)
			.then(response => response.json())
			.then(data => {
				resolve(data);
			});
	})
}

function getGroupListInHeadOffice(headOfficeSelector) {
	let searchType = 'groupInHeadOffice';
	let keyword = headOfficeSelector.value;

	let target = document.querySelector('#inputGroup');
	let templateObject = $('#optionInCommonCodeSelector')

	getCommonCodeListToRegister(searchType, keyword).then(data => {
		console.log(data);
		printOptionInCommonCodeSelector(data,target,templateObject)
	});
}

function getTeamListInGroup(groupSelector) {
	let searchType = 'teamInGroup';
	let keyword = groupSelector.value;

	let target = document.querySelector('#inputTeam');
	let templateObject = $('#optionInCommonCodeSelector')

	getCommonCodeListToRegister(searchType, keyword).then(data => {
		console.log(data);
		printOptionInCommonCodeSelector(data,target,templateObject)
	});
}

function printOptionInCommonCodeSelector(data, target, templateObject){

	Handlebars.registerHelper("word",function(comCodeGr){
		if (comCodeGr == 'D2'){
			return "그룹을";
		}else if(comCodeGr == 'D3'){
			return "팀을";
		}else{
			return "";
		}

	})

	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	let options = target.querySelectorAll('option')
	options.forEach( option =>{
		option.remove();
	})
	$(target).append(html)

}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="optionInCommonCodeSelector" type="text/x-handlebars-template">
	{{#each .}}
		{{#if @first}}
   		 <option disabled="disabled" selected="selected" hidden=""> {{word comCodeGr}} 선택하세요.</option>
   		 {{/if}}
		 <option value="{{comCode}}">{{comCode1}}</option>
	{{/each}}

</script>






	<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<!-- Summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js?ver=234234"></script>

</body>
</html>