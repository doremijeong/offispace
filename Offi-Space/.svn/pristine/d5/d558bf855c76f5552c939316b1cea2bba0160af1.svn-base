<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script type="text/javascript">

	/* 중요도 변경 */
	function importance_go(code) {
		$.ajax({
			url : "<%=request.getContextPath()%>/mail/modifyImportance.do?mailCode=" + code,
			type : 'get',
			contentType : "application/json",
			success : function(result) {
				Swal.fire({
					  title: '중요도 변경을 완료했습니다.',
					  icon: 'info',
					  //text: '결재선을 지정해주세요',
					  showConfirmButton: true,
					  timer: 1500
					});
				location.reload();
			},
			error : function(error) {
				callFail();
			}
		})
	}

	/* 디테일로 이동 */
	function mailDetail(code,kindOfmail) {
		location.href = "<%=request.getContextPath()%>/mail/detail.do?mailCode="+code + "&kindOfMail=" + kindOfmail;
	}

	/* 페이지 이동 */
	function list_go(page, url) {
		if(!url) url="list.do";

		var jobForm = $('#jobForm');

		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val())
		jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

		jobForm.attr({
			action : url,
			method : "get"
		}).submit();

	}

	/* 새로고침 */
	function refresh() {
		location.reload();
	}

	/* 임시보관함에서 디테일을 눌렀을떄 */
	function tempGO(mailCode) {
		location.href = "<%=request.getContextPath()%>/mail/tempGO?mailCode=" + mailCode;
	}

	/* 임시저장 */
	function tempStore() {

		if($('.select2bs4').val() ==''){
			Swal.fire({
				  title: '받는 사람 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			return;
		}

		if(!$('input[name="mailTitle"]').val() && $('input[name="mailTitle"]').val() == ""){
			Swal.fire({
				  title: '제목 입력은 필수입니다.',
				  icon: 'warning',
				  //text: '결재선을 지정해주세요',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTitle"]').focus();
			return;
		}


		Swal.fire({
		      text: '임시저장을 하시겠습니까?',
		      icon: 'info',
		      showCancelButton: true,
		      confirmButtonText: '임시저장',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
					var input = $('<input>').attr({'type' : 'hidden','name' : 'mailTemp', 'value' : 'Y'});
			
					$('form[name="registerForm"]').append(input);
			
					if($('#imporCheck').attr('checked')){
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'Y'});
						$('form[name="registerForm"]').append(importance);
					}else{
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'N'});
						$('form[name="registerForm"]').append(importance);
					}
					
					$('form[name="registerForm"]').submit();
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            return;
		         }
		    });

	}

	/* 미리보기 */
	function preview() {

		if($("#mailTo option:selected").val()){
			str = ""
			for (let mailTo of $("#mailTo option:selected").text()) {
				str += mailTo
			};
			$('#preMailTo').html(str);
		}

		if($('#mailReference option:selected').val()){
			str = ""
			for (let mailReference of $("#mailReference option:selected").text()) {
				str += mailReference
			};
			$('#preMailReference').html(str);
		}

		$('#preMailTitle').html($('input[name="mailTitle"]').val());
		$('#preMailContent').html($('textarea[name="mailCont"]').val());

		uploadFiles = document.getElementsByClassName('mailFiles');

		fileNames = "";
		attachLis = document.getElementsByClassName('attachFile');

		for (var attachLi of attachLis) {
			fileNames += attachLi.innerHTML + "<br>";
		}

		for (var file of uploadFiles) {
			if(file.files[0] != null && file.files[0].name){
				fileNames += file.files[0].name+"&nbsp;&nbsp;["+ (file.files[0].size / 1024).toFixed(2) +"KB]" +"</br>";
			}
		}
		$('#preMailFile').html(fileNames);
		$('#previewModal').modal('show');
	}

	/* 전송하기 */
	function gogo() {

		if(!$('select[name="mailTo"] option:selected').val() && $('select[name="mailTo"] option:selected').val() == ""){
			Swal.fire({
				  title: '받는 사람 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			return;
		}

		if(!$('input[name="mailTitle"]').val() && $('input[name="mailTitle"]').val() == ""){
			Swal.fire({
				  title: '제목 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTitle"]').focus();
			return;
		}


		Swal.fire({
		      text: '메일을 전송하시겠습니까?',
		      icon: 'info',
		      showCancelButton: true,
		      confirmButtonText: '전송',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	
					var input = $('<input>').attr({'type' : 'hidden','name' : 'mailTemp', 'value' : 'N'});
			
					$('form[name="registerForm"]').append(input);
			
					if($('#imporCheck').attr('checked')){
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'Y'});
						$('form[name="registerForm"]').append(importance);
					}else{
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'N'});
						$('form[name="registerForm"]').append(importance);
					}
					
		        	$('form[name="registerForm"]').submit();
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            return;
		         }
		    });
	}

	function main_tempStore() {

		if($('.select2bs4').val() ==''){
			Swal.fire({
				  title: '받는 사람 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTo"]').focus();
			return;
		}

		if(!$('input[name="mailTitle"]').val() && $('input[name="mailTitle"]').val() == ""){
			Swal.fire({
				  title: '제목 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTitle"]').focus();
			return;
		}


		Swal.fire({
		      text: '메일을 임시저장하시겠습니까?',
		      icon: 'info',
		      showCancelButton: true,
		      confirmButtonText: '임시저장',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
					var input = $('<input>').attr({'type' : 'hidden','name' : 'mailTemp', 'value' : 'Y'});
			
					$('form[name="registerForm"]').append(input);
			
					if($('#imporCheck').attr('checked')){
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'Y'});
						$('form[name="registerForm"]').append(importance);
					}else{
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'N'});
						$('form[name="registerForm"]').append(importance);
					}
			
					var form = $('form[name="registerForm"]')[0];
			
					var data = new FormData(form);
					
		        	$.ajax({
		    	    	type: "POST",
		    	        enctype: 'multipart/form-data',
		    	        url: "main/register",
		    	        data: data,
		    	        processData: false,
		    	        contentType: false,
		    	        success: function (data) {
		    	        	
		    	        	Swal.fire({
								  title: '메일을 임시저장하였습니다.',
								  icon: 'success',
								  showConfirmButton: false,
								  timer: 1500
							});
		    	        	
		    				window.close();
		    	        },
		    	        error: function (e) {
		    	        	console.log("ERROR : ", e);
		    	         }
		    		});
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            return;
		         }
		    });
	}
	
	function main_transfer() {

		if($('.select2bs4').val() ==''){
			Swal.fire({
				  title: '받는 사람 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTo"]').focus();
			return;
		}

		if(!$('input[name="mailTitle"]').val() && $('input[name="mailTitle"]').val() == ""){
			Swal.fire({
				  title: '제목 입력은 필수입니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
			$('input[name="mailTitle"]').focus();
			return;
		}


		Swal.fire({
		      text: '메일을 전송하시겠습니까?',
		      icon: 'info',
		      showCancelButton: true,
		      confirmButtonText: '전송',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
					var input = $('<input>').attr({'type' : 'hidden','name' : 'mailTemp', 'value' : 'N'});
			
					$('form[name="registerForm"]').append(input);
			
					if($('#imporCheck').attr('checked')){
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'Y'});
						$('form[name="registerForm"]').append(importance);
					}else{
						var importance = $('<input>').attr({'type' : 'hidden','name' : 'mailImportance', 'value' : 'N'});
						$('form[name="registerForm"]').append(importance);
					}
			
					var form = $('form[name="registerForm"]')[0];
			
					var data = new FormData(form);
					
		        	$.ajax({
		    	    	type: "POST",
		    	        enctype: 'multipart/form-data',
		    	        url: "main/register",
		    	        data: data,
		    	        processData: false,
		    	        contentType: false,
		    	        success: function (data) {
		    	        	
		    	        	Swal.fire({
								  title: '메일을 전송하였습니다.',
								  icon: 'success',
								  showConfirmButton: false,
								  timer: 1500
							});
		    	        	
		    				window.close();
		    	        },
		    	        error: function (e) {
		    	        	console.log("ERROR : ", e);
		    	         }
		    		});
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            return;
		         }
		    });
	}

	/* 중요도 체크 속성 심어주는 함수 */
	function import_go() {
		if($('#imporCheck').is(':checked') == true){
			$('#imporCheck').attr('checked', true);
		}

		if($('#imporCheck').is(':checked') == false){
			$('#imporCheck').removeAttr('checked');
		}
	}

	/* 작성하다가 초기화 하는 방법 - summernote 부분 보완필요 */
	function reset() {
		$('input[name="mailTitle"]').val("");
		$('input[name="mailTo"]').val("");
		$('input[name="mailFrom"]').val("");
		$('input[name="mailReference"]').val("");
		$('div .fileInput').empty();
		$('#content').summernote('reset');
	}

	window.onload = function () {
		/* 체크박스 선택 */
		$('.checkbox-toggle').click(function() {
			var clicks = $(this).data('clicks');
			if (clicks) {
				//Uncheck all checkboxes
				$('.mailbox-messages input[type=\'checkbox\']').prop('checked', false);
				$('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square');
			} else {
				//Check all checkboxes
				$('.mailbox-messages input[type=\'checkbox\']').prop('checked', true);
				$('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square');
			}
			$(this).data('clicks', !clicks);
		})
	}

	/* 보관함으로 이동 */
	function moveToStore(aa) {

		Swal.fire({
		      text: '보관함에 보관하시겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '보관',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
						url : '<%=request.getContextPath()%>/mail/moveToStore?mailCode=' + aa,
						method : 'get',
						success: function() {
							location.href = "<%=request.getContextPath()%>/mail/list.do?kindOfMail=store";
						},
						error : function() {
							callFail();
						}
					})
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		         }
		    });
	}

	/* 휴지통으로 이동 */
	function moveToTrash(aa) {
		Swal.fire({
		      text: '휴지통으로 이동시키겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '이동',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
						url : '<%=request.getContextPath()%>/mail/moveToTrash?mailCode=' + aa,
						method : 'get',
						success: function() {
							location.href = "<%=request.getContextPath()%>/mail/list.do?kindOfMail=trash";
						},
						error : function() {
							callFail();
						}
					})
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		         }
		    });
	}

	/* 휴지통에서 영구 삭제 */
	function realRemove(mailCode) {
		Swal.fire({
		      text: '삭제하면 복구가 불가능 합니다. \n 정말로 삭제하시겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '삭제',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
						url : '<%=request.getContextPath()%>/mail/permanentlyDelete?mailCode=' + mailCode,
						method : 'get',
						success: function() {
							location.href = "<%=request.getContextPath()%>/mail/list.do?kindOfMail=trash";
						},
						error : function() {
							callFail();
						}
					})
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		         }
		    });
	}

	/* 목록으로 돌아가는 함수 */
	function backToList(where){
		location.href = "list.do?kindOfMail=" + where;
	}

	/* 휴지통에서 메일 복구하는 함수 */
	function restore(mailCode) {
		Swal.fire({
		      text: '복구하시겠습니까?',
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonText: '복구',
		      cancelButtonText: '취소',
		      reverseButtons: false
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
						url : '<%=request.getContextPath()%>/mail/restore?mailCode=' + mailCode,
						method : 'get',
						success: function() {
							location.href = "<%=request.getContextPath()%>/mail/list.do?kindOfMail=trash";
						},
						error : function() {
							callFail();
						}
					})
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		         }
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
		         }
		    });

    }

	/* 목록에서 여러개 선택해서 보내는 함수 */
 	function moveToTrachCheck() {
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    } else {

	    	Swal.fire({
			      text: sendCnt+"개의 메일을 휴지통으로 이동하시겠습니까?",
			      icon: 'warning',
			      showCancelButton: true,
			      confirmButtonText: '이동',
			      cancelButtonText: '취소',
			      reverseButtons: false
			    })
			    .then((result) => {
			        if (result.isConfirmed) {
			        	$.ajax({
			 	    		url : "chkMoveToTrash.do",
			 	    		type : "post",
			 	    		data : {"sendArray" : sendArray},
			 	    		success: function(data){
			 	    			location.reload();
			 	    		},
			 	    		error: function(xhr) {
			 	    			callFail();
			 	    		}
			 	    	});
			        } else if ( result.dismiss === Swal.DismissReason.cancel) {
			         }
			    });
	    }
	}

 	/* 목록에서 여러개 선택해서 보내는 함수 */
 	function moveToStoreCheck() {
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    } else {
	    	Swal.fire({
			      text: sendCnt+"개의 메일을 보관하시겠습니까?",
			      icon: 'warning',
			      showCancelButton: true,
			      confirmButtonText: '보관',
			      cancelButtonText: '취소',
			      reverseButtons: false
			    })
			    .then((result) => {
			        if (result.isConfirmed) {
			        	$.ajax({
			 	    		url : "chkMoveToStore.do",
			 	    		type : "post",
			 	    		data : {"sendArray" : sendArray},
			 	    		success: function(data){
			 	    			location.reload();
			 	    		},
			 	    		error: function(xhr) {
			 	    			callFail();
			 	    		}
			 	    	});
			        } else if ( result.dismiss === Swal.DismissReason.cancel) {
			         }
			    });
	    }
	}

 	function chkRealRemove(){
 		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    } else {

	    	Swal.fire({
			      text: sendCnt+"개의 메일을 삭제하시겠습니까?",
			      icon: 'warning',
			      showCancelButton: true,
			      confirmButtonText: '삭제',
			      cancelButtonText: '취소',
			      reverseButtons: false
			    })
			    .then((result) => {
			        if (result.isConfirmed) {
			        	$.ajax({
			 	    		url : "chkRealRemove.do",
			 	    		type : "post",
			 	    		data : {"sendArray" : sendArray},
			 	    		success: function(data){
			 	    			location.reload();
			 	    		},
			 	    		error: function(xhr) {
			 	    			callFail();
			 	    		}
			 	    	});
			        } else if ( result.dismiss === Swal.DismissReason.cancel) {
			         }
			    });
	    }
 	}


 	function chkRestore(){
 		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    } else {
	    	Swal.fire({
			      text: sendCnt+"개의 메일을 복구하시겠습니까?",
			      icon: 'warning',
			      showCancelButton: true,
			      confirmButtonText: '복구',
			      cancelButtonText: '취소',
			      reverseButtons: false
			    })
			    .then((result) => {
			        if (result.isConfirmed) {
			        	$.ajax({
			 	    		url : "chkRestore.do",
			 	    		type : "post",
			 	    		data : {"sendArray" : sendArray},
			 	    		success: function(data){
			 	    			location.reload();
			 	    		},
			 	    		error: function(xhr) {
			 	    			callFail();
			 	    		}
			 	    	});
			        } else if ( result.dismiss === Swal.DismissReason.cancel) {
			         }
			    });
	    }
 	}

	function replyMail(mailCode) {
		location.href = "<%= request.getContextPath()%>/mail/reply?mailCode=" + mailCode;
	}

	function relayMail(mailCode) {
		location.href = "<%= request.getContextPath()%>/mail/relay?mailCode=" + mailCode;
	}

	function relayCheck() {
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	        return;
	    } else if (sendCnt > 1) {
	    	Swal.fire({
				  title: '1개의 메일만 선택해주세요.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    	return;
	    } else {
	    	location.href = "<%= request.getContextPath()%>/mail/relay?mailCode=" + sendArray[0]
	    }
	}

	function replyCheck() {
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checkSelect");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0){
			Swal.fire({
				  title: '선택된 메일이 없습니다.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	        return;
	    } else if (sendCnt > 1) {
	    	Swal.fire({
				  title: '1개의 메일만 선택해주세요.',
				  icon: 'warning',
				  showConfirmButton: true,
				  timer: 1500
				});
	    	return;
	    } else {
	    	location.href = "<%= request.getContextPath()%>/mail/reply?mailCode=" + sendArray[0]
	    }
	}

	function searchDetail() {
		$('#searchDetail').modal('show');
	}

	function search_go() {
		$('#jobForm input[name="to"]').val($('#to').val());
		$('#jobForm input[name="from"]').val($('#from').val());
		$('#jobForm input[name="sDate"]').val($('#sDate').val());
		$('#jobForm input[name="eDate"]').val($('#eDate').val());

		list_go(1);
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

		  Swal.fire({
			  title: '파일 등록은 5개까지만 가능합니다.',
			  icon: 'error',
			  showConfirmButton: false,
			  timer: 1500
			});
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
</script>