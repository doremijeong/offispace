<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<% response.setStatus(302); %>

<script>
	alert("${message}");
	if(window.opener) //열려있는 창이면
	{
		//window.opener.parent.location.reload();
		window.opener.parent.location.href="<%=request.getContextPath()%>/common/loginForm.do";
	}
	else
	{
		//alert("<%=request.getContextPath()%>");
		window.location.href="<%=request.getContextPath()%>/common/loginForm.do";
	}
	window.close();
</script>