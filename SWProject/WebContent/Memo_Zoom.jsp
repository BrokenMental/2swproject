<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";

	request.setCharacterEncoding("UTF-8");
	Class.forName(jdbc_driver);
	int number = Integer.parseInt(request.getParameter("number"));

	try {
		Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		Statement stmt = conn.createStatement();

		String sql = "SELECT TEXT, TODAY, URL FROM memo WHERE NUMBER=" + number;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String text = rs.getString(1);
			String today = rs.getString(2);
			String url = rs.getString(3);
%>
<html>
<script language="javascript">
	function deleteCheck() {
		if(confirm("삭제하시겠습니까?")){
			location.href="Delete_ok.jsp?number=<%=number%>";
		}else{
			location.reload();
		}
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
			<div id="middle_top">
			<table width="99%">
				<tr>
					<td>
						<a href="Main.jsp"><img src='img/WebMo.png'/></a>
					</td>
					<td align=right>
						<%@ include file="Setting_Drop.jsp"%>
					</td>
				</tr>
			</table>
			</div>
			<div id="middle_middle_up">
				<table width="99%">
					<tr>
						<td width="12%"><%@ include file="Route.jsp"%></td>
						<td width="1%"><font style="color: black;">></font></td>
						<td width="7%"><a href="Memo_List.jsp?today=<%=today%>"><font size="4.0"
								style="color: black;">리스트</font></a></td>
						<td width="1%"><font style="color: black;">></font></td>
						<td width="10%"><a href="Memo_Zoom.jsp?number=<%=number%>"><font
								size="4.0" style="color: black;">메모</font></a></td>
						<td width="60%" align="right"><%@ include file="Search.jsp"%></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle">
				<table align="center" width="90%" height="90%"
					style="border-collapse: collapse; position: relative; top: 50px; border: 0px solid white;">
					<tr style="border: 1px solid white; background: #F2DDDE;">
						<td align="center" width="100px"
							style="border-right: 1px solid white;"><font size="5.0"
							style="color: black;">번호</font></td>
						<td><font size="5.0" style="color: black; margin: 5px"><%=number%></font></td>
					</tr>
					<tr style="border: 1px solid white; background: #F2DDDE;">
						<td align="center" width="100px"
							style="border-right: 1px solid white;"><font size="5.0"
							style="color: black">내용</font></td>
						<td height="250px"><font size="5.0" style="color: black; margin: 5px"><%=text%></font></td>
					</tr>
					<tr style="border: 1px solid white; background: #F2DDDE;">
						<td align="center" width="100px"
							style="border-right: 1px solid white;"><font size="5.0"
							style="color: black">날짜</font></td>
						<td><font size="5.0" style="color: black; margin: 5px"><%=today%></font></td>
					</tr>
					<tr style="border: 1px solid white; background: #F2DDDE;">
						<td align="center" width="100px"
							style="border-right: 1px solid white;"><font size="5.0"
							style="color: black">url</font></td>
						<td><font size="5.0" style="color: black; margin: 5px"><%=url%></font></td>
					</tr>
					<tr style="border-style:none;">
						<td></td>
						<td align="right"><input type="submit"
							style="width: 70pt; height: 50pt; font-size: 25px;" value="수정" Onclick="location.href='Modify.jsp?number=<%=number%>'"/>
							<input type="submit" style="width: 70pt; height: 50pt; font-size: 25px;" value="삭제" Onclick="javascript:deleteCheck();"/>
							<input type="button"
							style="width: 70pt; height: 50pt; font-size: 25px;" value="취소"
							onClick="history.back()" /></td>
					</tr>
				</table>
			</div>
			<div id="middle_bottom">
			<table width="46%">
				<tr>
					<td style="float:right;">
						<%@ include file="New_Memo.jsp" %>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<div id="right"></div>
	</div>
	<%
				rs.close();
				stmt.close();
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>