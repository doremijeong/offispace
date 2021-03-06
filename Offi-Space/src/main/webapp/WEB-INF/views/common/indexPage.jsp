<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<style>
.boxes {
  --size: 32px;
  --duration: 800ms;
  height: calc(var(--size) * 2);
  width: calc(var(--size) * 3);
  position: relative;
  transform-style: preserve-3d;
  transform-origin: 50% 50%;
  margin-top: calc(var(--size) * 1.5 * -1);
  transform: rotateX(60deg) rotateZ(45deg) rotateY(0deg) translateZ(0px);
}
.boxes .box {
  width: var(--size);
  height: var(--size);
  top: 0;
  left: 0;
  position: absolute;
  transform-style: preserve-3d;
}
.boxes .box:nth-child(1) {
  transform: translate(100%, 0);
  -webkit-animation: box1 var(--duration) linear infinite;
          animation: box1 var(--duration) linear infinite;
}
.boxes .box:nth-child(2) {
  transform: translate(0, 100%);
  -webkit-animation: box2 var(--duration) linear infinite;
          animation: box2 var(--duration) linear infinite;
}
.boxes .box:nth-child(3) {
  transform: translate(100%, 100%);
  -webkit-animation: box3 var(--duration) linear infinite;
          animation: box3 var(--duration) linear infinite;
}
.boxes .box:nth-child(4) {
  transform: translate(200%, 0);
  -webkit-animation: box4 var(--duration) linear infinite;
          animation: box4 var(--duration) linear infinite;
}
.boxes .box > div {
  --background: #5c8df6;
  --top: auto;
  --right: auto;
  --bottom: auto;
  --left: auto;
  --translateZ: calc(var(--size) / 2);
  --rotateY: 0deg;
  --rotateX: 0deg;
  position: absolute;
  width: 100%;
  height: 100%;
  background: var(--background);
  top: var(--top);
  right: var(--right);
  bottom: var(--bottom);
  left: var(--left);
  transform: rotateY(var(--rotateY)) rotateX(var(--rotateX)) translateZ(var(--translateZ));
}
.boxes .box > div:nth-child(1) {
  --top: 0;
  --left: 0;
}
.boxes .box > div:nth-child(2) {
  --background: #145af2;
  --right: 0;
  --rotateY: 90deg;
}
.boxes .box > div:nth-child(3) {
  --background: #447cf5;
  --rotateX: -90deg;
}
.boxes .box > div:nth-child(4) {
  --background: #dbe3f4;
  --top: 0;
  --left: 0;
  --translateZ: calc(var(--size) * 3 * -1);
}

@-webkit-keyframes box1 {
  0%, 50% {
    transform: translate(100%, 0);
  }
  100% {
    transform: translate(200%, 0);
  }
}

@keyframes box1 {
  0%, 50% {
    transform: translate(100%, 0);
  }
  100% {
    transform: translate(200%, 0);
  }
}
@-webkit-keyframes box2 {
  0% {
    transform: translate(0, 100%);
  }
  50% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(100%, 0);
  }
}
@keyframes box2 {
  0% {
    transform: translate(0, 100%);
  }
  50% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(100%, 0);
  }
}
@-webkit-keyframes box3 {
  0%, 50% {
    transform: translate(100%, 100%);
  }
  100% {
    transform: translate(0, 100%);
  }
}
@keyframes box3 {
  0%, 50% {
    transform: translate(100%, 100%);
  }
  100% {
    transform: translate(0, 100%);
  }
}
@-webkit-keyframes box4 {
  0% {
    transform: translate(200%, 0);
  }
  50% {
    transform: translate(200%, 100%);
  }
  100% {
    transform: translate(100%, 100%);
  }
}
@keyframes box4 {
  0% {
    transform: translate(200%, 0);
  }
  50% {
    transform: translate(200%, 100%);
  }
  100% {
    transform: translate(100%, 100%);
  }
}
html {
  -webkit-font-smoothing: antialiased;
}

* {
  box-sizing: border-box;
}
*:before, *:after {
  box-sizing: border-box;
}

.loader {
  min-height: 100vh;
  font-family: Roboto, Arial;
  color: #adafb6;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f9fbff;
}
</style>
</head>

<title></title>

<body>

	<div class="content-wrapper" style="min-height:90vh;">

		<div id="toastsContainerTopRight" class="toasts-top-right fixed" style="top:57px;">
		</div>
		<div id="toastsContainerTopLeft" class="toasts-top-left fixed" style="top:7px; left:20%; width:60%;">
		</div>
		<div class="tab-loading loader" style="width:100%; height:100vh; display: none;">
			<div class="boxes">
			    <div class="box">
			        <div></div>
			        <div></div>
			        <div></div>
			        <div></div>
			    </div>
			    <div class="box">
			        <div></div>
			        <div></div>
			        <div></div>
			        <div></div>
			    </div>
			    <div class="box">
			        <div></div>
			        <div></div>
			        <div></div>
			        <div></div>
			    </div>
			    <div class="box">
			        <div></div>
			        <div></div>
			        <div></div>
			        <div></div>
			    </div>
			</div>

	     </div>
	     <div class="iframeBox" style=" display:none; width:100%; height:100vh;">
			<iframe id="main_iframe" name="ifr" src="" frameborder="0" style="width:100%; height:100vh;">
			</iframe>
	     </div>
	</div>

<!-- 	<form id="attForm"> -->
<!-- 		<input type="hidden" name="attOption" value="" /> -->
<!-- 	</form> -->

	<script>
