<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%
String connectionURL="jdbc:mysql://localhost:3306/biotec_dwh";
String Driver="com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";

Connection conn=null;
ResultSet rs;
Statement st;


Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);

%>
<%!
         public String sayHello(){
		 return "hello" ;
		}
                 
				  //return "Hello " + myName;
       
%>

<%
String st1="Kosit Aromsava";
%>

<%=sayHello()%>
