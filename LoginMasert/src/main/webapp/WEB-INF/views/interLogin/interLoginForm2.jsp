<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--구글  -->
 <meta name="google-signin-client_id" content="565923680914-o1pn5dogs41ctdmbcfrrt0aqcrm5047c.apps.googleusercontent.com">
 <script src="https://apis.google.com/j<span class="_8jan"></span>s/platform.js" async defer></script>
 <!--페이스북  -->
  <script src="https://connect.facebook.net/en_US/all.js"></script>

<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v5.0&appId=1135903910133386&autoLogAppEvents=1"></script>


<body>

                
     <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
     <a href="#" onclick="signOut();">로그아웃</a>
          
<br>



<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>


<div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with" data-auto-logout-link="true" data-use-continue-as="false"></div>

<div id="status">
</div>

<button id="fbLogOut">로그아웃12</button>


  <fb:login-button autologoutlink="true" perms=""></fb:login-button>
          
          
          
 
          
<!--구글  ------------------  -->
<!--googleLogin  -->


<!--googleLogOut  -->




<!--페이스북  ------------------  -->

      

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>
      /* 구글 */
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
      
      function signOut(){
    	  var auth = gapi.auth2.getAuthInstance();
    	  auth.signOut().then(function(){
    		  console.log('user signed out.'); 
    	  });
    	  auth.disconnect();
    	  location.href = '/interLogin/interLoginForm2';
      }
      
      
      /*페이스묵  */
      
 
  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();  
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1135903910133386',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v5.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };

  
  (function(d, s, id) {                      // Load the SDK asynchronously
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

  $('#fbLogOut').click(function(e){ 
	     e.preventDefault();
	     alert("1");
	      FB.logout(function(response) {
	    	  alert("시발개끼양");

	        });
	});
      
    </script>
</body>
</html>