// 		function close(){
// 			alert('??????????????? ????????? 15????????? ???????????? ??????????????????.');
// 		}
		var asideOpen = false;
	 	var url;
		function att_go(){
<%-- 			if(!url) url="<%=request.getContextPath()%>/attend/modify.do"; --%>
// 			var attForm = $('#attForm');
// 			var att = attForm.find("[name='attOption']").val($('select[name="attOption"]').val())[0];
// 			console.log(att);
// 			attForm.attr({
// 				action:url,
// 				method:'get'
// 			}).submit();
		if (!asideOpen){
			return;
		}
		let attJobstCode = $('#attOption').val();

			$.ajax({
				url : "<%=request.getContextPath()%>/attend/modify.do?attOption="+attJobstCode,
				type:"get",
				success : function(success){
					callSuccess(success,'');
// 					alert(success);
				},
				error:function(res){

				}
			});
		}

		function goPage(url,mCode) //??????????????? ?????????.
		{
			loaderShow();
			$('iframe[name="ifr"]').attr("src",url);
			$('iframe[name="ifr"]').on("load", function(){
				document.querySelector('.iframeBox').style.display="";
			  	loaderHide();
			});

			if(typeof(history.pushState)=='function')
			{
				//?????? ????????? ????????????.
				var renewURL=location.href;

				//?????? ?????? ??? .do???! ??? ????????? ????????? ???????????????. ???????????? ????????? ?????? ??????.
				renewURL=renewURL.substring(0,renewURL.indexOf(".do")+3);

				if(mCode!='M000000') //????????? ?????????
				{
					renewURL+="?mCode="+mCode;
				}

				//???????????? ??????????????? ?????? ????????? ????????? ????????? ??? ??????.
				history.pushState(mCode,null,renewURL); //????????????.

			}
			else
			{
				location.hash="#"+mCode; //#????????? value ????????????.
			}
		}

		window.onload=function(){
			goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}'); //????????? ???????????? ????????? ????????????.

			const parentNavNode = document.querySelectorAll('.parentNav');
			parentNavNode.forEach(parentNav=>{
				parentNav.addEventListener('click',()=>{
					let str = parentNav.href;
					let url = str.substring(0,str.indexOf("*"));
					let mCode = str.substring(str.lastIndexOf("*")+1)
					if(!parentNav.parentNode.classList.contains("menu-open")){
						goPage(url,mCode);
					}
				})
			})


			if('${attachment.attachSavename}')
			{
				MemberPictureThumb($('#aside_main_photo'),'${attachment.attachSavename}','<%=request.getContextPath()%>');
				MemberPictureThumb($('#top_main_photo'),'${attachment.attachSavename}','<%=request.getContextPath()%>');
			}

			setTooltips(); // ????????? ?????????
			setInterval("getInstantNotification()",10*1000); //?????? ?????? ????????????
			showTime(); //?????? ???????????? ????????? ??????????????? ?????? ????????????.
			$('#attOption').select2();
			$('.select2').select2();

			let myState = '${attend.attJobStCode}';
			console.log(myState);
			$('#attOption').val(myState);
			$('#attOption').trigger('change');

			//callConfirm('??????', '???????????????????????? ','?????? ','???????????? ','?????? ','???????????? ');


			//????????? ?????? : ?????? ?????????
			$('#msgTextarea').keyup(function(e) {
				let content = $(this).val();

				//????????? ??????
				if(content.length == 0 || content == '') {
					$('.textCount').text('0');
				} else {
					$('.textCount').text(content.length);
				}

				//????????? ??????
				if (content.length > 150) {
						// 200??? ????????? ????????? ?????? ?????????
						$(this).val($(this).val().substring(0, 150));
						// 200??? ????????? ????????? ?????????
						alert('???????????? 150????????? ?????? ???????????????.');
					};
			})


			//????????? ?????? : ??????
			$('#replyMsgTextarea').keyup(function(e) {
				let content = $(this).val();

				//????????? ??????
				if(content.length == 0 || content == '') {
					$('.textCount').text('0');
				} else {
					$('.textCount').text(content.length);
				}

				//????????? ??????
				if (content.length > 150) {
						// 200??? ????????? ????????? ?????? ?????????
						$(this).val($(this).val().substring(0, 150));
						// 200??? ????????? ????????? ?????????
						alert('???????????? 150????????? ?????? ???????????????.');
					};
			})
		}

		function showTime(){
         	var today = new Date();

         	var year=today.getFullYear();

         	var month=today.getMonth()+1;

         	var day=today.getDate();

         	var week = new Array('(???)', '(???)', '(???)', '(???)', '(???)', '(???)', '(???)');
				var temp=new Date().getDay();
         	var label = week[temp];

         	var hour = today.getHours();
         	if(hour>12){hour="?????? "+(hour-12)}
         	else{hour="?????? "+hour}

         	var minute = today.getMinutes();
         	if(minute<10){minute="0"+minute;}

         	var second = today.getSeconds();
         	if(second<10){second="0"+second;}

         	var mytime = year+'??? '+month+'??? '+day+'??? '+ label+' '+ hour+':'+minute+':'+second;
         	document.getElementById('timeCheck').innerText=mytime;
        }
        setInterval("showTime()",1000);


        function IPCheck(from,smooth)
        {
        	if(from=="A") //??????
        	{
        		 $.ajax({
     	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
     	            type:'get',
     	            success:function(success){
     	            	//alert(success);

     	            	//?????????????????? ????????? ????????????.
     	            	var current=$('iframe[name="ifr"]').attr('src');

     	            	//?????? ????????? ??????????????? ???????????? ??????.
     	            	$.ajax({
     	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
     	            		type:'get',
     	            		success:function(result){
     	            			console.log(result);

     	            			//????????????alert????????? ??????
     	            			callSuccess(result.ment,'');
//      	            			alert(result.ment);

     	            			$('#attTime').text(result.time);

     	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
     	     	            	$('#attBtn').text('????????????');
     	     	            	$('#attBtn').prop("href","javascript:IPCheck('B');"); //???????????????

     	     	            	if(current=='<%=request.getContextPath()%>/main.do')
     	     	            	{
     	     	            		//const url='<%=request.getContextPath()%>/main.do?from='+from;
     	         	            	//$('iframe[name="ifr"]').attr("src",url);

     	         	            	var mi=document.getElementById('main_iframe');
			     	            	var mid=mi.contentWindow || mi.contentDocument;
			     	            	mid.document.getElementById('attTime').innerText=result.time;
			     	            	mid.document.getElementById('attBtn').innerText='????????????';
			     	            	mid.document.getElementById('attBtn').href="javascript:IPCheck('B');";
			     	            	mid.start();

     	     	            	}

     	     	            	inter1=setInterval("workTime()",1000);
     	     	            	//inter2=setInterval("workTime2()",1000);
     	            		},
     	            		error:function(error){
     	            			AjaxErrorSecurityRedirectHandler(error.status);
     	            		}
     	            	});

     	            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
     	            	$('#attBtn').text('????????????');

     	            	setInterval("workTime()",1000);
     	            	//setInterval("workTime2()",1000);

     	            },
     	            error:function(error){
     	            	callSuccess(error.responseText,'');
//      	            	alert(error.responseText);
     	            	//alert(error.status);
     	                //AjaxErrorSecurityRedirectHandler(error.status);
     	            }
     	        });
        	}
        	else //??????
        	{
        		if(!smooth)
        		{
        		Swal.fire({
        			  title: '???????????????????????????????',
//         			  text: text,
        			  icon: 'warning',
        			  showCancelButton: true,
        			  confirmButtonText: '??????',
        			  cancelButtonText: '??????',
        			  reverseButtons: false
        			})
        			.then((result) => {
        				if (result.isConfirmed) {
        	        			$.ajax({
        	        	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
        	        	            type:'get',
        	        	            success:function(success){
        	        	            	//alert(success);

        	        	            	//?????????????????? ????????? ????????????.
        	         	            	var current=$('iframe[name="ifr"]').attr('src');

        	         	            	//?????? ????????? ??????????????? ???????????? ??????.
        	         	            	$.ajax({
        	         	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
        	         	            		type:'get',
        	         	            		success:function(result){
        	         	            			console.log(result);

        	         	            			//????????????alert???????????????
        	         	            			callSuccess(result.ment,'');
//        	          	            			alert(result.ment);
        	         	            			$('#leaveTime').text(result.time);

        	         	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
        	         	     	            	$('#attBtn').text('????????????');
        	         	     	            	$('#attBtn').prop("href","#"); //???????????????

        	         	     	            	if(current=='<%=request.getContextPath()%>/main.do')
        	         	     	            	{
        	         	         	            	var mi=document.getElementById('main_iframe');
        	    			     	            	var mid=mi.contentWindow || mi.contentDocument;
        	    			     	            	mid.document.getElementById('leaveTime').innerText=result.time;
        	    			     	            	mid.document.getElementById('attBtn').innerText='????????????';
        	    			     	            	mid.document.getElementById('attBtn').href="#";
        	    			     	            	mid.end();
        	         	     	            	}

        	         	     	            	clearInterval(inter1);
        	                	            	clearInterval(inter2);
        	         	            		},
        	         	            		error:function(error){
        	         	            			AjaxErrorSecurityRedirectHandler(error.status);
        	         	            		}
        	         	            	});
        	        	            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
        	        	            	$('#attBtn').text('????????????');

        	        	            	var stop1=workTime();
        	        	            	var stop2=workTime();
        	        	            	clearInterval(stop1);
        	        	            	clearInterval(stop2);
        	        	            },
        	        	            error:function(error){
        	        	            	callSuccess(error.responseText,'');
//         	        	            	alert(error.responseText);
        	        	            	//alert(error.status);
        	        	                //AjaxErrorSecurityRedirectHandler(error.status);
        	        	            }
        	        	        });

        				} else if ( result.dismiss === Swal.DismissReason.cancel) {
        					callCancel(canTitle,canText);
        			 	}
        			});

        		}
        		else
        		{
        			$.ajax({
        	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
        	            type:'get',
        	            success:function(success){
        	            	//alert(success);

        	            	//?????????????????? ????????? ????????????.
         	            	var current=$('iframe[name="ifr"]').attr('src');

         	            	//?????? ????????? ??????????????? ???????????? ??????.
         	            	$.ajax({
         	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
         	            		type:'get',
         	            		success:function(result){
         	            			console.log(result);

         	            			//????????????alert???????????????
         	            			callSuccess(result.ment,'');
//          	            			alert(result.ment);
         	            			$('#leaveTime').text(result.time);

         	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
         	     	            	$('#attBtn').text('????????????');
         	     	            	$('#attBtn').prop("href","#"); //???????????????

         	     	            	if(current=='<%=request.getContextPath()%>/main.do')
         	     	            	{
         	         	            	var mi=document.getElementById('main_iframe');
    			     	            	var mid=mi.contentWindow || mi.contentDocument;
    			     	            	mid.document.getElementById('leaveTime').innerText=result.time;
    			     	            	mid.document.getElementById('attBtn').innerText='????????????';
    			     	            	mid.document.getElementById('attBtn').href="#";
    			     	            	mid.end();
         	     	            	}

         	     	            	clearInterval(inter1);
                	            	clearInterval(inter2);
         	            		},
         	            		error:function(error){
         	            			AjaxErrorSecurityRedirectHandler(error.status);
         	            		}
         	            	});
        	            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
        	            	$('#attBtn').text('????????????');

        	            	var stop1=workTime();
        	            	var stop2=workTime();
        	            	clearInterval(stop1);
        	            	clearInterval(stop2);
        	            },
        	            error:function(error){
        	            	callSuccess(error.responseText,'');
//	        	            	alert(error.responseText);
        	            	//alert(error.status);
        	                //AjaxErrorSecurityRedirectHandler(error.status);
        	            }
        	        });
        		}

        		/* ipcheck confirm ????????? ?????? ??? ?????? ?????? */
        		<%-- if(smooth || confirm('???????????????????????????????'))
            	{
        			$.ajax({
        	        	url:'<%=request.getContextPath()%>/common/IPCheck.do?from='+from,
        	            type:'get',
        	            success:function(success){
        	            	//alert(success);

        	            	//?????????????????? ????????? ????????????.
         	            	var current=$('iframe[name="ifr"]').attr('src');

         	            	//?????? ????????? ??????????????? ???????????? ??????.
         	            	$.ajax({
         	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
         	            		type:'get',
         	            		success:function(result){
         	            			console.log(result);

         	            			//????????????alert???????????????
         	            			callSuccess(result.ment,'');
//          	            			alert(result.ment);
         	            			$('#leaveTime').text(result.time);

         	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
         	     	            	$('#attBtn').text('????????????');
         	     	            	$('#attBtn').prop("href","#"); //???????????????

         	     	            	if(current=='<%=request.getContextPath()%>/main.do')
         	     	            	{
         	         	            	var mi=document.getElementById('main_iframe');
    			     	            	var mid=mi.contentWindow || mi.contentDocument;
    			     	            	mid.document.getElementById('leaveTime').innerText=result.time;
    			     	            	mid.document.getElementById('attBtn').innerText='????????????';
    			     	            	mid.document.getElementById('attBtn').href="#";
    			     	            	mid.end();
         	     	            	}

         	     	            	clearInterval(inter1);
                	            	clearInterval(inter2);
         	            		},
         	            		error:function(error){
         	            			AjaxErrorSecurityRedirectHandler(error.status);
         	            		}
         	            	});
        	            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
        	            	$('#attBtn').text('????????????');

        	            	var stop1=workTime();
        	            	var stop2=workTime();
        	            	clearInterval(stop1);
        	            	clearInterval(stop2);
        	            },
        	            error:function(error){
        	            	alert(error.responseText);
        	            	//alert(error.status);
        	                //AjaxErrorSecurityRedirectHandler(error.status);
        	            }
        	        });
            	} --%>
        	}
        }

        function faceSuccess(from)
        {
        	if(from=="A") //??????
        	{
        		//alert(success);

	            	//?????????????????? ????????? ????????????.
	            	var current=$('iframe[name="ifr"]').attr('src');

	            	//?????? ????????? ??????????????? ???????????? ??????.
	            	$.ajax({
	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
	            		type:'get',
	            		success:function(result){
	            			console.log(result);

	            			//alert????????? ??????
	            			callSuccess(result.ment,'');
// 	            			alert(result.ment);

	            			$('#attTime').text(result.time);

	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
	     	            	$('#attBtn').text('????????????');
	     	            	$('#attBtn').prop("href","javascript:IPCheck('B');"); //???????????????

	     	            	if(current=='/offispace/main.do')
	     	            	{
	     	            		//const url='<%=request.getContextPath()%>/main.do?from='+from;
	         	            	//$('iframe[name="ifr"]').attr("src",url);

	         	            	var mi=document.getElementById('main_iframe');
		     	            	var mid=mi.contentWindow || mi.contentDocument;
		     	            	mid.document.getElementById('attTime').innerText=result.time;
		     	            	mid.document.getElementById('attBtn').innerText='????????????';
		     	            	mid.document.getElementById('attBtn').href="javascript:IPCheck('B');";
		     	            	mid.start();

	     	            	}

	     	            	inter1=setInterval("workTime()",1000);
	     	            	//inter2=setInterval("workTime2()",1000);
	            		},
	            		error:function(error){
	            			AjaxErrorSecurityRedirectHandler(error.status);
	            		}
	            	});

	            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
	            	$('#attBtn').text('????????????');

	            	setInterval("workTime()",1000);
	            	//setInterval("workTime2()",1000);
        	}
        	else //??????
        	{
        		//alert(success);

            	//?????????????????? ????????? ????????????.
	            	var current=$('iframe[name="ifr"]').attr('src');

	            	//?????? ????????? ??????????????? ???????????? ??????.
	            	$.ajax({
	            		url:'<%=request.getContextPath()%>/attend/asyncAttend?from='+from,
	            		type:'get',
	            		success:function(result){
	            			console.log(result);

	            			//alert????????? ??????
	            			callSuccess(result.ment,'');
// 	            			alert(result.ment);

	            			$('#leaveTime').text(result.time);

	            			//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
	     	            	$('#attBtn').text('????????????');
	     	            	$('#attBtn').prop("href","#"); //???????????????

	     	            	if(current=='/offispace/main.do')
	     	            	{
	         	            	var mi=document.getElementById('main_iframe');
		     	            	var mid=mi.contentWindow || mi.contentDocument;
		     	            	mid.document.getElementById('leaveTime').innerText=result.time;
		     	            	mid.document.getElementById('attBtn').innerText='????????????';
		     	            	mid.document.getElementById('attBtn').href="#";
		     	            	mid.end();
	     	            	}

	     	            	clearInterval(inter1);
    	            	clearInterval(inter2);
	            		},
	            		error:function(error){
	            			AjaxErrorSecurityRedirectHandler(error.status);
	            		}
	            	});
            	//?????? ??????????????? ????????????. -> ????????? ?????? ???????????? ?????????????????? ?????? x
            	$('#attBtn').text('????????????');

            	var stop1=workTime();
            	var stop2=workTime();
            	clearInterval(stop1);
            	clearInterval(stop2);
        	}
        }


      //??????????????????
        function homeCheck(from){
        	if(from=="A"){ //??????
        		 $.ajax({
     	        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
     	            type:'get',
     	            success:function(success){
     	            	if(success=='????????????'){
     	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'????????????','750','600');
     	            	}else{
     	            		IPCheck(from);
     	            	}
     	            },
     	            error:function(error){
     	            	alert(error.responseText);
     	            }
     	        });
        	}
        	else{ //??????

        		Swal.fire({
        			  title: '???????????????????????????????',
//         			  text: text,
        			  icon: 'warning',
        			  showCancelButton: true,
        			  confirmButtonText: '??????',
        			  cancelButtonText: '??????',
        			  reverseButtons: false
        			})
        			.then((result) => {
        				if (result.isConfirmed) {
        					$.ajax({
                	        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
                	            type:'get',
                	            success:function(success){
                	            	if(success=='????????????'){
                	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'????????????','750','600');
                 	            	}else{
                 	            		IPCheck(from,true);
                 	            	}
                	            },
                	            error:function(error){
                	            	alert(error.responseText);
                	            }
                	        });
        				} else if ( result.dismiss === Swal.DismissReason.cancel) {
        					callCancel(canTitle,canText);
        			 	}
        			});




        		/* ???????????? ????????????????????????(confirm????????? ?????????) */
        		<%-- if(confirm('???????????????????????????????')){
        			$.ajax({
        	        	url:'<%=request.getContextPath()%>/common/homeCheck.do?from='+from,
        	            type:'get',
        	            success:function(success){
        	            	if(success=='????????????'){
        	            		OpenWindow('<%=request.getContextPath()%>/common/faceRecognition.do?from='+from,'????????????','750','600');
         	            	}else{
         	            		IPCheck(from,true);
         	            	}
        	            },
        	            error:function(error){
        	            	alert(error.responseText);
        	            }
        	        });
            	} --%>
        	}
        }

        var time = 1;
        var inter1;
        var inter2;

        if(!'${attend.attLeavTime}')
        {
        	if('${elapsedTime}')
            {
            	time='${elapsedTime}'*1;
            	inter1=setInterval("workTime()",1000);
             	//inter2=setInterval("workTime2()",1000);
            }
        }

        //?????? ?????????
        function start()
       	{
        	inter1=setInterval("workTime()",1000);
         	//inter2=setInterval("workTime2()",1000);
       	}
        function end()
        {
        	clearInterval(inter1);
        	clearInterval(inter2);
        }


