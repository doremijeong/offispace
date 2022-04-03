<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="date"/>
<fmt:formatDate value="${now}" pattern="E" var="day" />
<c:set var="yyyy" value="${fn:substring(date,0,4)}"/>
<c:set var="MM" value="${fn:substring(date,5,7)}"/>
<c:set var="dd" value="${fn:substring(date,8,10)}"/>

<head>
<style>
.textarea-input{
	height: 100%;
	 width: 100%;
	 border: #ddd;
	 resize: none;
 }

.textarea-input::-webkit-scrollbar {
   display: none;
}

</style>
</head>

<body>

	<!-- Content Header (Page header) -->
	<div class="content-wrapper" style="min-height: 1602px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>업무요청</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">업무</a></li>
							<li class="breadcrumb-item active">업무 요청</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>


		<!-- Main content -->
		<section class="content">

			 <!-- Default box -->
	      <div class="card card-info card-outline">
				<div class="card-header">
					<div class="mailbox-controls">
						<div class="float-left">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default btn-sm"
									onclick="resetForm();">
									<i class="fas fa-undo-alt"></i>&nbsp;초기화
								</button>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default btn-sm" onclick="regist_report_doc('temp')">
									<i class="far fa-save"></i>&nbsp;임시저장
								</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-success btn-sm" onclick="openJobcodeSelector();">업무조회</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-info btn-sm"	onclick="registerGo();">업무요청</button>
							</div>
							<div>
								<button type="button" class="btn btn-block btn-default btn-sm" onclick="window.close();">닫기</button>
							</div>
						</div>
					</div>
				</div>

				<div class="card-body">
						<form name="registerJobForm" action="" method="post" enctype="multipart/form-data">
						<input type="hidden" name ="jobStartDt">
						<input type="hidden" name ="jobClosingDt">
							<table class="table table-sm table-bordered">
								<colgroup>
									<col style="width: 15%; background-color: lightgray;">
									<col style="width: 35%;">
									<col style="width: 15%; background-color: lightgray;">
									<col style="width: 35%;">
								</colgroup>


								<tbody>
									<tr>
										<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
										<td colspan="3"><input type="text" name="jobTitle" style="width: 100%; border: none;"></td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">업무분류&nbsp;</td>
										<td  onclick="openJobcodeSelector();" colspan="3"><input type="text" readonly name="jobcodeName" style="width: 100%; border: none;"></td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">업무기한&nbsp;</td>
										<td><input name="dates"style="width: 100%; border: none;"></td>
										<td style="text-align: right; font-weight: bold;">등록일&nbsp;</td>
										<td>${yyyy }-${MM }-${dd }(${day })</td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">요청자&nbsp;</td>
										<td><input readonly name="jobRequester"style="width: 100%; border: none;" value="${loginUser.empName } ${loginUser.positionValue}"></td>
										<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
										<td>${loginUser.groupValue}&nbsp;&nbsp;${loginUser.teamValue }</td>
									</tr>
								
									<tr>
										<td style="text-align: right; font-weight: bold;">담당자&nbsp;</td>
										<td onclick="openJobcodeSelector();"><input readonly name="jobCharger" style="width: 100%; border: none;"></td>
										<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
										<td onclick="openJobcodeSelector();"><input readonly name="jobChargerGroupTeam" style="width: 100%; border: none;"></td>
									</tr>
										<tr>
										<td style="text-align: right; font-weight: bold;">참조자&nbsp;</td>
										<td onclick="" colspan="3">
							                  <select class="select2bs4 select2-hidden-accessible jobReferencesSelector"  name="jobReferences[]" multiple="multiple" data-placeholder="참조자를 입력하세요." style="width: 100%;"  tabindex="-1" aria-hidden="true">
													<c:if test="${!empty empList}">
													<c:forEach items="${empList}" var="emp">
													<c:if test="${emp.empCode ne loginUser.empCode}">
														<option value="${emp.empCode}">${emp.empName}&nbsp;${emp.positionValue }</option>
													</c:if>
													</c:forEach>
													</c:if>
							                  </select>
						                </td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">중요도</td>
										<td colspan="3">
										 	&nbsp;
											<input type="checkbox" name="jobImportance">
											<label>중요 <i class="fas fa-exclamation text-danger"></i></label>
										</td>
									</tr>
									<tr >
										<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
										<td colspan="3" style="height: 200px;">
											<textarea id="content" name="jobContent" style="height: 300px; display: none;"></textarea>
										</td>
									</tr>
									<tr>
										<td style="text-align: right; font-weight: bold;">첨부파일&nbsp;</td>

										<td colspan="3">
											<div class="row" style=" border: none; padding-left:5px;">
						                     	<label for="attached">
							                     	<span class="btn btn-outline-success">
								                        <i class="fas fa-plus"></i>
								                        <span>추가</span>
							                     	</span>
						                     	</label>
												<input multiple="multiple" type="file" name="attached[]" id="attached" onchange="fileUpload();">
											</div>
											<div style="width: 90%; border: none" id="preview">
												<p>첨부된 파일이 없습니다.</p>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</form>

				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<div class="mailbox-controls">
						<div class="float-left">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default btn-sm"
									onclick="resetForm();">
									<i class="fas fa-undo-alt"></i>&nbsp;초기화
								</button>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-default btn-sm" onclick="regist_report_doc('temp')">
									<i class="far fa-save"></i>&nbsp;임시저장
								</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-success btn-sm" onclick="openJobcodeSelector();">업무조회</button>
							</div>
							<div style="margin-right: 5px;">
								<button type="button" class="btn btn-block btn-info btn-sm"	onclick="registerGo();">업무요청</button>
							</div>
							<div>
								<button type="button" class="btn btn-block btn-default btn-sm" onclick="window.close();">닫기</button>
							</div>
						</div>
					</div>
				</div>
	      </div>
	      <!-- /.card -->

		</section> <!-- /.content -->

	<div class="modal fade" id="modal-jogcodeSelector" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">업무 검색</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body" style="padding-top:0px;">
	        	<div class="card-body"  style="padding-top:0px;">
	             	<ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
		            	<li class="nav-item">
		               		<a class="nav-link active" id="select-search-tab" data-toggle="pill" href="#select-search" role="tab" aria-controls="select-search" aria-selected="true">필터 검색</a>
		              	</li>
		              	<li class="nav-item">
		                	<a class="nav-link" id="keyword-search-tab" data-toggle="pill" href="#keyword-search" role="tab" aria-controls="keyword-search" aria-selected="false">키워드 검색</a>
		              	</li>
		            </ul>
	                <div class="tab-content" id="custom-content-below-tabContent">
	                	<div style="margin-top:10px;"></div>
              			<div class="tab-pane fade active show" id="select-search" role="tabpanel" aria-labelledby="select-search-tab">
				           	<div class="row">
								<div class="form-group col-lg-4">
				                    <select name="headOfficeCode" class="custom-select rounded-0" id="inputHeadOffice" onchange="getGroupListInHeadOffice(this);">
				                    		<option disabled="disabled" selected="selected" hidden="">본부를 선택하세요.</option>
											<c:forEach var="item" items="${headOfficeList}">
													<option value="${item.comCode }">${item.comCode1}</option>
											</c:forEach>
				                  	</select>
				                  </div>
				                  <div class="form-group col-lg-4">
				                    <select name="groupCode" class="custom-select rounded-0" id="inputGroup" onchange="getTeamListInGroup(this);">
				                    <option disabled="disabled" selected="selected" hidden="">그룹을 선택하세요.</option>
				                  	</select>
				                  </div>

				                  <div class="form-group col-lg-4">
				                    <select name="TeamCode" class="custom-select rounded-0" id="inputTeam" onchange="getSortedTeamcodeListByTeamCode(this);">
				                    <option disabled="disabled" selected="selected" hidden="">팀을 선택하세요.</option>
				                  	</select>
				                  </div>
				            </div>
				            <!-- row -->
				            <div>
				            	<div class="card-body text-center table-responsive p-0"  style="height:360px;">
									<table class="table table-sm table-head-fixed" >
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="55%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr style="text-align: center;">
												<th class="text-truncate">선택</th>
												<th class="text-truncate">업무코드</th>
												<th class="text-truncate">업무명</th>
												<th class="text-truncate">업무 담당자</th>
											</tr>
										</thead>
										<tbody class="selectJobcodeListBox" style="font-size:0.9em;">

										</tbody>
									</table>
			              		</div>
			              		<!-- card-body -->
				            </div>

				       </div>
				       <!-- tab-pane -->

				       <div class="tab-pane fade " id="keyword-search" role="tabpanel" aria-labelledby="keyword-search-tab">
				       		<div class="row">
					       		<div class="input-group mb-3">
				                  <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요.">
				                  <div class="input-group-append">
				                    <button class="input-group-text" onclick="getSortedJobcodeListByKeyword();"><i class="fa fa-search"></i></button>
				                  </div>
				                </div>
				            </div>
				            <!-- row -->
				            <div>
				            	<div class="card-body text-center table-responsive p-0"  style="height:360px;">
									<table class="table table-sm table-head-fixed" >
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="55%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr style="text-align: center;">
												<th class="text-truncate">선택</th>
												<th class="text-truncate">업무코드</th>
												<th class="text-truncate">업무명</th>
												<th class="text-truncate">업무 담당자</th>
											</tr>
										</thead>
										<tbody class="keywordJobcodeListBox"  style="font-size:0.9em;">

										</tbody>
									</table>
			              		</div>
			              		<!-- card-body -->
				            </div>
				       </div>
				       <!-- tab-pane -->

				    </div>
				    <!-- tab-content -->
            	</div>
            	<!-- card-body -->
            </div>
            <!-- modal-body -->
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="putJobcodeInfo();">선택</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<!-- modal -->

	</div> <!-- content-wrapper -->


