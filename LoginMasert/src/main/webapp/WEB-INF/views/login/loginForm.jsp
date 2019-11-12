<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>loginForm</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

<body>

    <form id="form">
    <div><a href="/">홈으로</a></div>
    
        <div id="mainDiv">
            <div id="loginMain">
                <!-- <i class="fas fa-sign-in-alt" style="font-size: 250px;"></i> -->
                <div id="loginTitle">LOGIN</div>
                <div class="textbox">
                    <input type="text" placeholder="아이디" name="userid" class=" xCenter" required>
                </div>
                <div class="pswbox">
                    <input type="password" placeholder="비밀번호" name="userpw" class=" xCenter" required>
                </div>

                <div class="loginbutton_box ">
                    <button type="submit" class="btn-blue" id="loginBtn">로그인</button>
                    <button type="button" class="btn-blue" id="insertBtn">회원가입</button>
                </div>
            </div>
        </div>
    </form>









    <!-- JS -->
    <script src="/resources/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var form = $("#form");

            $("#loginBtn").on("click", function () {
                form.attr("action", "loginProcess").attr("method", "POST").submit();
            });


            $("#insertBtn").on("click", function () {
                form.attr("action", "insertForm").attr("method", "GET").submit();
            });

        });

    </script>
</body>
</html>
