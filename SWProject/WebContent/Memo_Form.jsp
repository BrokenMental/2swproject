<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Pattern"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";
		int tc = 0;
		int x = 0;
		int total = 0;

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			Statement stmt = conn.createStatement();
			
			// 총 개수 시작
			String sqlTotal = "SELECT COUNT(*) FROM MEMO";
			ResultSet rs = stmt.executeQuery(sqlTotal);
			
			while(rs.next()){
				total = rs.getInt(1);
			}
			rs.close();
			// 총 개수 끝
			
			// today 컬럼의 개수 구하기 시작
			String sqltc = "select count(distinct today) from memo";
			rs = stmt.executeQuery(sqltc);
			while(rs.next()){
				tc = rs.getInt(1);
			}
			rs.close();
			// today 컬럼의 개수 구하기 끝
			
			// 날짜가 서로다른 today칼럼 구하기 시작
			String sqlResult = "SELECT distinct today FROM MEMO";
			rs = stmt.executeQuery(sqlResult);
			String []result = new String[tc];
			while(rs.next()){
				result[x] = rs.getString(1);
				x++;
			}
			rs.close();
			// 날짜가 서로다른 today칼럼 구하기 끝
			
			// 특정 today의 개수 구하기 시작
			String []sqlCount = new String[tc];
			int []Count =  new int[tc];
			for(int i = 0; i<tc; i++){
				sqlCount[i] = "SELECT count(today) FROM memo where today='"+result[i]+"'";
				rs = stmt.executeQuery(sqlCount[i]);
				if (rs.next()){
					Count[i] = rs.getInt(1);
				}
			}
			rs.close();
			// 특정 today의 개수 구하기 끝

			// 날짜가 서로다른 today칼럼 구하기 시작 - 위에서 한번 구했었지만, 게시글을 만들기 위해서 다시 구현
			String sqlToday = "SELECT distinct today FROM MEMO";
			rs = stmt.executeQuery(sqlToday);
			// String []result = new String[tc]; //while(rs.next())로 반복하기 때문에 배열이 필요없음.
	%>
	<%
		if (total == 0) {
	%>
	<table class="Main_table1">
		<tr>
			<td style="border: 0px" colspan="6">등록된 글이 없습니다.</td>
		</tr>
	</table>
	<%
		} else {
				x=0;
				while (rs.next()) {
					String today = rs.getString(1);
	%>
	<center>
	<table class="Main_table2" border="1px solid" width="95%" height="50px" style="border-color:white; border-collapse:collapse; margin: 7px; text-align:center; background: #F2DDDE;">
		<tr>
			<td width="60%"><a href="Memo_List.jsp?today=<%=today%>"><%=today%></a></td>
			<td><%out.print("메모 : " +Count[x] + "개");%></td>
		</tr>
	</table>
	</center>
	<%
	x++;
		}
			}
			rs.close();
			// 날짜가 서로다른 today칼럼 구하기 끝
			stmt.close();
			conn.close();
	%>
	<div id=box></div>
	<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>
</html>