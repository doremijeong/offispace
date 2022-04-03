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
			<div class="card-header d-flex justify-content-between">
				<div>
					<h3 class="card-title" style="margin-top: 7px;">초대하기 :&nbsp;&nbsp;</h3>
					<input id="roomNumber" class="form-control" type="text" placeholder="방번호 입력" style="width:200px;">
				</div>
				<!-- button -->
				<div>
					<button type="button" class="btn btn-md btn-info" onclick="enter();">초대</button>
					<button type="button" onclick="window.close()" class="btn btn-md btn-secondary">취소</button>
				</div>
			</div>
			<!-- /.card-header -->

			<div class="card-body">
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
											<div id="tree">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>

		</div>
	</div>

	<script>
	var person;

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

	    $('#tree').bind('select_node.jstree', function(event, data){
	    	console.log(data);
	        console.log(event);
	        //person=data.node.text;
	        person=data.node.id;
		});

	}

	var pattern = /^[0-9]*$/;
	
	//방 입장하기
    function enter() {
        const room = $('#roomNumber').val();
        if(room.trim()=='')
		{
        	alert('방 번호를 입력하세요.');
        	return;
		}
        if(!room.match(pattern))
        {
        	alert('방 번호는 숫자만 입력 가능합니다.');
        	return;
        }
        if(person==undefined)
        {
        	alert('초대할 사람을 선택해주세요.');
        	return;
        }
        if(!person.startsWith('OP'))
        {
        	alert('폴더를 선택하셨습니다.\n사람을 선택해주세요.');
        	return;
        }
        
        $.ajax({
        	url:'<%=request.getContextPath()%>/videoConference/inviteNotification?empCode='+person+'&room='+room,
            type:'get',
            success:function(success){
            	console.log(success);
            	
            	opening = window.open('https://192.168.143.5/run?room='+room, '화상회의', 'width=810,height=450');
            	window.close();
            },
            error:function(error){
            	//alert("시스템장애로 가입이 불가합니다.");
                AjaxErrorSecurityRedirectHandler(error.status);
            }
        });	
        
    } 
	

</script>

</body>