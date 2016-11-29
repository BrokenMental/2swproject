<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memo_List</title>
<link rel="stylesheet" type="text/css" href="style.css?">
</head>
<body>
<%
String todayi = request.getParameter("today");
Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/swproject?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";
int total = 0;
int tc = 0;
int x = 0;

try{
	Class.forName(jdbc_driver);
	conn = DriverManager.getConnection(jdbc_url,"root","1234");
	Statement stmt = conn.createStatement();

	// today 컬럼의 개수 구하기 시작
	String sqltc = "select count(distinct today) from memo";
	ResultSet rs = stmt.executeQuery(sqltc);
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
	
	String sqltoday = "SELECT today from memo where today='"+todayi+"'";
	rs = stmt.executeQuery(sqltoday);
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
						<td><a href="javascript:location.reload();"><font size="4.0" style="color:black;">리스트</font></a></td>
						<td align="right"><%@ include file = "Search.jsp" %></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle_down">
				<div id="center1">
				<%
				for(int i =0; i<result.length; i++){
					if(todayi.equals(result[i])){
						if(rs.next()){
							String today = rs.getString(1);
				%>
				<table width="99%">
					<tr>
						<td style="left:10px">&nbsp;<%=today %></td>
						<td align="right"><font style="color:white;">&nbsp;<%out.print("현재 메모 : " + Count[i] + "개"); %></font>&nbsp;</td>
					</tr>
				</table>
				<%
						}
						rs.close();
					}
				}
				String sqlList = "SELECT * from memo where today='"+todayi+"' order by number desc";
				rs = stmt.executeQuery(sqlList);
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
						<th>번호</th><td><!--<a href="Memo_Zoom.jsp?number=<%=number%>"> </a>--><%=number %>
						<%
						if(year.equals(ye)){
						%>
							<img src='img/new3.png' />
						<%
						}
						%>
						</td> <!--<td><a href="Memo_Joom.jsp"></a></td> -->
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
				<!--
				<span style="float:right">
					<input type="button" value="메모작성" onClick="location.href='Memo.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				 -->
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