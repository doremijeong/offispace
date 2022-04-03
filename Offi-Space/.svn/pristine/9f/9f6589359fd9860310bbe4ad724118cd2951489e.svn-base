<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
window.onload  = function() {
	
	//쪽지 메인페이지에서 받은 쪽지 목록 불러오기
	msgCounts();
	getReceivedMsgList();
	getSendMsgList();
	getPersonalMsgList();
	getWorkMsgList();

$(function() {

	// 받은 쪽지함 : 읽음 처리 후 상세 보기
	$(document).on('click', '.msgTable tbody tr', function() {
		paramCode = $(this).find('.msgCode').text();
		//this.style.color="lightgray";

		$.ajax({
			url : "read.do?msgCode="+paramCode,
			type : "get",
			success : function(result) {
				//읽음 처리 성공하면 modal이 열림
				$.ajax({
					url : "detail?msgCode="+paramCode,
					type : "get",
					dataType : "json",
					success : function(result) {

						var code = result.msg.msgCode;
						var impt = result.msg.msgImpt;
						var fromId = result.msg.msgFrom;
						var fromName = result.msg.msgFromName;
						var fromTeam = result.msg.msgFromTeam;
						var fromPosition = result.msg.msgFromPosition;
						var date = result.msg.msgDt;
						var realDate = dateFormat(date); //날짜변환 함수
						var content = result.msg.msgContent;

						modal_msgDetail(code, impt, fromId, fromName, fromTeam, fromPosition, realDate, content); //상세 모달창 함수
					},
					error : function(xhr) {
						callFail();
					}
				}); //상세 보기 ajax
			},
			error : function(xhr) {
				callFail();
			}
		}); //읽음 처리 ajax
	}); //document

//===============================================================================

	// 보낸 쪽지함 : 상세 보기
	$(document).on('click', '.msgToTable tbody tr', function() {
		paramCode = $(this).find('.msgCode').text();

		$.ajax({
			url : "toDetail?msgCode="+paramCode,
			type : "get",
			dataType : "json",
			success : function(result) {

				var code = result.msg.msgCode;
				var impt = result.msg.msgImpt;
				var toId = result.msg.msgTo;
				var toName = result.msg.msgToName;
				var toTeam = result.msg.msgToTeam;
				var toPosition = result.msg.msgToPosition;
				var date = result.msg.msgDt;
				var realDate = dateFormat(date);
				var content = result.msg.msgContent;

				modal_msgToDetail(code, impt, toId, toName, toTeam, toPosition, realDate, content);
			},
			error : function(xhr) {
				callFail();
			}
		}); //ajax
	}); //document


//===============================================================================

	// 개인/업무/휴지통 : 보낸or받은 쪽지 구분해서 modal 열기
	$(document).on('click', '.msgMixedTable tbody tr', function() {
		paramCode = $(this).find('.msgCode').text();
		paramCont = $(this).find('.modal_msgDetail').text();
		var sent1 = "[sent]";
		var sent2 = paramCont.substr(0,6);

		//앞에 sent가 붙어 있다면...
		if(sent1 == sent2){
			$.ajax({
				url : "toDetail?msgCode="+paramCode,
				type : "get",
				dataType : "json",
				success : function(result) {
					var code = result.msg.msgCode;
					var impt = result.msg.msgImpt;
					var toId = result.msg.msgTo;
					var toName = result.msg.msgToName;
					var toTeam = result.msg.msgToTeam;
					var toPosition = result.msg.msgToPosition;
					var date = result.msg.msgDt;
					var realDate = dateFormat(date);
					var content = result.msg.msgContent;

					modal_msgToDetail(code, impt, toId, toName, toTeam, toPosition, realDate, content);
				},
				error : function(xhr) {
					callFail();
				}
			}); //ajax

		} else {
			$.ajax({
				url : "read.do?msgCode="+paramCode,
				type : "get",
				success : function(result) {
					//읽음 처리 성공하면 modal이 열림
					$.ajax({
						url : "detail?msgCode="+paramCode,
						type : "get",
						dataType : "json",
						success : function(result) {
							var code = result.msg.msgCode;
							var impt = result.msg.msgImpt;
							var fromId = result.msg.msgFrom;
							var fromName = result.msg.msgFromName;
							var fromTeam = result.msg.msgFromTeam;
							var fromPosition = result.msg.msgFromPosition;
							var date = result.msg.msgDt;
							var realDate = dateFormat(date); //날짜변환 함수
							var content = result.msg.msgContent;

							modal_msgDetail(code, impt, fromId, fromName, fromTeam, fromPosition, realDate, content); //상세 모달창 함수
						},
						error : function(xhr) {
							callFail();
						}
					}); //상세 보기 ajax
				},
				error : function(xhr) {
					callFail();
				}
			}); //읽음 처리 ajax
		}

	}); //document

//===============================================================================

	//쪽지 전체 선택 체크 박스
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


	/* //중요한 쪽지만 보기 버튼
	$('.checkbox-toggle2').click(function() {
		var clicks = $(this).data('clicks')
		if (clicks) {
			$('.checkbox-toggle2 .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
		} else {
			$('.checkbox-toggle2 .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
		}
		$(this).data('clicks', !clicks)
	});


	//안 읽은 쪽지만 보기 버튼
	$('.checkbox-toggle3').click(function() {
		var clicks = $(this).data('clicks')
		if (clicks) {
			$('.checkbox-toggle3 .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
		} else {
			$('.checkbox-toggle3 .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
		}
		$(this).data('clicks', !clicks)
	}); */


	//쪽지 쓰기 중요도 표시=========================================
	  // 기본 값
    $('#chkImp1').val(0);

	  // 해제 = 0, 체크 = 1(중요)
	  $('#check1').click(function () {
		  if($(this).is(':checked')){
	      $('#chkImp1').val(1);
		  } else {
			  $('#chkImp1').val(0);
		  }
	  });


	//쪽지 답장 중요도 표시=========================================
	  // 기본 값
    $('#chkImp2').val(0);

	  // 해제 = 0, 체크 = 1(중요)
	  $('#check2').click(function () {
		  if($(this).is(':checked')){
	      $('#chkImp2').val(1);
		  } else {
			  $('#chkImp2').val(0);
		  }
	  });


	//쪽지 쓰기 보내는 사람 선택 창=====================================
    //Initialize Select2 Elements
     $('.select2').select2({
   	 	closeOnSelect: true
     });


	//쪽지 쓰기 modal 닫을 때 리셋======================================
	$('#modal-default').on('hidden.bs.modal', function () {
    $(this).find('form').trigger('reset');
    $('.select2').val(null).trigger('change');
	});


	//글자수 제한 : 쪽지 보내기
	$('#msgTextarea').keyup(function(e) {
		let content = $(this).val();

		//글자수 세기
		if(content.length == 0 || content == '') {
			$('.textCount').text('0');
		} else {
			$('.textCount').text(content.length);
		}

		//글자수 제한
		if (content.length > 150) {
				// 200자 부터는 타이핑 되지 않도록
				$(this).val($(this).val().substring(0, 150));
				// 200자 넘으면 알림창 뜨도록
				Swal.fire({
					  icon: 'warning',
					  text: '글자수는 150자까지 입력 가능합니다.',
					  showConfirmButton: false,
					  timer: 1500
				});
			};
	})


	//글자수 제한 : 답장
	$('#replyMsgTextarea').keyup(function(e) {
		let content = $(this).val();

		//글자수 세기
		if(content.length == 0 || content == '') {
			$('.textCount').text('0');
		} else {
			$('.textCount').text(content.length);
		}

		//글자수 제한
		if (content.length > 150) {
				// 200자 부터는 타이핑 되지 않도록
				$(this).val($(this).val().substring(0, 150));
				// 200자 넘으면 알림창 뜨도록
				Swal.fire({
					  icon: 'warning',
					  text: '글자수는 150자까지 입력 가능합니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
			};
	})


	}); //function
} //window.onload

//===============================================================================

// 받은/개인/업무 쪽지함 : 쪽지 상세 모달창에 데이터 넣기
function modal_msgDetail(code, impt, fromId, fromName, fromTeam, fromPosition, realDate, content) {

	$('#modal-from #msgCode').html(code);
	if(impt == 1) $('#modal-from #msgImpt').html("<i class='fas fa-exclamation text-danger'></i>&nbsp;&nbsp;");
	$('#modal-from #msgFromId').html(fromId);
	$('#modal-from #msgFrom').html(fromName);
	$('#modal-from #msgFromPosition').html("&nbsp;"+fromPosition);
	$('#modal-from #msgFromTeam').html("&nbsp;["+fromTeam+"]");
	$('#modal-from #msgDate').html("<i class='far fa-clock'></i>&nbsp;&nbsp;"+realDate);
	$('#modal-from #msgFromContent').html(content);

	$('#modal-from').modal('show');
};

//===============================================================================

// 보낸 쪽지함 : 쪽지 상세 모달창에 데이터 넣기
function modal_msgToDetail(code, impt, toId, toName, toTeam, toPosition, realDate, content) {

	$('#modal-to #msgToCode').html(code);
	if(impt == 1) $('#modal-To #msgImpt').html("<i class='fas fa-exclamation text-danger'></i>&nbsp;&nbsp;");
	$('#modal-to #msgToId').html(toId);
	$('#modal-to #msgTo').html(toName);
	$('#modal-to #msgToPosition').html("&nbsp;"+toPosition);
	$('#modal-to #msgToTeam').html("&nbsp;["+toTeam+"]");
	$('#modal-to #msgDate').html("<i class='far fa-clock'></i>&nbsp;&nbsp;"+realDate);
	$('#modal-to #msgContent').html(content);

	$('#modal-to').modal('show');
};

//===============================================================================

//쪽지 상세 모달에 들어가는 날짜변환
function dateFormat(date) {

  var week = new Array('일', '월', '화', '수', '목', '금', '토');
  var today = new Date(date).getDay();
  var todayLabel = week[today];

	var getDate = new Date(date);
	var realDate = getDate.getFullYear()+"-"+(getDate.getMonth()+1)+"-"+getDate.getDate() +"("+todayLabel+")"+
				   "&nbsp;" + getDate.getHours()+":"+getDate.getMinutes();

	return realDate;
};

//===============================================================================

// 받은 쪽지 상세에서 삭제(휴지통 이동)
function moveToBin() {
	var paramCode = document.getElementById("msgCode").textContent;
	
	Swal.fire({
	  text: "쪽지를 삭제하시겠습니까?",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonText: '확인',
	  cancelButtonText: '취소',
	  reverseButtons: false
	})
	.then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url : "<%=request.getContextPath()%>/message/bin.do?msgCode=" + paramCode,
				type : "get",
				success : function(result) {
					Swal.fire({
					  text: "쪽지를 삭제하였습니다.",
					  icon: 'success',
					  confirmButtonText: '확인',
					  reverseButtons: false
					})
					.then((result) => {
						location.reload();
					});
				},
				error : function(xhr) {
					callFail();
				}
			}); // ajax
		} else if ( result.dismiss === Swal.DismissReason.cancel) {
			callCancel(canTitle,canText);
	 	}
	});
	
};

