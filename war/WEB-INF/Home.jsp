<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
window.fbAsyncInit = function() {
			FB.init({
				appId : '310546022761945',
				xfbml : true,
				version : 'v2.11'
			});

			function onLogin(response) {
				if (response.status == 'connected') {
					FB.api('/me?fields=first_name,last_name', function(data) {
						var welcomeBlock = document.getElementById('User_Welcome');
						welcomeBlock.innerHTML = '<h4>'+'Welcome, ' + data.first_name+' '+ data.last_name + '!'+'</h4>';
						
					    document.getElementById("tweetLink").href="/twitter?Author="+ data.first_name + data.last_name; 
					});
				} else {
					var welcomeBlock = document.getElementById('User_Welcome');
					welcomeBlock.innerHTML = 'Cant get data ' + response.status + '!';
				}
			}

			FB.getLoginStatus(function(response) {
				// Check login status on load, and if the user is
				// already logged in, go directly to the welcome message.
				console.log('getLoginStatus .... ');

				if (response.status == 'connected') {
					console.log('connected .... ');
					onLogin(response);
				} else {
					// Otherwise, show Login dialog first.
					console.log('Not connected .... ');
					FB.login(function(response) {
						onLogin(response);
					}, {
						scope : 'user_friends, email, user_birthday'
					});
				}
			});

			console.log('logPageView .... ');
			FB.AppEvents.logPageView();

		};	
		
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
</script>
<title>Kaur- jx3874</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-md-8">
			<div class="form-area">
				<form role="form" action="twitter" method="post"
					style="width: 150%;">
					<br><br><br><br>
					<h3 style=" text-align: center; color:blue;">Social Media Application</h3>
					<h5 style=" text-align: center; color:blue;">Created by Prabhleen Kaur (jx3874)</h5>
					<div id="User_Pic"></div>
					<h6 id="User_Welcome"></h6>
					<nav class="navbar navbar-fixed-top" style="background-color:blue; color:white;">
					<div class="container-fluid">
						<ul class="nav navbar-nav">
							<li><a id="tweetLink"  style="color:white;">Tweet</a></li>
							<li style="color:white;"><a href="/friendspage"  style="color:white;">Friends</a></li>
							<li style="color:white;"><a href="/toptweets"  style="color:white;">Top Tweets</a></li>
						</ul>
					</div>
					</nav>
				</form>
			</div>
		</div>
	</div>
</body>
</html>