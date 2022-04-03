<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
.mailTitle {
	width: 250px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
table{
	font-size: 0.8em;
}
</style>
</head>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<div class="row">
							<h5>사내메일함</h5>
						</div>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">사내메일함</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="container-fluid">
				<div class="col-md-12 p-2"></div>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-success">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center">
									<a href="<%=request.getContextPath() %>/mail/list?kindOfMail=recieved" style="color: white;">
										<h3 style="margin: 0px;" id="mailCnt"></h3>
									</a>
								</span>
								<span class="info-box-text text-center text-bold">받은 메일 수 </span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-danger">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center">
									<a href="<%=request.getContextPath() %>/mail/list?kindOfMail=notRead" style="color: white;">
										<h3 style="margin: 0px;"  id="mailNotCnt"></h3>
									</a>
								</span>
								<span class="info-box-text text-center text-bold"> 안읽은 메일 수 </span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-warning">
							<!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

							<div class="info-box-content">
								<span class="info-box-number text-center">
									<a href="<%=request.getContextPath() %>/mail/list?kindOfMail=import" style="color: white;">
										<h3 style="margin: 0px;" id="importCnt"></h3>
									</a>
								</span>
								<span class="info-box-text text-center text-bold" style="color: white;"> 중요 메일 수 </span>

							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

<!-- 					<div class="col-md-3 col-sm-6 col-12"> -->
<!-- 						<div class="info-box bg-info"> -->
<!-- 							<span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
<!-- 							<a href="#" style="color: white;"> -->
<!-- 								<div class="info-box-content"> -->
<!-- 									<span class="info-box-text text-center text-bold" onclick="writeMail()"> 메일쓰기 </span> -->
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 						</div> /.info-box-content -->
<!-- 					</div> /.info-box -->

					<div class="col-md-3 col-sm-6 col-12">
						<div class="info-box bg-info">
							<div class="info-box-content">
								<span class="info-box-number text-center">
									<h3 style="margin: 3px;">
										<i class="fas fa-edit" onclick="writeMail()" style="cursor: pointer;"></i>
									</h3>
								</span>
								<span class="info-box-text text-center text-bold" onclick="writeMail()" style="cursor: pointer;"> 메일쓰기 </span>
							</div> <!-- /.info-box-content -->
						</div> <!-- /.info-box -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="card" style="height: 230px;">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h5 class="card-title">받은 메일함</h5>
								<div>
									<a href="javascript:recievedList('prev');" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                                    <a href="javascript:recievedList('next');" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
									&nbsp;&nbsp;
									<a href="javascript:recievedList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/mail/list.do?kindOfMail=recieved">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-sm" id="recieved">

							</table>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card" style="height: 230px;">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h5 class="card-title">내게쓴 메일함</h5>
								<div>
									<a href="javascript:toMeList('prev');" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                                    <a href="javascript:toMeList('next');" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
									&nbsp;&nbsp;
									<a href="javascript:toMeList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/mail/list.do?kindOfMail=sendToMe">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-sm" id="toMe">

							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card" style="height: 230px;">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h5 class="card-title">임시보관함</h5>
								<div>
									<a href="javascript:tempList('prev');" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                                    <a href="javascript:tempList('next');" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
									&nbsp;&nbsp;
									<a href="javascript:tempList();">
										<i class="fas fa-sync-alt refresh text-secondary" ></i>
									</a>
									&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/mail/list.do?kindOfMail=temporary">
										<i class="fas fa-plus plus text-secondary"> </i>
									</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-sm" id="temp">

							</table>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card" style="height: 230px;">
						<div class="card-header border-0">
							<div class="d-flex justify-content-between">
								<h5 class="card-title">휴지통</h5>
								<div>
									<a href="javascript:trashList('prev');" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                                    <a href="javascript:trashList('next');" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
									&nbsp;&nbsp;
									<a href="javascript:trashList();">
										<i class="fas fa-sync-alt text-secondary"></i>
									</a>
									&nbsp;&nbsp;
									<a href="<%=request.getContextPath()%>/mail/list.do?kindOfMail=trash">
										<i class="fas fa-plus text-secondary"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-sm" id="trash">

							</table>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>
	</div>
<script>
function writeMail() {
	location.href = "<%=request.getContextPath()%>/mail/writeForm.do";

}

window.onload = function() {
	mailCount();
	recievedList();
	toMeList();
	tempList();
	trashList();
}

function mailCount() {
	$.ajax({
		url : '<%=request.getContextPath()%>/mail/mainCnt.do',
		dataType : 'json',
		method : 'get',
		success : function(result) {
			$('#mailCnt').text(result.recievedMailCnt);
			$('#mailNotCnt').text(result.recievedNotReadCnt);
			$('#importCnt').text(result.importMailCnt);
		},
		error: function(msg) {
		}
	})
}
recievedListPage = 1;
function recievedList(type) {

	if(!type){
		page = 1;
	}

	if(type == "next"){
		page = recievedListPage + 1;
	}
	if(type == "prev"){
		if(recievedListPage != 0){
			page = recievedListPage - 1;
		}else{
			return false;
		}
	}

	loaderShow();

	$.ajax({
		url : '<%=request.getContextPath()%>/mail/main/list?kindOfMail=recieved&perPageNum=5&page=' + page,
		dataType : 'json',
		method : 'get',
		success : function(result) {
			printRecievedList(result,$('#recieved'),$('#recievedForm'))
			loaderHide();
		},
		error: function(msg) {
		}
	})
}

toMeListPage = 1;
function toMeList(type) {

	if(!type){
		page = 1;
	}

	if(type == "next"){
		page = toMeListPage + 1;
	}
	if(type == "prev"){
		if(recievedListPage != 0){
			page = toMeListPage - 1;
		}else{
			return false;
		}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mail/main/list?kindOfMail=sendToMe&perPageNum=5&page=' + page,
		dataType : 'json',
		method : 'get',
		success : function(result) {
			printRecievedList(result,$('#toMe'),$('#toMeForm'))
		},
		error: function(msg) {
		}
	})
}

