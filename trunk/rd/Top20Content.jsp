<%@ page contentType="text/html; charset=TIS-620" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" language="java" %>
<%@ page language="java" import="net.sf.json.JSONArray" %>
<%@ page language="java" import="org.json.JSONObject" %>
<%@ page language="java" import="com.google.gson.Gson" %>
<% 
java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;

int year = 2012;
int month = 2;

// Remember to change the next line with your own environment 
String url="jdbc:mysql://localhost/biotec_dwh";
String id= "root";
String pass = "gj1";
try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
con = java.sql.DriverManager.getConnection(url, id, pass);


}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}


//ArrayList
ArrayList IC_Score = new ArrayList();
ArrayList BSC_Score = new ArrayList();
ArrayList Emp_Score = new ArrayList();

// json
JSONObject jsonObject = new JSONObject();
JSONArray arrayObj=new JSONArray();

///gson
String[] types = {"street_number","2","1"};
Hashtable address_components = new Hashtable();
address_components.put("long_name", 1600);
address_components.put("short_name", 1600);
address_components.put("types", types);
Hashtable results = new Hashtable();
results.put("address_components", address_components);

// use
ArrayList category = new ArrayList();
category.add("IC_Score");
category.add("BSC_Score");
category.add("Emp_Score");
Hashtable serie1 = new Hashtable(); // have Name,Data
Hashtable serie2 = new Hashtable(); // have Name,Data
Hashtable serie3 = new Hashtable(); // have Name,Data
ArrayList series = new ArrayList();  // list of serie
Hashtable main = new Hashtable();
ArrayList ret = new ArrayList();


// Make sure you have the Gson JAR in your classpath
String sql = "call sp_top20_ic_score_2("+year+","+month+")";
//String sql = "select 1 as IC_Score,2 as BSC_Score,3 as Emp_Score union select 2 as IC_Score,5 as BSC_Score,6 as Emp_Score";


try{
s = con.createStatement();
rs = s.executeQuery(sql);
	while( rs.next() ){
		IC_Score.add(rs.getString("IC_Score"));	
		BSC_Score.add(rs.getString("BSC_Score"));	
		Emp_Score.add(rs.getString("Emp_Score"));
	}	
	serie1.put("Name","IC_Score");
	serie1.put("Data",IC_Score.toString());
	series.add(serie1);
	serie2.put("Name","BSC_Score");
	serie2.put("Data",BSC_Score.toString());
	series.add(serie2);
	serie3.put("Name","Emp_Score");
	serie3.put("Data",Emp_Score.toString());
	series.add(serie3);
	main.put("category",category.toString());
	main.put("series",series);
	ret.add(main);
}
catch(Exception e){out.println(e);
}
finally{
/*if(!con.isClosed()){
con.close();
}
*/
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

// echo json data
// (place it in the tomcat/classes directory)
Gson gson = new Gson();
String json = gson.toJson(ret);  
out.print(json);

%>

