<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebMo에 오신것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<div id="frame">
		<div id="funtion">기능 설명 창</div>
		<div id="input">
			<div id="sign_in">
				로그인 영역
				<center>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" /></td>
						</tr>
						<tr>
							<td></td>
							<td align="right"><input type="button" name="sign_in" value="로그인" onclick="location='Main.jsp'" /></td>
						</tr>
					</table>
				</center>
			</div>
			<div id="sign_up">
				회원가입 영역
				<center>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="user_e-mail" /></td>
						</tr>
						<tr>
							<td></td>
							<td align="right"><input type="button" name="sign_up" value="회원가입" /></td>
						</tr>
					</table>
				</center>
			</div>
		</div>
	</div>
</body>
</html>