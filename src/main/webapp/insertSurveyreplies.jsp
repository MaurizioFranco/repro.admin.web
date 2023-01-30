<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<%-- <%@include file="authentication.jsp"%> --%>

<head>
<meta charset="ISO-8859-1">
<title>Insert SurveyReplies</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body>
<%@include file="header.jsp" %>


	<form method="post" action="./InsertSurveyRepliesServlet">
		<label>Survey ID</label><br>
		<input type=number id="survey_id" placeholder="Survey_id" name="survey_id_input"required> <br>
		<label>User ID</label><br>
		<input type=number id="user_id"placeholder="User_id" name="user_id_input" maxlength="50" required><br>
		<label>Answers ID</label><br>
		<input type="text" id="answers" placeholder="Answers"name="answers_input" required> <br>
		<label>PdfFileName ID</label><br>
		<input type="text"id="pdffilename" placeholder="Pdffilename" name="pdffilename_input"maxlength="50" required><br>
		<label>Points</label><br>
		<input type="text" id="points"placeholder="Points" name="points_input" required><br>
		
		<input class="btn btn-primary" type="submit" id="button" value="Insert">
	</form>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>