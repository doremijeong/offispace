<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title></title>

<body>
	<script>
		var answer=confirm('할래말래');
		if(answer)
		{
			window.opener.faceSuccess('A');
			window.close();
		}
		
	</script>
</body>