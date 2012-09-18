<%@page contentType="text/html" pageEncoding="utf-8"%>


<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>


<%
String connectionURL="jdbc:mysql://localhost:3306/biotec_dwh";
String Driver="com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
Statement st;
Connection conn=null;
ResultSet  rs;

Class.forName(Driver).newInstance();
conn = DriverManager.getConnection(connectionURL,User,Pass);
st = conn.createStatement();
Query="";
if(!conn.isClosed()){
	out.print("connection is successfully");

}

%>
<script type="text/javascript">
	var right_now = new Date();
	var Day=rigth_now.getDate();
	alert(Day);
</script>