//===============================================================================

// 보낸 쪽지 상세에서 삭제(휴지통 이동)
function moveToBin2() {

	var paramCode = document.getElementById("msgToCode").textContent;

	Swal.fire({
  text: "쪽지를 삭제하시겠습니까?",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: '확인',
  cancelButtonText: '취소',
  reverseButtons: false
	})
	.then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url : "bin.do?msgCode=" + paramCode,
				type : "get",
				success : function(result) {
					Swal.fire({
						  text: "쪽지를 삭제하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							location.reload();
						});
				},
				error : function(xhr) {
					callFail();
				}
			}); // ajax
		} else if ( result.dismiss === Swal.DismissReason.cancel) {
			callCancel(canTitle,canText);
	 	}
	});
	
};

//===============================================================================

// 쪽지 목록 : 체크박스로 휴지통 이동
function moveToBinBtn() {

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
				  icon: 'warning',
				  text: "선택된 쪽지가 없습니다.",
				  showConfirmButton: false,
				  timer: 1500
				});
     } else {
    	 
    		Swal.fire({
    			  text: "쪽지를 삭제하시겠습니까?",
    			  icon: 'warning',
    			  showCancelButton: true,
    			  confirmButtonText: '확인',
    			  cancelButtonText: '취소',
    			  reverseButtons: false
    			})
    			.then((result) => {
    				if (result.isConfirmed) {
    					$.ajax({
    		 	    		url : "chkBoxBin.do",
    		 	    		type : "post",
    		 	    		data : {"sendArray" : sendArray},
    		 	    		success: function(data){
    		 	    			Swal.fire({
    		 						  text: "쪽지를 삭제하였습니다.",
    		 						  icon: 'success',
    		 						  confirmButtonText: '확인',
    		 						  reverseButtons: false
    		 						})
    		 						.then((result) => {
    		 							location.reload();
    		 						});
    		 	    		},
    		 	    		error: function(xhr) {
    		 	    			callFail();
    		 	    		}
    		 	    	}); //ajax
    				} else if ( result.dismiss === Swal.DismissReason.cancel) {
    					callCancel(canTitle,canText);
    			 	}
    			});
     }; //else
};

