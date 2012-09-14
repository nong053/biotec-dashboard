<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<%@ include file="npr-2.jsp"%>-->
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>

<% 
String abc="tesssssssssssssssssst";
String connectionURL="jdbc:mysql://localhost:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
String center_name="";
//Connection conn= null;
Connection conn= null;
Statement st;
ResultSet  rs;

Class.forName(Driver).newInstance();
conn = DriverManager.getConnection(connectionURL,User,Pass);
if(!conn.isClosed()){
out.println("Connenction is sucessfully");
}else{
out.println("Connection is false");
}
/*
st =conn.createStatement();
Query="";
rs = st.executeQuery(Query);
*/
%>
<script>

function functiontest(arg1){
	alert(arg1);
}
nong="[\"นักวิจัยร่วมวิจัย\",\"นักวิจัยหลังปริญญาเอก\",\"นักศึกษาร่วมวิจัย (โท/เอก)\"]";
functiontest(nong);
</script>



































