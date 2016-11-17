<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "java.util.regex.Pattern" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
	String text = request.getParameter("text");
	String today = request.getParameter("today");
	String url = request.getParameter("url");
%>

<body>
	&nbsp; &nbsp; 날짜가 들어갑니다.
	<hr align="center" style="border: solid 1px gray; width: 95%">
	<center>
		<a href="Memo_List.jsp"> 그림이 들어갈 예정입니다.</a>
	</center>
	<div id=box>
	</div>
</body>
</html>