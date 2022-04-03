<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title>조직도</title>

<body>
	<div class="content-wrapper">
	
	<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>조직도</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">조직도</a></li>
							<li class="breadcrumb-item active">메인</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
	<section class="content">
		<div class="container-fluid">
        	<div class="row">
            	<!-- left column -->
            	<div class="col-md-4">
                	<!-- general form elements -->
                	<div class="card card-info" >
                    	<div class="card-header" >
                        	<h3 class="card-title">조직도 현황</h3>
                        	<button type="button" class="btn btn-block btn-default btn-xs float-right" id="showAll" style="width:80px;">전체 펼치기</button>
                        </div>
                        <!-- /.card-header -->
                        
                        <div class="card-body">
                        	<div class="form-group" style="overflow-y:scroll; height:500px;">
                            	<div id="tree"></div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (left) -->
                
                <!-- right column -->
                <div class="col-md-8">
                	<!-- general form elements disabled -->
                	<div class="card card-info">
                    	<div class="card-header">
                        	<h3 class="card-title">팀 목록</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="overflow-y:scroll; height:248px;">
                        	<table class="table table-sm" id="teamList">
                            	<thead>
                              		<tr>
                                		<th>번호</th>
                                		<th>성명</th>
                                		<th>소속</th>
                                		<th>직책</th>
                              		</tr>
                            	</thead>
                            	<tbody>
                            	</tbody>
                          </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    
                    <!-- general form elements disabled -->
                    <div class="card card-info">
                    	<div class="card-header">
                        	<h3 class="card-title">팀원 상세</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="overflow-y:scroll; height:248px;">
                        	<table class="table table-condensed" id="teamDetail">
                            	<tbody>
                            		<tr>
                            			<th rowspan="4"  style="width: 174px;"></th>
                            			<th>이름</th> 
                            			<td></td> 
                            			<th>직급</th> 
                            			<td></td>
                            		</tr>
                            		<tr>
                            			<th>소속</th> 
                            			<td></td> 
                            			<th>직책</th> 
                            			<td></td> 
                            		</tr>
                            		<tr>
                            			<th>상태</th> 
                            			<td></td> 
                            			<th>Email</th> 
                            			<td></td> 
                            		</tr>
                            		<tr>
                            			<th>권한</th> 
                            			<td></td> 
                            			<th>휴대전화</th> 
                            			<td></td> 
                            		</tr>
                            	</tbody>
                          	</table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                	<!-- /.card -->
                </div>
            	<!--/.col (right) -->
            </div>
        	<!-- /.row -->
    	</div>
    	<!-- /.container-fluid -->
    </section>
      
	<script>
    	var flag=true;
        var btnElement= document.getElementById('showAll');
       	var list=new Array();
                            	
	    '<c:forEach items="${headOfficeList }" var="item">'
	    var temp=new Object();
	                            			
	    temp.id='${item.comCode}';
	    temp.parent='#';
	    temp.text='${item.comCode1}';
	                            		
	    list.push(temp);
	    //headOfficeList.push('${item.comCode1 }');
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
	                            	
	        						
	    function detail_go(empCode)
	    {
	    	$('#teamDetail>tbody').empty();
	        $.ajax({
	        	url:'<%=request.getContextPath()%>/organizationChart/getDetail?empCode='+empCode,
	            type:'get',
	            success:function(success){
	            	console.log(success);
	                        					
	            	if(success) //있으면
	            	{
	            		$('#teamDetail>tbody').append('<tr> <th rowspan="4"  style="width: 150px;"><img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName='+success.attachSavename+'" style="object-fit: cover; width: 150px; height: 180px;" class="" alt="User Image"></th> <th>이름</th> <td>'+success.empName+'</td> <th>직급</th> <td>'+success.positionValue+'</td> </tr>');
	                	$('#teamDetail>tbody').append('<tr> <th>소속</th> <td>'+success.teamValue+'</td> <th>직책</th> <td>'+success.chargeValue+'</td> </tr>');
	                	$('#teamDetail>tbody').append('<tr> <th>상태</th> <td>'+success.statusValue+'</td> <th>Email</th> <td>'+success.empEmail+'</td> </tr>');
	                	$('#teamDetail>tbody').append('<tr> <th>권한</th> <td>'+success.authorityValue+'</td> <th>휴대전화</th> <td>'+success.empTelephone+'</td> </tr>');
	            	}
	            },
	            error:function(error){
	            	//alert("시스템장애로 가입이 불가합니다.");
	                AjaxErrorSecurityRedirectHandler(error.status);
	            }
	        });	
	    }
	                            	
	    window.onload=function(){
	    	$('#tree').jstree({ 
	        'core' : { 
	        	'data' : list,
	            "check_callback":true
	        },
	        "plugins":["dnd","contextmenu","search","wholerow"]
	    });
		
	    $('#tree').bind("move_node.jstree", function(e, d) {
	        console.log(e); //event 
	        console.log(d); //node 
	    });
										
	    $('#tree').bind('select_node.jstree', function(event, data){
	    	console.log(data);
	        console.log(event);
	        //$('#teamList>thead').empty();
	        $('#teamList>tbody').empty();
	                            			
	        $.ajax({
	        	url:'<%=request.getContextPath()%>/organizationChart/getTeamList?comCode='+data.node.id,
	            type:'get',
	            success:function(success){
	            	//alert(success[0].empName);
	                console.log(success);
	                if(success) //있으면
	                {
	                	var num=1;
	                	//$('#teamList>thead').append('<tr><th>번호</th><th>성명</th><th>소속</th><th>직책</th></tr>');
	                    for(var i of success)
	                    {
	                    	//console.log(i.empName);
	                        $('#teamList>tbody').append('<tr onclick="javascript:detail_go(\''+i.empCode+'\');" style="cursor:pointer;" onmouseover="this.style.background=\'#9DE4FF\'" onmouseout="this.style.background=\'white\'"><td>'+num+'</td><td>'+i.empName+'</td><td>'+i.teamValue+'</td><td>'+i.chargeValue+'</td></tr>');
	                        num++;
	                    }
	                }
	                /* for(var i=0;i<=success.length;i++)
	                {
	                $('#teamList>tbody').append("<tr><td>"+(i+1)+"</td><td>"+success[i].empName+"</td><td>"+success[i].teamValue+"</td><td>"+success[i].empEmail+"</td></tr>")
	                }  */
	            },
	            error:function(error){
	            	//alert("시스템장애로 가입이 불가합니다.");
	            	AjaxErrorSecurityRedirectHandler(error.status);
	        	}
	    	});	
		});
	}
	</script>
	
	</div>
                            	
</body>