<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
    * {
        padding: 0;
        margin: 0;
    }


    #loginMain {
      position:absolute;
       top:50%; left:50%;
       transform: translate(-50%, -50%);
        width: 500px;
        height: 500px;
        text-align: center;
        font-size: 18px;
        margin:auto;
        background: #283B42;
    }

    input {
        height: 30px;
        width: 300px;
        padding: 10px;
        margin: 10px;
    }

    .btn-blue {
        background-color: rgb(51, 102, 204);
        border: 1px solid rgb(44, 91, 104);
    }

    .btn-blue:hover {
        background-color: rgb(58, 131, 213);
    }


    #loginTitle{
        font-weight: bold;
        font-size: 120px;
        padding: 10px;
        margin: 10px;
    }
</style>


<!--구글  -->
 <meta name="google-signin-client_id" content="565923680914-o1pn5dogs41ctdmbcfrrt0aqcrm5047c.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
 <script src="https://connect.facebook.net/en_US/all.js"></script>
 <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v5.0&appId=1135903910133386&autoLogAppEvents=1"></script>
 
<body>

<a href=""></a>


<!--페이스북  ------------------  -->
    <a href="${facebook_url}"><button class="btn btn-primary btn-round">
      Facebook Login</button></a> 



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
 
 /* faceBook 로그인  */



   

     
 </script>
</body>
</html>