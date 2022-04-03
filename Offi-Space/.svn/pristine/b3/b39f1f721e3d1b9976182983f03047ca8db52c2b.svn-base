<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    	var opening;
    	//var date1;
    	//var date2;

        window.onload = function() {
        	if('${apvFormCode}'){
        		form_go('${apvFormCode}');
        	}else if('${apv.apvFormCode}'){

        	}else{
	        	$('#approval-form').modal('show');
        	}


             //타자 칠 때마다 input value에 값 입력
            $('#approvalFormDiv').on('keyup', '.apv-input', function() {
        		var inputText = $(this).val();
        		$(this).attr('value',inputText);
        	});

         	//타자 칠 때마다 textarea value에 값 입력
            $('#approvalFormDiv').on('keyup', '.apv-textarea', function() {
        		var textareaText = $(this).val();
        		$(this).attr('data-textarea',textareaText);
        	});

            //타자 칠때마다 input칸 늘어나게
            $('#approvalFormDiv').on('keydown', '.apv-input', function() {
        		$(this).attr('size', $(this).val().length * 2);
        	});
            
            /* 
            
            //input date값 value에 넣어주기
            $('#approvalFormDiv').on('click', '#input-date1', function() {
            	date1 = $('#input-date1').val();
                //console.log("date1" + date1);
                $(this).attr('value',date1);
            });
            
            $('#approvalFormDiv').on('click', '#input-date2', function() {
           		date2 = $('#input-date2').val();
                console.log("date2" + date2);
                $(this).attr('value',date2);
            });

             */
            
            // date타입 오늘날짜부터 선택하도록 최소값 주기
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1; // 1월이면 0을 반환해서 +1 해주기
            var day = today.getDate();

            // 10보다 작을 경우 '0' 붙여주기
            if(month<10){
            	month='0'+month
            }
            if(day<10){
            	day='0'+day
            }

            var minDate = year + "-" + month + "-" + day; // 2022-01-27 형태로 만들기

            $('input#apvEndDt').attr('min',minDate); // min속성 주기


            /*  data-range-picker */
           /*  const jobStartDt = document.querySelector('input[name="jobStartDt"]');
		   	const jobClosingDt = document.querySelector('input[name="jobClosingDt"]');
			$('#approvalFormDiv').ready(function() {
				 $('#approvalFormDiv').on("click",'input[name="dates"]', function(){
					 console.log(this);
					 //document.querySelector('input[name="dates"]').click();
					setDatePicker(this);
				})
			}); */

            if('${apv.apvEmergency}' == 'Y'){
				$('#emergency').attr('checked', true);
            }

			if('${apv.apvImportance}' == 'Y'){
				$('#emergency').attr('checked', true);
            }

			// 파일 업로드 시 필요한 애들
			const attached = document.querySelector('#attached');
			const form = document.querySelector('form[name="registerPostForm"]');
			const newFile = document.querySelector('#newFile');

			attached.style.opacity=0;
			attached.addEventListener('change', updateFileDisplay);

        }

        /* function setDatePicker(picker){
        	 $(picker).daterangepicker({
	       	      autoUpdateInput: false,
	       	      locale: {
	       	          cancelLabel: 'Clear'
	       	      }
	       	  });
	       	  $(picker).on('apply.daterangepicker', function(ev, picker) {
	       	      $(this).val(picker.startDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.startDate.format('YYYY-MM-DD'))+')'+ ' ~ ' + picker.endDate.format('YYYY-MM-DD')+'('+getDayOfWeek(picker.endDate.format('YYYY-MM-DD'))+')');
	       			jobStartDt.value = picker.startDate.format('YYYY-MM-DD');
	       			jobClosingDt.value = picker.endDate.format('YYYY-MM-DD');
	       	  });
	       	  $(picker).on('cancel.daterangepicker', function(ev, picker) {
	       	      $(this).val('');
	       	  });
        } */

        function selectedEvent(select) {
        	document.getElementById('selectValue').value = select;
		}

        // 양식 띄우는 애
        function form_go(apvFormCode) {

        	$.ajax({
    			url : "getApprovalForm?apvFormCode="+apvFormCode,
    			type : "get",
    			dataType : "json",
    			success : function(result) {
    				//alert(result.reportMarkup);
    				$('#approvalFormDiv').html(result.apvFormMarkup);
    				$('#approval-form').modal('hide');

    				summernote_go($('textarea#content'), 500);

    				$('#cnt').val(result.apvFormCnt);
    				$('#cntH').val(result.apvFormCntH);


    				$('#approvalFormDiv').ready(function() {
    		        	$('input[name="approvalWriter"]').attr('value',"${loginUser.empName}"+" "+"${loginUser.positionValue}");
    		        	$('input[name="approvalTeam"]').attr('value',"${loginUser.teamValue}");
    		        	$('input[name="approvalDt"]').attr('value',"${yyyy}년 ${MM}월 ${dd}일");
    				});

    				// 문서 양식 코드
    				var input = $('<input>').attr({'type' : 'hidden','name' : 'apvFormCode', 'value' : result.apvFormCode});
    				$('form[name="registerForm"]').prepend(input);



    			},
    			error : function(xhr) {
    				alert("양식 불러오기 실패..ㅠㅠㅠ");
    			}
    		});
		}
		
        // 양식선택 버튼
        function apv_form_modal_show(){
        	$('#approval-form').modal('show');
        }
        
        // 결재선 지정
        function open_line_set(){
        	$('input.line').remove();
        	OpenWindow('<%=request.getContextPath()%>/approval/approvalLineSet', '', '950', '615');
        }

        // 양식 미리보기
        function formPreview(apvFormCode) {
        	OpenWindow('<%=request.getContextPath()%>/approval/formPreview?apvFormCode=' + apvFormCode, '결재양식 미리보기', '870', '700');
		}

        // 결재 요청
		function regist_approval(){
        	
			$('#approvalFormDiv').ready(function() {
				
				var apvLineChByName = $('#f_apline_name_0').text();

				if(apvLineChByName == ""){
					//alert("결재선을 지정해주세요.")

					Swal.fire({
					  title: '결재선을 지정해주세요',
					  icon: 'warning',
					  //text: '결재선을 지정해주세요',
					  showConfirmButton: false,
					  timer: 1500
					});

					return false;
				}


			if($('#apvEndDt').val() == ""){
				//alert("결재기한을 지정해주세요.")

				Swal.fire({
					  title: '결재기한을 지정해주세요',
					  icon: 'warning',
					  //text: '결재기한을 지정해주세요',
					  showConfirmButton: false,
					  timer: 1500
					});

				return false;
			}


			var apvFormCode = $('[name="apvFormCode"]').val();
			
			
			/* 재택근무신청서 */
			if(apvFormCode == 'AF0012'){
					
					// input date값 value에 넣어주기
	             	var date1 = $('#input-date1').val();
	                //console.log("date1" + date1);
	                $('#input-date1').attr('value',date1);
	                console.log("#input-date1" + $('#input-date1').attr('value'));
	            
	            	var date2 = $('#input-date2').val();
	                console.log("으아아아date2" + date2);
	                $('#input-date2').attr('value',date2);
	                console.log("#input-date2" + $('#input-date2').attr('value'));
			}
			


			Swal.fire({
				  title: '결재를 요청하시겠습니까?',
				  //text: text,
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonText: '결재요청',
				  cancelButtonText: '취소',
				  reverseButtons: false
				})
				.then((result) => {
					if (result.isConfirmed) {

						/* 재택근무신청서 */
						if(apvFormCode == 'AF0012'){

							//alert("이거 타니!!");

							$('#approvalFormDiv').ready(function() {
								
// 								// input date값 value에 넣어주기
// 				             	var date1 = $('#input-date1').val();
// 				                //console.log("date1" + date1);
// 				                $('#input-date1').attr('value',date1);
// 				                console.log("#input-date1" + $('#input-date1').attr('value'));
				            
// 				            	var date2 = $('#input-date2').val();
// 				                console.log("으아아아date2" + date2);
// 				                $('#input-date2').attr('value',date2);
// 				                console.log("#input-date2" + $('#input-date2').attr('value'));
				                

								var WFHstartdate = $('.apv-home-startdate').val();
								//console.log("WFHstartdate : " + WFHstartdate);
								var WFHenddate = $('.apv-home-enddate').val();
								var WFHreason = $('.apv-home-reason').val();

								let data = {
										"startDt"    			 : WFHstartdate,
										"endDt"    				 : WFHenddate,
										"applicationReason"      : WFHreason
									}

								$.ajax({
									url : "<%=request.getContextPath()%>/attend/registerWorkFromHome.do",
									type : "post",
									data : JSON.stringify(data),
									dataType : 'text',
									contentType : 'application/json',
									success : function(msg) {
									},
									error : function(xhr) {
									}
								});

							});

						}


						/* 연차신청서 */
						if(apvFormCode == 'AF0011'){

							//alert("연차 이거 타니!!");

							$('#approvalFormDiv').ready(function() {

								var ANstartdate = $('.apv-an-startdate').val();
								var ANenddate = $('.apv-an-enddate').val();
								var ANdays = $('.apv-an-days').val();
								var ANreason = $('.apv-an-reason').val();

								//console.log("ANstartdate : " + ANstartdate);
								//console.log("ANenddate : " + ANenddate);
								//console.log("ANdays : " + ANdays);
								//console.log("ANreason : " + ANreason);

								let data = {
										"annStartDt"    : ANstartdate,
										"annEndDt"    	: ANenddate,
										"annUsedCnt"    : ANdays,
										"annReason"    : ANreason
									}

								$.ajax({
									url : "<%=request.getContextPath()%>/attend/registerAnnualHistory.do",
									type : "post",
									data : JSON.stringify(data),
									dataType : 'text',
									contentType : 'application/json',
									success : function(msg) {
									},
									error : function(xhr) {
									}
								});

							});

						}


						/* 임시저장 여부 form에 추가 */
						var input = $('<input>').attr({'type' : 'hidden','name' : 'apvTemporary', 'value' : 'N'});
						$('form[name="registerForm"]').append(input);

						var markUp = $('#approvalFormDiv').html();
						var title = $('.approval-title').val();

						var markUpInput = $('<input>').attr({'type' : 'hidden','name' : 'apvMarkUp', 'value' : markUp});
						$('form[name="registerForm"]').append(markUpInput);

						var titleInput = $('<input>').attr({'type' : 'hidden','name' : 'apvTitle', 'value' : title});
						$('form[name="registerForm"]').append(titleInput);

						$('form[name="registerForm"]').submit();


					} else if ( result.dismiss === Swal.DismissReason.cancel) {
						callCancel(canTitle,canText);
				 	}
				});


			});

        	<%--  location.href = '<%=request.getContextPath()%>/approval/register'; --%>
        }

		// 임시저장
		function temp_approval() {

			Swal.fire({
				  title: '임시저장하시겠습니까?',
				  //text: text,
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonText: '확인',
				  cancelButtonText: '취소',
				  reverseButtons: false
				})
				.then((result) => {
					if (result.isConfirmed) {

						/* 임시저장 여부 form에 추가 */
						var input = $('<input>').attr({'type' : 'hidden','name' : 'apvTemporary', 'value' : 'Y'});
						$('form[name="registerForm"]').append(input);

						var markUp = $('#approvalFormDiv').html();
						var title = $('.approval-title').val();

						var markUpInput = $('<input>').attr({'type' : 'hidden','name' : 'apvMarkUp', 'value' : markUp});
						$('form[name="registerForm"]').append(markUpInput);

						var titleInput = $('<input>').attr({'type' : 'hidden','name' : 'apvTitle', 'value' : title});
						$('form[name="registerForm"]').append(titleInput);

						$('form[name="registerForm"]').submit();

					} else if ( result.dismiss === Swal.DismissReason.cancel) {
						callCancel(canTitle,canText);
				 	}
				});

		}

		// 긴급 체크 박스 checked 넣어주고 hidden값 변경
		function check_emer(element) {
			if(!$('#import').is(':checked')){
				if($('#emergency').is(':checked') == true){
					$('#emergency').attr('checked', true);
					$('#apvEmergency').val('Y');
				}

				if($('#emergency').is(':checked') == false){
					$('#emergency').removeAttr('checked');
					$('#apvEmergency').val('N');
				}
			}else if($('#import').is(':checked')){
				//alert("긴급과 중요는 하나만 설정 가능합니다.");
				callCustomAlert('긴급과 중요는 하나만 설정 가능합니다.','','warning');
				element.checked = false;
			}

		}

		// 중요도 체크 박스 checked 넣어주고 hidden값 변경
		function check_import(element) {
			if(!$('#emergency').is(':checked')){
				if($('#import').is(':checked') == true){
					$('#import').attr('checked', true);
					$('#apvImportance').val('Y');
				}

				if($('#import').is(':checked') == false){
					$('#import').removeAttr('checked');
					$('#apvImportance').val('N');
				}
			}else if($('#emergency').is(':checked')){
				//alert("긴급과 중요는 하나만 설정 가능합니다.");
				callCustomAlert('긴급과 중요는 하나만 설정 가능합니다.','','warning');
				element.checked = false;
			}
		}

		// 미리보기
		function preview() {

			var markUp = $('#approvalFormDiv').html();
			$('#formMarkUp').html(markUp);
			$('#previewModal').modal('show');

			//$('input').prop('disabled',true);
			//$('textarea').prop('disabled',true);

			let textareaNode = document.querySelectorAll('textarea');
			if(textareaNode != null){
				textareaNode.forEach(input=>{

					let textarea = input.dataset.textarea;

					if(textarea == null){
						input.value = "";
					}else{
						input.value = textarea;
					}

				})
			};
		}

		// 결재 기한 날짜 고르면 form태그 안에 hidden에 value넣어주는 function
		function dateChange() {
			var date = $('#apvEndDt').val();
			$('input[name="apvEndDt"]').val(date);
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

		  }  else {
		    const list = document.createElement('ol');
		    newFile.appendChild(list);

		    for(const file of curFiles) {

		      const listItem = document.createElement('li');
		      const para = document.createElement('p');

		      if(validFileType(file)) {
		        para.textContent = file.name+', size:'+returnFileSize(file.size)+'.';
		        para.className = 'attachFile';
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

		/* 파일 수정하는 것 */
		function removeFile_go(attachCode) {

			var li = $('li.' + attachCode);

			Swal.fire({
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