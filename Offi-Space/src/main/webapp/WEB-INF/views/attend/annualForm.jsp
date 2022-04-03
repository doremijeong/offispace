<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차신청서</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 400px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="card card-default">
					<div class="card-header">
						<h1 class="card-title">연차신청서</h1>

						<div class="card-tools">
							<button type="button" class="btn btn-info" onclick="regist_approval">임시저장</button>
							<button type="button" class="btn btn-danger" onclick="temp_approval">결재 요청</button>
						    <button type="button" class="btn btn-default" onclick="CloseWindow();">닫기</button>
						</div>
					</div>


					<div style="width: 800px; height: auto; margin: auto; padding-top: 20px;">

						<span style="font-family: &amp; amp; quot; 맑은 고딕&amp;amp; quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; border:">
							<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
								<!-- Header -->
								<colgroup>
									<col width="310">
									<col width="490">
								</colgroup>
								<tbody>
<!-- 									<tr> -->
<!-- 										<td style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">연차신청서</td> -->
<!-- 									</tr> -->
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
																	결<br> <br>재
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
							</table> <!--margin div-->
							<div style="height: 30px;"></div>

							<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
								<!-- 품의서 -->
								<colgroup>
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="200">
								</colgroup>
								<tbody>
									<tr>
										<td style="padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(221, 221, 221);" colspan="5">
											<span style="font-weight: bold; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">신청인</span>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">소속</td>
										<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="4" class="dext_table_border_t">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-team" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">직책</td>
										<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="4" class="dext_table_border_t">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-charge" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">성명</td>
										<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="4" class="dext_table_border_t">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-name" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td style="padding: 5px; border: currentColor; height: 20px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);" colspan="4">
											<p style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">연차 기간</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;" colspan="2">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{period}}" data-wrapper="" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor ipt_editor_date apv-input apv-an-period" type="text" style="width: 110px;"> ~ <input class="ipt_editor ipt_editor_date apv-input" type="text" style="width: 110px;"><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">연차 사용일</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{text$width:60$}}" data-wrapper="" style="width: 60px; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-days" type="text" style="width: 100px;"><span contenteditable="false" class="comp_active" "="" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span>일
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">연차 사유</td>
										<td style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="4" class="dext_table_border_t">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-reason" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">비상연락망</td>
										<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="4">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-contact" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td rowspan="2" style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">업무 인수인계</td>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">업무 내용</td>
										<td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-work" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>
									<tr>
										<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">업무 인계자</td>
										<td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
											<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""> <input class="ipt_editor apv-input apv-an-handover" type="text" style="width: 100%;"> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2"
													style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												></span> <span class="Active_dot3" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
											</span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
											</span><br>
										</td>
									</tr>

									<tr>
										<td style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);" colspan="5" class="dext_table_border_t">
											<span style="font-weight: bold; font-family: &amp; amp; quot; malgun gothic&amp;amp; quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">연차를 신청하오니 허락하여 주시기 바랍니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
						</span>
						<p style="font-family: &amp; amp; quot; 맑은 고딕&amp;amp; quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
							<br>
						</p>

					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>