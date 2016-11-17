<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stats</title>
</head>
<body>
	<div id="frame">
		<div id="left"></div>
		<div id="middle">
			<div id="middle_top"><%@ include file="Setting_Drop.jsp"%></div>
			<div id="middle_middle_up">
				<table>
					<tr>
						<td><%@ include file="Route.jsp"%></td>
						<td><font style="color:black;">></font></td>
						<td><a href="Stats.jsp"><font size="4.0" style="color:black;">통계</font></a></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle_down">
				<div id="center1">
				</div>
			</div>
			<div id="middle_bottom">
			</div>
		</div>
		<div id="right"></div>
	</div>
</body>
</html>