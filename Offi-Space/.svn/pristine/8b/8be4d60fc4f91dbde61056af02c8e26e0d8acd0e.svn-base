<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>업무 담당자 관리</title>
<body>
	<!-- Content Header (Page header) -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>업무 담당자 관리 </h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">업무 담당자 관리 </li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">

				<!-- 마진을 위한 div -->
				<div style="height: 0px;"></div>

				<!-- compressed list -->
				<div class="row">


					<div class="col-lg-12">
						<div class="card card-info card-outline">
							<div class="card-header p-0 border-bottom-0"></div>
							<div class="card-body">
								<!-- 내부 card -->
								<div class="">
									<div class="card-header">
										<h3 class="card-title">업무담당자 관리 </h3>
										<div class="card-tools">
										<button type="button" class="btn btn-outline-info btn-sm msg-modal" data-toggle="modal" data-target="#modal-registerJobcode">
											업무 생성 </button>
										<button type="button" class="btn btn-outline-secondary btn-sm msg-modal" onclick="openModifyModal();">
											업무 관리 </button>
										</div>
									</div>
									<!-- /.card-header -->
									<div class="card-body text-center" style="padding-bottom: 0;">
										<table class="table table-sm">
										<colgroup>
											<col width="3%">
											<col width="12%">
											<col width="40%">
											<col width="15%">
											<col width="30%">
										</colgroup>
											<thead>
												<tr style="text-align: center;">
													<th>
														<button type="button" class="btn btn-default btn-md checkbox-toggle">
																<i class="far fa-square"></i>
														</button>
													</th>
													<th>업무코드</th>
													<th>업무명</th>
													<th>업무 담당자</th>
													<th>업무 협조자</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="item" items="${jobStakeholderList}">
													<tr onclick="selectJobcode(this);">
														<td style="text-align: center;">
															<input type="checkbox" name="checkSelect"
															data-jobcode-name="${item.jobcodeName}"
															data-jobcode-code='${item.jobcodeCode}'
															data-job-charger-emp-code='${item.jobCharger.empCode}'
															data-job-assistants='<c:forEach var="jobAssistant" items="${item.jobAssistants}">/${jobAssistant.empCode }</c:forEach>' class="checkSelect" style="margin: 5px;">
														</td>
														<td style="text-align: center;">${item.jobcodeCode}</td>
														<td>${item.jobcodeName}</td>
														<td>${item.jobCharger.empName}&nbsp;${item.jobCharger.positionValue} </td>
														<td>
															<c:forEach var="jobAssistant" items="${item.jobAssistants}">
																${jobAssistant.empName}&nbsp;${jobAssistant.positionValue }&nbsp;
															</c:forEach>
														</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /. 내부 card -->
							</div>
						</div>
						<!-- /.card -->

					</div>

				</div>
				<!-- ./row -->
				<!-- ./compressed list -->


			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>



	<div class="modal fade" id="modal-registerJobcode" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form id="registerJobcodeForm">
	            <div class="modal-header">
	              <h4 class="modal-title" onclick="autoInput();">업무 생성</h4>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">×</span>
	              </button>
	            </div>
	            <div class="modal-body">
	              <div class="form-group">
	                  <label for="jobcodeName">이름 </label>
	                  <input type="text" class="form-control" name="jobcodeName" placeholder="업무명을 입력하세요. ">
	               </div>
	               <div class="form-group">
	                  <label>업무담당자 </label>
	                  <select class="form-control select2 select2-hidden-accessible jobCharger" name="jobCharger" style="width: 100%;"  data-placeholder="업무 담당자를 입력하세요." tabindex="-1" aria-hidden="true">
	                    <option></option>
	<c:if test="${!empty teamEmpList}">
	<c:forEach items="${teamEmpList}" var="emp">
						<option value="${emp.empCode}">${emp.empName}&nbsp;${emp.positionValue }</option>
	</c:forEach>
	</c:if>
	                    </select>
	                </div>
	                <div class="form-group">
	                  <label>업무협조자</label>
	                  <select class="select2bs4 select2-hidden-accessible jobAssistants" name="jobAssistants[]" multiple="multiple" data-placeholder="업무 협조자를 입력하세요." style="width: 100%;"  tabindex="-1" aria-hidden="true">

	<c:if test="${!empty teamEmpList}">
	<c:forEach items="${teamEmpList}" var="emp">
						<option value="${emp.empCode}">${emp.empName}&nbsp;${emp.positionValue }</option>
	</c:forEach>
	</c:if>
	                  </select>
	                </div>
	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal" onclick="formReset();">취소</button>
	              <button type="button" onclick="registerJobcode();" class="btn btn-info">등록</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>


	<div class="modal fade" id="modal-modifyJobcode" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form id="modifyJobcodeForm">
	            <div class="modal-header">
	              <h4 class="modal-title">업무 관리</h4>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">×</span>
	              </button>
	            </div>
	            <div class="modal-body">
	              <div class="form-group">
	                  <label for="jobcodeName">이름 </label>
	                  <input type="hidden" name="jobcodeCode">
	                  <input type="text" class="form-control" name="jobcodeName" placeholder="업무명을 입력하세요. ">
	               </div>
	               <div class="form-group">
	                  <label>업무담당자 </label>
	                  <select class="form-control select2 select2-hidden-accessible jobChargerModify"  name="jobCharger" style="width: 100%;"  data-placeholder="업무 담당자를 입력하세요." tabindex="-1" aria-hidden="true">
	                    <option></option>
	<c:if test="${!empty teamEmpList}">
	<c:forEach items="${teamEmpList}" var="emp">
						<option class="jobChargerOptions" value="${emp.empCode}">${emp.empName}&nbsp;${emp.positionValue }</option>
	</c:forEach>
	</c:if>
	                    </select>
	                </div>
	                <div class="form-group">
	                  <label>업무협조자</label>
	                  <select class="select2bs4 select2-hidden-accessible jobAssistantsModify"  name="jobAssistants[]" multiple="multiple" data-placeholder="업무 협조자를 입력하세요." style="width: 100%;"  tabindex="-1" aria-hidden="true">

	<c:if test="${!empty teamEmpList}">
	<c:forEach items="${teamEmpList}" var="emp">
						<option value="${emp.empCode}">${emp.empName}&nbsp;${emp.positionValue }</option>
	</c:forEach>
	</c:if>
	                  </select>
	                </div>
	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal" onclick="formReset();">취소</button>
	              <button type="button" onclick="modifyJobcode();" class="btn btn-info">수정</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>


