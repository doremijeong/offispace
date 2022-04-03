<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재택근무신청서</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 400px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="card card-default">
					<div class="card-header">
						<h1 class="card-title">재택근무신청서</h1>

						<div class="card-tools">
							<button type="button" class="btn btn-info" onclick="regist_approval">임시저장</button>
							<button type="button" class="btn btn-danger" onclick="temp_approval">결재 요청</button>
							<button type="button" class="btn btn-default" onclick="CloseWindow();">닫기</button>
						</div>
					</div>

					<div style="width: 800px; height: auto; margin: auto; padding-top: 20px;">

						<table class="__se_tbl" style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
							<!-- Header -->

							<tbody>
<!-- 								<tr> -->
<!-- 									<td style="width: 300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">재택근무신청서</td> -->
<!-- 								</tr> -->
								<tr>
									<td>
										<div style="width: 800px;; display: flex; justify-content: space-between;">

											<!-- 기안자 정보 -->
											<div>
												<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic, dotum, arial, tahoma; font-size: 12px; border-collapse: collapse !important;">

													<tbody>
														<tr>
															<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">기안자</td>
															<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
																<input class="autoInput apv-input" name="approvalWriter" readonly style="width: 195px;" data-code="" value=""></input>
															</td>
														</tr>
														<tr>
															<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">소속부서</td>
															<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
																<input class="autoInput apv-input" name="approvalTeam" readonly style="width: 195px;" data-code="" value=""></input>
															</td>
														</tr>
														<tr>
															<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안일</td>
															<td style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
																<input class="autoInput apv-input" name="approvalDt" readonly style="width: 195px;" data-code="" value=""></input>
															</td>
														</tr>
														<tr>
															<td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">문서번호</td>
															<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
																<input class="autoInput apv-input" name="approvalCode" readonly style="width: 195px;" data-code="" value=""></input>
															</td>
														</tr>
													</tbody>
												</table>
											</div>

											<!-- 결재선 -->
											<div id="f_apline">
												<table style="border-color: black; border-collapse: collapse; table-layout: fixed; margin: 0px 1px 1px 0px; border: medium none;">
													<tbody>
														<tr style="height: 17px;">
															<td rowspan="4" width="20" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;">
																결<br>
																<br>재
															</td>
															<td id="f_apline_title_0" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
															<td id="f_apline_title_1" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
															<td id="f_apline_title_2" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
														</tr>
														<tr style="height: 63px;">
															<td id="f_apline_sign_0" width="65" valign="top" align="center" style="padding-top: 20px; border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_0"></span>
															</td>
															<td id="f_apline_sign_1" width="65" valign="top" align="center" style="padding-top: 20px; border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_1"></span>
															</td>
															<td id="f_apline_sign_2" width="65" valign="top" align="center" style="padding-top: 20px; border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_2"></span>
															</td>
														</tr>
														<tr style="height: 17px;">
															<td id="f_apline_name_0" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_0"></span>
															</td>
															<td id="f_apline_name_1" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_1"></span>
															</td>
															<td id="f_apline_name_2" width="65" valign="top" align="center" style="border-right: 1px solid #6e6e6e; text-align: center; vertical-align: top; font-size: 8pt; font-family: gulim;">
																<span style="line-height: 12px;" id="f_apline_type_2"></span>
															</td>
														</tr>
														<tr style="height: 17px;">
															<td id="f_apline_date_0" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
															<td id="f_apline_date_1" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
															<td id="f_apline_date_2" width="65" valign="middle" align="center" style="border: 1px solid #6e6e6e; text-align: center; vertical-align: middle; font-size: 9pt; font-family: gulim;"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<br> <span id="timelineApprovalFormSection">

							<table id="timelineApprovalForm" class="__se_tbl" style="width: 800px; margin-top: 0px; margin-bottom: 20px; border-collapse: collapse !important; color: black; background: white; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
								<tbody>
									<tr>
										<td colspan="4" style="width: 800px; background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">신청&nbsp;현황</td>
									</tr>
									<tr>
										<td style="width: 200px; background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
											<b style="color: rgb(255, 0, 0);">*</b>부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
										</td>
										<td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
											<span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											<input class="ipt_editor ipt_editor_date apv-input apv-home-team" type="text" style="width: 100%;">
										</td>
									</tr>
									<tr>
										<td style="width: 200px; background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
											<b style="color: rgb(255, 0, 0);">*</b>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급
										</td>
										<td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
											<span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											<input class="ipt_editor ipt_editor_date apv-input apv-home-position" type="text" style="width: 100%;">
										</td>
									</tr>
									<tr>
										<td style="width: 200px; background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
											<b style="color: rgb(255, 0, 0);">*</b>근무시간
										</td>
										<td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
											<span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											<input class="ipt_editor ipt_editor_date apv-input apv-home-time" type="text" style="width: 100%;">
										</td>
									</tr>
									<tr>
										<td style="width: 200px; background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
											<b style="color: rgb(255, 0, 0);">*</b>신청&nbsp;사유
										</td>
										<td colspan="3" style="padding: 3px; border: 1px solid black; width: 450px; height: 100px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: top; background: rgb(255, 255, 255);">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{textarea:description}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype=""> <textarea class="txta_editor apv-textarea apv-home-reason" style="width: 100%; height: 100%;"></textarea> <span contenteditable="false" class="comp_active" style="display: none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span>
										</td>
									</tr>
									<tr>
										<td style="width: 200px; background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
											<b style="color: rgb(255, 0, 0);">*</b>근무일시
										</td>
										<td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
											<span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											<input name="dates" class="ipt_editor ipt_editor_date apv-input apv-home-date" type="text" style="width: 100%;">
										</td>
									</tr>
									<tr>
										<td colspan="4" style="width: 800px; padding: 20px !important; height: 200px; vertical-align: middle; border: 1px solid black; text-align: left; background: rgb(255, 255, 255);">
											<p style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 상기 본인은 위의 사유로 인하여 재택근무를 신청하고자 하오니 허락하여 주시기 바랍니다.</p>
										</td>
									</tr>
								</tbody>
							</table>
						</span> <span id="timelineApprovalDetailsSection"> </span>


					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>