<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
<script>
window.onload = function(){

	summernote_go($('textarea#content'), 300);
	$('.jobReferencesSelector').select2();

	const form = document.querySelector('form[name="registerJobForm"]');
	const jobStartDt = document.querySelector('input[name="jobStartDt"]');
	const jobClosingDt = document.querySelector('input[name="jobClosingDt"]');
	const attached = document.querySelector('#attached');
	const preview = document.querySelector('#preview');
	attached.style.opacity=0;
	attached.addEventListener('change', updateFileDisplay);

	let jobcodeCode;
	let jobChargerCode;


/*  data-range-picker */
	  $('input[name="dates"]').daterangepicker({
	      autoUpdateInput: false,
	      locale: {
	          cancelLabel: 'Clear'
	      }
	  });
	  $('input[name="dates"]').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.startDate.format('YYYY-MM-DD'))+')'+ ' ~ ' + picker.endDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.endDate.format('YYYY-MM-DD'))+')');
			jobStartDt.value = picker.startDate.format('YYYY-MM-DD');
			jobClosingDt.value = picker.endDate.format('YYYY-MM-DD');
	  });
	  $('input[name="dates"]').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });
	  
}//window.onload
/* 초기화 버튼   */
const resetForm = () => {
	document.querySelector('input[name="jobTitle"]').value = "";
	document.querySelector('input[name="jobcodeName"]').value = "";
	document.querySelector('input[name="jobCharger"]').value = "";
	document.querySelector('input[name="jobTitle"]').value = "";
	document.querySelector('input[name="jobImportance"]').checked = false;
	document.querySelector('textarea[name="jobContent"]').value ="";
	document.querySelector('input[name="dates"]').value ="";
	document.querySelector('input[name="jobStartDt"]').value ="";
    document.querySelector('input[name="jobClosingDt"]').value="";
    document.querySelector('select[name="jobReferences[]"]').querySelectorAll('option').forEach(option => {
		option.selected = false;
	});
	attached.value="";
	updateFileDisplay();
	$('.jobReferencesSelector').val(null).trigger('change');
	$('textarea#content').summernote('reset');

}



