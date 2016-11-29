<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
	function writeCheck() {
		var form = document.search;
		if (!form.search.value) {
			alert("검색어를 입력해주세요.");
			form.text.focus();
			return;
		}
		form.submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form name="search" method="post" action=Search_Page.jsp>
	<table>
		<tr>
			<td>
				검색 : <input type="text" name="search" />
				&nbsp;<input type="button" value="검색" Onclick="javascript:writeCheck();" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>