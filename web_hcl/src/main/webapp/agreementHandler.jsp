
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String action = request.getParameter("action");

    if ("accept".equals(action)) {
        response.sendRedirect("home.jsp"); // Redirect to home page
    } else {
        response.sendRedirect("logout.jsp"); // Redirect to logout
    }
%>
    