tempListPage = 1;
function tempList(type) {

	if(!type){
		page = 1;
	}

	if(type == "next"){
		page = tempListPage + 1;
	}
	if(type == "prev"){
		if(recievedListPage != 0){
			page = tempListPage - 1;
		}else{
			return false;
		}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mail/main/list?kindOfMail=temporary&perPageNum=5&page=' + page,
		dataType : 'json',
		method : 'get',
		success : function(result) {
			printRecievedList(result,$('#temp'),$('#tempForm'))
		},
		error: function(msg) {
		}
	})
}

trashListPage = 1;
function trashList(type) {

	if(!type){
		page = 1;
	}

	if(type == "next"){
		page = trashListPage + 1;
	}
	if(type == "prev"){
		if(recievedListPage != 0){
			page = trashListPage - 1;
		}else{
			return false;
		}
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/mail/main/list?kindOfMail=trash&perPageNum=5&page=' + page,
		dataType : 'json',
		method : 'get',
		success : function(result) {
			printRecievedList(result,$('#trash'),$('#trashForm'))
		},
		error: function(msg) {
		}
	})
}


function printRecievedList(data, target, templateObject){

	Handlebars.registerHelper("getImportance",function(importance){
		if(importance =="Y"){
			return new Handlebars.SafeString(`<span class="badge bg-danger">중요</span>`);
		};
	});

	Handlebars.registerHelper("getEmp",function(empCode){
		if(empCode =="${loginUser.empCode}"){
			return new Handlebars.SafeString(`<span class="badge bg-default">sent</span>`);
		}
	});

	Handlebars.registerHelper("getFormatedDt",function(dt){
		let formatedDt = formatDate(dt);
		return formatedDt;
	});


	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	$(target).empty();
	$(target).append(html);
}

function formatDate(dt){
	let week = ['일', '월', '화', '수', '목', '금', '토'];

	let date = new Date(dt);
    let year = date.getFullYear();
    let month = ("0" + (1 + date.getMonth())).slice(-2);
    let day = ("0" + date.getDate()).slice(-2);
    let dayOfWeek = week[date.getDay()];

    return year + "-" + month + "-" + day + "("+ dayOfWeek +")";
}

/* 휴지통에서 메일 복구하는 함수 */
function restore(mailCode) {
	if(confirm("복구하시겠습니까?")){
		$.ajax({
			url : '<%=request.getContextPath()%>/mail/restore?mailCode=' + mailCode,
			method : 'get',
			success: function() {
				Swal.fire({
					  title: '복구를 완료했습니다.',
					  icon: 'info',
					  showConfirmButton: false,
					  timer: 1500
					});
				trashList();
			},
			error : function() {
				callFail();
			}
		})
	}
}

function detailGo(mailCode, kindOfMail) {
	location.href = "<%=request.getContextPath()%>/mail/detail.do?mailCode="+mailCode + "&kindOfMail=" + kindOfMail;
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="recievedForm" type="text/x-handlebars-template">
	{{#each .}}
		<tr onclick="detailGo('{{mailCode}}','recieved')" style="cursor: pointer;">
			<td style="width: 50px;">
				 {{getImportance mailImportance}}
			</td>
			<td>
				<div style="width: 250px;" class="mailTitle">{{mailTitle}}</div>
			</td>
			<td class="text-truncate">{{getFormatedDt mailDate}}</td>
			<td class="text-truncate">{{mailFromEmp.empName}}&nbsp;{{mailFromEmp.positionValue}}</td>
		</tr>
	{{/each}}

</script>
<script id="toMeForm" type="text/x-handlebars-template">
	{{#each .}}
		<tr onclick="detailGo('{{mailCode}}','sendToMe')" style="cursor: pointer;">
			<td style="width: 50px;">
				 {{getImportance mailImportance}}
			</td>
			<td>
				<div style="width: 350px;" class="mailTitle">{{mailTitle}}</div>
			</td>
			<td class="text-truncate">{{getFormatedDt mailDate}}</td>
		</tr>
	{{/each}}

</script>
<script id="tempForm" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<td style="width: 50px;">
				 {{getImportance mailImportance}}
			</td>
			<td>
				<div style="width: 250px;" class="mailTitle">{{mailTitle}}</div>
			</td>
			<td>{{getFormatedDt mailDate}}</td>
			<td><a href="<%=request.getContextPath()%>/mail/tempGO?mailCode={{mailCode}}"><span class="badge bg-info">전송</span></a></td>
		</tr>
	{{/each}}

</script>
<script id="trashForm" type="text/x-handlebars-template">
	{{#each .}}
		<tr onclick="detailGo('{{mailCode}}','trash')" style="cursor: pointer;">
			<td style="width: 50px;">
				 {{getImportance mailImportance}}
			</td>
			<td>
				<div style="width: 250px;" class="mailTitle">{{mailTitle}}</div>
			</td>
			<td class="text-truncate">
				{{getEmp mailFromEmp.empCode}} {{mailFromEmp.empName}}&nbsp;{{mailFromEmp.positionValue}}
			</td>
			<td class="text-truncate">{{getFormatedDt mailDate}}</td>
			<td><a href="javascript:restore('{{mailCode}}')"><span class="badge bg-info">복원하기</span></a></td>
		</tr>
	{{/each}}

</script>
</body>