//===============================================================================

// 휴지통 : 체크박스로 영구삭제
function deleteMsgBtn() {

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
			  icon: 'warning',
			  text: "선택된 쪽지가 없습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
     } else {
    	 
    	 Swal.fire({
    		  text: "삭제한 쪽지는 복구할 수 없습니다. 삭제하시겠습니까?",
    		  icon: 'warning',
    		  showCancelButton: true,
    		  confirmButtonText: '확인',
    		  cancelButtonText: '취소',
    		  reverseButtons: false
    		})
    		.then((result) => {
    			if (result.isConfirmed) {
    				$.ajax({
    		 	   		url : "delete.do",
    		 	   		type : "post",
    		 	   		data : {"sendArray" : sendArray},
    		 	   		success : function(result) {
	    		 	   		Swal.fire({
	    						  text: "쪽지를 삭제하였습니다.",
	    						  icon: 'success',
	    						  confirmButtonText: '확인',
	    						  reverseButtons: false
	    						})
	    						.then((result) => {
	    							location.reload();
	    						});
    		 	   		},
    		 	   		error : function(xhr) {
    		 	   		callFail();
    		 	   		}
    	 	    	}); // ajax
    			} else if ( result.dismiss === Swal.DismissReason.cancel) {
    				callCancel(canTitle,canText);
    		 	}
    		});
     }; // else
};

