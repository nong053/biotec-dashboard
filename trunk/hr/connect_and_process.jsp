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

String center_th_shortname1="";
String shortname="";
//Integer i =1 ;

/*
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_center(2012,11);";
		rs = st.executeQuery(Query);

		center_th_shortname1+="[";
		while(rs.next()){
		//                           [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		center_th_shortname1+="{category:";
	
		center_th_shortname1+= "\""+rs.getString("center_th_shortname") +"\"";
		center_th_shortname1+= ",value:10";
		center_th_shortname1+="}";
		}else{
		center_th_shortname1+=",{category:";
	
		center_th_shortname1+= "\""+rs.getString("center_th_shortname") +"\"";
		center_th_shortname1+= ",value:10";
		center_th_shortname1+="}";
		}
		
	i++;
		}
		center_th_shortname1+="]";
		//out.println(center_name);
		out.print(center_th_shortname1);
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}*/

//sp_emp_by_employ_type
/*
String sp_emp_by_employ_type ="";

String ParamYear="2012";
String ParamMonth="11";
String ParamOrg="\"ศอ.\"";

try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_employ_type("+ParamYear+","+ParamMonth+","+ParamOrg+");";
		rs = st.executeQuery(Query);
		sp_emp_by_employ_type+="[";
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_emp_by_employ_type+="{category:";
	
		sp_emp_by_employ_type+= "\""+rs.getString("employ_type") +"\"";
		sp_emp_by_employ_type+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_employ_type+="}";
		}else{
		sp_emp_by_employ_type+=",{category:";
	
		sp_emp_by_employ_type+= "\""+rs.getString("employ_type") +"\"";
		sp_emp_by_employ_type+= ",value:"+rs.getString("total_employee");
		sp_emp_by_employ_type+="}";
		}
		
	i++;
		}
		sp_emp_by_employ_type+="]";
		//out.println(center_name);
		out.println(sp_emp_by_employ_type);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error</font>"+ex);
}

*/


//sp_emp_by_education_level_group
/*
String sp_emp_by_education_level_group ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_education_level_group(2012,11,\"ศจ.\");";
		rs = st.executeQuery(Query);
		sp_emp_by_education_level_group+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
	
		sp_emp_by_education_level_group+="{category:";
	
		sp_emp_by_education_level_group+= "\""+rs.getString("education_level_group") +"\"";
		sp_emp_by_education_level_group+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_education_level_group+="}";
		}else{
		sp_emp_by_education_level_group+=",{category:";
	
		sp_emp_by_education_level_group+= "\""+rs.getString("education_level_group") +"\"";
		sp_emp_by_education_level_group+= ",value:"+rs.getString("total_employee");
		sp_emp_by_education_level_group+="}";
		}
		
	i++;
		}
		sp_emp_by_education_level_group+="]";
		out.println("-------------------------------------------------------");
		out.println("sp_emp_by_education_level_group"+sp_emp_by_education_level_group);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_emp_by_education_level_group</font>"+ex);
}
*/


//############################  sp_emp_by_job_family  Start ############################ //
/*
String sp_emp_by_job_family ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_job_family(2012,11,\"ศจ.\");";
		rs = st.executeQuery(Query);
		sp_emp_by_job_family+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
	
		sp_emp_by_job_family+="{category:";
	
		sp_emp_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_emp_by_job_family+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_job_family+="}";
		}else{
		sp_emp_by_job_family+=",{category:";
	
		sp_emp_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_emp_by_job_family+= ",value:"+rs.getString("total_employee");
		sp_emp_by_job_family+="}";
		}
		
	i++;
		}
		sp_emp_by_job_family+="]";
		out.println("-------------------------------------------------------");
		out.println("sp_emp_by_job_family"+sp_emp_by_job_family);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_emp_by_job_family</font>"+ex);
}
*/
//############################  sp_emp_by_job_family  End ############################ //



//############################  sp_emp_by_function_type  Start ############################ //
/*
String sp_emp_by_function_type ="";
Integer sum_emp_by_function_type=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_function_type(2012,11,\"ศจ.\");";
		rs = st.executeQuery(Query);
		sp_emp_by_function_type+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sum_emp_by_function_type+=rs.getInt("total_employee") ;
		sp_emp_by_function_type+="{category:";
	
		sp_emp_by_function_type+= "\""+rs.getString("function_type") +"\"";
		sp_emp_by_function_type+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_function_type+="}";
		}else{
		sum_emp_by_function_type+=rs.getInt("total_employee") ;
		sp_emp_by_function_type+=",{category:";
		sp_emp_by_function_type+= "\""+rs.getString("function_type") +"\"";
		sp_emp_by_function_type+= ",value:"+rs.getString("total_employee");
		sp_emp_by_function_type+="}";
		}
		
	i++;
		}
		sp_emp_by_function_type+="]";
		out.println("-------------------------------------------------------");
		out.println("sp_emp_by_function_type"+sp_emp_by_function_type);
		out.println("sum_emp_by_function_type"+sum_emp_by_function_type);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_emp_by_function_type</font>"+ex);
}

//############################  sp_emp_by_function_type  End ############################ //

*/
//############################  sp_hr_expense  Start ############################ //
/*
String sp_hr_expense ="";
Integer sum_hr_expense=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_hr_expense(2012,11,\"สวทช\");";
		rs = st.executeQuery(Query);
		sp_hr_expense+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
	  
		sp_hr_expense+="{category:";
	
		sp_hr_expense+= "\""+rs.getString("hr_group_name") +"\"";
		sp_hr_expense+= ",value:"+rs.getString("total_employee") ;
		sum_hr_expense+=rs.getInt("total_employee");
		sp_hr_expense+="}";
		}else{
		sp_hr_expense+=",{category:";
	
		sp_hr_expense+= "\""+rs.getString("hr_group_name") +"\"";
		sp_hr_expense+= ",value:"+rs.getString("total_employee");
		sp_hr_expense+="}";
		sum_hr_expense+=rs.getInt("total_employee");
		}
		
	i++;
		}
		sp_hr_expense+="]";
		out.println("-------------------------------------------------------");
		out.println("sum_hr_expense"+sum_hr_expense);
		out.println("sp_hr_expense"+sp_hr_expense);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_hr_expense</font>"+ex);
}
*/
//############################  sp_hr_expense  End ############################ /

//############################  sp_npr_by_center  Start ############################ /

//############################  sp_npr_by_center  End ############################ /

%>
