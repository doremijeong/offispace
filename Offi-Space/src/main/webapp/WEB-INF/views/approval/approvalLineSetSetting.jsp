<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
.clicked {
	color: #FF6A89;
}
</style>
</head>

<title></title>

<body>

	<div class="content-wrapper">

		<div class="card card-default">
			<div class="card-header">
				<div>
					<h3 class="card-title" style="margin-top: 7px;">자주쓰는 결재선 등록</h3>
				</div>
				<!-- button -->
				<div class="float-right">
					<button type="button" onclick="window.close()" class="btn btn-sm btn-secondary">취소</button>
				</div>
			</div>
			<!-- /.card-header -->

			<div class="card-body">
				<div class="row">

					<div class="col-md-5">
						<div class="card card-info" style="height: 500px;'">
							<div class="card-header">
								<p class="card-title" style="font-size: 16px;">사원목록</p>
								<button type="button" class="btn btn-block btn-default btn-xs float-right" id="showAll" style="width: 80px;">전체 펼치기</button>
							</div>

							<div class="card-body" style="padding: 10px;">
								<div class="col-12 col-sm-12">
									<div class="card card-info card-outline card-outline-tabs">
				              			<div class="card-header p-0 border-bottom-0">
				              			</div>

				              			<div class="card-body" style="padding: 5px;">
				              				<div class="card-body p-0" style="height: 400px; overflow-y:scroll;">
												<div class="form-group">
													<div id="tree"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.조직도 -->

					<!-- 결재방법 -->
					<div class="col-md-2">
						<div class="card card-secondary" style="height: 300px; margin-top: 100px;">
							<div class="card-header" style="padding: 10px;">
								<p class="card-title" style="margin-left: 25px; font-size: 15px;">결재방법</p>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div>
									<div class="col-sm-12">
										<div class="apv-kind-box" style="margin-left: 8px;">
											<div class="custom-control custom-radio" style="margin-bottom: 8px;">
												<input class="custom-control-input" type="radio" id="customRadio1" name="customRadio" value="결재">
												<label for="customRadio1" class="custom-control-label">결재</label>
											</div>
											<div class="custom-control custom-radio" style="margin-bottom: 8px;">
												<input class="custom-control-input" type="radio" id="customRadio2" name="customRadio" value="합의">
												<label for="customRadio2" class="custom-control-label">합의</label>
											</div>
											<div class="custom-control custom-radio" style="margin-bottom: 8px;">
												<input class="custom-control-input" type="radio" id="customRadio3" name="customRadio" value="참조">
												<label for="customRadio3" class="custom-control-label">참조</label>
											</div>
										</div>
										<div style="margin-top: 20px; padding-left: 23px; padding-right: 23px;">
											<button type="button" style="border: 2px solid lightgray; width: 32px; padding: 5px; margin-bottom: 5px;" onclick="add();">
												<i class="fas fa-angle-right"></i>
											</button>
											<button type="button" style="border: 2px solid lightgray; width: 32px; padding: 5px; margin-bottom: 5px;" onclick="remove();">
												<i class="fas fa-angle-left"></i>
											</button>
											<button type="button" style="border: 2px solid lightgray; width: 32px; padding: 5px; margin-bottom: 5px;" onclick="removeAll();">
												<i class="fas fa-angle-double-left"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.결재방법 -->

					<!-- 결재선 -->
					<div class="col-md-5">
						<div class="card card-info" style="height: 500px;'">
							<div class="card-header">
								<p class="card-title" style="font-size: 16px;">결재선</p>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<!-- 선택된 결재선 -->
								<div class="select-approval-line" style="border: 2px solid lightgray; width: 100%; height: 370px; overflow-y: scroll;">
									<ol id="insertForm">

									</ol>
								</div>
								<div style="margin-top: 10px;">
									<button type="button" class="btn btn-block btn-default btn-sm" onclick="saveLine()">등록</button>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.결재선 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.card-body -->
		</div>

	</div>

	<!-- 자주쓰는 결재선 모달 -->
	<div class="modal" id="jApv-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3>자주쓰는 결재선 등록</h3>
				</div>
				<!--header-->

				<div class="modal-body">
					<div class="col-sm-12 d-flex justify-content-center">
						<div class="form-group row">
							<input id="lineName" type="text" name="apvName" class="form-control form-control-md" placeholder="이름을 입력해주세요.">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary" onclick="save_go()">등록</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	var person;
	var way;

	var flag=true;
	var btnElement= document.getElementById('showAll');
	var list=new Array();

	'<c:forEach items="${headOfficeList }" var="item">'
	var temp=new Object();

	temp.id='${item.comCode}';
	temp.parent='#';
	temp.text='${item.comCode1}';

	list.push(temp);
	'</c:forEach>'

	'<c:forEach items="${groupList }" var="item">'
	var temp=new Object();

	temp.id='${item.comCode}';
	temp.parent='${item.comCode2}';
	temp.text='${item.comCode1}';

	list.push(temp);
	'</c:forEach>'

	'<c:forEach items="${teamList }" var="item">'
	var temp=new Object();

	temp.id='${item.comCode}';
	temp.parent='${item.comCode3}';
	temp.text='${item.comCode1}';

	list.push(temp);
	'</c:forEach>'

	'<c:forEach items="${employeeList }" var="item">'
	var temp=new Object();

	temp.id='${item.empCode}';
	temp.parent='${item.teamCode}';
	temp.text='${item.empName}&nbsp;&nbsp;&nbsp;${item.chargeValue}/${item.positionValue}';
	temp.icon='<%=request.getContextPath()%>/resources/images/person2.png';

	list.push(temp);
	'</c:forEach>'

	btnElement.addEventListener('click',function(){
		if(flag)
		{
	    	$('#tree').jstree('open_all');
	    	this.innerText = '전체 접기';
	    	flag=false;
		}
		else
		{
	    	$('#tree').jstree('close_all');
	    	this.innerText = "전체 펼치기";
	    	flag=true;
		}
	});

	window.onload=function(){

    	$('#tree').jstree({
	        'core' : {
	        	'data' : list,
	            "check_callback":true
	        },
	        "plugins":["dnd","contextmenu","search","wholerow"],
    	});

	    $('#tree').bind("move_node.jstree", function(e, d) {
	    	alert('왈왈');
	        console.log(e); //event
	        console.log(d); //node
	    });

	    $('#tree').bind('select_node.jstree', function(event, data){
	    	console.log(data);
	        console.log(event);
	        //person=data.node.text;
	        person=data.node;
		});

	    $("input:radio[name=customRadio]").click(function(){
	        way=$('input:radio[name=customRadio]:checked').val();
	    });

	}

	var dupli = true;
	function add()
	{
		noDuplicate(person.id);

		console.log(dupli)
		if(!dupli){
			return;
		}

		if(person==undefined)
		{
			alert('대상을 선택하세요.');
			return;
		}

		if(way==undefined)
		{
			alert('결재 방법을 선택하세요.');
			return;
		}

		var teamName;
		$.ajax({
        	url:'<%=request.getContextPath()%>/approval/getTeamName?comCode='+person.parent,
            type:'get',
            success:function(success){
            	$('#insertForm').append('<li onclick="clicked(this);" class="list" data-empCode="'+person.id+'" style="cursor:pointer;" onmouseover="this.style.background=\'#64D6FF\'" onmouseout="this.style.background=\'white\'">'+way+'&nbsp;&nbsp;&nbsp;'+person.text+'/'+success+'</li>');
            	//overlap.push(person.text.split('&nbsp;&nbsp;&nbsp;')[0]);
            },
            error:function(error){
            	AjaxErrorSecurityRedirectHandler(error.status);
        	}
    	});

		//$('#insertForm').append('<li>'+'&nbsp;&nbsp;&nbsp;'+way+'&nbsp;&nbsp;&nbsp;'+person.text+'/'+teamName+'</li>');
	}


	function remove()
	{
		$('.clicked').remove();
	}

	function removeAll()
	{
		$('.list').remove();
	}

	function clicked(temp)
	{
		//temp.style.backgroundColor='red';
		if(temp.classList[1]=='clicked')
		{
			temp.classList.remove('clicked')
		}
		else
		{
			for(var i=0;i<$('.list').length;i++)
			{
				$('.list')[i].classList.remove('clicked');
			}
			temp.classList.add('clicked');
		}
		console.log(temp.classList[1]);
	}

	// 자주쓰는 결재선 선택한거 담아주는 배열
	var arr = new Array();

	// 자주쓰는 결재선 저장 버튼을 누르면 배열에 값을 넣어주고 모달창을 띄워줘야함
	function saveLine() {

		var listCnt=$('.list').length;
		var listAll=$('.list');
		var allRefEmp;
		var represent;
		var use;
		var ff=0;
		var hh=0;
		var rr=0;

		for(var i=0;i<listCnt;i++)
		{
			represent=listAll[i].innerHTML;
			use=represent.split('&nbsp;&nbsp;&nbsp;');

			var empCode = listAll[i].dataset.empcode;
			var aa;

			if(use[0]=='결재')
			{
				aa = ff + "/" + empCode + "/" + 'AK0001';
				arr.push(aa)
				ff = ff + 1;
			}
			if(use[0]=='합의')
			{
				aa = hh + "/" + empCode + "/" + 'AK0002';
				arr.push(aa)
				hh = hh + 1;
			}
			if(use[0]=='참조')
			{
				aa = rr + "/" + empCode + "/" + 'AK0003';
				arr.push(aa)
				rr = rr + 1;
			}
		}

		$('#jApv-modal').modal('show');
	}

	// 모달창에서 입력받은 이름을 가지고 배열과 함께 ajax로 보내기
	function save_go() {
		var name = $('#lineName').val();

		$.ajax({
			url : '<%=request.getContextPath()%>/approval/jLineRegister.do',
			data : {'name' : name, 'lineArr' : arr},
			dataType : 'text',
			method : 'post',
			success : function(msg) {
				alert(msg);
				CloseWindow();
			},
			error : function() {
				alert("등록에 실패하였습니다.")
			}
		})
	}

	function jApvLine() {
		var jApvCode = $("select[name=jApvLines] option:selected").val();
		$.ajax({
			url : '<%=request.getContextPath()%>/approval/getJApvLine?jApvLineCode=' + jApvCode,
			dataType : 'json',
			success : function(data) {
				printOptionInCommonCodeSelector(data, $('#insertForm'), $('#jApvLineShow'))
			},
			error : function() {
				alert("등록에 실패하였습니다.")
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
		$('#insertForm').empty();
		$(target).append(html);
	}

	function noDuplicate(empcode){
		dupli = true;
		let insertForm = document.querySelector('#insertForm');
		insertForm.querySelectorAll('li').forEach(li=>{
			if(li.dataset.empcode == empcode){
				alert("중복된 사원을 선택할 수 없습니다.")
				dupli = false;
			}
		})
	}
</script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script id="jApvLineShow" type="text/x-handlebars-template">
	{{#each .}}
		<li onclick="clicked(this);" class="list" data-empCode="{{jApvLineInfoEmpCode}}" style="cursor:pointer;" onmouseover="this.style.background='#64D6FF'" onmouseout="this.style.background='white'">{{word jApvLineInfoKind}}&nbsp;&nbsp;&nbsp;{{emp.empName}}&nbsp;&nbsp;&nbsp;{{emp.positionValue}}/{{emp.chargeValue}}/{{emp.teamValue}}</li>
	{{/each}}

</script>


</body>