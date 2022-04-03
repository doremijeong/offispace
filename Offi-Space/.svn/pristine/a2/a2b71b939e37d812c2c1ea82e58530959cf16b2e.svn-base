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
					<button type="button" class="btn btn-sm btn-info" onclick="gogo()">선택</button>
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

										<div class="card-body" style="padding: 5px;">
											<div class="tab-content" id="custom-tabs-four-tabContent">
												<!-- 조직도 -->
												<div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
													<div class="card-body" style="padding: 5px 5px;">
														<div class="tab-content" id="custom-tabs-four-tabContent">
															<div class="tab-pane fade active show" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
																<div>
																	<div class="card-body p-0" style="height: 360px; overflow-y: scroll;">

																		<!-- 조직도 들어갈 곳 -->
																		<div class="form-group">
																			<div id="tree"></div>
																		</div>

																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /.card -->
									</div>
								</div>

							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.조직도 -->

					<!-- 결재방법 -->

					<!-- /.결재방법 -->

					<!-- 결재선 -->

					<!-- /.결재선 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.card-body -->
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

	    $('#tree').bind('select_node.jstree', function(event, data){
	    	console.log(data);
	        console.log(event);
	        //person=data.node.text;
	        person=data.node;
		});

	}

	function gogo() {
		var aa = $('.jstree-clicked').attr('id');
		var bb = aa.split('_');
		$('#dada',opener.document).append(bb[0]);
		var input = $('<input>').attr({'type' : 'hidden','name' : 'giveEmpCode', 'value' : bb[0]});
		$('div.card-body',opener.document).prepend(input);


		$.ajax({
			url : "<%=request.getContextPath()%>/approval/getEmp?empCode=" + bb[0],
			type : "get",
			dataType : 'json',
			success : function(emp) {
				$('#zozicdo',opener.document).val(emp.empName + " " + emp.positionValue + "(" + emp.teamValue + ")");
				window.close();
			},
			error : function(xhr) {
			}

		});


	}
</script>


</body>