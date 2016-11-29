<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebMo</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		String searched ="";
		Connection conn = null;
		PreparedStatement pstmt = null;

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			Statement stmt = conn.createStatement();
			%>
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
						<td width="95px"><%@ include file="Route.jsp"%></td>
						<td width="10px"><font style="color:black;">></font></td>
						<td><a href="javascript:location.reload();"><font size="4.0" style="color:black;">검색결과</font></a></td>
						<td align="right"><%@ include file = "Search.jsp" %></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle_down">
				<div id="center1">
				<%
				String sqlnum = "SELECT COUNT(*) FROM MEMO WHERE TEXT LIKE '%"+search+"%'";
				ResultSet rs = stmt.executeQuery(sqlnum);
				
				if(rs.next()){
					int num = rs.getInt(1);
					if(num == 0){
						%>
					<table width="99%">
						<tr>
							<td style="left:10px">&nbsp; (<%=search %>)로 검색 된 메모가 없습니다.</td>
							<td align="right"><font style="color:white;">&nbsp;<%out.print("현재 메모 : " + num + "개"); %></font>&nbsp;</td>
						</tr>
					</table>
					<%
					}else{
				%>
				<table width="99%">
					<tr>
						<td style="left:10px">&nbsp; (<%=search %>)로 검색 된 메모</td>
						<td align="right"><font style="color:white;">&nbsp;<%out.print("현재 메모 : " + num + "개"); %></font>&nbsp;</td>
					</tr>
				</table>
				<%	
					}
						}
						rs.close();
					String sqlsearch = "SELECT * FROM MEMO WHERE TEXT LIKE '%"+search+"%' ORDER BY NUMBER DESC";
					rs = stmt.executeQuery(sqlsearch);
				%>
				<hr align="center" style="border: solid 1px gray; width: 95%">
				<%
					while(rs.next()){
						int number = rs.getInt(1);
						String text = rs.getString(2);
						String today = rs.getString(3);
						String url = rs.getString(4);
						
						Date date = new Date();
						SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
						String year = (String)simpleDate.format(date);
						String ye = today.substring(0,10);
				%>
				<table class="memo_table2" border= "1px solid" width= "32%" onclick="location.href='Memo_Zoom.jsp?number=<%=number%>'"style="border-color:white; border-collapse: collapse; TABLE-layout:fixed; float:left; position: relative; left: 10px; margin: 2px; background: #F2DDDE;">
					<tr>
						<th>번호</th><td><%=number %>
						<%
						if(year.equals(ye)){
						%>
							<img src='img/new3.png' />
						<%
						}
						%>
						</td>
					</tr>
					<tr>
						<th>메모</th><td style="text-overflow : ellipsis;overflow : hidden;"><nobr><%=text %></nobr></td>
					</tr>
					<tr>
						<th>날짜</th><td><%=today %></td>
					</tr>
					<tr>
						<th>url</th><td style="text-overflow : ellipsis;overflow : hidden;"><nobr><%=url %></nobr></td>
					</tr>
				<%
				}
				rs.close();
				stmt.close();
				conn.close();
				 %>
				</table>
				</div>
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
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>