<script>
window.onload = function(){
	$('.jobCharger').select2();
	$('.jobAssistants').select2();
	$('.jobChargerModify').select2();
	$('.jobAssistantsModify').select2();
}
const registerJobcode = () =>{
	let form = document.querySelector('#registerJobcodeForm');
	let jobcodeName = form.querySelector('input[name="jobcodeName"]').value;
	let jobCharger = form.querySelector('select[name="jobCharger"]').value;
	let jobAssistants = new Array();

	let jobAssistantsOptions = form.querySelector('select[name="jobAssistants[]"]').querySelectorAll('option');
	jobAssistantsOptions.forEach(option => {
		if(option.selected == true){
			jobAssistants.push(option.value);
		}
	})

	let formData = { "jobcodeName"  : jobcodeName,
					 "jobCharger"   : jobCharger,
					 "jobAssistants": jobAssistants}
	Swal.fire({
		  title: "업무 생성",
		  text:  "새로운 업무코드를 생성하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '생성',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('registerJobcode',{
					method:'POST',
					headers:{
						'Content-Type':'application/json',
					},
					body: JSON.stringify(formData),
				})
				.then(data => {
					console.log('Success:', data);
					formReset();
					Swal.fire({
						  title: "업무 생성 완료",
						  text: "업무 생성 완료하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							$('#modal-registerJobcode').modal('hide');
							location.reload();
						});
				})
				.catch((error) => {
					console.log('Error:', error);
					callFail();
				});
				callSuccess(conTitle,conText);
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("업무 생성","업무 생성을 취소하였습니다.");
		 	}
		});
}
const modifyJobcode = () =>{
	let form = document.querySelector('#modifyJobcodeForm');
	let jobcodeCode = form.querySelector('input[name="jobcodeCode"]').value;
	let jobcodeName = form.querySelector('input[name="jobcodeName"]').value;
	let jobCharger = form.querySelector('select[name="jobCharger"]').value;
	let jobAssistants = new Array();

	let jobAssistantsOptions = form.querySelector('select[name="jobAssistants[]"]').querySelectorAll('option');
	jobAssistantsOptions.forEach(option => {
		if(option.selected == true){
			jobAssistants.push(option.value);
		}
	})

	let formData = {"jobcodeCode"  : jobcodeCode,
					"jobcodeName"  : jobcodeName,
					"jobCharger"   : jobCharger,
					"jobAssistants": jobAssistants}
	Swal.fire({
		  title: "업무 수정",
		  text:  "업무코드를 수정하시겠습니까?",
		  icon:  'warning',
		  showCancelButton: true,
		  confirmButtonText: '수정',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
				fetch('modifyJobcode',{
					method:'POST',
					headers:{
						'Content-Type':'application/json',
					},
					body: JSON.stringify(formData),
				})
				.then(data => {
					console.log('Success:', data);
					formReset();
					Swal.fire({
						  title: "업무 수정 완료",
						  text: "업무 수정 완료하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							$('#modal-modifyJobcode').modal('hide');
							location.reload();
						});
				})
				.catch((error) => {
					console.log('Error:', error);
					callFail();
				});
				callSuccess(conTitle,conText);
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				callCancel("업무 수정","업무 수정 취소하였습니다.");
		 	}
		});
}


