<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%
String month=request.getParameter("month");
String year=request.getParameter("year");
String flag = request.getParameter("flag");
//String flag = "1";
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
Query="CALL sp_personnel_expense_vs_operating_expense(";
Query += year +"," + month +","+flag+");";
rs = st.executeQuery(Query);
int i = 0;
int totalPieHR3 = 0;
String valuePieHR3 ="{\"value_piehr3\":[";

	while(rs.next()){
	if(i>0){
			valuePieHR3 += ",";
	}
		String typeName = rs.getString("typename");
		int expense = rs.getInt("expense");
	
		valuePieHR3 += "{\"category\": \"";
		valuePieHR3 += typeName;
		valuePieHR3 += "\",";
		valuePieHR3 += "\"value\": ";
		valuePieHR3 += expense;
		valuePieHR3 += "}";
		totalPieHR3 = totalPieHR3 + expense;
		i++;
}
valuePieHR3 += "]}";

//out.print(valuePieHR3);
out.print("[{\"totalPieHR3\":\""+totalPieHR3+"\"},"+valuePieHR3+"]");
%>