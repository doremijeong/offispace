<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title>조직도</title>

<body>
	<div class="content-wrapper">
	
	<div style="height: 20px;"></div>
	
	<section class="content">
		<div class="container-fluid">
        	<div class="row">
            	<!-- left column -->
            	<div class="col-md-6">
                	<!-- general form elements -->
                	<div class="card card-info" >
                    	<div class="card-header" >
                        	<h3 class="card-title">조직도(주소록)</h3>
                        	<div class="float-right">
  	                      	<button type="button" class="btn btn-block btn-default btn-xs" id="showAll" style="width:100px;">전체 펼치기</button>
	                        </div>
                        </div>
                        <!-- /.card-header -->
                        
                        <div class="card-body">
                        	<div class="form-group" style="overflow-y:scroll; height:650px;">
                            	<div id="tree"></div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (left) -->
                
                
                <!-- right column -->
                <div class="col-md-6">
                	<!-- general form elements disabled -->
                	<div class="card card-info">
                    	<div class="card-header">
                        	<h3 class="card-title">받는 사람</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="overflow-y:scroll; height:320px;">
                        	<div class="form-group" id="receiverList">
                        		<form id="form1">
		                        <select id="receiverSelect" class="duallistbox" multiple="multiple" style="display: none;">
		                    		<!-- <option selected="">Alabama</option>
		                    		<option>Alaska</option>
		                    		<option data-sortindex="101">California</option>
				                    <option data-sortindex="102">Delaware</option>
				                    <option data-sortindex="103">Tennessee</option>
				                    <option>Texas</option>
				                    <option>Washington</option> -->
		                  		</select>
		                  		<button type="submit" class="btn btn-primary w-100">hihi</button>
		                  		</form>
		                	</div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    
                    <!-- general form elements disabled -->
                    <div class="card card-info">
                    	<div class="card-header">
                        	<h3 class="card-title">참조</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="overflow-y:scroll; height:320px;">
                        	<div class="form-group" id="referencerList">
                        		<form id="form2">
		                        <select id="referencerSelect" class="duallistbox" multiple="multiple" style="display: none;">
		                    		<!-- <option selected="">Alabama</option>
		                    		<option>Alaska</option>
		                    		<option data-sortindex="101">California</option>
				                    <option data-sortindex="102">Delaware</option>
				                    <option data-sortindex="103">Tennessee</option>
				                    <option>Texas</option>
				                    <option>Washington</option> -->
		                  		</select>
		                  		<button type="submit" class="btn btn-primary w-100">2222</button>
		                  		</form>
		                	</div>
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
	    //temp.icon='<%=request.getContextPath()%>/resources/images/01.jpg';
	                            		
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
	        
	        //초기화
	        $('#receiverList').empty();
	        $('#referencerList').empty();
	        
	        $.ajax({
	        	url:'<%=request.getContextPath()%>/organizationChart/getTeamList?comCode='+data.node.id,
	            type:'get',
	            success:function(success){
	            	//alert(success[0].empName);
	                console.log(success);
	                if(success) //있으면
	                {
	                	$('#receiverList').append('<select id="receiverSelect" size="7" class="duallistbox" multiple="multiple" style="display: none;"></select>');
	                	$('#referencerList').append('<select id="referencerSelect" size="7" class="duallistbox" multiple="multiple" style="display: none;"></select>');
	                    for(var i of success)
	                    {
	            	        $('#receiverSelect').append('<option>'+i.empName+'</option>');
	            	        $('#referencerSelect').append('<option>'+i.empName+'</option>');
	                    }
	                    $('#receiverSelect').bootstrapDualListbox();
	                    $('#referencerSelect').bootstrapDualListbox();
	                }
	            },
	            error:function(error){
	            	//alert("시스템장애로 가입이 불가합니다.");
	            	AjaxErrorSecurityRedirectHandler(error.status);
	        	}
	    	});	
		});
	    
	    $("#form1").submit(function() {
	        alert('d');
	        return false;
	    });
	}
	    
	</script>
	
	</div>
                            	
</body>