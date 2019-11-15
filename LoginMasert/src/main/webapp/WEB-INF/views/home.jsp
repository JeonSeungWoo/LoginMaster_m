<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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


<h4>2.연동로그인(java)</h4>
<table border="1">
<tr>
<td>연동로그인</td>
<td><button type="button" onclick="interLoginMove()">이동</button></td>
</tr>
</table>

<h4>3.연동로그인(js)</h4>
<table border="1">
<tr>
<td>연동로그인</td>
<td><button type="button" onclick="interLoginMove2()">이동</button></td>
</tr>
</table>
<h5>단점: 해당 사이트에서 지원해 주는 디자인이기 때문에 크기를 전부 맞춰줘야 한다.</h5>

<P>  The time on the server is ${serverTime}. </P>
<script type="text/javascript">

function simpleLoginMove(){
	location.href = "/login/loginForm";
}

function interLoginMove(){
	location.href = "/interLogin/interLoginForm";
} 

function interLoginMove2(){
	location.href = "/interLogin/interLoginForm2";
} 

</script>

</body>
</html>
