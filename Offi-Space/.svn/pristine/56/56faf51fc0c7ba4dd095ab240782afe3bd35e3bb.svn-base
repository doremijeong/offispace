<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<style>
input{
	border: none;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
<input style="hidden" name="reportCodeToRegister" />
	<div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>보고하기</h1>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">보고서</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>

	    <!-- Main content -->
	    <section class="content">

	      <!-- Default box -->
	      <div class="card">
	        <div class="card-header row">
			  <div class="row col-9">
			  	<div style="margin-right: 5px;">
					<button type="button" class="btn btn-block btn-secondary">미리보기</button>
				</div>
				<div style="margin-right: 5px;">
					<button type="button" class="btn btn-block btn-secondary"onclick="modify_report_doc('temp','${reportDocCode}')">임시저장</button>
				</div>
			  	<div style="margin-right: 5px;">
			  		<button type="button" class="btn btn-block btn-info" onclick="modify_report_doc('report','${reportDocCode}')">보고하기</button>
			  	</div>
			  </div>
	          <!-- <div class="card-tools col-3 row d-flex justify-content-end">
	          	<div class="form-check" style="margin-right: 20px;">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" style="margin-top:15px;">
                    <label class="form-check-label" for="exampleCheck1" style="margin-top:8px;">긴급</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck2" style="margin-top:15px;">
                    <label class="form-check-label" for="exampleCheck2" style="margin-top:8px;">중요</label>
                </div>
	          </div> -->
	        </div>
	        <div class="card-body show-form-div report-doc-html" style="margin: auto;">


	          ${reportDocMarkup}

	        </div>
	        <!-- /.card-body -->
	      </div>
	      <!-- /.card -->

	    </section>
	    <!-- /.content -->
	  </div>

	  <%@ include file="/WEB-INF/views/common/summernote_js.jsp"%>

    <script>
        window.onload = function() {
        	if('${from}'=="main"){
        		 summernote_go($('textarea#content'), 500);

        		let reportCode = '${regularReport.reportCode}';

        	}else if ('${from}'=="menu"){
	            summernote_go($('textarea#content'), 500);
	            $('#report-form').modal('show');
        	}
        	
        	$('.report-doc-html').on('keyup', '.report-input', function() {
        		var inputText = $(this).val();
        		$(this).attr('value',inputText);
        	});
        	
        	$('.report-doc-html').on('keydown', '.report-input', function() {
        		$(this).attr('size', $(this).val().length * 2);
        	});
        	
        }
        
        function modify_report_doc(param, reportDocCode){
        	
        	//console.log("보고문서코드" + reportDocCode);
        	reportDocHtml = $('.report-doc-html').html();
        	
        	var data = {
   				"reportDocMarkup" : reportDocHtml,
   				"reportDocCode" : reportDocCode,
    		}
        	
        	$.ajax({
    			url : "modifyReport?param=" + param,
    			type : "post",
    			data : JSON.stringify(data),
    			contentType : 'application/json',
    			success : function() {
    				if(param=='report'){
    					
    					Swal.fire({
   						  title: '보고서가 등록되었습니다.',
   						  icon: 'info',
   						  confirmButtonText: '확인',
   						  reverseButtons: false
   						})
   						.then((result) => {
   							if (result.isConfirmed) {
   								location.href = '<%=request.getContextPath()%>/report/myReport/list.do';
   							} else if ( result.dismiss === Swal.DismissReason.cancel) {
   								callCancel(canTitle,canText);
   						 	}
   						});
    					
    				}else{
    					
    					Swal.fire({
    						  title: '보고서가 임시저장되었습니다.',
    						  icon: 'info',
    						  confirmButtonText: '확인',
    						  reverseButtons: false
    						})
    						.then((result) => {
    							if (result.isConfirmed) {
    								location.href = '<%=request.getContextPath()%>/report/tempReport/list.do';
    							} else if ( result.dismiss === Swal.DismissReason.cancel) {
    								callCancel(canTitle,canText);
    						 	}
    						});
    					
    				}
    				
    			},
    			error : function(xhr) {
    				alert("이게무슨일이야 왜돌아왔어~!");
    			}
    		});
        	
        	
        }
        

    </script>

</body>



