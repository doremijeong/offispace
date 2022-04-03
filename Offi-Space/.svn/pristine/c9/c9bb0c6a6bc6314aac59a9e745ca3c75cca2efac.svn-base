<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="year" value="${fn:substring(managerReport.reportDt,0,4)}"/>
<c:set var="month" value="${fn:substring(managerReport.reportDt,5,7)}"/>
<c:set var="date" value="${fn:substring(managerReport.reportDt,8,10)}"/>
<c:set var="reported" value="${managerReport.reported }"/>
<c:set var="notReported" value="${managerReport.notReported }"/>
<head>
<style>
.reportBoxForm tbody tr td{
border:none;
}

</style>
</head>
<body>
<!-- Content Header (Page header) -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h5>보고서</h5>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">보고 현황 </li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
       <div class="column">

      <!-- 보고서현황 상세 -->
        <div class="row">
          <div class="col-lg-12">
            <div class="card card card-info card-outline">
              <div class="card-header">
              	<div class="">
	                <h3 class="card-title">${managerReport.reportTitle} 현황</h3>
              	</div>
                <div class="btn-group float-right">
					<button class="btn btn-default btn-sm" onclick="window.close();">닫기</button>
				</div>
              </div>

              <!-- ./card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                    <tr>
                      <td style="background-color: lightgray;"><b>보고서</b></td>
                      <td>${managerReport.reportManagerName}&nbsp;${managerReport.reportManagerPosition }</td>
                      <td style="background-color: lightgray;"><b>보고일</b></td>
                      <td>${year }년 ${month }월 ${date }일 (${managerReport.reportDay})</td>
                    </tr>
                    <tr>
                      <td style="background-color: lightgray;"><b>총 보고 인원</b></td>
                      <td> ${fn:length(reported)}&nbsp;/&nbsp;${fn:length(reported)+fn:length(notReported)}&nbsp;인</td>
                      <td style="background-color: lightgray;"><b>보고 유형</b></td>
                      <td>정기 보고</td>
                    </tr>

                    <tr>
                    	<td style="background-color: lightgray;" ><b>보고자</b></td>
<c:choose>
	<c:when test="${fn:length(reported) eq 0 }">
                    	<td colspan="3">보고자 없음</td>
	</c:when>
	<c:otherwise>
						<td colspan="3">
		<c:forEach  items="${reported }" var="reported">
			            	<a class="tooltipCaller"
			            	style="	float: left;
								    padding: 0;
								    padding-right: 0.75rem;
								    margin-top: calc(0.375rem - 2px);
								    margin-right: 0.375rem;
								    color: #ffffff;
								    cursor: pointer;
								    background-color:#1976d2;
								    border: 1px solid #1976d2;
								    border-radius: 0.2rem;"
			            	data-toggle="tooltip" data-html="true" title=""
                      		data-emp-name='${reported.empName }'
                      		data-emp-telephone='${reported.empTelephone }'
                      		data-emp-email='${reported.empEmail }'
                      		data-position-value='${reported.positionValue }'
                      		data-team-value='${reported.teamValue }'
                      		data-group-value='${reported.groupValue }'
                      		data-attach-savename='${reported.attachSavename }'
                      		onclick="getDetail(this);"
                      		data-report-code='${managerReport.reportCode}'
                      		data-report-dt='${managerReport.reportDt}'
                      		data-emp-code='${reported.empCode }'
                      		>
                    	  	&nbsp;&nbsp;&nbsp;${reported.empName}&nbsp;${reported.positionValue}
							</a>
		</c:forEach>
						</td>
	</c:otherwise>
</c:choose>
                    </tr>




                    <tr>
                    	<td style="background-color: lightgray;"><b>미보고자</b></td>
<c:choose>
	<c:when test="${fn:length(notReported) eq 0 }">
                    	<td colspan="3">미보고자 없음</td>
	</c:when>
	<c:otherwise>
						<td colspan="3">
		<c:forEach  items="${notReported }" var="notReported">
			            	<a class="tooltipCaller"
			            	style="	float: left;
								    padding: 0;
								    padding-right: 0.75rem;
								    margin-top: calc(0.375rem - 2px);
								    margin-right: 0.375rem;
								    color: #ffffff;
								    cursor: pointer;
								    background-color:#8c0032;
								    border: 1px solid #8c0032;
								    border-radius: 0.2rem;"
			            	data-toggle="tooltip" data-html="true" title=""
                      		data-emp-name='${notReported.empName }'
                      		data-emp-telephone='${notReported.empTelephone }'
                      		data-emp-email='${notReported.empEmail }'
                      		data-position-value='${notReported.positionValue }'
                      		data-team-value='${notReported.teamValue }'
                      		data-group-value='${notReported.groupValue }'
                      		data-attach-savename='${notReported.attachSavename }'

							>
                    	  	&nbsp;&nbsp;&nbsp;${notReported.empName}&nbsp;${notReported.positionValue}
							</a>
		</c:forEach>
						</td>
	</c:otherwise>
</c:choose>
                    </tr>

					<tr data-widget="expandable-table" class="reportBoxOuter" aria-expanded="false">
						<td colspan="4" style="background-color: lightgray; text-align: center;"><b>보고서 상세조회</b></td>
					</tr>
					  <tr class="expandable-body d-none reportBoxInner">
                    	<td colspan="4">
                    		<div style="padding: 0 5%;">
		                        <div class="card-body row reportBoxForm" style="box-sizing: content-box;"></div>
                    		</div>
                      	</td>
                    </tr>
                  </tbody>
                </table>
                <!-- ./table   -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col-lg-12 -->
        </div>
        <!-- ./row -->
        <!-- ./보고서현황 상세 -->

      </div>
      <!-- ./column -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<script>

window.onload = function(){

	setTooltips();

}


/* const reportedBoxes = document.querySelectorAll('.reportedBox');

console.log(reportedBoxes)
	reportedBoxes.forEach(reportedBox=>{
		reportedBox.addEventListener('click',(event)=>{
			getDetail(event.currentTarget).then(data=>{
				document.querySelector('.reportBoxForm').innerHTML = data.reportDoc.reportDocMarkup;
				document.querySelector('input[name="reportDocCode"]').setAttribute("value",data.reportDoc.reportDocCode);
				$('input').prop('disabled',true);


				let textareaNode = document.querySelectorAll('.textarea-input');
				if(textareaNode != null){
					textareaNode.forEach(input=>{
						let content = input.dataset.content;
						input.value = content;
						input.disabled = true;

				})
				}

				if(document.querySelector('.reportBoxOuter').getAttribute("aria-expanded") == "false"){
					document.querySelector('.reportBoxOuter').click();
				}
			})


		})
	}) */

function getDetail(reported){

	let reportCode = reported.dataset.reportCode;
	let reportDt = reported.dataset.reportDt;
	let empCode = reported.dataset.empCode;


		fetch('<%=request.getContextPath()%>/report/managerReportDetailShowEmpDoc?reportCode='+reportCode+'&reportDt='+reportDt+'&empCode='+empCode)
		.then(response=>response.json())
		.then(data=>{
			console.log(data);
			document.querySelector('.reportBoxForm').innerHTML = data.reportDoc.reportDocMarkup;

			if(document.querySelector('.reportBoxOuter').getAttribute("aria-expanded") == "false"){
				document.querySelector('.reportBoxOuter').click();
			}

		})

}



</script>
</body>