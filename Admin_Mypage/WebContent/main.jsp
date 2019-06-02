<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 메인페이지</title>
<script>
	onload = function(){
		document.getElementById("toMyPage").onclick = function(){
			location.href = "mypage.admin";
		}
	}
</script>
</head>
<body>
	<input id="toMyPage" type="button" value="마이페이지">
</body>
</html>