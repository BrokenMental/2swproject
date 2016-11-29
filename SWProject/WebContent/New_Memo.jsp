<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		Connection conn0 = null;
		PreparedStatement pstmt0 = null;

		String jdbc_driver0 = "com.mysql.jdbc.Driver";
		String jdbc_url0 = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";

		try {
			Class.forName(jdbc_driver0);
			conn0 = DriverManager.getConnection(jdbc_url0, "root", "1234");
			Statement stmt0 = conn0.createStatement();

			String sqltoday0 = "select * from memo order by today desc limit 1";
			ResultSet rs0 = stmt0.executeQuery(sqltoday0);
			if (rs0.next()) {
				int number0 = rs0.getInt(1);
				String text0 = rs0.getString(2);
				String today0 = rs0.getString(3);
				String url0 = rs0.getString(4);
	%>
	<table border="0px solid" onclick="location.href='Memo_Zoom.jsp?number=<%=number0%>'" style="border-radius:5px; position:absolute; margin-top:4px; border-color:white; border-collapse:collapse; background:#F7CAC9;">
		<tr>
			<td>최신 메모 :&nbsp;</td>
			<td><%=number0 %></td><td><%=text0 %></td><td><%=today0 %></td><td><%=url0 %></td>
			<td><img src='img/new3.png' /></td>
		</tr>
	</table>
	<!--<marquee behavior="alternate" scrolldelay="100" direction="right"> -->
	<!--</marquee>-->
	<%
			}
		rs0.close();
		stmt0.close();
		conn0.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>
</html>