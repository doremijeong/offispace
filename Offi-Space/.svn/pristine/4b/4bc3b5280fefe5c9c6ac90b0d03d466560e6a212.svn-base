<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 양식 선택 Modal start -->
<div class="modal" id="approval-form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">결재양식</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 양식구분탭 -->
				<div class="col-12 col-sm-12">
					<div class="card card-info card-outline card-outline-tabs">
						<div class="card-header p-0 border-bottom-0">
							<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
								<c:if test="${!empty apvFormGrList}">
									<c:set value="0" var="aa"/>
									<c:forEach items="${apvFormGrList}" var="apvFormGr">
										<li class="nav-item">
											<a class="nav-link ${aa eq 0 ? 'active' : ''}" id="custom-tabs-four--tab" data-toggle="pill" href="#custom-tabs-four-${apvFormGr.apvFomGrCode}" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">${apvFormGr.apvFomGrName}</a>
										</li>
										<c:set value="${aa + 1}" var="aa"/>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-four-tabContent">
								<c:if test="${!empty allApvFormList}">
								<c:set var="bb" value="0"/>
									<c:forEach items="${allApvFormList}" var="apvFormList">
										<div class="tab-pane fade ${bb eq 0 ? 'active show' : '' }" id="custom-tabs-four-${apvFormList[0].apvFomGrCode}" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
										<c:set var="bb" value="${bb + 1}"/>
											<div class="card-body" style="padding: 5px 5px;">
												<div class="tab-content" id="custom-tabs-four-tabContent">
													<div class="tab-pane fade active show" id="custom-tabs-four-wait" role="tabpanel" aria-labelledby="custom-tabs-four-wait-tab">
														<!-- 내부 table card -->
														<div>
															<div class="card-header" style="padding: 10px 10px;"></div>
															<!-- /.card-header -->
															<div class="card-body p-0">
																<table class="table table-sm">
																	<thead style="font-size: 1.05em;">
																		<tr>
																			<th></th>
																			<th style="width: 60%;">양식 이름</th>
																			<th></th>
																		</tr>
																	</thead>
																	<tbody style="font-size: 1.0em;">
																		<c:forEach items="${apvFormList}" var="apvForm">
																			<tr>
																				<td></td>
																				<td style="vertical-align: middle;">${apvForm.apvFormName}</td>
																				<td>
																					<div class="row">
																						<div style="margin-right: 5px;">
																							<button type="button" class="btn btn-block btn-default btn-sm" onclick="formPreview('${apvForm.apvFormCode}')">미리보기</button>
																						</div>
																						<div>
																							<button type="button" class="btn btn-block btn-info btn-sm" onclick="form_go('${apvForm.apvFormCode}')">선택</button>
																						</div>
																					</div>
																				</td>
																			</tr>
																			<!-- apvFormCode 숨겨두는곳 -->
																			<input type="hidden" value ="${apvForm.apvFormCode}" name="apvFormCode" id="apvFormCode">
																		</c:forEach>
																	</tbody>
																</table>
															</div>
															<!-- /.card-body -->
														</div>
														<!-- / .내부 table card -->
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<!-- /.card -->
					</div>
				</div>

			</div>
			<!-- < div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>  -->
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<!-- 양식 선택 Madal end -->

<script>

</script>


