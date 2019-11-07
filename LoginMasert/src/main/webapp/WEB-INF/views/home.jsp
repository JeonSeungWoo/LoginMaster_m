<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<style>

</style>

<body>
<h1>
    로그인의 종류
</h1>

<table border="1">
<tr>
<td>기본 로그인</td>
<td><button type="button" onclick="simpleLoginMove()">이동</button></td>
</tr>



</table>


<P>  The time on the server is ${serverTime}. </P>
<script type="text/javascript">

function simpleLoginMove(){
	location.href = "/login/loginForm";
}

</script>

</body>
</html>