//===============================================================================

// 쪽지 목록 : 체크박스로 개인보관함 이동
function moveToPersonalBtn() {

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
			  icon: 'warning',
			  text: "선택된 쪽지가 없습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
     } else {

 	    	$.ajax({
 	    		url : "chkBoxPersonal.do",
 	    		type : "post",
 	    		data : {"sendArray" : sendArray},
 	    		success: function(data){
 	    			Swal.fire({
 						  text: "쪽지를 개인 보관함으로 이동하였습니다.",
 						  icon: 'success',
 						  confirmButtonText: '확인',
 						  reverseButtons: false
 						})
 						.then((result) => {
 							location.reload();
 						});
 	    		},
 	    		error: function(xhr) {
 	    			callFail();
 	    		}
 	    	}); //ajax
     }; //else
};

//===============================================================================.

// 쪽지 목록 : 체크박스로 업무보관함 이동
function moveToWorkBtn() {

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
			  icon: 'warning',
			  text: "선택된 쪽지가 없습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
     } else {

 	    	$.ajax({
 	    		url : "chkBoxWork.do",
 	    		type : "post",
 	    		data : {"sendArray" : sendArray},
 	    		success: function(data){
 	    			Swal.fire({
						  text: "쪽지를 업무 보관함으로 이동하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							location.reload();
						});
 	    		},
 	    		error: function(xhr) {
 	    			callFail();
 	    		}
 	    	}); //ajax
     }; //else
};

//===============================================================================.

// 쪽지 목록 : 체크박스로 받은쪽지함 이동
function moveToFromBtn() {

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
			  icon: 'warning',
			  text: "선택된 쪽지가 없습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
   } else {

	    	$.ajax({
	    		url : "chkBoxFrom.do",
	    		type : "post",
	    		data : {"sendArray" : sendArray},
	    		success: function(data){
	    			Swal.fire({
						  text: "쪽지를 받은 쪽지함으로 이동하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							location.reload();
						});
	    		},
	    		error: function(xhr) {
	    			callFail();
	    		}
	    	}); //ajax
   }; //else
};

//===============================================================================.

