<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<% response.setStatus(403); //권한이 없음. %>

<script>
	alert('권한이 없습니다.');
	if(window.opener) //열려있는 창이면
	{
		window.close();
	}
	else
	{
		history.go(-1);
	}
</script>