/* 전송하기 */
const  registerGo  = () => {
	if(!$('input[name="jobTitle"]').val() && $('input[name="jobTitle"]').val() == ""){
		callCustomAlert("업무 요청","제목 입력은 필수입니다.","warning");
		$('input[name="jobTitle"]').focus();
		return;
	}

	if(!$('input[name="jobcodeName"]').val() && $('input[name="jobcodeName"]').val() == ""){
		callCustomAlert("업무 요청","업무 분류 선택은 필수입니다.","warning");
		$('input[name="jobcodeName"]').focus();
		return;
	}

	if(!$('input[name="jobCharger"]').val() && $('input[name="jobCharger"]').val() == ""){
		callCustomAlert("업무 요청","업무 담당자 선택은 필수입니다.","warning");
		$('input[name="jobCharger"]').focus();
		return;
	}

	if(!$('input[name="dates"]').val() && $('input[name="dates"]').val() == ""){
		callCustomAlert("업무 요청","업무 기한 선택은 필수입니다.","warning");
		$('input[name="dates"]').focus();
		return;
	}

	let jobTitle = document.querySelector('input[name="jobTitle"]').value;
	let jobImportance;
	if(document.querySelector('input[name="jobImportance"]').checked == true){
		jobImportance = "Y"
	}else{
		jobImportance = "N"
	}
	let jobContent = document.querySelector('textarea[name="jobContent"]').value;
	let jobStartDt = document.querySelector('input[name="jobStartDt"]').value;
    let jobClosingDt =  document.querySelector('input[name="jobClosingDt"]').value;
	let jobReferences = new Array();

	let jobReferencesOptions = document.querySelector('select[name="jobReferences[]"]').querySelectorAll('option');
	jobReferencesOptions.forEach(option => {
		if(option.selected == true){
			jobReferences.push(option.value);
		};
	});

	const formData = new FormData();
	formData.append("jobTitle",jobTitle)
	formData.append("jobImportance",jobImportance)
	formData.append("jobContent",jobContent)
	formData.append("jobStatus","대기")
	formData.append("jobStartDt",jobStartDt)
	formData.append("jobClosingDt",jobClosingDt)
	formData.append("jobcodeCode",jobcodeCode)
	formData.append("jobChargerCode",jobChargerCode)
	formData.append("jobRequesterCode",'${loginUser.empCode}')
	formData.append("jobReferences",jobReferences)

	for(var file of attached.files){
		formData.append("attached",file,file.name);
	};

	Swal.fire({
		  title: "업무 요청 ",
		  text: "요청된 업무는 수정이 불가능합니다. 요청하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '요청',
		  cancelButtonText: '취소',
		  reverseButtons: false
		})
		.then((result) => {
			if (result.isConfirmed) {
			 	fetch('registerJob',{
					method:'POST',
					headers:{},
					body: formData,
				})
				.then(response => response.json())
				.then(data => {
					console.log('Success:', data);
					Swal.fire({
						  title: "업무 요청 완료",
						  text: "업무 요청을 계속하시겠습니까?",
						  icon: 'success',
						  showCancelButton: true,
						  confirmButtonText: '계속',
						  cancelButtonText: '취소',
						  reverseButtons: false
						})
						.then((result) => {
							if (result.isConfirmed) {
								window.location.reload();							
								OpenWindow('<%=request.getContextPath()%>/job/requestedJobDetail?jobCode='+data.jobCode, '', '950', '830');
							} else if ( result.dismiss === Swal.DismissReason.cancel) {
								window.close();	
								OpenWindow('<%=request.getContextPath()%>/job/requestedJobDetail?jobCode='+data.jobCode, '', '950', '830');
							}
						});									
				})
				.catch((error) => {
					console.log('Error:', error);
					callFail();
				});
			} else if ( result.dismiss === Swal.DismissReason.cancel) {
				//취소
				callCancel("취소하였습니다.","");
		 	}
		});
	

}

