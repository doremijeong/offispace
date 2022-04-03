<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script>
	// alert("${user} 현재 DB서버 장애로 서비스가 불가합니다.");
	window.onload = function() {

		Swal.fire({
		      text: '${loginUser.empName}님 현재 DB서버 장애로 서비스가 불가합니다.',
		      icon: 'error',
		      showCancelButton: true,
		      confirmButtonText: '뒤로가기',
		      cancelButtonText: '취소'
		    })
		    .then((result) => {
		        if (result.isConfirmed) {
					history.go(-1);
		        } else if ( result.dismiss === Swal.DismissReason.cancel) {
		            callCancel(canTitle,canText);
		         }
		    });

	}
</script>