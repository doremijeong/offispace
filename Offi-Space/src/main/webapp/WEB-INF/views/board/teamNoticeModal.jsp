<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


<!-- 글 쓰기 Modal -->
<div class="modal" id="modal-registerPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" 
	aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="card-title p-1">글쓰기</h3>
				<div class="card-tools">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">닫기</span>
					</button>
					&nbsp;
					<button type="button" class="btn btn-primary btn-sm" id="registBtn"
						onclick="registerGo();">등 록</button>
				</div>
			</div>

			<div class="modal-body">
				<form name="registerPostForm" action="" method="post" enctype="multipart/form-data">
					<input type="hidden" name ="teamNoticeSdate">
					<input type="hidden" name ="teamNoticeEdate">
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
									&nbsp;
									<input type="checkbox" name="teamNoticeImportance">
									<label>필독</label>
								</td>
							</tr>
							
							<tr>
								<td style="text-align: right; font-weight: bold;">작성자&nbsp;</td>
								<td><input readonly name="teamNoticeWriter"style="width: 100%; border: none;" value="${loginUser.empName } ${loginUser.positionValue}"></td>
								<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
								<td>${loginUser.groupValue}&nbsp;&nbsp;${loginUser.teamValue }</td>
							</tr>
							
								<tr>
								<td style="text-align: right; font-weight: bold;">등록일&nbsp;</td>
								<td>${yyyy }-${MM }-${dd }(${day })</td>
								<td style="text-align: right; font-weight: bold;">게시기간&nbsp;</td>
								<td><input id="date-picker" style="width: 100%; border: none;"></td>
							</tr>
							
							<tr>
								<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
								<td colspan="3"><input type="text" name="teamNoticeTitle" style="width: 100%; border: none;"></td>
							</tr>
						
							<tr >
								<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
								<td colspan="3" style="height: 200px;">
									<textarea id="content" name="teamNoticeContent" style="height: 300px; display: none;"></textarea>
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
										<p>첨부된 파일이 없습니다.</p>
									</div>
								</td>
							</tr>
	
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<!--modal -->


<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
<script>
window.onload = function(){

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
	const teamNoticeSdate = document.querySelector('input[name="teamNoticeSdate"]');
	const teamNoticeEdate = document.querySelector('input[name="teamNoticeEdate"]');
	const attached = document.querySelector('#attached');
	const preview = document.querySelector('#preview');
	attached.style.opacity=0;
	attached.addEventListener('change', updateFileDisplay);


/*  data-range-picker */
	  $('input[id="date-picker"]').daterangepicker({
	      autoUpdateInput: false,
	      locale: {
	          cancelLabel: 'Clear'
	      }
	  });
	  
	  $('input[id="date-picker"]').on('apply.daterangepicker', function(ev, picker) {
	    $(this).val(picker.startDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.startDate.format('YYYY-MM-DD'))+')'+ ' ~ ' + picker.endDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.endDate.format('YYYY-MM-DD'))+')');
			teamNoticeSdate.value = picker.startDate.format('YYYY-MM-DD');
			teamNoticeEdate.value = picker.endDate.format('YYYY-MM-DD');
	  });
	  
	  $('input[id="date-picker"]').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });
	  
	  
		//전체 선택 체크 박스
		$('.checkbox-toggle').click(function() {
			var clicks = $(this).data('clicks')
			if (clicks) {
				//Uncheck all checkboxes
				$('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
				$('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
			} else {
				//Check all checkboxes
				$('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
				$('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
			}
			$(this).data('clicks', !clicks)
		});
	  
}//=====================================window.onload============================================


/* 전송하기 */
const  registerGo  = () => {
	if(!$('input[name="teamNoticeTitle"]').val() && $('input[name="teamNoticeTitle"]').val() == ""){
		alert("제목 입력은 필수입니다.");
		$('input[name="teamNoticeTitle"]').focus();
		return;
	}
	
	if(!$('input[id="date-picker"]').val() && $('input[id="date-picker"]').val() == ""){
		alert("게시기간 선택은 필수입니다.");
		$('input[id="date-picker"]').focus();
		return;
	}
	
	if(!$('textarea[name="teamNoticeContent"]').val() && $('textarea[name="teamNoticeContent"]').val() == ""){
		alert("내용 입력은 필수입니다.");
		$('textarea[name="teamNoticeContent"]').focus();
		return;
	}
	
	
	let teamNoticeTitle = document.querySelector('input[name="teamNoticeTitle"]').value;
	let teamNoticeContent = document.querySelector('textarea[name="teamNoticeContent"]').value;
	let teamNoticeSdate = document.querySelector('input[name="teamNoticeSdate"]').value;
  let teamNoticeEdate =  document.querySelector('input[name="teamNoticeEdate"]').value;
	let teamNoticeImportance;
	
	if(document.querySelector('input[name="teamNoticeImportance"]').checked == true){
		teamNoticeImportance = "Y"
	}else{
		teamNoticeImportance = "N"
	}

	const formData = new FormData();
	formData.append("teamNoticeTitle",teamNoticeTitle)
	formData.append("teamNoticeContent",teamNoticeContent)
	formData.append("teamNoticeSdate",teamNoticeSdate)
	formData.append("teamNoticeEdate",teamNoticeEdate)
	formData.append("teamNoticeWriter",'${loginUser.empCode}')
	formData.append("teamNoticeImportance",teamNoticeImportance)

	for(var file of attached.files){
		formData.append("attached",file,file.name);
	};

 	fetch('registerPost',{
		method:'POST',
		headers:{},
		body: formData,
	})
	.then(response => response.json())
	.then(data => {
		console.log('Success:', data);
		window.location.reload();
		OpenWindow('detail.do?teamNoticeCode='+data.teamNoticeCode, '부서공지', '950', '830');
	})
	.catch((error) => {
		console.log('Error:', error);
	});
}//등록 끝


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


</script>

