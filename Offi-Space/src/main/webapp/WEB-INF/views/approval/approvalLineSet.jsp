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
					<h3 class="card-title" style="margin-top: 7px;">결재선 지정</h3>
				</div>
				<!-- button -->
				<div class="float-right">
					<button type="button" class="btn btn-sm btn-info" onclick="inputMark();">확인</button>
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
								<div class="j-appoval-line row" style="margin-bottom: 10px; margin-left: 3px; width: 100%">
									<label class="col-md-4" style="font-size: 14px; padding: 0px; margin-top: 7px;">자주쓰는 결재선</label>
									<div class="col-md-8" style="padding: 0px;">
										<select class="form-control" name="jApvLines" onchange="jApvLine()" style="font-size: 14px; padding-left: 5px; width: 193px; height: 35px; margin-left: 10px;">
											<option>선택</option>
											<c:if test="${!empty jApvLineList}">
												<c:forEach items="${jApvLineList}" var="jApvLine">
													<option value="${jApvLine.jApvLineCode}">${jApvLine.jApvLineName}</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>

								<!-- 선택된 결재선 -->
								<div class="select-approval-line" style="border: 2px solid lightgray; width: 100%; height: 330px; overflow-y: scroll;">
									<ol id="insertForm">

									</ol>
								</div>
								<div style="margin-top: 10px;">
									<button type="button" class="btn btn-block btn-default btn-sm" onclick="saveLine()">자주쓰는 결재선 저장</button>
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
					<h3 onclick="dataGo()">자주쓰는 결재선 등록</h3>
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
					<button type="button" class="btn btn-primary" onclick="save_go()">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>

	// 발표용 데이터 입력
	function dataGo() {
		$('#lineName').val("ICT기술 1팀 빠른 결재선");
	}





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
	    	//alert('왈왈');
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
			//alert('대상을 선택하세요.');
			callCustomAlert('대상을 선택하세요.','','warning');
			return;
		}

		if(way==undefined)
		{
			//alert('결재 방법을 선택하세요.');
			callCustomAlert('결재 방법을 선택하세요.','','warning');
			return;
		}

		if(person.id=='${loginUser.empCode}')
		{
			//alert('결재 방법을 선택하세요.');
			callCustomAlert('본인을 결재선으로 지정할 수 없습니다.','','warning');
			return;
		}

		$.ajax({
        	url:'<%=request.getContextPath()%>/approval/agency?empCode='+person.id,
            type:'get',
            success:function(success){
            	if(success != ""){
            		//alert('해당 사원은 부재중으로 대결자로 지정됩니다.');
            		callCustomAlert('해당 사원은 부재중으로 대결자로 지정됩니다.','','info');
            		$('#insertForm').append('<li onclick="clicked(this);" class="list" data-empCode="'+ success.toEmp.empCode +'" style="cursor:pointer; color:blue;" onmouseover="this.style.background=\'#64D6FF\'"  onmouseout="this.style.background=\'white\'">'+way+'&nbsp;&nbsp;&nbsp;'+success.toEmp.empName+'&nbsp;&nbsp;&nbsp;'+success.toEmp.positionValue+'/'+success.toEmp.chargeValue+'/'+success.toEmp.teamValue+'</li>');
            	}else{

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

            	}
            },
            error:function(error){
            	AjaxErrorSecurityRedirectHandler(error.status);
        	}
    	});

	<%-- 	var teamName;
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
    	}); --%>

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

	function inputMark()
	{
		var realCnt=opener.document.getElementById('cnt').value;
		var realfcnt=opener.document.getElementById('cnt').value;
		var realhcnt=opener.document.getElementById('cntH').value;

		//console.log($('#cnt',opener.document).val("value"));
		//console.log($('#f_apline>table>tbody tr[style="height:80px;"] td',opener.document).length);
		var listCnt=$('.list').length;
		var listAll=$('.list');

		var fcharge='f_apline_title_';
		var fname='f_apline_name_';
		var ftime='f_apline_date_';
		var fsign='f_apline_sign_';

		var hcharge='h_apline_title_';
		var hname='h_apline_name_';
		var htime='h_apline_date_';
		var hsign='h_apline_sign_';

		var fcnt = 0;
		var hcnt = 0;
		var rcnt = 0;

		//시간
		var today = new Date();
     	var year=today.getFullYear();
     	var month=today.getMonth()+1;
     	var day=today.getDate();
     	var week = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');
		var temp=new Date().getDay();
     	var label = week[temp];

     	var mytime = year+'.'+month+'.'+day+label;
     	//document.getElementById('timeCheck').innerText=mytime;


		for(var i=0;i<listCnt;i++)
		{
			var a=listAll[i].innerHTML;
			var b=a.split('&nbsp;&nbsp;&nbsp;');


			if(b[0]=='결재'){
				fcnt = fcnt + 1;
			}
			if(b[0]=='합의'){
				hcnt = hcnt + 1;
			}
			if(b[0]=='참조'){
				rcnt = rcnt + 1;
			}
		}
		//alert("결재자 수 : " + fcnt);
		//alert("합의자 수 : " + hcnt);
		//alert("참조자 수 : " + rcnt);

		if(fcnt>realfcnt)
		{
			//alert('[실패] 결재인원보다 많은 인원을 선택하였습니다.');
			callCustomAlert('결재인원보다 많은 인원을 선택하였습니다.','','warning');
			return;
		}
		if(hcnt>realhcnt)
		{
			//alert('[실패] 합의인원보다 많은 인원을 선택하였습니다.');
			callCustomAlert('합의인원보다 많은 인원을 선택하였습니다.','','warning');
			return;
		}




		//$('#f_apline_sign_0',opener.document).text('44');
		//window.opener.document.getElementById('f_apline_sign_0').innerText='33';


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


			//직책 (상단부)


			//이름,도장 (중단부)
			if(use[0]=='결재')
			{

				var fnaming=fname+ff;
				//var fsigning=fsign+i;
				stampImg = "<img style='width: 40px;height: 40px;' alt='stamp.png' src='<%=request.getContextPath() %>/resources/images/전결승인도장.jpg'>";

				$('#'+fnaming,opener.document).text(use[1]+"("+use[2].split('/')[1]+")");
				//$('#'+fsigning,opener.document).html(stampImg);

				var ftiming=ftime+ff;
				$('#'+ftiming,opener.document).text(mytime);

				var fcharging=fcharge+ff;
				$('#'+fcharging,opener.document).text(use[2].split('/')[0]);

				var input = $('<input>').attr({'type' : 'hidden','class' : 'line','name' : 'fEmpCode', 'value' : (ff+1)+empCode});
				$('form[name="registerForm"]',opener.document).prepend(input);

				ff = ff + 1;

			}
			if(use[0]=='합의')
			{

				var hnaming=hname+hh;
				$('#'+hnaming,opener.document).text(use[1]+"("+use[2].split('/')[1]+")");

				var htiming=htime+hh;
				$('#'+htiming,opener.document).text(mytime);

				var hcharging=hcharge+hh;
				$('#'+hcharging,opener.document).text(use[2].split('/')[0]);

				var input = $('<input>').attr({'type' : 'hidden','class' : 'line','name' : 'hEmpCode', 'value' : (hh+1) + empCode});
				$('form[name="registerForm"]',opener.document).prepend(input);

				hh = hh + 1;

			}
			if(use[0]=='참조')
			{

				var refEmp = use[1]+'('+use[2].split('/')[1]+')';


				if(allRefEmp==null){
					allRefEmp = " ";
				}

				if(allRefEmp!=null){
					if(rr==0){
						allRefEmp = allRefEmp + refEmp;
					}else{
						allRefEmp = allRefEmp + "," + refEmp;
					}
					rr = rr + 1;
				}

				var input = $('<input>').attr({'type' : 'hidden','class' : 'line','name' : 'rEmpCode', 'value' : rr+empCode});
				$('form[name="registerForm"]',opener.document).prepend(input);

			}

		}

		$('.approval-ref',opener.document).text(allRefEmp);

		/* var form=$('form[role=form]');
		form.submit(); */
		window.close();
	}

	// 자주쓰는 결재선 선택한거 담아주는 배열
	var arr = new Array();

	// 자주쓰는 결재선 저장 버튼을 누르면 배열에 값을 넣어주고 모달창을 띄워줘야함
	function saveLine() {

		var realCnt=opener.document.getElementById('cnt').value;
		var realfcnt=opener.document.getElementById('cnt').value;
		var realhcnt=opener.document.getElementById('cntH').value;

		var listCnt=$('.list').length;
		var listAll=$('.list');

		var fcnt = 0;
		var hcnt = 0;
		var rcnt = 0;

		for(var i=0;i<listCnt;i++)
		{
			var a=listAll[i].innerHTML;
			var b=a.split('&nbsp;&nbsp;&nbsp;');


			if(b[0]=='결재'){
				fcnt = fcnt + 1;
			}
			if(b[0]=='합의'){
				hcnt = hcnt + 1;
			}
			if(b[0]=='참조'){
				rcnt = rcnt + 1;
			}
		}

		if(fcnt>realfcnt)
		{
			//alert('[실패] 결재인원보다 많은 인원을 선택하였습니다.');
			callCustomAlert('결재인원보다 많은 인원을 선택하였습니다.','','warning');
			return;
		}
		if(hcnt>realhcnt)
		{
			//alert('[실패] 합의인원보다 많은 인원을 선택하였습니다.');
			callCustomAlert('합의인원보다 많은 인원을 선택하였습니다.','','warning');
			return;
		}

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
				callCustomAlert('자주 쓰는 결재선 [' + name + ']을 등록하였습니다.','','success');
				$('#jApv-modal').modal('hide');
				//location.reload();
			},
			error : function() {
				//alert("등록에 실패하였습니다.")
				callCustomAlert('등록에 실패하였습니다.','','error');
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
				//alert("등록에 실패하였습니다.")
				callCustomAlert('등록에 실패하였습니다.','','error');
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
				//alert("중복된 사원을 선택할 수 없습니다.")
				callCustomAlert('중복된 사원을 선택할 수 없습니다.','','warning');
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