// 쪽지 목록 : 체크박스로 보낸쪽지함 이동
function moveToSentBtn() {

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
			  icon: 'warning',
			  text: "선택된 쪽지가 없습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
   } else {

	    	$.ajax({
	    		url : "chkBoxTo.do",
	    		type : "post",
	    		data : {"sendArray" : sendArray},
	    		success: function(data){
	    			Swal.fire({
						  text: "쪽지를 보낸 쪽지함으로 이동하였습니다.",
						  icon: 'success',
						  confirmButtonText: '확인',
						  reverseButtons: false
						})
						.then((result) => {
							location.reload();
						});
	    		},
	    		error: function(xhr) {
	    			callFail();
	    		}
	    	}); //ajax
   }; //else
};

//===============================================================================

//onclick 쪽지쓰기 모달창 열기
function sendMsgModal() {
	$('#modal-default').modal('show');
}

//쪽지 보내기!
function sendMsg() {
	var sendForm = $("form[name='sendForm']").serialize();
	var msgContent = $('#msgTextarea').val();
		
	if(!msgContent) {
		 Swal.fire({
			  icon: 'warning',
			  text: "내용은 필수입니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}
	if($('.select2').val() == "" ) {
		 Swal.fire({
			  icon: 'warning',
			  text: "받는 사람을 선택해 주세요.",
			  showConfirmButton: false,
			  timer: 1500
			});
		return;
	}

	$.ajax({
		url : "<%=request.getContextPath()%>/message/sendMsg.do",
		type : "post",
		data : sendForm,
		success : function(result) {
			Swal.fire({
				  text: "쪽지를 전송하였습니다.",
				  icon: 'success',
				  confirmButtonText: '확인',
				  reverseButtons: false
				})
				.then((result) => {
					$('#modal-default').modal().hide();
					location.reload();
				});

		},
		error : function(xhr) {
			callFail();
		}
	});
}


//===============================================================================

	//답장 눌렀을 때 modal에 받는 사람 정보 넣기
	function replyMsg(replyId, replyName, replyPosition, replyTeam, replyContent) {

	 	$('#modal-from').modal().hide();

	 	document.getElementById('msgReplyId').setAttribute('value',replyId);
	 	document.getElementById('msgReplyTo').setAttribute('value',replyName+replyPosition+replyTeam);
		//$('#modal-reply #msgReplyContent').html("[re:] ");
		//$('#modal-reply #msgReplyContent').html("[re:]\n----------------------------------------------------------\n"+replyContent);

		$('#modal-reply').modal('show');
	}


	//답장 보내기!
	function sendReplyMsg() {
		var sendForm = $("form[name='sendReplyForm']").serialize();
		var msgContent = $('#replyMsgTextarea').val();
		
		if(!msgContent) {
			 Swal.fire({
				  icon: 'warning',
				  text: "내용은 필수입니다.",
				  showConfirmButton: false,
				  timer: 1500
				});
			return;
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/message/sendReplyMsg.do",
			type : "post",
			data : sendForm,
			success : function(result) {
				Swal.fire({
					  text: "쪽지를 전송하였습니다.",
					  icon: 'success',
					  confirmButtonText: '확인',
					  reverseButtons: false
					})
					.then((result) => {
						$('#modal-reply').modal().hide();
						location.reload();
					});
			},
			error : function(xhr) {
				callFail();
			}
		});
	}


	//받은 쪽지 읽기(알림용)
	function fromMsgModal(code) {
				$.ajax({
					url : "<%=request.getContextPath()%>/message/detail?msgCode="+code,
					type : "get",
					dataType : "json",
					success : function(result) {

						var code = result.msg.msgCode;
						var impt = result.msg.msgImpt;
						var fromId = result.msg.msgFrom;
						var fromName = result.msg.msgFromName;
						var fromTeam = result.msg.msgFromTeam;
						var fromPosition = result.msg.msgFromPosition;
						var date = result.msg.msgDt;
						var realDate = dateFormat(date); //날짜변환 함수
						var content = result.msg.msgContent;

						modal_msgDetail(code, impt, fromId, fromName, fromTeam, fromPosition, realDate, content); //상세 모달창 함수
					},
					error : function(xhr) {
						callFail();
					}
				}); 
	}
	
	
	function msgCounts() {
		$.ajax({
			url : '<%=request.getContextPath()%>/message/msgMainCnts.do',
			dataType : 'json',
			method : 'get',
			success : function(result) {
				$('#recMsgCnt').text(result.recievedMsgCnt);
				$('#unreadMsgCnt').text(result.unReadMsgCnt);
				$('#imptMsgCnt').text(result.imptMsgCnt);
			},
			error: function(msg) {
			}
		})
	}
	
	//메인 페이지 받은 쪽지
	function getReceivedMsgList() {
		$.ajax({
			url : "<%=request.getContextPath()%>/message/getRecMsgMainList",
			type : "post",
			dataType : "json",
			success : function(recMsg) {
				
				var recMsgList = "";
				if(recMsg.length < 1) {
					recMsgList = "<tr class='text-center'><td colspan='6'>받은 쪽지가 없습니다.</td></tr>";
				}else {
					$.each(recMsg, function(i, v) {
						if(i < 5){
							recMsgList += "<tr style='cursor:pointer;'>"
							if(recMsg[i].msgImpt == 1){
								recMsgList += "<td class='text-center'><i class='fas fa-exclamation text-danger'></i></td>";
							}else {
								recMsgList += "<td class='text-center'></td>";
							}
							if(recMsg[i].msgRead == 0){
								recMsgList += "<td class='text-center'><i class='fas fa-envelope text-info'></i></td>";
							} else {
								recMsgList += "<td class='text-center'><i class='far fa-envelope-open text-info'></i></td>";
							}
							recMsgList += "<td class='text-truncate'>"+recMsg[i].msgContent+"</td>";
							recMsgList += "<td class='text-left text-truncate'>"+recMsg[i].msgFromName+"&nbsp;"+recMsg[i].msgFromPosition+"</td>";
							recMsgList += "<td class='text-center text-truncate'>"+recMsg[i].msgDate+"</td>";
							recMsgList += "<td class='msgCode'><p style='visibility:hidden;position:absolute;'>"+recMsg[i].msgCode+"</p></td>";
							recMsgList += "</tr>";
						}
					})
				}
				$('.recMsg').html(recMsgList);
				
// 				document.getElementById("recMsgCnt").textContent=recMsg[0].receivedMsgCnt;
// 		 		document.getElementById("unreadMsgCnt").textContent=recMsg[0].unreadMsgCnt;
// 				document.getElementById("imptMsgCnt").textContent=recMsg[0].imptMsgCnt;
				
				
			},
			error : function(error) {
				callFail();
			}
		})
	}
	
	
	//보낸 쪽지
	function getSendMsgList() {
		$.ajax({
			url : "<%=request.getContextPath()%>/message/getSendMsgMainList",
			type : "post",
			dataType : "json",
			success : function(sendMsg) {
				
				var sendMsgList = "";
				if(sendMsg.length < 1) {
					sendMsgList = "<tr class='text-center'><td colspan='6'>보낸 쪽지가 없습니다.</td></tr>";
				}else {
					$.each(sendMsg, function(i, v) {
						if(i < 5){
							sendMsgList += "<tr style='cursor:pointer;'>"
							if(sendMsg[i].msgImpt == 1){
								sendMsgList += "<td class='text-center'><i class='fas fa-exclamation text-danger'></i></td>";
							}else {
								sendMsgList += "<td class='text-center'></td>";
							}
							if(sendMsg[i].msgRead == 0){
								sendMsgList += "<td class='text-center'><i class='fas fa-envelope text-info'></i></td>";
							} else {
								sendMsgList += "<td class='text-center'><i class='far fa-envelope-open text-info'></i></td>";
							}
							sendMsgList += "<td class='text-truncate'>"+sendMsg[i].msgContent+"</td>";
							sendMsgList += "<td class='text-left text-truncate'>"+sendMsg[i].msgToName+"&nbsp;"+sendMsg[i].msgToPosition+"</td>";
							sendMsgList += "<td class='text-center text-truncate'>"+sendMsg[i].msgDate+"</td>";
							sendMsgList += "<td class='msgCode'><p style='visibility:hidden;position:absolute;'>"+sendMsg[i].msgCode+"</p></td>";
							sendMsgList += "</tr>";
						}
					})
				}
				$('.sendMsg').html(sendMsgList);
			},
			error : function(error) {
				callFail();
			}
		})
	}
	
	
	//개인 보관함 쪽지
	function getPersonalMsgList() {
		$.ajax({
			url : "<%=request.getContextPath()%>/message/getPersonalMsgMainList",
			type : "post",
			dataType : "json",
			success : function(perMsg) {
				
				var perMsgList = "";
					if(perMsg.length < 1) {
						perMsgList = "<tr class='text-center'><td colspan='6'>보관한 쪽지가 없습니다.</td></tr>";
					}else {
						$.each(perMsg, function(i, v) {
							if(i < 5){
								perMsgList += "<tr style='cursor:pointer;'>"
								if(perMsg[i].msgImpt == 1){
									perMsgList += "<td class='text-center'><i class='fas fa-exclamation text-danger'></i></td>";
								}else {
									perMsgList += "<td class='text-center'></td>";
								}
								if(perMsg[i].msgRead == 0){
									perMsgList += "<td class='text-center'><i class='fas fa-envelope text-info'></i></td>";
								} else {
									perMsgList += "<td class='text-center'><i class='far fa-envelope-open text-info'></i></td>";
								}
								if("${loginUser.empCode}" == perMsg[i].msgFromCode){
									perMsgList += "<td class='text-truncate'><span class='text-danger'>[sent]&nbsp;</span>"+perMsg[i].msgContent+"</td>";
								} else {
									perMsgList += "<td class='text-truncate'>"+perMsg[i].msgContent+"</td>";
								}
								perMsgList += "<td class='text-left text-truncate'>"+perMsg[i].msgFromName+"&nbsp;"+perMsg[i].msgFromPosition+"</td>";
								perMsgList += "<td class='text-center text-truncate'>"+perMsg[i].msgDate+"</td>";
								perMsgList += "<td class='msgCode'><p style='visibility:hidden;position:absolute;'>"+perMsg[i].msgCode+"</p></td>";
								perMsgList += "</tr>";
							}
						})
					}
				$('.personalMsg').html(perMsgList);
			},
			error : function(error) {
				callFail();
			}
		})
	}
	
	
	//업무 보관함 쪽지
	function getWorkMsgList() {
		$.ajax({
			url : "<%=request.getContextPath()%>/message/getWorkMsgMainList",
			type : "post",
			dataType : "json",
			success : function(workMsg) {
				
				var workMsgList = "";
					if(workMsg.length < 1) {
						workMsgList = "<tr class='text-center'><td colspan='6'>보관한 쪽지가 없습니다.</td></tr>";
					}else {
						$.each(workMsg, function(i, v) {
							if(i < 5){
								workMsgList += "<tr style='cursor:pointer;'>"
								if(workMsg[i].msgImpt == 1){
									workMsgList += "<td class='text-center'><i class='fas fa-exclamation text-danger'></i></td>";
								}else {
									workMsgList += "<td class='text-center'></td>";
								}
								if(workMsg[i].msgRead == 0){
									workMsgList += "<td class='text-center'><i class='fas fa-envelope text-info'></i></td>";
								} else {
									workMsgList += "<td class='text-center'><i class='far fa-envelope-open text-info'></i></td>";
								}
								if("${loginUser.empCode}" == workMsg[i].msgFromCode){
									workMsgList += "<td class='text-truncate'><span class='text-danger'>[sent]&nbsp;</span>"+workMsg[i].msgContent+"</td>";
								} else {
									workMsgList += "<td class='text-truncate'>"+workMsg[i].msgContent+"</td>";
								}
								workMsgList += "<td class='text-left text-truncate'>"+workMsg[i].msgFromName+"&nbsp;"+workMsg[i].msgFromPosition+"</td>";
								workMsgList += "<td class='text-center text-truncate'>"+workMsg[i].msgDate+"</td>";
								workMsgList += "<td class='msgCode'><p style='visibility:hidden;position:absolute;'>"+workMsg[i].msgCode+"</p></td>";
								workMsgList += "</tr>";
							}
						})
					}
				$('.workMsg').html(workMsgList);
			},
			error : function(error) {
				callFail();
			}
		})
	}
	
	
	function resetMsgModal(clsBtn) {
		var modal = $(clsBtn).closest('#modal-default');
	  
	  $(modal).on('hidden.bs.modal', function () {
		    $(this).find('form').trigger('reset');
		    $('.sendSelect2').val(1).trigger('change.select2');
		})
		
	}
	

</script>