<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.select2-selection {
	padding-bottom : 3px;
}
#msgReplyTo:disabled {
	background-color: white;
}

</style>


<!-- 쪽지 쓰기 Modal -->
<div class="modal" id="modal-default" tabindex="-1" role="dialog"	aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
	<form role="form" method="post" action="sendMsg" name="sendForm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header d-flex flex-column" style="padding-bottom: 8px; border-bottom: none;">
					<input type="hidden" class="form-control" name="msgFrom" value="${loginUser.empId}">
					<input type="hidden" class="form-control" name="msgFromName" value="${loginUser.empName}">
					<input type="hidden" class="form-control" name="msgFromPosition" value="${loginUser.positionValue}">
					<input type="hidden" class="form-control" name="msgFromTeam" value="${loginUser.teamValue}">

					<div class="col-sm-12 d-flex flex-row p-0">
						<div class="col-sm-6 p-0">
							<label>받는사람 : </label>
						</div> <!--mailbox-controls-->
						
						<div class="col-sm-6 p-0 text-right">
							<input type="checkbox" id="check1"> 
							<input type="hidden" id="chkImp1" name="msgImpt"> 
							<label>중요 <i class="fas fa-exclamation text-danger"></i></label> &nbsp; 
						</div>
					</div> <!--row-->
					
					
					<div class="select2-blue" style="width: 100%; padding-bottom:0px;">
						<select class="select2 sendSelect2" multiple="multiple"	name="msgTo" data-maximum-selection-length="1">
							<c:if test="${!empty empList}">
								<c:forEach items="${empList}" var="emp">
									<c:if test="${(emp.empId).indexOf('EMP') ne 0 && emp.empId ne loginUser.empId}">
										<option value="${emp.empId}">${emp.empName}&nbsp;${emp.positionValue}&nbsp;[${emp.teamValue}]</option>
									</c:if>
								</c:forEach>
							</c:if>
						</select> 
					</div>
				</div> <!--header-->

				<div class="modal-body" style="padding-top: 8px; padding-bottom: 10px;">
					<div style="border: 1px solid lightgray; border-radius: 5px;">
						<textarea id="msgTextarea" name="msgContent" class="form-control" rows="8"	style="resize: none; border: none;" maxlength="200"></textarea>
						<div class="textLengthWrap float-right"> 
							<p class="textCount m-1" style="display: inline-block;">0</p><p class="textTotal m-1" style="display: inline-block;">/&nbsp;&nbsp;150</p> 
						</div>
					</div>
				</div>
				
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" onclick="resetMsgModal(this);">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary" onclick="sendMsg();">보내기</button>
				</div>
				
			</div>
		</div>
	</form>
</div>
<!--modal -->

<!-- =============================================================================== -->

<!-- 받은 쪽지 Modal -->
<div class="modal" id="modal-from" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"	data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="padding-bottom: 7px;">

				<div class="row col-12 p-0">
					<p id="msgCode" style="margin:0px; visibility:hidden; position:absolute;" ></p> 
					<p id="msgFromId" style="margin:0px; visibility:hidden; position:absolute;" ></p> 
					<div class="col-md-12 input-group input-group-sm d-flex align-items-center">
						<p id="msgImpt" style="margin: 0px;"></p> 
						<b>보낸사람&nbsp;&nbsp;:&nbsp;</b>&nbsp;&nbsp; 
						<p id="msgFrom" style="margin: 0px;" class="text-black"><!-- 보낸사람 이름자 자리--></p>
						<p id="msgFromPosition" style="margin: 0px;"><!-- 보낸사람 팀 자리--></p>
						<p id="msgFromTeam" style="margin: 0px;"><!-- 보낸사람 직급 자리--></p>
					</div>
					<div>
						&nbsp; <span id="msgDate" class="text-gray"><!-- 날짜 들어가는 자리 --></span>
					</div>

				</div><!-- row -->
			</div> <!--header-->
			
			<div class="modal-body" style="padding-top : 7px;">
				<div id="msgFromContent" style="border: 1px solid lightgray; height: 250px; border-radius: 5px; padding: 10px;">
					<!-- 내용 들어가는 자리 -->
				</div>
			</div> <!--modal-body-->
			
			<div class="modal-footer d-flex justify-content-between">
				<div>
					<button type="button" class="btn btn-default btn-md" onclick="moveToBin();">
						<span>삭제</span>
					</button>
					<button type="button" class="btn btn-default btn-md" id="closeFromBtn" data-dismiss="modal" aria-label="Close" onclick="window.location.reload();">
						<span aria-hidden="true">닫기</span>
					</button>
				</div>
				<div>
					<button type="button" class="btn btn-primary btn-md" onclick="replyMsg(document.getElementById('msgFromId').textContent, document.getElementById('msgFrom').textContent, document.getElementById('msgFromPosition').textContent, document.getElementById('msgFromTeam').textContent, document.getElementById('msgFromContent').textContent)">
						답장
					</button>
				</div>
			</div>
		</div>
	</div>
