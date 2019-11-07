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

    [class*='btn-'] {
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
        -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.08);
        color: #fff;
        display: inline-block;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 14px;
        padding: 8px 16px;
        text-decoration: none;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.075);

        -webkit-transition: background-color 0.1s linear;
        -moz-transition: background-color 0.1s linear;
        -o-transition: background-color 0.1s linear;
        transition: background-color 0.1s linear;
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
                    <button type="button" class="btn-blue" id="idInsertBtn">회원가입</button>
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


            $("#idInsertBtn").on("click", function () {
                form.attr("action", "idInsertForm").attr("method", "GET").submit();
            });

        });

    </script>
</body>
</html>