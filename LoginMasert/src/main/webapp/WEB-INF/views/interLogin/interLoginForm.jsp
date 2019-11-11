<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <meta name="google-signin-client_id" content="565923680914-o1pn5dogs41ctdmbcfrrt0aqcrm5047c.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
<body>
<!--googleLogin  -->
<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>

<!--googleLogOut  -->
<a href="#" onclick="signOut();">로그아웃</a>

 <script>
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
    	  location.href = '/interLogin/interLoginForm';
      }
    </script>
</body>
</html>