/* 문자열을 날짜로 변환 후, 해당 요일을 반환 */
const getDayOfWeek = date =>{
	let week = ['일', '월', '화', '수', '목', '금', '토'];
	let dayOfWeek = week[new Date(date).getDay()];

	return dayOfWeek;
}

/*  파일 업로드 */
function updateFileDisplay (){
	while(preview.firstChild) {
  	  preview.removeChild(preview.firstChild);
  	}

  const curFiles = attached.files;

  if(curFiles.length === 0) {
    const para = document.createElement('p');
    para.textContent = '첨부된 파일이 없습니다.';
    preview.appendChild(para);
  } else {
    const list = document.createElement('ol');
    preview.appendChild(list);

    for(const file of curFiles) {
      const listItem = document.createElement('li');
      const para = document.createElement('p');

      if(validFileType(file)) {
        para.textContent = file.name+', size:'+returnFileSize(file.size)+'.';
        //const image = document.createElement('img');
        //image.src = URL.createObjectURL(file);

       // listItem.appendChild(image);
        listItem.appendChild(para);
      } else {
        para.textContent = file.name+', size:'+returnFileSize(file.size)+'.';
        listItem.appendChild(para);
      }

      list.appendChild(listItem);
    }
  }
}

const fileTypes = [
	  "image/apng",
	  "image/bmp",
	  "image/gif",
	  "image/jpeg",
	  "image/pjpeg",
	  "image/png",
	  "image/svg+xml",
	  "image/tiff",
	  "image/webp",
	  "image/x-icon"
	];

