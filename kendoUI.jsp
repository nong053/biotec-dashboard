<%@page contentType="text/html"  pageEncoding="utf-8"%>

<%@page import ="java.io.*"%>
<%@page import ="java.lang.*"%>
<%@page import ="java.sql.*"%>


<% 

String test1  = request.getParameter("test1");
String test2  = request.getParameter("test2");
String test3  = request.getParameter("test3");
out.println("testGetData"+test1);
out.println("testGetData"+test2);
out.println("testGetData"+test3);
%>


	