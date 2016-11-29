<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stats</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['일', '메모 개수'],
          ['15일', 11],
          ['16일', 21],
          ['17일', 2],
          ['18일', 2],
          ['20일', 2],
          ['22일', 2]
        ]);

        var options = {
          chart: {
            title: '일별 그래프 통계자료',
            subtitle: '2016 : 11월 일별 그래프',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, options);
      }
    </script>
  </head>
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
						<td width="1%"><font style="color:black;">></font></td>
						<td width="10%"><a href="Stats.jsp"><font size="4.0" style="color:black;">통계</font></a></td>
						<td width="70%" align="right"><%@ include file = "Search.jsp" %></td>
					</tr>
				</table>
			</div>
			<div id="middle_middle_down">
				<div id="center2" style="border:1px solid black; background:#FFFFFF;">
				<table>
					<tr>
						<td>
						&nbsp;&nbsp; 통계
						</td>
					</tr>
				</table>
				<hr align="center" style="border: solid 1px gray; width: 95%">
					<center>
					<div id="columnchart_material" style="width: 700px; height: 500px; position:relative; top:20px;">
					</div>
					</center>
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
</body>
</html>
