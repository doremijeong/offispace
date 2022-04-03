<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head></head>

<title>이슈 업무함</title>
<body>

    <!-- Content Header (Page header) -->
   <div class="content-wrapper" style="min-height: 1602px;">
     <!-- Content Header (Page header) -->
     <section class="content-header">
       <div class="container-fluid">
         <div class="row mb-2">
           <div class="col-sm-6">
             <h1>이슈 업무함</h1>
           </div>
           <div class="col-sm-6">
             <ol class="breadcrumb float-sm-right">
               <li class="breadcrumb-item"><a href="#">업무</a></li>
               <li class="breadcrumb-item active">이슈 업무함</li>
             </ol>
           </div>
         </div>
       </div><!-- /.container-fluid -->
     </section>

     <!-- Main content -->
     <section class="content">
       <div class="container-fluid">
         <!-- 마진을 위한 div -->
         <div style="height: 3px;"></div>


         <div class="row">
           <!-- left-list -->
           <div class="col-lg-12">
             <div class="card card-info card-outline">
               <div class="card-header p-0 border-bottom-0">
               
               </div>
               <div class="card-body">
                   <!--참조 업무함==================================================================================================-->
                     <table class="table table-sm table-hover" style="table-layout: fixed; font-size: 0.8em;">
                       <thead>
                         <tr>
                           <th class="text-center" style="width:3%"></th>
                           <th class="text-center" style="width:18%">업무</th>
                           <th class="text-center" style="width:18%">제목</th>
                           <th class="text-center" style="width:6%">담당자</th>
                           <th class="text-center" style="width:7%;">등록일</th>
                           <th class="text-center" style="width:7%;">마감일</th>
                           <th class="text-center" style="width:3%;">상태</th>
                         </tr>

                       </thead>

                       <tbody>
                         <tr>
                           <td class="text-center"><span class="badge bg-danger">긴급</span></td>
                           <td class="text-left text-truncate">직원의 급여·상여금·퇴직금 계산 및 정산처리에 관한 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">조명석 과장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">인사관리에 관한 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">이민영 사원</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-warning">진행</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"></td>
                           <td class="text-left text-truncate">직원의 출장·휴가·파견근무에 관한 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">하기재 팀장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"></td>
                           <td class="text-left text-truncate">직원의 건강진단에 관한 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김진혁 사원</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-danger">지연</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-danger">긴급</span></td>
                           <td class="text-left text-truncate">연봉 테이블 디자인 및 관리</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">이미정 차장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-warning">진행</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">상벌추천</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김노을 과장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-danger">긴급</span></td>
                           <td class="text-left text-truncate">UI개발 이벤트(웹페이지·팝업·아이콘·베너 등 제작) 지원</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김미희 과장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-danger">지연</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">리뉴얼 메인 및 서브페이지·서브섹션 디자인</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">석기현 대리</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"></td>
                           <td class="text-left text-truncate">시스템운용 서버·스토리지 관리 및 유지보수 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김혜윤 과장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-warning">진행</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">DB관리 DB Schema 설계 및 작성·관리</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">강건 대리</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">DB관리 DB Backup alc Recovery</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">임나리 부장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-warning">진행</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-danger">긴급</span></td>
                           <td class="text-left text-truncate">소송사무처리 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">류인성 팀장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">회사직인의 제작 및 사용관리</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김수진 사원</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"></td>
                           <td class="text-left text-truncate">대내외 행사에 관한 사항</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">김형민 부장</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>

                         <tr>
                           <td class="text-center"><span class="badge bg-primary">중요</span></td>
                           <td class="text-left text-truncate">이사회 업무</td>
                           <td class="text-left text-truncate">차량대여 문의7777777777777777777777777777</td>
                           <td class="text-center">이단비 대리</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.25.(화)</td>
                           <td class="text-center" style="font-size: 0.8em; padding-top: 9px;">2021.01.26.(수)</td>
                           <td class="text-center"><span class="badge bg-secondary">완료</span></td>
                         </tr>
                       </tbody>
                     </table>

                     <!--페이징-->
                     <div class="card-footer p-1 d-flex justify-content-center">
                       <ul class="pagination pagination-sm m-0">
                         <li class="page-item"><a class="page-link" href="#">«</a></li>
                         <li class="page-item active"><a class="page-link" href="#">1</a></li>
                         <li class="page-item"><a class="page-link" href="#">2</a></li>
                         <li class="page-item"><a class="page-link" href="#">3</a></li>
                         <li class="page-item"><a class="page-link" href="#">4</a></li>
                         <li class="page-item"><a class="page-link" href="#">5</a></li>
                         <li class="page-item"><a class="page-link" href="#">6</a></li>
                         <li class="page-item"><a class="page-link" href="#">7</a></li>
                         <li class="page-item"><a class="page-link" href="#">8</a></li>
                         <li class="page-item"><a class="page-link" href="#">9</a></li>
                         <li class="page-item"><a class="page-link" href="#">10</a></li>
                         <li class="page-item"><a class="page-link" href="#">»</a></li>
                       </ul>
                     </div>
                     <!--페이징-->

               </div> <!-- /.card -->
             </div>
             <!--card-->
           </div>
           <!--col-lg-12(탭 크기)-->
         </div> <!-- row -->
       </div>
       <!--card-body-->
   </div> <!-- ./column -->
 </div> <!-- /.container-fluid -->
 </section> <!-- /.content -->
 </div> <!-- content-wrapper -->

</body>
