<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
	<style>
		.box {
			width: 100%;
			height: 100%;
			border-radius: 5px;
			box-shadow: 0 2px 30px rgba(black, .2);
			background: lighten(#f0f4c3, 10%);
			position: relative;
			transform: translate3d(0, 0, 0);
			padding-top: 11%;
		}
		
		.wave {
			opacity: .4;
			position: absolute;
			top: 10%;
			left: 50%;
			background: #0af;
			width: 500px;
			height: 500px;
			margin-left: -250px;
			/* margin-top: -250px; */
			transform-origin: 50% 48%;
			border-radius: 43%;
			animation: drift 3000ms infinite linear;
		}
		
		.wave.-three {
			animation: drift 5000ms infinite linear;
		}
		
		.wave.-two {
			animation: drift 7000ms infinite linear;
			opacity: .1;
			background: yellow;
		}
		
		.box:after {
			content: '';
			display: block;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background: linear-gradient(to bottom, rgba(#e8a, 1), rgba(#def, 0) 80%,
				rgba(white, .5));
			z-index: 11;
			transform: translate3d(0, 0, 0);
		}
		
		.titlely {
			position: absolute;
			z-index: 1;
			padding-left: 42%;
		/* 	padding-top: 1%; */
		}
		
		@keyframes drift {
		  from { transform: rotate(0deg); }
		  from { transform: rotate(360deg); }
		}
	</style>
</head>

<body>
	<!-- <script>
        location.href="http://localhost:3000/";
    </script> -->

	<div class="content-wrapper" style="min-height: 900px;">

		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>화상회의</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">화상회의</a></li>
							<li class="breadcrumb-item active">메인</li>
						</ol>
					</div>
				</div>
			</div>
		</section>

		<section class="content">

			<div class='box'>
				<div class='wave -one'></div>
				<div class='wave -two'></div>
				<div class='wave -three'></div>
				<div class='titlely'>
				
					<div class="d-flex justify-content-center">
						<img alt="" src="<%=request.getContextPath()%>/resources/images/화상회의.png" style="width: 180px; padding-bottom: 25px;">
					</div>
<!-- 					<p> -->
<!-- 						화상회의에 참여하시려면<br />원하는 방 번호 입력 후 &nbsp;<i class="fas fa-video"></i>를 click 하세요. -->
<!-- 					</p> -->
					<input id="roomNumber" class="form-control" type="text" placeholder="방 번호 입력" style="border-radius: 5px 5px 0px 0px; text-align: center;">
					<button type="button" class="btn btn-block btn-light" onclick="enter();" style="border-radius: 0px 0px 5px 5px;">
<!-- 						<i class="fas fa-video"></i> -->입장하기
					</button>
					
					<br/>
					<button type="button" class="btn btn-block btn-light" onclick="openInvite();">
						초대하기
					</button>
				</div>
			</div>

		</section>
	</div>


	<script>
        var opening;
        
        //방 입장하기
        function enter() {
            const room = $('#roomNumber').val();
            opening = window.open('https://192.168.143.5/run?room='+room, '화상회의', 'width=810,height=450');
        } 
        
        // 초대하기
        function openInvite(){
        	OpenWindow('<%=request.getContextPath()%>/videoConference/invite', '초대하기', '460', '615');
        }
    </script>

</body>