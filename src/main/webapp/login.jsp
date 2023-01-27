<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>

<!--  <link rel="stylesheet" href="styles.css"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center">Login</h1>
		<%
		if (request.getAttribute("logoutMessage") != null) {
		%>
		<p>Logout complete</p>
		<%
		}
		%>

		<%
		if (request.getAttribute("loginFailed") != null) {
		%>
		<p>
			<%=request.getAttribute("loginFailed")%>
		</p>
		<%
		}
		%>

		<%
		if (request.getAttribute("firstRegistration") != null) {
		%>
		<p>Check your email for create a new password</p>
		<%
		}
		%>

		<%
		if (request.getAttribute("passwordRegistration") != null) {
		%>
		<p>We have received your registration, your account will be
			activated soon</p>
		<%
		}
		%>
		<form action="./LoginServlet" method="post">
			<div class="form-group">
				<label id="email">Email</label>
				<input class="form-control" type="email" name="email">
			</div>
			<div class="form-group">
				<label id="password">Password</label>
				 <input class="form-control" type="password" name="password">
			</div>
	<div class="form-group form-check">

			</div>
			<input id="button" class="btn btn-primary" type="submit"
				value="Continue">
		</form>

		<br>
		<p class="text-center"> Don't have an account? <a href="registration.html">Sign	up</a></p>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>

</body>
</html>