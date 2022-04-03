<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="card-footer p-2">
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
	<nav aria-label="Navigation">
		<ul class="pagination pagination-sm justify-content-center m-0">

			<li class="paginate_button page-item ">
				<a class="page-link" style="display:inline" aria-controls="example2" href="javascript:list_go(1);">
					<i class="fas fa-angle-double-left"></i>
				</a>
			</li>

			<li class="paginate_button page-item ">
				<a class="page-link" style="display:inline" aria-controls="example2" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage - 1 : pageMaker.mailCri.page}');">
					<i class="fas fa-angle-left"></i>
				</a>
			</li>

			<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">

				<li class="paginate_button page-item  ${pageMaker.mailCri.page == pageNum ? 'active' : ''}">
					<a class="page-link" style="display:inline" aria-controls="example2" href="javascript:list_go('${pageNum}');"> ${pageMaker.totalCount != 0 ? pageNum : '1'} </a>
				</li>

			</c:forEach>

			<li class="paginate_button page-item ">
				<a class="page-link" style="display:inline" aria-controls="example2" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage + 1 : pageMaker.mailCri.page}');">
					<i class="fas fa-angle-right"></i>
				</a>
			</li>

			<li class="paginate_button page-item ">
				<a class="page-link" style="display:inline" aria-controls="example2" href="javascript:list_go('${pageMaker.realEndPage}');">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</li>
		</ul>
	</nav>
</div>
</div>
</div>
<!-- /.card -->
</section>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="">
	<input type="hidden" name="perPageNum" value="">
	<input type="hidden" name="searchType" value="">
	<input type="hidden" name="keyword" value="">
	<input type="hidden" name="kindOfMail" value="${mailCri.kindOfMail}">
	<input type="hidden" name="loginUser" value="${loginUser.empCode}">
	<input type="hidden" name="to" value="">
	<input type="hidden" name="from" value="">
	<input type="hidden" name="sDate" value="">
	<input type="hidden" name="eDate" value="">
</form>

