<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd. HH:mm:ss"); //yyyy.MM.dd. HH:mm:ss
String now = formatter.format(new java.util.Date());
%>
<html>
<script language="javascript">
	function writeCheck() {
		var form = document.writeform;

		if (!form.text.value) {
			alert("내용을 적어주세요");
			form.text.focus();
			return;
		}
		if (!form.url.value) {
			alert("url을 적어주세요");
			form.url.focus();
			return;
		}

		form.submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebMo</title>
<link rel="stylesheet" type="text/css" href="style.css">
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
						<td><font style="color: white;">></font></td>
						<td><a href="Memo_List.jsp"><font size="4.0"
								style="color: white;">리스트</font></a></td>
						<td><font style="color: white;">></font></td>
						<td><a href="Memo_Zoom.jsp?number=<%=%>"><font
								size="4.0" style="color: white;">메모</font></a></td>
						<td><a href="Memo.jsp"></</a></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle">
				<div id="center1">
					<form name= "writeform" action="Memo_ok.jsp" method="post"
						onsubmit="return formCheck();">
						<table>
							<tr>
								<td align="right">내용 :</td>
								<td><textarea rows="10" cols="21" name="text"></textarea></td>
							</tr>
							<tr>
								<td align="right">url :</td>
								<td><input type="text" name="url" /></td>
							</tr>
							<tr>
								<td align="right">날짜 :</td>
								<td><input type="text" name="today" value = "<% out.print(now); %>"/></td>
							</tr>
							<tr>
								<td></td>
								<td align="right">
								<input type="button" value="입력" Onclick="javascript:writeCheck();"/> 
								<input type="button" value="취소" onClick="history.back(-1)" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div id="middle_bottom">
			</div>
		</div>
		<div id="right"></div>
	</div>
</body>
</html>