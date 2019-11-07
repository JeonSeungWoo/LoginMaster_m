<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>idInsertForm</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/sewerage.css">
<!-- JS -->
<script src="/resources/js/jquery-1.11.2.min.js"></script>

</head>
<body>
	<div class="frame" style="overflow: hidden;">
		<div class="pw_box xyCenter_for_pwbox">
			<div class="logo">
				<img src="/resources/img/logo.png" alt="logo">
			</div>


			
				<div class="pw_boxline">
				<form id="form">
					<div class="pw_title_box">
						<div class="help_icon">
							<img src="/resources/img/help.png" alt="도움말">
						</div>
						<div class="pw_title xyCenter">회원가입</div>
					</div>

					<div class="pw_informationbox ">
						<div class="pw_information xyCenter">
							- 비밀번호는 8~16자리로 생성할 수 있습니다.<br> - 한 가지 이상 영문자/숫자/특수문자를 포함해야
							합니다.<br> - 특수문자는 (!/@/#/$/%/^/&/*) 만 사용 가능합니다.
						</div>
					</div>

					<div class="pw_informationbox2 xCenter displayNone">
						<div class="pw_information2 xyCenter">
							<div class="pw_information_text xyCenter">형식에 맞지 않는
								비밀번호입니다.</div>
						</div>
				</div>
					<div class="textbox" style="left: 18% !important;">
						<input type="text" placeholder="아이디"  name="userid" id="userid"style="width: 240px">
						<button type="button" id="checkId">Id체크</button>
						<span id="idCk"></span>
					</div>
				    
				<div class="textbox">
						<input type="password" placeholder="페스워드" name="userpw" id="userpw"
							class=" xCenter" required>
					</div>
				<div class="textbox">
						<input type="text" placeholder="이름" name="usernm" id="usernm"
							class=" xCenter" required>
					</div>
					
					<div class="textbox">
						<input type="text" placeholder="Email" name="email" id="email"
							class=" xCenter" required>
					</div>

					<div class="pw_linebox">
						<div class="pw_line xyCenter"></div>
					</div>
					
			</form>		
					<div class="pw_buttonbox">
						<div class="pw_button xyCenter">
							<button type="submit" id="insertBtn" class="change">회원가입</button>
							<button type="submit" id="cancelBtn" class="cancel">취소</button>
						</div>
					</div>
				</div>
			


		</div>
	</div>
	<!-- JS -->
	<script src="/resources/js/sewerage.js"></script>
	<script src="/resources/js/jquery-ver1_12_4.js"></script>
	<script src="/resources/js/jquery-1.11.2.min.js"></script>
	<script>
        $(document).ready(function() {
            Set_Event();
            var form =$("#form");
            
        	var checkedId = false;
			//회원가입 시작
			$("#insertBtn").on("click",function(){
				 var usernm  = $("#usernm").val(); 
			     var userid  = $("#userid").val(); 
				 var userpw  = $("#userpw").val(); 
				 var email  = $("#email").val(); 
				 
				//유효성 검사 
				if(usernm == "" || userid == ""  || userpw == "" || email == ""){
					alert("데이터를 입력해주세요");
			    }else if(userpw.length<8 ||userpw.length>16){
        	       alert("비밀번호를 8~16자까지 입력해주세요.")
                    $("#userpw").focus();
                    $("#userpw").select();
                    return false;
			    }else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userpw)){
			    	  alert('숫자+영문자+특수문자 조합으로 8~16자까지 입력해주세요.');
			          userpw.focus();
			        return false;
			    }
				else{
			    	//아이디 체크 검사
			    	if(checkedId == true){
			    		alert("회원가입 되었습니다.");
			    		form.attr("action","loginCreate").attr("method","POST").submit();
			    		return true;
			    	}else{
			    		alert("아이디를 체크를 확인해 주세요!!!!");
			    		return false;
			    	}
			    	
			    }
				
			});
			//회원가입 끝
			
	
	//idCheck 시작		
	 //id check 
	 $("#checkId").on("click",function(){
		var userid  = $("#userid").val(); 
		
		$.ajax({
			type : "POST",
			url : "/user/checkId",
			data : {"userid" :  userid},
			
			success : function(data){
				if($.trim(data) == 0){
					$("#idCk").html('<b style ="font-size:18xp; color:blue">사용가능</b>');
					checkedId = true;
				}else{
					$("#idCk").html('<b style ="font-size:18xp; color:red">사용불가</b>');
					checkedId = false;
				}
			}
			
			
		});
		 return false;
		 
	 });
	//idCheck 끝
			
			
			
			
			$("#cancelBtn").on("click",function(){
				 location.href = "/user/login";
			});
			
			
			
			
        });    
    </script>
</body>
</html>
