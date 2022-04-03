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
					<button type="button" class="btn btn-default btn-sm" id="dataBtn" onclick="dataGo()">데이터 입력</button>
					&nbsp;
					<button type="button" class="btn btn-default btn-sm" id="cancelBtn" data-dismiss="modal" aria-label="Close">닫기</button>
					&nbsp;
					<button type="button" class="btn btn-primary btn-sm" id="registBtn"
						onclick="registerGo();">등 록</button>
				</div>
			</div>

			<div class="modal-body">

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
								<input type="checkbox" name="noticeImportance">
								<label>필독</label>
							</td>
						</tr>

						<tr>
							<td style="text-align: right; font-weight: bold;">작성자&nbsp;</td>
							<td><input type="hidden" name="noticeWriter" value="${loginUser.empCode}">${loginUser.empName} ${loginUser.positionValue}</td>
							<td style="text-align: right; font-weight: bold;">소속&nbsp;</td>
							<td>${loginUser.groupValue}&nbsp;&nbsp;${loginUser.teamValue }</td>
						</tr>

							<tr>
							<td style="text-align: right; font-weight: bold;">등록일&nbsp;</td>
							<td>${yyyy }-${MM }-${dd }(${day })</td>
							<td style="text-align: right; font-weight: bold;">게시기간&nbsp;</td>
							<td><input id="date-picker" style="width: 100%; border: none;">
								<input type="hidden" name="noticeEdate">
								<input type="hidden" name="noticeSdate">
							</td>
						</tr>

						<tr>
							<td style="text-align: right; font-weight: bold;">제목&nbsp;</td>
							<td colspan="3"><input type="text" name="noticeTitle" style="width: 100%; border: none;"></td>
						</tr>

						<tr >
							<td style="text-align: right; font-weight: bold;">내용&nbsp;</td>
							<td colspan="3" style="height: 200px;">
								<textarea id="content" name="noticeContent" style="height: 300px; display: none;"></textarea>
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
			</div>
		</div>
	</div>
</div>
<!--modal -->


<%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>
<script>
window.onload = function(){

	//summernote
    summernote_go($('textarea#content'), 300);

	const form = document.querySelector('form[name="registerPostForm"]');
	const noticeSdate = document.querySelector('input[name="noticeSdate"]');
	const noticeEdate = document.querySelector('input[name="noticeEdate"]');
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
			noticeSdate.value = picker.startDate.format('YYYY-MM-DD');
			noticeEdate.value = picker.endDate.format('YYYY-MM-DD');
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
	if(!$('input[name="noticeTitle"]').val() && $('input[name="noticeTitle"]').val() == ""){
		alert("제목 입력은 필수입니다.");
		$('input[name="noticeTitle"]').focus();
		return;
	}

	if(!$('input[id="date-picker"]').val() && $('input[id="date-picker"]').val() == ""){
		alert("게시기간 선택은 필수입니다.");
		$('input[id="date-picker"]').focus();
		return;
	}

	if(!$('textarea[name="noticeContent"]').val() && $('textarea[name="noticeContent"]').val() == ""){
		alert("내용 입력은 필수입니다.");
		$('textarea[name="noticeContent"]').focus();
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

	const formData = new FormData();
	formData.append("noticeTitle",noticeTitle)
	formData.append("noticeImportance",noticeImportance)
	formData.append("noticeContent",noticeContent)
	formData.append("noticeSdate",noticeSdate)
	formData.append("noticeEdate",noticeEdate)
	formData.append("noticeWriter",'${loginUser.empCode}')


	for(var file of attached.files){
		formData.append("attached",file,file.name);
	};

 	fetch('register',{
		method:'POST',
		headers:{},
		body: formData,
	})
	.then(response => response.json())
	.then(data => {
		console.log('Success:', data);
// 		location.reload();
// 		$('#modal-registerPost').modal('hide');
		window.location.reload();
		OpenWindow('detail.do?noticeCode='+data.noticeCode,'사내공지','950','830');
	})
	.catch((error) => {
		console.log('Error:', error);
		// json에 '<'가 들어가서 오류로 빠지는 현상으로 여기에 reload를 해줫음
		location.reload();
		$('#modal-registerPost').modal('hide');
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

function dataGo() {
	$('input[name="noticeImportance"]').attr('checked', 'checked');
	$('#date-picker').val("2022-02-19(토) ~ 2022-05-19(목)")
	$('input[name="noticeEdate"]').val("2022-02-19");
	$('input[name="noticeSdate"]').val("2022-05-19");
	$('input[name="noticeTitle"]').val("프로젝트 정보유출로 인한 시스템점검");

	$('#content').summernote('destroy');
	var str = "＊프로젝트 정보유출로 인한 시스템점검<br>";
	str += "7월 22일(월) 오후 1시(13시)~ 7월 23일(화) 오후 6시(18시)까지 / 17시간<br><br><br>";
	str += "＊점검  내용<br>";
	str +=  "수사결과발표를 통해 밝혀진 바와 같이 회사 내 범죄를 일으켜 침해를 시도한 것으로 확인되었습니다.<br>";
	str +=  "침해 감지 이후 불법으로 접근한 IP를 즉시 차단하고 보안을 한층 더 강화하려합니다.<br>";
	str +=  "무상 보안 업데이트를 실행하려합니다.<br>";
	str +=  "이번 일을 계기로 내부 보안체계 강화와 전 직원의 보안의식을 철저히 하여 향후 이러한 일이<br>";
	str +=  "발생하지 않도록 최선의 노력을 다하겠습니다.<br>";
	str +=  "사이트를 이용하시면서 불편한 사항은 이메일(design2@kui.co.kr)로 문의하시기 바랍니다.<br>";
	str +=  "많은 고객분들을 일괄처리하기 때문에 이에 관련된 전화 문의는 가급적 피해 주시기 바랍니다.<br>";
	$('#content').val(str);

	summernote_go($('textarea#content'), 300);


	$('#dataBtn').remove();
}

</script>

