<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--
    This is a starter template page. Use this page to start your new project from
    scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title default="Offi-Space" /></title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- additional link for korean font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
    <!-- fullCalendar -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fullcalendar/main.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
	<!-- summernote -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<!-- BS Stepper -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/bs-stepper/css/bs-stepper.min.css">
	<!-- Select2 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2/css/select2.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
	<!-- dropzonejs -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/dropzone/min/dropzone.min.css">
	<!-- ionicons -->
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

	<script>
		function logout(){
			
			Swal.fire({
			  title: '로그아웃 하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonText: '확인',
			  cancelButtonText: '취소',
			  reverseButtons: false
			})
			.then((result) => {
				if (result.isConfirmed) {
					location.href = "<%=request.getContextPath() %>/common/logout.do"
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					callCancel('취소','취소하였습니다.');
			 	}
			});
			
		}
	
	</script>

    <style>
        aside i {
            color: white;
        }

        aside p {
            color: white;
        }

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tooltip-inner *{
		box-sizing: border-box;
		}

		.tooltip-inner{
		  min-width:211px;
		  min-height: 150px !important;
		  padding:0px;
		  margin:0px;
		  color:black;
		  backgroud-color:F4F4F4;
		  background: -webkit-gradient(linear, left top, left 25, from(#F4F4F4), color-stop(4%, #F4F4F4), to(#F4F4F4));
		  background: -moz-linear-gradient(top, #F4F4F4, #B4C8D6 1px, #F4F4F4 25px);
		  -webkit-border-radius:9px;
		  -moz-border-radius:9px;
		  border-radius:4px;
		}
		.tooltip-inner img{
			object-fit: cover;
			width: 50px;
			height: 50px;

		}
		.tooltip-inner .card{
		 	width: 210px;
		 	margin:0;
			background-color: #f8f9fa!important;

		}
		.tooltip-inner .card-body{
			padding:: 1.25rem;
		}

		.tooltip-inner .row{
		display:flex;
		}

		.tooltip-inner p{
		  display: block;
		  margin-block-start: 0.3em;
		  margin-block-end: 0.3em;
		  margin-inline-start: 0px;
		  margin-inline-end: 0px;"
		}

		.tooltip-inner .fa-ul{
			list-style-type: none;
			padding-left:0;
			text-align: left;
		}

		.tooltip-inner .firstRow{
		margin-bottom:10px;
		}
		.tooltip-inner li i {
		padding-top:0.3em;
		}

.control-sidebar .selectBox .select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 20px;
    text-align: center;
}
    </style>
  <decorator:head />

</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed sidebar-collapse">
    <div class="wrapper" style="min-width:1280px;  margin:0 auto;">

    <%@ include file="/WEB-INF/views/message/msgModalForMain.jsp"%>
	<%@ include file="/WEB-INF/views/message/messageJSForMain.jsp"%>

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item ">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button" ><i class="fas fa-bars"></i></a>
                </li>
            </ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					  <span id="timeCheck" class="text-muted" style="font-size: 0.8em;"></span>
				</li>
			</ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                        <button onclick="logout()" type="button" style="border: 0; outline: 0; background: 0; margin-top: 6px;">
	                        <img src="<%=request.getContextPath() %>/resources/images/logout1.png"
	                        	 style="width: 20px; height: 20px;">
                       	</button>
                </li>


                <!-- Notifications Dropdown Menu -->

                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge unreadNotiCount">
                        	${fn:length(notificationList)}
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-header"><span class="unreadNotiCount">${fn:length(notificationList)}</span> 개의 읽지 않은 알림</span>
                        <div class="dropdown-divider"></div>

						<div class="table-responsive" style="max-height:300px;">
							<table class="table table-head-fixed text-nowrap headerNotificationListBox">
								<c:if test="${ fn:length(notificationList) ne 0}">
								<c:forEach var="noti" items="${notificationList }">
									<tr onclick="OpenWindow('${noti.ntLinkPath}', '${noti.ntTitle}', '900', '870'); removeFromHeaderNotificationList('${noti.ntCode}');" class="headerNotificationItem" id="listItem${noti.ntCode}">
	               		<td style="padding:0;">
	               			<a class="dropdown-item">
									       <div class="media">
				                        <img src="<%=request.getContextPath() %>/common/getPicture.do?attachSaveName=${noti.ntFrom.attachSavename}"
					                     onerror="this.src='<%=request.getContextPath() %>/resources/images/01.jpg'"
					                     style="object-fit: cover; width: 40px; height: 40px;" class="img-size-50 mr-3 img-circle" alt="User Image">
			                               <div class="media-body">
			                                   <h3 class="dropdown-item-title">
												${noti.ntTitle }
			                                        <button data-dismiss="toast" type="button" class="ml-2 mb-1 close notification-close" aria-label="Close" onclick="removeFromHeaderNotificationList('${noti.ntCode}');event.stopPropagation();">
											      <span aria-hidden="true">×</span>
											    </button>
			                                   </h3>
			                                   <p class="text-muted" style="font-size: 0.8em;">${noti.ntFrom.empName }&nbsp;${noti.ntFrom.positionValue}</p>
			                               </div>
				                       </div>
                         			</a>
                         		</td>
                            </tr>
	</c:forEach>
</c:if>
						</table>
						</div>

                        <a href="javascript:void(0);" onclick="removeFromHeaderNotificationList('all');" class="dropdown-item dropdown-footer">전체 읽음 처리</a>

                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="setAsideOpen();getTeamAttendList();" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <div class="image">
                            <img id="top_main_photo" src="" style="object-fit: cover;
                            width: 30px;
                            height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image" onerror="this.src='<%=request.getContextPath() %>/resources/images/01.jpg'">
                        </div>
                    </a>
                </li>
                <!-- ./ Notifications Dropdown Menu -->
            </ul>
            <!-- ./ Right navbar links -->
        </nav>
        <!-- /.navbar -->




        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-light bg-gradient-info accent-white elevation-4">
            <!-- Brand Logo -->
            <a href="<%=request.getContextPath() %>/index.do" class="brand-link">
                <!-- <img src="../resources/bootstrap/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fab fa-opera"></i>
                &nbsp;&nbsp;&nbsp;<span class="brand-text font-weight-light"
                    style="color: aliceblue;">Offi-Space</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column nav-legacy nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->

						<c:forEach items="${mainMenuList }" var="mainMenu">
							<c:if test="${mainMenu.mcode ne 'M000000'}">

							<li class="nav-item">

        						<%-- <a href="javascript:goPage('<%=request.getContextPath() %>${mainMenu.murl }','${mainMenu.mcode }'); subMenu_go('${mainMenu.mcode }');" class="nav-link"> --%>

        						<c:choose>
        							<c:when test="${mainMenu.mlevel eq 1}">

        								<!-- 메인메뉴구분 시작-->
        								<c:if test="${mainMenu.isNav eq 1 }">
        									<a href="<%=request.getContextPath() %>${mainMenu.murl }*${mainMenu.mcode }" class="nav-link parentNav">
			        							<i class="${mainMenu.micon }"></i>
			                                	<p>${mainMenu.mname }
					                           		<i class="fas fa-angle-left right"></i>
				                            	</p>
	        								</a>
        								</c:if>

        								<c:if test="${mainMenu.isNav eq 0 }">
        									<a href="" class="nav-link">
			        							<i class="${mainMenu.micon }"></i>
			                                	<p>${mainMenu.mname }
					                           		<i class="fas fa-angle-left right"></i>
				                            	</p>
	        								</a>
        								</c:if>
        								<!-- 메인메뉴구분 끝 -->


	        							<%-- <a href="<%=request.getContextPath() %>${mainMenu.murl }*${mainMenu.mcode }" class="nav-link parentNav">
			        						<i class="${mainMenu.micon }"></i>
			                                <p>${mainMenu.mname }
					                           <i class="fas fa-angle-left right"></i>
				                            </p>
	        							</a> --%>
        							</c:when>
        							<c:otherwise>
        								<a href="javascript:goPage('<%=request.getContextPath() %>${mainMenu.murl }','${mainMenu.mcode }'); " class="nav-link">
			        						<i class="${mainMenu.micon }"></i>
			                                <p>${mainMenu.mname }</p>
	        							</a>
        							</c:otherwise>
        						</c:choose>


								<c:if test="${mainMenu.mlevel eq 1}">
									<c:forEach items="${allMenuList }" var="allMenu">
											<c:if test="${allMenu.upcode eq mainMenu.mcode}">
												<ul class="nav nav-treeview">
													<li class="nav-item">
					                                <c:choose>
														<c:when test="${allMenu.mlevel eq 1}">

														<!-- 메인메뉴구분 시작-->
														<c:if test="${allMenu.isNav eq 1 }">
															<a href="<%=request.getContextPath() %>${allMenu.murl }*${allMenu.mcode }" class="nav-link parentNav" >
						                                        <i class="far fa-circle nav-icon"></i>
						                                        <p>${allMenu.mname }</p>
						                                        <i class="fas fa-angle-left right"></i>
		                                					</a>
														</c:if>

														<c:if test="${allMenu.isNav eq 0 }">
															<a href="" class="nav-link" >
						                                        <i class="far fa-circle nav-icon"></i>
						                                        <p>${allMenu.mname }</p>
						                                        <i class="fas fa-angle-left right"></i>
		                                					</a>
														</c:if>
														<!-- 메인메뉴구분 끝-->

															<%-- <a href="<%=request.getContextPath() %>${allMenu.murl }*${allMenu.mcode }" class="nav-link parentNav" >
						                                        <i class="far fa-circle nav-icon"></i>
						                                        <p>${allMenu.mname }</p>
						                                        <i class="fas fa-angle-left right"></i>
		                                					</a> --%>
														</c:when>
														<c:otherwise>
														<li class="nav-item">
															<a href="javascript:goPage('<%=request.getContextPath() %>${allMenu.murl }','${allMenu.mcode }'); " class="nav-link">
						                                        <i class="far fa-circle nav-icon"></i>
						                                        <p>${allMenu.mname }</p>
					                                		</a>
														</c:otherwise>
													</c:choose>


					                                    <c:if test="${allMenu.mlevel eq 1}">
				                            				<c:forEach items="${allMenuList }" var="allMenu2">
																<c:if test="${allMenu2.upcode eq allMenu.mcode}">

																	<ul class="nav nav-treeview">
										                                <li class="nav-item">
										                                    <a href="javascript:goPage('<%=request.getContextPath() %>${allMenu2.murl }','${allMenu2.mcode }'); " class="nav-link">
										                                        <i class="far fa-dot-circle nav-icon"></i>
										                                        <p><small>${allMenu2.mname }</small></p>
										                                    </a>
										                                </li>
							                            			</ul>

							                            		</c:if>
					                            			</c:forEach>
		                                				</c:if>

					                                </li>
		                            			</ul>

		                            		</c:if>
                            		</c:forEach>
		                        </c:if>

      						</li>

      						</c:if>
      					</c:forEach>



                        <!-- additional list for the menu -->
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>