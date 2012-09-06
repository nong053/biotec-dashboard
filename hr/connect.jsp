<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%
/*
-- biotec_dwh --
Type: MYSQL
Server: 10.226.202.114
database: biotec_dwh
user: root
pass: bioteccockpit
*/
// Jsp  Server-side
String connectionURL="jdbc:mysql://10.226.202.114:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="bioteccockpit";
String Query="";
Connection conn= null;
Statement st;
ResultSet rs;
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		out.print("hello jsp");
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
%>