<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
if (session.getAttribute("userLoggedEmail") == null) {
	String url = request.getRequestURL() + "?" + request.getQueryString();
	session.setAttribute("url", url);
	response.sendRedirect("login.jsp");
}
%>