</div> <!--modal -->


<!-- =============================================================================== -->

<!-- 보낸 쪽지 Modal -->
<div class="modal" id="modal-to" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"	data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="padding-bottom: 7px;">

				<div class="row col-12 p-0">
					<p id="msgToCode" style="margin:0px; visibility:hidden; position:absolute;" ></p> 
					<p id="msgToId" style="margin:0px; visibility:hidden; position:absolute;" ></p> 
					<div class="col-md-12 input-group input-group-sm d-flex align-items-center">
						<p id="msgImpt" style="margin: 0px;"></p> 
						<b>받는사람&nbsp;&nbsp;:&nbsp;</b>&nbsp;&nbsp; 
						<p id="msgTo" style="margin: 0px;" class="text-black"><!-- 받는사람 이름자 자리--></p>
						<p id="msgToPosition" style="margin: 0px;"><!-- 받는사람 팀 자리--></p>
						<p id="msgToTeam" style="margin: 0px;"><!-- 받는사람 직급 자리--></p>
					</div>
					<div>
						&nbsp; <span	id="msgDate" class="text-gray"><!-- 날짜 들어가는 자리 --></span>
					</div>

				</div><!-- row -->
			</div> <!--header-->
			
			<div class="modal-body" style="padding-top : 15px;">
				<div id="msgContent" style="border: 1px solid lightgray; height: 250px; border-radius: 5px; padding: 10px;">
					<!-- 내용 들어가는 자리 -->
				</div>
			</div> <!--modal-body-->
			
			<div class="modal-footer d-flex justify-content-start">
				<button type="button" class="btn btn-default" onclick="moveToBin2();">
					<span>삭제</span>
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">닫기</span>
				</button>
			</div>
		</div>
	</div>
</div> <!--modal -->

<!-- =============================================================================== -->

<!-- 쪽지 답장 Modal -->
<div class="modal" id="modal-reply" tabindex="-1" role="dialog"	aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
	<form role="form" method="post" action="sendMsg" name="sendReplyForm">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header d-flex flex-column" style="padding-bottom: 8px; border-bottom: none;">
					<input type="hidden" class="form-control" name="msgFrom" value="${loginUser.empId}">
					<input type="hidden" class="form-control" name="msgFromName" value="${loginUser.empName}">
					<input type="hidden" class="form-control" name="msgFromPosition" value="${loginUser.positionValue}">
					<input type="hidden" class="form-control" name="msgFromTeam" value="${loginUser.teamValue}">

					<div class="col-sm-12 d-flex flex-row p-0">
						<div class="col-sm-6 p-0">
							<label>받는사람 : </label>
						</div> <!--mailbox-controls-->
						
						<div class="col-sm-6 p-0 text-right">
							<input type="checkbox" id="check2"> 
							<input type="hidden" id="chkImp2" name="msgImpt"> 
							<label>중요 <i class="fas fa-exclamation text-danger"></i></label> &nbsp; 
						</div>
					</div> <!--row-->
					
					
					<div style="width: 100%; padding-bottom:0px;">
						<input id="msgReplyId" name="msgTo" type="hidden" class="form-control" name="msgTo" style="width: 100%;">
						<input id="msgReplyTo" class="form-control" style="width: 100%;" disabled>
						<!-- <button type="button" class="btn btn-primary btn-xs">주소록</button> -->
					</div>
				</div> <!--header-->

		
			<div class="modal-body" style="padding-top: 8px; padding-bottom: 10px;">
					<div style="border: 1px solid lightgray; border-radius: 5px;">
						<textarea id="replyMsgTextarea" name="msgContent" class="form-control" rows="8"	style="resize: none; border: none;" maxlength="200"></textarea>
						<div class="textLengthWrap float-right"> 
							<p class="textCount m-1" style="display: inline-block;">0</p><p class="textTotal m-1" style="display: inline-block;">/&nbsp;&nbsp;150</p> 
						</div>
					</div>
				</div>
			
				
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" onclick="location.reload();">
						<span aria-hidden="true">닫기</span>
					</button>
					<button type="button" class="btn btn-primary" onclick="sendReplyMsg()">보내기</button>
				</div>
				
			</div>
		</div>
	</form>
</div>
<!--modal -->