function validFileType(file) {
  return fileTypes.includes(file.type);
}

function returnFileSize(number) {
  if(number < 1024) {
    return number + 'bytes';
  } else if(number >= 1024 && number < 1048576) {
    return (number/1024).toFixed(1) + 'KB';
  } else if(number >= 1048576) {
    return (number/1048576).toFixed(1) + 'MB';
  }
}

function fileUpload(){
	let files = attached.files;
	files.forEach(file=>{
		console.log(file.name);
	});
}
/* 파일업로드에 관한 function 마침 */


/*  업무코드를 선택하는 모달창 오픈 */
const openJobcodeSelector = () => {
	$('#modal-jogcodeSelector').modal('show');
}

/*  모달 내부 tr 선택 */
const selectJobcode = element =>{
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			check.click();
		}
	})
	let selected = element.querySelector('.checkSelect');
	selected.click();
};

/* 모달 내부 tr 선택 후 적용  */
function putJobcodeInfo(){
	document.querySelectorAll('.checkselect').forEach(check=>{
		if(check.checked == true){
			jobcodeCode = check.dataset.jobcodeCode;
			document.querySelector('input[name="jobcodeName"]').value = check.dataset.jobcodeName;
			jobChargerCode = check.dataset.jobChargerEmpCode;
			document.querySelector('input[name="jobCharger"]').value = check.dataset.jobChargerNamePosition;
			document.querySelector('input[name="jobChargerGroupTeam"]').value = check.dataset.jobChargerGroupTeam;

		}
	});
	$('#modal-jogcodeSelector').modal('hide');
}
/*본부, 그룹, 팀명을 가져오는 메서드 */
function getCommonCodeListForJob(searchType,  keyword) {
	return new Promise(resolve => {
		fetch('<%=request.getContextPath()%>/common/getCommonCodeList/' + searchType + '/' + keyword)
			.then(response => response.json())
			.then(data => {
				resolve(data);
			});
	})
}

/* 모달 내부 select onchange event -> option 비동기로 가져오고 리스트출 */
function getGroupListInHeadOffice(headOfficeSelector) {
	let searchType = 'groupInHeadOffice';
	let keyword = headOfficeSelector.value;

	let target = document.querySelector('#inputGroup');
	let templateObject = $('#optionInCommonCodeSelector')

	getCommonCodeListForJob(searchType, keyword).then(data => {
		getSortedJobcodeList(searchType,keyword);
		printOptionInCommonCodeSelector(data,target,templateObject);
	});
}

