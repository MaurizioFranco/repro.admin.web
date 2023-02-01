<%@page import="proxima.informatica.academy.seventh.surveyquestion.service.SurveyService"%>
<%@page import="proxima.informatica.academy.dto.SurveyDto"%>
<%@page import="proxima.informatica.academy.DatabaseManagerSingleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Update Survey</title>
<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">
</head>
<body>
<%@include file="header.jsp" %>

<% SurveyDto survey = SurveyService.getInstance().selectSurveyById(Integer.parseInt(request.getParameter("surveyId"))); %>
	<form action="UpdateSurveyServlet" method="post">
		
	  	<label>ID</label><br>
  		<input type="number" name="id" value="<%= survey.getId() %>"><br>
  		
  		<label>Label</label><br>
  		<input type="text" name="label" value="<%= survey.getLabel() %>"><br>
  		
  		<label>Time</label><br>
  		<input type="number" name="time" value="<%= survey.getTime() %>"><br>
  		
  		<label>Description</label><br>
  		<input type="text" name="description" value="<%= survey.getDescription() %>"><br>
  		
		<input class="btn btn-primary" type="submit" id="button" value="Update">
  		
	</form> 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>