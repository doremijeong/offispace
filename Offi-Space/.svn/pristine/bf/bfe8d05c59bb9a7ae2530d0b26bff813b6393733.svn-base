<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.autoInput {
	height: 100%;
	width: 100%;
	border: #ddd;
}
</style>

</head>
<body>


	<div style="width: 800px;; display: flex; justify-content: space-between;">

		<!-- 기안자 정보 -->
		<div>
			<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic, dotum, arial, tahoma; font-size: 12px; border-collapse: collapse !important;">

				<tbody>
					<tr>
						<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">기안자</td>
						<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
							<input class="autoInput" name="approvalWriter" readonly style="width: 195px;" data-code="" value=""></input>
						</td>
					</tr>
					<tr>
						<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">소속부서</td>
						<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
							<input class="autoInput" name="approvalTeam" readonly style="width: 195px;" data-code="" value=""></input>
						</td>
					</tr>
					<tr>
						<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안일</td>
						<td style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
							<input class="autoInput" name="approvalDt" readonly style="width: 195px;" data-code="" value=""></input>
						</td>
					</tr>
					<tr>
						<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">문서번호</td>
						<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
							<input class="autoInput" name="approvalCode" readonly style="width: 195px;" data-code="" value=""></input>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 결재선 -->
		<div id="f_apline">
			<table style="border-color:black;border-collapse:collapse;table-layout:fixed;margin:0px 1px 1px 0px;border:medium none;">
			 <tbody>
			  <tr style="height:17px;">
			   <td rowspan="4" width="20" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;">결<br><br>재</td>
			   <td id="f_apline_title_0" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			   <td id="f_apline_title_1" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			   <td id="f_apline_title_2" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			  </tr>
			  <tr style="height:63px;">
			   <td id="f_apline_sign_0" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_0"></span></td>
			   <td id="f_apline_sign_1" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_1"></span></td>
			   <td id="f_apline_sign_2" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_2"></span></td>
			  </tr>
	          <tr style="height:17px;">
	            <td id="f_apline_name_0" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_0"></span></td>
	            <td id="f_apline_name_1" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_1"></span></td>
	            <td id="f_apline_name_2" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="f_apline_type_2"></span></td>
	           </tr>
			  <tr style="height:17px;">
			   <td id="f_apline_date_0" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			   <td id="f_apline_date_1" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			   <td id="f_apline_date_2" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
			  </tr>
			 </tbody>
			</table>
		  </div>
		  
		  
		  
		  	<!-- 합의 -->
			<div id="h_apline">
				<table style="border-color:black;border-collapse:collapse;table-layout:fixed;margin:0px 1px 1px 0px;border:medium none;">
				 <tbody>
				  <tr style="height:17px;">
				   <td rowspan="4" width="20" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;">합<br><br>의</td>
				   <td id="h_apline_title_0" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				   <td id="h_apline_title_1" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				   <td id="h_apline_title_2" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				  </tr>
				  <tr style="height:63px;">
				   <td id="h_apline_sign_0" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_0"></span></td>
				   <td id="h_apline_sign_1" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_1"></span></td>
				   <td id="h_apline_sign_2" width="65" valign="top" align="center" style="padding-top: 20px; border-right:1px solid #6e6e6e;text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_2"></span></td>
				  </tr>
		          <tr style="height:17px;">
		            <td id="h_apline_name_0" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_0"></span></td>
		            <td id="h_apline_name_1" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_1"></span></td>
		            <td id="h_apline_name_2" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align:center;vertical-align:top;font-size:8pt;font-family:gulim;"><span style="line-height:12px;" id="h_apline_type_2"></span></td>
		           </tr>
				  <tr style="height:17px;">
				   <td id="h_apline_date_0" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				   <td id="h_apline_date_1" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				   <td id="h_apline_date_2" width="65" valign="middle" align="center" style="border:1px solid #6e6e6e;text-align:center;vertical-align:middle;font-size:9pt;font-family:gulim;"></td>
				  </tr>
				 </tbody>
				</table>
			  </div>
		  
		  
		  
		  
	   
	</div>



</body>
</html>