function getTeamListInGroup(groupSelector) {
	let searchType = 'teamInGroup';
	let keyword = groupSelector.value;

	let target = document.querySelector('#inputTeam');
	let templateObject = $('#optionInCommonCodeSelector')

	getCommonCodeListForJob(searchType, keyword).then(data => {
		getSortedJobcodeList(searchType,keyword);
		printOptionInCommonCodeSelector(data,target,templateObject);
	});
}

/* 모달 내부 jobcode List 비동기로 가져옴 */
function getSortedTeamcodeListByTeamCode(teamSelector){
	let searchType = "sortedTeam";
	let keyword = teamSelector.value;

	getSortedJobcodeList(searchType, keyword);
}

function getSortedJobcodeList (searchType, keyword){
	if (searchType == 'groupInHeadOffice'){
		searchType="sortedHeadOffice";
	}else if(searchType == 'teamInGroup'){
		searchType = "sortedGroup"
	}

	target = document.querySelector('.selectJobcodeListBox');
	templateObject = $('#jobcodeListSelector');

	fetch('sortedjobcodeList?searchType=' + searchType + '&keyword=' + keyword)
	.then(response => response.json())
	.then(data => {
		printJobcodeList(data.jobcodeList,target,templateObject);
	});
}

function getSortedJobcodeListByKeyword(){
	let keyword = document.querySelector('input[name="searchKeyword"]').value;
	let searchType = 'sortedByKeyword';

	target = document.querySelector('.keywordJobcodeListBox');
	templateObject = $('#jobcodeListSelector');

	fetch('sortedjobcodeList?searchType=' + searchType + '&keyword=' + keyword)
	.then(response => response.json())
	.then(data => {
		printJobcodeList(data.jobcodeList,target,templateObject);
	});
}


/* 핸들러  */
function printJobcodeList(data, target, templateObject){
	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	let trs = target.querySelectorAll('tr');
	trs.forEach(tr=>{
		tr.remove();
	})
	$(target).append(html);
}

function printOptionInCommonCodeSelector(data, target, templateObject){
	Handlebars.registerHelper("word",function(comCodeGr){
		if (comCodeGr == 'D2'){
			return "그룹을";
		}else if(comCodeGr == 'D3'){
			return "팀을";
		}else{
			return "";
		}

	})

	let template = Handlebars.compile(templateObject.html());
	let html = template(data);
	let options = target.querySelectorAll('option')
	options.forEach( option => {
		option.remove();
	})
	$(target).append(html)

}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="optionInCommonCodeSelector" type="text/x-handlebars-template">
	{{#each .}}
		{{#if @first}}
   		 <option disabled="disabled" selected="selected" hidden=""> {{word comCodeGr}} 선택하세요.</option>
   		 {{/if}}
		 <option value="{{comCode}}">{{comCode1}}</option>
	{{/each}}

</script>

<script id="jobcodeListSelector" type="text/x-handlebars-template">
{{#each .}}
		<tr onclick="selectJobcode(this);">
			<td style="text-align: center;">
				<input type="checkbox" name="checkSelect" data-jobcode-name='{{jobcodeName}}' data-jobcode-code='{{jobcodeCode}}' data-job-charger-emp-code='{{jobCharger.empCode}}' data-job-charger-name-position='{{jobCharger.empName}}&nbsp;{{jobCharger.positionValue}}' data-job-charger-group-team='{{jobCharger.groupValue}}&nbsp;&nbsp;{{jobCharger.teamValue}}' class="checkSelect" style="margin: 5px;">
			</td>
			<td style="text-align: center;">{{jobcodeCode}}</td>
			<td>{{jobcodeName}}</td>
			<td style="text-align: center;">{{jobCharger.empName}}&nbsp;{{jobCharger.positionValue}}</td>
		</tr>
{{/each}}
</script>

</body>
