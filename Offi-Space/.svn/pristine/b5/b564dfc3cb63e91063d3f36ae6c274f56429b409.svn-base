<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--
    This is a starter template page. Use this page to start your new project from
    scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인사관리</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- additional link for korean font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
    <!-- fullCalendar -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fullcalendar/main.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">



    <style>
        aside i {
            color: white;
        }

        aside p {
            color: white;
        }

        * {
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
    </style>

</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed sidebar-collapse">
	<div class="wrapper" style="max-width:1280px; margin:0 auto;">

        <!-- Navbar 상단 헤더 : 공간확보 -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <!-- Right navbar links :공간확보 -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search : 공간확보 -->
                <li class="nav-item">
                    <div class="navbar-search-block">
                        <form class="form-inline">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-navbar" type="search" placeholder="Search"
                                    aria-label="Search">
                                <div class="input-group-append">
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
                <!-- Messages Dropdown Menu : 공간확보 -->
                <li class="nav-item dropdown">
                </li>
                <!-- Notifications Dropdown Menu : 공간확보 -->
                <li class="nav-item dropdown">
                </li>
                <li class="nav-item">
                </li>
                <!-- ./ Notifications Dropdown Menu -->
            </ul>
            <!-- ./ Right navbar links -->
        </nav>
        <!-- /.navbar -->


        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-light bg-gradient-info accent-white elevation-4">
            <!-- Brand Logo -->
            <a href="#" class="brand-link">
                <!-- <img src="../resources/bootstrap/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
                &nbsp;&nbsp;&nbsp;<i class="fab fa-opera"></i>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="brand-text font-weight-light"
                    style="color: aliceblue;">Offi-Space</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column nav-legacy nav-child-indent" data-widget="treeview"
                        role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                        
                        <li class="nav-item">
                            <a href="<%=request.getContextPath() %>/admin/main.do" class="nav-link">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>
                                  관리자 메뉴 
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/HRManager.do" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>
                                            인사관리자
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-users-cog"></i>
                                <p>
                                    권한 설정 
                                </p>
                            </a>
                        </li>
                        <!-- additional list for the menu -->
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
            
        </aside>
	 	<!--/ Main Sidebar Container -->

		<div class="content-wrapper" style="min-height: 660px;">
		    
		    <!-- Content Header (Page header) -->
		    <section class="content-header">
		      <div class="container-fluid">
		        <div class="row mb-2">
		          <div class="col-sm-6">
		            <h1>인사관리  </h1>
		          </div>
		          <div class="col-sm-6">
		            <ol class="breadcrumb float-sm-right">
		              <li class="breadcrumb-item"><a href="#">admin</a></li>
		              <li class="breadcrumb-item active">Human Resource</li>
		            </ol>
		          </div>
		        </div>
		      </div><!-- /.container-fluid -->
		    </section>
		
		    <!-- Main content -->
		    <section class="content">
		    	<div class="row">
		    		<div class="col-lg-12">
		    		<div class="card">
			            <div class="card-header">
			              <h3 class="card-title">관리 메뉴</h3>
			
			              <div class="card-tools">
			                <button type="button" class="btn btn-tool" data-card-widget="collapse">
			                  <i class="fas fa-minus"></i>
			                </button>
			              </div>
			            </div>
			            <div class="card-body p-0">
			              <ul class="nav nav-pills flex-column">
			                <li class="nav-item active">
			                  <a href="javascript:void(0);" onclick="OpenWindow('registerEmployeeForm.do','사원등록',800,500);" class="nav-link">
			                    사원 추가  
			                  </a>
			                </li>
			                <li class="nav-item">
			                  <a href="#" class="nav-link">
			                  	사원 파일 업로드
			                  </a>
			                </li>
			              </ul>
			            </div>
			            <!-- /.card-body -->
			          </div>
			          <!-- /.card -->
		    		</div>
		    	</div>
		    	<div class="row">
			       
			        <div class="col-lg-12">
			          <div class="card card-primary card-outline">
			            <div class="card-header">
			              <h3 class="card-title">전체 목록</h3>			
			              <div class="card-tools">
			                <div class="input-group input-group-sm">
			                  <input type="text" class="form-control" placeholder="Search Person">
			                  <div class="input-group-append">
			                    <div class="btn btn-primary">
			                      <i class="fas fa-search"></i>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              <!-- /.card-tools -->
			            </div>
			            <!-- /.card-header -->
			            <div class="card-body p-0">
			              <div class="mailbox-controls">
			                <!-- Check all button -->
			                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
			                </button>
			                <div class="btn-group">
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="far fa-trash-alt"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="fas fa-reply"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="fas fa-share"></i>
			                  </button>
			                </div>
			                <!-- /.btn-group -->
			                <button type="button" class="btn btn-default btn-sm">
			                  <i class="fas fa-sync-alt"></i>
			                </button>
			                <div class="float-right">
			                  1-50/200
			                  <div class="btn-group">
			                    <button type="button" class="btn btn-default btn-sm">
			                      <i class="fas fa-chevron-left"></i>
			                    </button>
			                    <button type="button" class="btn btn-default btn-sm">
			                      <i class="fas fa-chevron-right"></i>
			                    </button>
			                  </div>
			                  <!-- /.btn-group -->
			                </div>
			                <!-- /.float-right -->
			              </div>
			              <div class="table-responsive mailbox-messages">
			                <table class="table table-hover table-striped">
			                  <tbody>
			                  <tr>
			                  	<th>
			                  		<div class="icheck-primary">
			                        	<input type="checkbox" value="" id="check1">
			                        	<label for="check1"></label>
			                      	</div>
			                  	</th>
			                  	<th>아이디</th>
			                  	<th>이름</th>
			                  	<th>사진</th>
			                  	<th>부서</th>
			                  	<th>직급</th>
			               		<th>상태</th>
			               		<th>입사일</th>
			                  	<th>주소</th>
			                  	<th>휴대폰</th>
			                  	<th>이메일</th>
			                  </tr>
			                  
			                  <c:if test="${empty employeeList }">
			                  	<tr>
			                	  <td colspan="8">
                  					<h2 style="text-align: center;">등록된 주소록이 없습니다.</h2>
                  				  </td>
                  			  	</tr>
                  			  </c:if>
                  					
                  			  <c:if test="${!empty employeeList }">
	                  		  <c:forEach items="${employeeList }" var="emp">
			                  	<tr>
			                    	<td>
			                        	<div class="icheck-primary">
			                            	<input type="checkbox" value="" id="check1">
			                            	<label for="check1"></label>
			                          	</div>
			                        </td>
			                        <td>${emp.empId }</td>
			                        <td>${emp.empName }</td>
			                        <td>	
			                        	<div class="image">
			                        		<img src="<%=request.getContextPath() %>/resources/images/01.jpg" class="img-circle img-sm" alt="User Image">
			                          	</div>
			                        </td>
			                        <td>${emp.teamValue }</td>
			                        <td>${emp.chargeValue }</td>
			                        <td>${emp.statusCode }</td>
			                        <td>${emp.empHireDt }</td>
			                        <td>${emp.empAddress }</td>
			                        <td>${emp.empTelephone }</td>
			                        <td>${emp.empEmail }</td>
			                      </tr>
			                    </c:forEach>
                  				</c:if>
                  					                  			                			               
			                  </tbody>
			                </table>
			                <!-- /.table -->
			              </div>
			              <!-- /.mail-box-messages -->
			            </div>
			            <!-- /.card-body -->
			            <div class="card-footer p-0">
			              <div class="mailbox-controls">
			                <!-- Check all button -->
			                <button type="button" class="btn btn-default btn-sm checkbox-toggle">
			                  <i class="far fa-square"></i>
			                </button>
			                <div class="btn-group">
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="far fa-trash-alt"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="fas fa-reply"></i>
			                  </button>
			                  <button type="button" class="btn btn-default btn-sm">
			                    <i class="fas fa-share"></i>
			                  </button>
			                </div>
			                <!-- /.btn-group -->
			                <button type="button" class="btn btn-default btn-sm">
			                  <i class="fas fa-sync-alt"></i>
			                </button>
			                <div class="float-right">
			                  1-50/200
			                  <div class="btn-group">
			                    <button type="button" class="btn btn-default btn-sm">
			                      <i class="fas fa-chevron-left"></i>
			                    </button>
			                    <button type="button" class="btn btn-default btn-sm">
			                      <i class="fas fa-chevron-right"></i>
			                    </button>
			                  </div>
			                  <!-- /.btn-group -->
			                </div>
			                <!-- /.float-right -->
			                <%@ include file="/WEB-INF/views/admin/pagination.jsp" %>
			              </div>
			            </div>
			          </div>
			          <!-- /.card -->
			        </div>
			        <!-- /.col -->
			      </div>
			      <!-- /.row -->
		    </section>
		    <!-- /.content -->
		</div>
    

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">
                Anything you want
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights
            reserved.
        </footer>
    </div>
    <!-- ./wrapper -->


<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/fullcalendar/main.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>

    
</body>
</html>
        
        