<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>idInsertForm</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        width: 527px;
        height: 540px;
        text-align: center;
        font-size: 18px;
        margin:auto;
        background: #283B42;
        color: white;
    }



    .btn-blue {
        background-color: rgb(51, 102, 204);
        border: 1px solid rgb(44, 91, 104);
    }

    .btn-blue:hover {
        background-color: rgb(58, 131, 213);
    }


    #insertTitle{
        font-weight: bold;
        font-size: 50px;
        padding: 10px;
        margin: 10px;
    }
    
    #checkId{
       left: 20px;
        width: 58px;
        height: 40px;
        background: #819FF7;
        border: 1px solid #2E2EFE; 
        font-weight: bold;
    }
     #checkId:hover{
        width: 58px;
        height: 40px;
        background: #0B610B;
        border: 1px solid #00FF00; 
        font-weight: bold;
    }
    
    .btn{
       left: 20px;
        width: 58px;
        height: 40px;
        background: #819FF7;
        border: 1px solid #0489B1; 
        font-weight: bold;
    }
     .btn:hover{
        width: 58px;
        height: 40px;
        background: #0B0B61;
        border: 1px solid #0489B1; 
        font-weight: bold;
        color: white;
    }
    
    .input {
        height: 17px;
        width:  240px;
        padding: 5px;
        margin: 5px;
        border-radius: 50px;
    }
    
    .idInput{
        height: 17px;
        width: 171px;
        padding: 5px;
        margin: 5px;
        border-radius: 50px;
    }
    
    .phoneInput{
        height: 17px;
        width: 51px;
        padding: 5px;
        margin: 5px;
        border-radius: 50px;
     }
    .textTit {
    position: absolute;
    width: 133px;
    left: 9px;
    padding: 8px;
      }
    #idCk{
      padding: 5px;
      position: absolute;
      margin: 2px;
    }
    
</style>
<body>

   <form id="form">
    <div><a href="/">홈으로</a></div>
    
        <div id="mainDiv">
            <div id="loginMain">
                <!-- <i class="fas fa-sign-in-alt" style="font-size: 250px;"></i> -->
                <div id="insertTitle">회원가입</div>
                	<div class="pw_informationbox ">
						<div class="pw_information">
							- 비밀번호는 1~5자리로 생성할 수 있습니다.<br>
						</div>
					</div>
                
                <div class="textbox">
                    <span class="textTit">ID</span> : <input type="text" placeholder="아이디" name="userid" id="userid" class="idInput" required>
                     <button type="button" id="checkId">Id체크</button>
				     <span id="idCk"></span>
                </div>
                
               
                <div class="pswbox">
                 <span class="textTit">PW</span> : <input type="password" placeholder="비밀번호" name="userpw" id="userpw" class="input"  required>
                </div>
                
                 <div class="pswConbox">
                 <span class="textTit">PW 확인</span> : <input type="password" placeholder="pw확인" id="userpwCon" class="input" required>
                </div>
                
                 <div class="pswConbox">
                 <span class="textTit">이름 </span> : <input type="text" placeholder="이름" name="usernm" id="usernm" class="input" required>
                </div>
                
                 <div class="pswConbox">
                 <span class="textTit">e-mail</span> : <input type="text" placeholder="e-mail" name="email" id="email" class="input" required>
                </div>
                
                 <div class="pswConbox">
                 <span class="textTit">주소</span> : <input type="text" placeholder="주소" name="address" id="address" class="input" required>
                </div>
                
                 <div class="pswConbox">
                 <span class="textTit">폰 번호</span> : 
                 <input type="text" placeholder="폰 번호" name="phonenumber" class="phoneInput phonenumber" required> -
                 <input type="text" placeholder="폰 번호" name="phonenumber" class="phoneInput phonenumber" required> -
                 <input type="text" placeholder="폰 번호" name="phonenumber" class="phoneInput phonenumber" required>
                </div>
                
                

                <div class="loginbutton_box ">
                	<button type="button" id="insertBtn" class="btn">회원가입</button>
					<button type="button" id="cancelBtn" class="btn">취소</button>
                </div>
            </div>
        </div>
    </form>


	<!-- JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
        $(document).ready(function() {
            var form =$("#form");
            
        	var checkedId = false;
			//회원가입 시작
			$("#insertBtn").on("click",function(){
				
				 var userid = $("#userid").val();
			     var userpw = $("#userpw").val(); 
			     var userpwCon = $("#userpwCon").val(); 
				 var usernm = $("#usernm").val(); 
				 var email =  $("#email").val(); 
				 var address =  $("#address").val(); 
				 var phonenumber = $(".phonenumber").val();
				 
				//유phonenumber사       phonenumber
				if(userid == "" || userpw == ""  || userpwCon == "" || usernm == ""
					|| email == "" || address == "" || phonenumber == ""){
					alert("데이터를 입력해주세요");
			    }else if(userpw.length<1 ||userpw.length>5){
        	       alert("비밀번호를 1~5자까지 입력해주세요.");
                    $("#userpw").focus();
                    $("#userpw").select();
                    return false;
			    }else if(userpw != userpwCon){
			    	 alert("비밀번호가 서로 다릅니다.");
	                 $("#userpw").focus();
	                 $("#userpw").select();
	                 return false;
			    	
			    }else if(!/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test(email)){
			    	  alert('올바른 이메일 주소를 입력하세요.');
			    	  email.focus();
			        return false;
			    } else{
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
			
/*
           else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{1,5}$/.test(userpw)){
		    	  alert('숫자+영문자+특수문자 조합으로  입력해주세요.');
		    	  userpw.focus();
		        return false;
		    } 
		    */
	//idCheck 시작		
	 //id check 
	 $("#checkId").on("click",function(){
		var userid  = $("#userid").val(); 
		
		$.ajax({
			type : "POST",
			url : "/login/checkId",
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
				 location.href = "/login/insertForm";
			});
			
			
			
			
        });    
    </script> 
</body>
</html>
