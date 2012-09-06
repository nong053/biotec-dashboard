<%@page contentType="text/html" pageEncoding="utf-8"%>
<!--<meta http-equiv="Content-type" content="text/html; charset=utf-8">-->
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
String center_name="";
Connection conn= null;
Statement st;
ResultSet rs;
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_center(2012,11);";
		rs = st.executeQuery(Query);
		
		while(rs.next()){
		out.println(rs.getString("total_employee"));
		out.println(rs.getString("center_th_shortname"));
		//center_name+="<option>"+rs.getString("center_name")+"</option>";

		}
		//out.println(center_name);

		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
%>