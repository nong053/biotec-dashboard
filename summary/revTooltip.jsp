<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 

<%
String month=request.getParameter("month");
String year=request.getParameter("year");
//String month = "11";
//String year = "2012";
String connectionURL="jdbc:mysql://localhost:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
String center_name="";
Connection conn= null;
Class.forName(Driver).newInstance();
conn = DriverManager.getConnection(connectionURL,User,Pass);

Statement st;
ResultSet  rs;
st = conn.createStatement();
Query="CALL sp_executive_revenue_by_bsc(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);
	while(rs.next()){
		out.print(rs.getString("bsc_name"));
	}


%>