const formReset = () =>{
	let inputs = document.querySelectorAll('input');
	inputs.forEach(input=>{
		input.value = null;
	})
	let selects = document.querySelectorAll('select');
	selects.forEach(select=>{
		$(select).val(null).trigger('change');
	})

};

const selectJobcode = element =>{
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			check.click();
		}
	})
	let selected = element.querySelector('.checkSelect');
	selected.click();

};

const openModifyModal=()=>{
	let checkedNumber = 0;
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			checkedNumber++;
		}
	})
	if(checkedNumber == 1){
		$('#modal-modifyJobcode').modal('show');
		document.querySelectorAll('.checkselect').forEach(check=>{
			if(check.checked == true){
				console.log(check);
			}
		})
		let modifyForm =  document.querySelector('#modifyJobcodeForm');
		let selected;
		document.querySelectorAll('.checkselect').forEach(check=>{
			if(check.checked == true){
				selected = check;
			}
		})
		modifyForm.querySelector('input[name="jobcodeName"]').value = selected.dataset.jobcodeName;
		modifyForm.querySelector('input[name="jobcodeCode"]').value = selected.dataset.jobcodeCode;
		modifyForm.querySelectorAll('.jobChargerOptions').forEach(option=>{
			if(option.value == selected.dataset.jobChargerEmpCode){
				option.selected;
			}
		})
		let jobChargerEmpCode = selected.dataset.jobChargerEmpCode;
		$('.jobChargerModify').val(jobChargerEmpCode);
		$('.jobChargerModify').trigger('change');

		let jobAssistants = selected.dataset.jobAssistants;
		let jobAssistantArray = jobAssistants.split("/");
		let data = new Array();
		for (var i = 1 ; i< jobAssistantArray.length; i++){
			data.push(jobAssistantArray[i]);
		}
		$('.jobAssistantsModify').val(data);
		$('.jobAssistantsModify').trigger('change');
	}else{
		callCustomAlert("업무코드 관리","관리하실 업무코드를 선택해주세요.","warning");
	}
}

//시연을 위한 자동입력
const autoInput = () => {
	document.querySelector('#registerJobcodeForm').querySelector('input[name="jobcodeName"]').value = '[프로젝트] 원격 교육 웹 콘텐츠'; 
}
</script>

</body>
