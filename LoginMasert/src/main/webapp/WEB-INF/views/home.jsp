<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<style>
ul{
 list-style: none;
    margin: 0px;
    padding: 0px;
}


</style>



<body>
<h1>
    로그인의 종류
</h1>


<h4>1.기본로그린</h4>
<table border="1">
<tr>
<td>기본 로그인</td>
<td><button type="button" onclick="simpleLoginMove()">이동</button></td>
</tr>
</table>


<h4>2.연동로그인</h4>
<table border="1">
<tr>
<td>연동로그인</td>
<td><button type="button" onclick="interLoginMove()">이동</button></td>
</tr>
</table>


<P>  The time on the server is ${serverTime}. </P>
<script type="text/javascript">

function simpleLoginMove(){
	location.href = "/login/loginForm";
}

function interLoginMove(){
	location.href = "/interLogin/interLoginForm";
} 

</script>

</body>
</html>
