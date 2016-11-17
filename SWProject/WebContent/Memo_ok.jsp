<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";
	
	request.setCharacterEncoding("UTF-8");
	Class.forName(jdbc_driver);

	String number = request.getParameter("number");
	String text = request.getParameter("text");
	String today = request.getParameter("today");
	String url = request.getParameter("url");

	try {
		Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");

		String sql = "INSERT INTO MEMO(NUMBER,TEXT,TODAY,URL) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, number);
		pstmt.setString(2, text);
		pstmt.setString(3, today);
		pstmt.setString(4, url);

		pstmt.execute();
		pstmt.close();

		conn.close();
	} catch (Exception e) {
		System.out.println(e.toString());
	}
%>
<script language=javascript>
	self.window.alert("메모가 저장되었습니다.");
	location.href = "Memo_List.jsp"
</script>