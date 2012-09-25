<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="myPackage.*"%>
<%
MyClass m = new MyClass();
out.print(m.sayHi("Kosit"));
%>