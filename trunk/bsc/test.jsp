<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>

<% 
String connectionURL="jdbc:mysql://localhost:3306/SNP_DWH";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
String Query1="";

String center_name="";
//Connection conn= null;
Connection conn= null;
Statement st;
ResultSet  rs;
Statement st1;
ResultSet  rs1;

Class.forName(Driver).newInstance();
conn = DriverManager.getConnection(connectionURL,User,Pass);

if(!conn.isClosed()){
out.println("Connenction is sucessfully");
}else{
out.println("Connection is false");
}

String url = "";
if(url.equals(""))
	out.println("Nothing");





st = conn.createStatement();
Query="select Parent from CashFlow limit 5";
rs = st.executeQuery(Query);
while(rs.next()){
out.print(rs.getString("Parent"));

st1 = conn.createStatement();
Query1="select ItemGroupName from CashFlow limit 2";
rs1 = st1.executeQuery(Query1);
while(rs1.next()){
	String ItemGroupName = rs1.getString("ItemGroupName");
out.print(ItemGroupName);

}

}


%>