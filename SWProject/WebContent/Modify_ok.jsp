<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";

	request.setCharacterEncoding("UTF-8");
	Class.forName(jdbc_driver);
	int number = Integer.parseInt(request.getParameter("number"));
	String text = request.getParameter("text");

	try {
		Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		Statement stmt = conn.createStatement();
		
		String sql = "UPDATE memo SET text='"+text+"' where number="+number;
		stmt.executeUpdate(sql);
		
%>
		<script language="javascript">
			alert("글이 수정되었습니다.");
			location.href="Memo_Zoom.jsp?number=<%=number%>";
		</script>
<%
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>