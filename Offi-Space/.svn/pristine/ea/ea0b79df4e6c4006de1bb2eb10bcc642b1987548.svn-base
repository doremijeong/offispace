<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head></head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-12">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">HOME</a>
							</li>
							<li class="breadcrumb-item active">사내공지</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<section class="content">
			<div class="card card-info card-outline">
				<div class="card-header">
					<c:if test="${notice.noticeImportance eq 'Y'}">
						<label class="badge bg-danger">필독</label>
					</c:if>
					<div class="card-tools">
						<c:if test="${notice.noticeWriter eq loginUser.empCode}">
							<button type="button" class="btn btn-primary btn-sm" id="registBtn" onclick="modify_go()">수정</button>
							&nbsp;
						</c:if>
						<button type="button" class="btn btn-default btn-sm" id="cancelBtn" onclick="CloseWindow()">닫기</button>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0">
					<table class="table table-sm table-bordered">
					<colgroup>
						<col style="width: 15%; background-color: lightgray;">
						<col style="width: 35%;">
						<col style="width: 15%; background-color: lightgray;">
						<col style="width: 35%;">
					</colgroup>

					<tbody>
						<tr>
							<td style="text-align: right; font-weight: bold;">상태</td>
							<td colspan="3">
							<input type="hidden" name="noticeCode" value="${notice.noticeCode}">
								&nbsp;
								<input type="checkbox" name="noticeImportance" ${notice.noticeImportance eq 'Y' ? 'checked' : ''}>
								<label>필독</label>
							</td>
						</tr>

						<tr>
							<td style="text-align: right; font-weight: bold;">작성자&nbsp;</td>
							<td><input type="hidden" name="noticeWriter" value="${loginUser.empCode}">${loginUser.empName } ${loginUser.positionValue}</td>
							<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
							<td>${loginUser.groupValue}&nbsp;&nbsp;${loginUser.teamValue }</td>
						</tr>

							<tr>
							<td style="text-align: right; font-weight: bold;">등록일&nbsp;</td>
							<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일"/></td>
							<td style="text-align: right; font-weight: bold;">게시기간&nbsp;</td>
							<td>
								<input id="date-picker" style="width: 100%; border: none;" value="<fmt:formatDate value="${notice.noticeSdate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${notice.noticeSdate}" pattern="E"/>)&nbsp;&nbsp;~&nbsp;&nbsp;<fmt:formatDate value="${notice.noticeEdate}" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${notice.noticeEdate}" pattern="E"/>)">
								<input type="hidden" name="noticeEdate" value="<fmt:formatDate value="${notice.noticeEdate}" pattern="yyyy-MM-dd"/>">
								<input type="hidden" name="noticeSdate" value="<fmt:formatDate value="${notice.noticeSdate}" pattern="yyyy-MM-dd"/>">
							</td>
						</tr>

						<tr>
							<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
							<td colspan="3"><input type="text" name="noticeTitle" style="width: 100%; border: none;" value="${notice.noticeTitle}"></td>
						</tr>

						<tr >
							<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
							<td colspan="3" style="height: 200px;">
								<textarea id="content" name="noticeContent" style="height: 300px; display: none;">${notice.noticeContent}</textarea>
							</td>
						</tr>
						<tr>
							<td style="text-align: right; font-weight: bold;">첨부파일&nbsp;</td>
							<td colspan="3">
								<div class="row" style=" border: none; padding-left:5px;">
				                   	<label for="attached">
				                    	<span class="btn btn-outline-success btn-sm">
				                        <i class="fas fa-plus"></i>
				                        <span>추가</span>
				                    	</span>
				                   	</label>
									<input multiple="multiple" type="file" name="attached[]" id="attached" onchange="fileUpload();">
								</div>
								<div style="width: 90%; border: none" id="preview">
									<ol>
										<c:if test="${!empty notice.attachList}">
											<c:forEach items="${notice.attachList}" var="attach">
												<li class="attach-item ${attach.attachCode}" file-name="${attach.attachSavename}">
													<p>
														<a class="mailbox-attachment-name"  href="<%=request.getContextPath()%>/mail/getFile.do?atCode=${attach.attachCode}"  >
														<i class="fas fa-paperclip"></i>${attach.attachSavename}&nbsp;&nbsp;<span class="badge bg-danger" onclick="remove_originFile('${attach.attachCode}');">X</span>
														</a>
													</p>
												</li>
											</c:forEach>
										</c:if>
									</ol>
									<div id="newFile">

									</div>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
				</div>

				<!-- /.card-footer -->
			<!-- 	<div class="card-footer"></div> -->
				<!-- /.card-footer -->
			</div>

		</section>
	</div>
