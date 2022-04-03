<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style>
input{
	border: none;
	background-color: white;
	color: black;
}
.textarea-input{
	border: none;
	background-color: white;
	color: black;
}
.textarea-input:disabled{
	background-color: white;
}
</style>
</head>
<body>
	<div class="content-wrapper" style="margin: 0px; height: auto;" >

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="card card-default card-outline">
					<div class="card-header d-flex justify-content-end">
						<div class="btn-group">
							<button class="btn btn-default btn-sm" onclick="javascript:CloseWindow();">닫기</button>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body reportDocMarkup">


						<!-- 양식 들어올 자리 -->
						${approvalForm.apvFormMarkup}

					</div>
					<!-- /.card-body -->
					<!-- <div class="card-footer">

				</div> -->
					<!-- /.card-footer -->
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script>
window.onload = function(){

	$('input').prop('disabled',true);
	$('textarea').prop('disabled',true);

}
</script>
</body>