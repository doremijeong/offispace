<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="card card-default">
					<div class="card-header">
						<h1 class="card-title">
							<div class="icheck-primary" ${scheduler.scdImport eq 'Y' ? 'style="display: inline;"' : 'style="display: none;"' }>
								<i class="fas fa-exclamation" style="color: red;"></i>
							</div>
							일정상세보기
						</h1>

						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-warning btn-sm" onclick="modify_go();">수정</button>
							<button type="button" id="removeBtn" class="btn btn-danger btn-sm" onclick="remove_go();">삭제</button>
							<button type="button" id="closeBtn" class="btn btn-info btn-sm" onclick="CloseWindow();">닫기</button>
						</div>
					</div>
					<div class="card-body" style="padding-top: 10px;">
						<!-- 						<div class="form-group" style="padding-top: 20px;"> -->
						<%-- 							<div class="icheck-primary" ${scheduler.scdImport eq 'Y' ? 'style="display: inline;"' : 'style="display: none;"' }> --%>
						<!-- 								<p for="importantCheck" style="font-weight: bold;"> -->
						<!-- 									중요<i class="fas fa-exclamation" style="color: red;"></i> -->
						<!-- 								</p> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<div class="form-group">
							<label for="startDt">일정 시작일</label>
							<input type="date" class="form-control" id="scdStartDt" readonly value='<fmt:formatDate value="${scheduler.scdStartDt}" pattern="yyyy-MM-dd"/>' />
						</div>
						<div class="form-group">
							<label for="endDt">일정 종료일</label>
							<input type="date" class="form-control" id="scdEndDt" readonly value="<fmt:formatDate value="${scheduler.scdEndDt}" pattern="yyyy-MM-dd"/>" />
						</div>
						<div class="form-group" ${scheduler.scdAllday eq 'Y' ? 'style="display: none;"' : '${scheduler.scdAllday}' }>
							<label for="startTime">일정 시작시간</label>
							<input type="time" class="form-control" id="startTime" readonly value='<fmt:formatDate value="${scheduler.scdStartDt}" pattern="HH:mm:ss"/>' />
						</div>
						<div class="form-group" ${scheduler.scdAllday eq 'Y' ? 'style="display: none;"' : '${scheduler.scdAllday}' }>
							<label for="endTime">일정 종료시간</label>
							<input type="time" class="form-control" id="endTime" readonly value='<fmt:formatDate value="${scheduler.scdEndDt}" pattern="HH:mm:ss"/>' />
						</div>
						<div class="form-group">
							<label for="title">제목</label>
							<input type="text" class="form-control" id="title" readonly value="${scheduler.scdTitle }" />
						</div>
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" rows="4" style="resize: none;" id="scdContent" readonly>${scheduler.scdContent }</textarea>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</section>
	</div>

	<form role="form">
		<input type="hidden" name="scdCode" value="${scheduler.scdCode }" />
		<input type="hidden" name="scdImport" value="${scheduler.scdImport }" />
	</form>
	<script>
var formObj = "";
window.onload=function(){
	formObj = $("form[role='form']");
	
	if(${param.from eq 'modify'}){	
		
		callSuccess('수정되었습니다.','');
	// 		alert('수정되었습니다.');
	}
	
	if(${from eq 'remove'}){
		
		Swal.fire({
			  title: '삭제되었습니다.',
//	 		  text: text,
			  icon: 'success',
// 			  showCancelButton: true,
			  confirmButtonText: '확인',
// 			  cancelButtonText: '취소',
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					window.opener.location.reload();
					window.close();
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					callCancel(canTitle,canText);
			 	}
			});
// 		alert('삭제되었습니다.');
// 		window.opener.location.reload();
// 		window.close();
		}

}
function modify_go(){
	formObj.attr('action','modifyForm.do').submit();
}

function remove_go(){
	
	Swal.fire({
		  title: "정말 삭제하시겠습니까?",
// 		  text: text,
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '확인',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				formObj.attr({'action':'remove.do','method':'post'}).submit();
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel(canTitle,canText);
		 	}
		});
// 	var answer = confirm("정말 삭제하시겠습니까?");
// 	if(answer) formObj.attr({'action':'remove.do','method':'post'}).submit();
	
}



</script>
</body>