<script>

	window.onload = function() {
		//summernote
	    $('#content').summernote({
	      placeholder: '내용을 입력하세요.',
	      toolbar: [
	        ['style', ['style']],
	        ['font', ['bold', 'underline']],
	        ['fontname', ['fontname']],
	        ['color', ['color']],
	        ['para', ['ul', 'ol', 'paragraph']],
	        ['table', ['table']],
	        ['insert', ['link', 'picture', 'video']],
	      ],
	      height: 190,
	    });

	    const form = document.querySelector('form[name="registerPostForm"]');
		const noticeSdate = document.querySelector('input[name="noticeSdate"]');
		const noticeEdate = document.querySelector('input[name="noticeEdate"]');
		const attached = document.querySelector('#attached');
		const newFile = document.querySelector('#newFile');

		attached.style.opacity=0;
		attached.addEventListener('change', updateFileDisplay);

		$('input[id="date-picker"]').daterangepicker({
		    autoUpdateInput: false,
		    locale: {
		        cancelLabel: 'Clear'
		    }
		});

		$('input[id="date-picker"]').on('apply.daterangepicker', function(ev, picker) {
		    $(this).val(picker.startDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.startDate.format('YYYY-MM-DD'))+')'+ ' ~ ' + picker.endDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.endDate.format('YYYY-MM-DD'))+')');
				noticeSdate.value = picker.startDate.format('YYYY-MM-DD');
				noticeEdate.value = picker.endDate.format('YYYY-MM-DD');
		});

		$('input[id="date-picker"]').on('cancel.daterangepicker', function(ev, picker) {
		    $(this).val('');
		});
	}

	/* 전송하기 */
	const  modify_go  = () => {
		if(!$('input[name="noticeTitle"]').val() && $('input[name="noticeTitle"]').val() == ""){
			alert("제목 입력은 필수입니다.");
			$('input[name="noticeTitle"]').focus();
			return;
		}

		if(!$('input[name="dates"]').val() && $('input[name="dates"]').val() == ""){
			alert("게시 기간 입력은 필수입니다.");
			$('input[name="dates"]').focus();
			return;
		}

		let noticeTitle = document.querySelector('input[name="noticeTitle"]').value;
		let noticeImportance;

		if(document.querySelector('input[name="noticeImportance"]').checked == true){
			noticeImportance = "Y"
		}else{
			noticeImportance = "N"
		}

		let noticeContent = document.querySelector('textarea[name="noticeContent"]').value;
		let noticeSdate = document.querySelector('input[name="noticeSdate"]').value;
	 	let noticeEdate =  document.querySelector('input[name="noticeEdate"]').value;
	 	let deleteFiles =  document.querySelector('input[name="deleteFiles"]');
	 	let noticeCode =  document.querySelector('input[name="noticeCode"]').value;

	 	if(deleteFiles){
		 	for(var deleteFile of deleteFiles){
				formData.append("deleteFiles", deleteFile.value);
			};
	 	}

		const formData = new FormData();
		formData.append("noticeTitle",noticeTitle)
		formData.append("noticeImportance",noticeImportance)
		formData.append("noticeContent",noticeContent)
		formData.append("noticeSdate",noticeSdate)
		formData.append("noticeEdate",noticeEdate)
		formData.append("noticeWriter",'${loginUser.empCode}')
		formData.append("noticeCode",noticeCode)


		for(var file of attached.files){
			formData.append("attached",file,file.name);
		};

	 	fetch('modify',{
			method:'POST',
			headers:{},
			body: formData,
		})
		.then(response => response.json())
		.then(data => {
			console.log('Success:', data);
			location.href = "detail.do?noticeCode=${notice.noticeCode}"

		})
		.catch((error) => {
			console.log('Error:', error);
			location.href = "detail.do?noticeCode=${notice.noticeCode}"
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
		while(newFile.firstChild) {
			newFile.removeChild(newFile.firstChild);
	  	}
	  const originFiles = document.getElementsByClassName('attach-item');

	  const curFiles = attached.files;
	  var fileCnt = originFiles.length + curFiles.length;

	  if(fileCnt === 0) {
	    const para = document.createElement('p');
	    para.textContent = '첨부된 파일이 없습니다.';
	    newFile.appendChild(para);
	  } else if(fileCnt > 5){

		  alert("파일은 5까지만 등록 가능합니다.")
		  return;

	  } else {
	    const list = document.createElement('ol');
	    newFile.appendChild(list);

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

	function remove_originFile(attachCode) {

		var li = $('li.' + attachCode);

		Swal.fire({
		      title: '공지사항 수정',
		      text: li.attr("file-name") +'를 삭제하시겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '삭제',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
					li.remove();

					// 사용자가 어떤 파일을 지웠는지 확인하기 위한 정보를 서버에 보내기 위해서 hidden으로 심어 놓음
					// 서버는 ano를 받아서 해당 파일의 저장경로를 받아와 파일을 지우고 새로운 파일 저장
					var input = $('<input>').attr({
						"type" : "hidden",
						"name" : "deleteFiles",
						"value" : attachCode
					});
					$('#preview').prepend(input);
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            callCancel(canTitle,canText);
		         }
		    });


	}

</script>
</body>