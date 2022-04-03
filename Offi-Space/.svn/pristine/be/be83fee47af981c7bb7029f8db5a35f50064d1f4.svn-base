<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 400px;">
		<section class="content-header">
			<form role="form" method="post" action="modify.do" name="modifyForm">
				<input type="hidden" name="scdCode" value="${scheduler.scdCode }" />
				<input type="hidden" name="scdAllday" value="${scheduler.scdAllday }" />
				<div class="container-fluid">
					<div class="card card-default">
						<div class="card-header">
							<h1 class="card-title" onclick="dataGo()">일정 수정</h1>

							<div class="card-tools">
								<button type="button" id="modifyBtn"
									class="btn btn-primary btn-sm" onclick="modify_go();">수정</button>
								<button type="button" id="backBtn"
									class="btn btn-default btn-sm" onclick="history.go(-1)">이전</button>
							</div>
						</div>
						<div class="card-body" style="padding-top: 10px;">
							<div class="form-group row" style="margin-bottom: 5px;">
                  				<label for="importantCheck" class="col-sm-2 col-form-label">중요 여부</label>
                  				<div class="col-sm-6 d-flex align-items-center">
                    				<div class="" style="display: inline-block;">
                    					<input type="checkbox" id="importantCheck" name="scdImport" ${scheduler.scdImport eq 'Y' ? 'checked' : '' } value="" onchange="import_go();"/>
                      					<label for="importantCheck" style="margin: 0; font-weight: 300;">중요</label>
                    				</div>
                  				</div>
                			</div>
							<div class="form-group">
								<label for="startDate">일정 시작일</label>
								<input type="date" class="form-control" id="startDate" name="scdStartDt"
									value="<fmt:formatDate value="${scheduler.scdStartDt}" pattern="yyyy-MM-dd" />" />
							</div>
							<div class="form-group">
								<label for="endDate">일정 종료일</label> 
								<input type="date" class="form-control" id="endDate" name="scdEndDt"
									value="<fmt:formatDate value="${scheduler.scdEndDt}" pattern="yyyy-MM-dd" />" />
							</div>
							<div class="form-group" ${scheduler.scdAllday eq 'Y' ? 'style="display: none;"' : '${scheduler.scdStartDt}' }>
								<label for="startTime">일정 시작시간</label> 
								<input type="time" class="form-control" id="startTime" name="scdStartTime"
									value="<fmt:formatDate value="${scheduler.scdStartDt}" pattern="HH:mm:ss" />" />
							</div>
							<div class="form-group" ${scheduler.scdAllday eq 'Y' ? 'style="display: none;"': '${scheduler.scdEndDt}' }>
								<label for="endTime">일정 종료시간</label> 
								<input type="time" class="form-control" id="endTime" name="scdEndTime"
									value="<fmt:formatDate value="${scheduler.scdStartDt}" pattern="HH:mm:ss" />" />
							</div>
							<div class="form-group">
								<label for="title">제목</label> 
								<input type="text" class="form-control" id="title" name="scdTitle"
									value="${scheduler.scdTitle }" />
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" rows="4" style="resize: none;"
									id="scdContent" name="scdContent">${scheduler.scdContent }</textarea>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</form>
		</section>
	</div>
	
<script>
/* 중요여부체크 */
function import_go() {
		console.log($('#importantCheck').is(':checked'))
		if($('#importantCheck').is(':checked') == true){
			$('#importantCheck').attr('checked');
			//$('#importantCheck').val('Y');
		}
		
		if($('#importantCheck').is(':checked') == false){
			$('#importantCheck').removeAttr('checked');
			//$('#importantCheck').val('N');
		}
	}
function modify_go(){
	var form=$('form[role="form"]');
	form.submit();
}

function dataGo() {
	$('#startDate').val('2022-03-05');
	$('#endDate').val('2022-03-05');
}
</script>
	
</body>
</html>