/*         //???????????? ??????
        function workTime2(){
            var hours = Math.floor(time / 3600 );
            var mins = Math.floor(time % 3600 / 60 );
            var secs = time % 3600 % 60;
            if (hours < 10) {
                hours = "0" + hours;
            }
            if (mins < 10) {
                mins = "0" + mins;
            }
            if (secs < 10) {
                secs = "0" + secs;
            }
            document.getElementById("elapsedTime").innerHTML = "<h3>"+hours + ":" + mins + ":" + secs+"</h3>";
        	time++;
        } */

      	//???????????? Bar
        function workTime(){
        	var percent=time/32400*100; //9?????? = 32400???
        	$('#workBar').width(percent+"%");
        }

	</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="messageNotificationForm" type="text/x-handlebars-template">
{{#each .}}
<div class="toast {{important ntImportant}} fade show notificationToast" id="toast{{ntCode}}" data-nt-code="{{ntCode}}" data-nt-msec="{{ntMsec}}" data-nt-set-timeout="N" data-nt-removed="N" role="alert" aria-live="assertive" aria-atomic="true" style="position: relative;">
  <div class="toast-header">
    <i class="mr-2 {{ntIcon}} fa-lg"></i>
    <strong class="mr-auto"> {{ntTitle}}</strong>
    <button data-dismiss="toast" type="button" class="ml-2 mb-1 close notification-close" aria-label="Close" onclick="removeNow('{{ntCode}}');">
      <span aria-hidden="true">??</span>
    </button>
  </div>
  <div class="toast-body">
    <div class="row" >
      <div class="col-lg-3" style="border:none; justify-content:center">
        <div class="image">
          <img src="<%=request.getContextPath() %>/common/getPicture.do?attachSaveName={{ntFrom.attachSavename}}" style="object-fit: cover;
          width: 60px;
          height: 60px;" class="img-size-50 mr-3 img-circle" alt="User Image">
        </div>
      </div>
      <div class="notification-body col-lg-9">
        <p class="text-sm">
          <strong>{{ntFrom.empName}} {{ntFrom.positionValue}}</strong>?????? ?????? {{ntMsg}}<br/>
            ?????? ?????? ???????????????????
        </p>
        <div class="notification-btn-box" style="display:flex; justify-content: space-around">
		  <button type="button" class="btn bg-gradient-primary btn-sm col-lg-4" onclick="fromMsgModal('{{ntCode}}');removeNow('{{ntCode}}');msgRead('{{ntCode}}');">??? ???</button>
          <button type="button" class="btn bg-gradient-secondary btn-sm col-lg-4" onclick="removeNow('{{ntCode}}');">??? ???</button>
        </div>
      </div>
    </div>
  </div>
</div>
{{/each}}
</script>


<script id="noticeNotificationForm" type="text/x-handlebars-template">
{{#each .}}
<div class="bg-maroon fade show notificationToast"
	style="width:100%; font-size: .875rem; background-color: rgba(255,255,255,.85); background-clip: padding-box; border: 1px solid rgba(0,0,0,.1); box-shadow: 0 0.25rem 0.75rem rgb(0 0 0 / 10%); opacity: 0.8; border-radius: 0.25rem;"
	role="alert" aria-live="assertive" aria-atomic="true"
	id="toast{{ntCode}}"
	data-nt-code="{{ntCode}}"
	data-nt-title="{{ntTitle}}"
	data-nt-msec="{{ntMsec}}"
	data-nt-set-timeout="Y"
	data-nt-removed="N">
	<div class="toast-body" style="width:100%" onclick="OpenWindow('{{ntLinkPath}}', '{{ntTitle}}', '950', '830');removeNow('{{ntCode}}');">
		<ion-icon name="{{ntIcon}}"></ion-icon>&nbsp;&nbsp;&nbsp;&nbsp;
    	<strong class="mr-auto">{{ntTitle}}</strong>&nbsp;&nbsp;&nbsp;&nbsp;
		{{ntMsg}}
	</div>
</div>
{{/each}}
</script>


<script id="normalNotificationForm" type="text/x-handlebars-template">
{{#each .}}
<div class="toast {{important ntImportant}} fade show notificationToast" id="toast{{ntCode}}" data-nt-code="{{ntCode}}" data-nt-msec="{{ntMsec}}" data-nt-from-emp-code="{{ntFrom.empCode}}" data-nt-set-timeout="N" data-nt-removed="N" data-nt-title="{{ntTitle}}" role="alert" aria-live="assertive" aria-atomic="true" style="position: relative;">
  <div class="toast-header">
    <i class="mr-2 {{ntIcon}} fa-lg"></i>
    <strong class="mr-auto"> {{ntTitle}}</strong>
    <button data-dismiss="toast" type="button" class="ml-2 mb-1 close notification-close" aria-label="Close" onclick="removeNow('{{ntCode}}');">
      <span aria-hidden="true">??</span>
    </button>
  </div>
  <div class="toast-body">
    <div class="row" >
      <div class="col-lg-3" style="border:none; justify-content:center">
        <div class="image">
          <img src="<%=request.getContextPath() %>/common/getPicture.do?attachSaveName={{ntFrom.attachSavename}}" style="object-fit: cover;
          width: 60px;
          height: 60px;" class="img-size-50 mr-3 img-circle" alt="User Image">
        </div>
      </div>
      <div class="notification-body col-lg-9">
        <p class="text-sm">
          <strong>{{ntFrom.empName}} {{ntFrom.positionValue}}</strong>?????? ?????? {{ntMsg}}<br/>
            ?????? ?????? ???????????????????
        </p>
        <div class="notification-btn-box" style="display:flex; justify-content: space-around">
          <button type="button" class="btn bg-gradient-primary btn-sm col-lg-4" onclick="OpenWindow('{{ntLinkPath}}', '{{ntTitle}}', {{openSize ntCode}});removeNow('{{ntCode}}');">??? ???</button>
          <button type="button" class="btn bg-gradient-secondary btn-sm col-lg-4" onclick="removeNow('{{ntCode}}');">??? ???</button>
        </div>
      </div>
    </div>
  </div>
</div>
{{/each}}
</script>

<script id="headerNotificationForm" type="text/x-handlebars-template">
{{#each .}}
<tr onclick="OpenWindow('{{ntLinkPath}}', '{{ntTitle}}', {{openSize ntCode}}); removeFromHeaderNotificationList('{{ntCode}}');" class="headerNotificationItem" id="listItem{{ntCode}}">
<td style="padding:0;">
	<a class="dropdown-item">
    	<div class="media">
        	<img src="<%=request.getContextPath() %>/common/getPicture.do?attachSaveName={{ntFrom.attachSavename}}"
         	onerror="this.src='<%=request.getContextPath() %>/resources/images/01.jpg'"
         	style="object-fit: cover; width: 40px; height: 40px;" class="img-size-50 mr-3 img-circle" alt="User Image">
        	<div class="media-body">
           	 	<h3 class="dropdown-item-title">
					{{ntTitle}}
           	    	<button data-dismiss="toast" type="button" class="ml-2 mb-1 close notification-close" aria-label="Close" onclick="removeFromHeaderNotificationList('{{ntCode}}');event.stopPropagation();">
				    	<span aria-hidden="true">??</span>
					</button>
           	 	</h3>
           	 	<p class="text-muted" style="font-size: 0.8em;">{{ntFrom.empName }}&nbsp;{{ntFrom.positionValue}}</p>
        	</div>
    	</div>
	</a>
</td>
</tr>
{{/each}}
</script>

<script id="teamAttendListForm" type="text/x-handlebars-template">
<table class="table table-head-fixed text-nowrap teamAttendListTable">
{{#each attendTeamList}}
<tr>
	<td style="padding: 0;">
		<div class="info-box" style="margin: 0px; min-height:70px;">
        	<div class="image" style="width: 50px; height: 50px;">
				<img src="<%=request.getContextPath()%>/common/getPicture.do?attachSaveName={{attachSavename}}" style="object-fit: cover; width: 50px; height: 50px;" class="img-size-50 mr-3 img-circle" alt="User Image">
            </div>
	       <div class="info-box-content" style="height: 50px;">
		   		<span class="info-box-number text-center">{{empName}}&nbsp;{{positionValue}}</span>
		      	<span class="badge badge-primary">{{status attJobStCode}}</span>
		 </div>
       </div>
    </td>
</tr>
{{/each}}
</table>
</script>


<script>
const setAsideOpen = () => {
	if(asideOpen){
		asideOpen = false;
	}else{
		asideOpen = true;
	}
		//console.log(asideOpen);
}


const  getTeamAttendList = () =>{
	fetch('<%=request.getContextPath()%>/attend/getTeamAttendList')
	.then(response => response.json())
	.then(data => {
		console.log('Success:', data);
		printTeamAttendList(data)
	})
	.catch((error) => {
		console.log('Error:', error);
	});
}

const printTeamAttendList = data => {
	Handlebars.registerHelper("status", function(attJobStCode){
		if (this.attJobStCode == null){
			return "?????????";
		}else if(this.attJobStCode == 'AJ0001'){
			return "?????????";
		}else if(this.attJobStCode == 'AJ0002'){
			return "????????????";
		}else if(this.attJobStCode == 'AJ0003'){
			return "?????????";
		}else if(this.attJobStCode == 'AJ0004'){
			return "????????????";
		}else if(this.attJobStCode == 'AJ0005'){
			return "????????????";
		}else if(this.attJobStCode == 'AJ0006'){
			return "?????????";
		}else if(this.attJobStCode == 'AJ0007'){
			return "?????????";
		}else if(this.attJobStCode == 'AJ0008'){
			return "?????????";
		}else{
			return "????????????";
		}
	})

	let target = document.querySelector('.teamAttendListBox');

	if(target.querySelector('.teamAttendListTable') != null){
		target.querySelector('.teamAttendListTable').remove();
	}

	let templateObject = $('#teamAttendListForm');
	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	$(target).append(html)
}


const getHeaderNotificationList = () => {
	let searchType = "headerNotificationList";
	let target = document.querySelector('.headerNotificationListBox');
	let templateObject = $('#headerNotificationForm');
    let from = "headerNotificationList";
	getNotificationList(searchType).then(data=>{
		document.querySelectorAll('.unreadNotiCount').forEach(span=>{
			span.textContent = data.notificationList.length;
		})
		printNotification(data.notificationList,target,templateObject,from);
	});

};

const getInstantNotification = () =>{
  let searchType = "instantNotification";
  let target =  document.querySelector('#toastsContainerTopRight');
  let noticeTarget = document.querySelector('#toastsContainerTopLeft')
  let templateObject = $('#normalNotificationForm');
  let from ="instantNotification";

  getNotificationList(searchType).then(data=>{
    if(data.notificationList.length != null){
      let messageList = new Array();
      let normalList = new Array();
	  let noticeList = new Array();

      for(i=0; i<data.notificationList.length; i++){
	        let ntCode = data.notificationList[i].ntCode

	        if(ntCode.substring(0,2)=="MG"){
	        	messageList.push(data.notificationList[i]);
	        }else if(ntCode.substring(0,2)=="WN"||ntCode.substring(0,2)=="TN"){
	        	noticeList.push(data.notificationList[i]);
	        }else{
	        	normalList.push(data.notificationList[i]);
	        }

      }
        printNotification(messageList,target,$('#messageNotificationForm'),from);
        printNotification(noticeList,noticeTarget,$('#noticeNotificationForm'),from);
      	printNotification(normalList,target,templateObject,from);

      	document.querySelectorAll('.notificationToast').forEach(noti=>{
    	if(noti.dataset.ntSetTimeout =="N"){
	        let ntCode = noti.dataset.ntCode;
	        let ntMsec = noti.dataset.ntMsec;
	        notiTimeout(ntCode, ntMsec);
	        noti.dataset.ntSetTimeout="Y";
    	}
      })
    }
  });

}



const printNotification = (data, target,templateObject, from) => {
	if (from == "headerNotificationList"){
		document.querySelectorAll('.headerNotificationItem').forEach(item=>{
			item.remove();
		})
	}

	Handlebars.registerHelper("important", function(ntImportant){
		if (this.ntCode.substring(0,2)=="WF"){
			if(this.ntTitle =="???????????? ?????? ??????")	{
				return "bg-warning";
			}else{
				return "bg-danger";
			}
		}else{
			if (ntImportant == 'Y'){
				return "bg-info";
			}else{
				return "";
			}
		}
	});
	Handlebars.registerHelper("openSize", function(ntCode){
		if(ntCode.substring(0,2)=="VC"){
			return "'810', '450'";
		}else{
			return "'900', '875'";
		}
	});

	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	$(target).append(html)
};

const getNotificationList = searchType => {
	return new Promise(resolve=> {
		fetch('<%=request.getContextPath()%>/notification/list?searchType='+searchType)
		.then(response => response.json())
		.then(data => {
			resolve(data);
		});
	});
};

const removeFromHeaderNotificationList = ntCode =>{
	if(document.querySelectorAll('.headerNotificationItem').length == 0){
		callCustomAlert('?????? ?????? ????????? ????????????.',' ','warning');
		return;
	}

 	if(ntCode == 'all'){
		Swal.fire({
			  title: "?????? ?????? ?????? ",
			  text: "?????? ?????? ?????? ???????????????????",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: '??????',
			  cancelButtonText: '??????',
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					//??????
					confirmNoti(ntCode);
					callSuccess("?????????????????????","");
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					//??????
					callCancel("?????????????????????.","");
			 	}
			});
	}else{
		confirmNoti(ntCode);
	}
}

const removeNow = ntCode => {
	let target = document.querySelector('#toast'+ntCode);
	/* ?????? ????????? ?????? ???????????? ??????  */
	target.dataset.ntRemoved="Y";
    target.remove();
    confirmNoti(ntCode);
}

const confirmNoti = ntCode =>{
	fetch ('<%=request.getContextPath()%>/notification/modifyNotiConfirmed?ntCode='+ntCode)
	.then(data=>{
		console.log('Success:', data);
		getHeaderNotificationList();
	})
	.catch((error)=>{
		console.log('Error:', error);
	})
}

const notiTimeout = (ntCode,time) => {
	let target = document.querySelector('#toast'+ntCode);
    console.log(target);
   	setTimeout(function(){
   		/*  ?????? ????????? ???????????? ?????? ???????????? ?????? */
   		if(target.dataset.ntRemoved=="N"){
   			target.dataset.ntRemoved="Y";
	    	target.remove();
    	  	getHeaderNotificationList();
    	  	/*  ??? ????????? ???????????? ?????? ????????? ???, ????????? ????????? ????????????. */

			if(ntCode.substring(0,2)=="WF"&&target.dataset.ntTitle =="???????????? ?????? ??????"){
		 		/* ??????????????? ????????? ?????? ????????? */
		 		let formData = new FormData();
		 		formData.append("empCode",target.dataset.ntFromEmpCode);
		 		formData.append("ntFromEmpCode",'${loginUser.empCode}');
		 		formData.append("ntCode",target.dataset.ntCode);
		 		formData.append("ntTitle","??????????????? ????????????");
		 		formData.append("ntMsg","??????????????? ?????? ?????? ????????? ????????????.");
		 		formData.append("ntLinkPath","attend/answerPage.do");
		 		formData.append("ntMsec",15*60*1000)
		 		formData.append("ntImportant","Y");

		 		registerNotification(formData);

		 		/* ???????????? ????????? ?????? ????????? */
		 		let formDataForMe = new FormData();
		 		formDataForMe.append("ntFromEmpCode",target.dataset.ntFromEmpCode);
		 		formDataForMe.append("empCode",'${loginUser.empCode}');
		 		formDataForMe.append("ntCode",target.dataset.ntCode);
		 		formDataForMe.append("ntTitle","???????????? ?????? ?????? ??????");
		 		formDataForMe.append("ntMsg","???????????? ?????? ????????? ????????? ?????? ???????????????.");
		 		formDataForMe.append("ntLinkPath","attend/answerPage.do");
		 		formDataForMe.append("ntMsec",15*60*1000);
		 		formDataForMe.append("ntImportant","Y");

		 		registerNotification(formDataForMe);
		   }
   		}
   	}, time)
}
/*  ?????? ?????? */
const registerNotification = (formData) => {
	console.log('??????');
	fetch('<%=request.getContextPath()%>/notification/registerNotiFromNoti',{
			method:'POST',
			headers:{},
			body: formData,
		})
		.then(data => {
			console.log('Success:', data);
		})
		.catch((error) => {
			console.log('Error:', error);
		});
}


/*  ????????? ?????? ?????????????????? */
const setTooltips = () => {
	 $('.tooltipCaller').tooltip();
	  let tooltips = document.querySelectorAll('.tooltipCaller');
	  tooltips.forEach(tooltip=>{
		  let empName = tooltip.dataset.empName;
	  	  let empTelephone = tooltip.dataset.empTelephone;
	  	  let empEmail = tooltip.dataset.empEmail;
	  	  let positionValue = tooltip.dataset.positionValue;
	  	  let teamValue = tooltip.dataset.teamValue;
	  	  let groupValue = tooltip.dataset.groupValue;
	      let attachSavename = tooltip.dataset.attachSavename;
		  let imgSrc = "<%=request.getContextPath() %>/resources/images/01.jpg"
	      if(attachSavename != ""){
	      	imgSrc = "<%=request.getContextPath() %>/common/getPicture.do?attachSaveName="+attachSavename;
	      }
	      //console.log(empName, empTelephone, empEmail, positionValue, teamValue, groupValue,imgSrc);
		  let content = setContent(empName, empTelephone, empEmail, positionValue, teamValue, groupValue, imgSrc);
		  //console.log(content);
		  tooltip.dataset.originalTitle = content;
	  });

};


const setContent = (empName, empTelephone, empEmail, positionValue, teamValue, groupValue, imgSrc) => {

let content = `
<div class="card" >
   <div class="card-body" >
	    <div class="row firstRow">
	        <div class="col-lg-4 text-center">
	        <img src="`+imgSrc+`"
	  			class="img-size-50 mr-3 img-circle" alt="User Image">
	        </div>
	        <div class="col-lg-8">
	        	<p class="text-muted text-sm">`+empName+`&nbsp;`+positionValue+`</p>
	            <p class="text-muted text-sm">`+teamValue+`</p>

	        </div>
	    </div>
	    <div class="row" >
	        <ul class="ml-4 mb-0 fa-ul text-muted">
		        <li><span class="fa-li" ><i class="fas fa-envelope text-muted"></i></span>`+empEmail+`</li>
	    	    <li><span class="fa-li" ><i class="fas fa-phone text-muted"></i></span>`+empTelephone+`</li>
	    	</ul>
	    </div>
   </div>
</div>`;

return content;
}

/*  ?????? ?????? ?????? ???????????? */
const loaderShow = () => {
	document.querySelector(".tab-loading").style.display="";
}
const loaderHide = () => {
	document.querySelector(".tab-loading").style.display="none";
}
/* UI??? ????????? ?????????  */
const callCustomAlert = (title, text, icon)=>{
	Swal.fire({
		  title: title,
		  icon: icon,
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}

const callSuccess = (title, text) => {
	Swal.fire({
		  title: title,
		  icon: 'success',
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}
const callCancel = (title, text) => {
	Swal.fire({
		  title: title,
		  icon: 'error',
		  text: text,
		  showConfirmButton: false,
		  timer: 1500
		});
}

const callFail = () => {
	Swal.fire({
		  title: "?????? ??????",
		  icon: 'error',
		  text: "????????? ??????????????? ????????? ??? ????????????.",
		  showConfirmButton: false,
		  timer: 1500
		});
}
const callConfirmSimple =  (title, text, conText,canText) => {
	 Swal.fire({
		  title: title,
		  text: text,
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: conText,
		  cancelButtonText: canText,
		  reverseButtons: false
		});
}
const callConfirm = (title,text,conTitle,conText,canTitle,canText) => {
	Swal.fire({
	  title: title,///????????? ?????? ??????
	  text: text,//????????? ?????? ??????
	  icon: 'warning',//????????????
	  showCancelButton: true,
	  confirmButtonText: '??????',//????????? ?????? ??????
	  cancelButtonText: '??????',//????????? ?????? ??????
	  reverseButtons: false
	})
	.then((result) => {
		if (result.isConfirmed) {
			//?????? ??????????????? ?????????
			//callSuccess(conTitle,conText);
		} else if ( result.dismiss === Swal.DismissReason.cancel) {
			// ?????? ???????????? ??????//
			//callCancel(canTitle,canText);
	 	}
	});
}

</script>


</body>