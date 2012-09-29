<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<%
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamCenter = request.getParameter("ParamCenter");
String ParamDivision = request.getParameter("ParamDivision");



//############################bar  sp_ic_score_by_center  Start ############################ /

String categoryAxis_sp_ic_score_by_center = "";
String[] categoryAxis_sp_ic_score_by_center_array;
String categoryAxis_sp_ic_score_by_center_using="";

String series_sp_ic_score_by_center = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_center("+ParamYear+","+ParamMonth+")";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_ic_score_by_center_using+="[";
		series_sp_ic_score_by_center+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_ic_score_by_center=rs.getString("center_list");
				categoryAxis_sp_ic_score_by_center_array=categoryAxis_sp_ic_score_by_center.split(",");
				series_sp_ic_score_by_center+="{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
				for(int j=0; j< categoryAxis_sp_ic_score_by_center_array.length; j++){
					if(j==0){
					categoryAxis_sp_ic_score_by_center_using+="\""+categoryAxis_sp_ic_score_by_center_array[j]+"\"";
					}else{
					categoryAxis_sp_ic_score_by_center_using+=",\""+categoryAxis_sp_ic_score_by_center_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_ic_score_by_center+=",{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_ic_score_by_center_using+="]";
	series_sp_ic_score_by_center+="]";
	
	
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_center</font>"+ex);
}

//############################bar  sp_ic_score_by_center  End ############################ //


//############################bar  sp_ic_score_by_division  Start ############################ /

String categoryAxis_sp_ic_score_by_division = "";
String[] categoryAxis_sp_ic_score_by_division_array;
String categoryAxis_sp_ic_score_by_division_using="";
String series_sp_ic_score_by_division = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_division("+ParamYear+","+ParamMonth+",'"+ParamCenter+"')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_ic_score_by_division_using+="[";
		series_sp_ic_score_by_division+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_ic_score_by_division=rs.getString("division_list");
				categoryAxis_sp_ic_score_by_division_array=categoryAxis_sp_ic_score_by_division.split(",");
				series_sp_ic_score_by_division+="{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
				for(int j=0; j< categoryAxis_sp_ic_score_by_division_array.length; j++){
					if(j==0){
					categoryAxis_sp_ic_score_by_division_using+="\""+categoryAxis_sp_ic_score_by_division_array[j]+"\"";
					}else{
					categoryAxis_sp_ic_score_by_division_using+=",\""+categoryAxis_sp_ic_score_by_division_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_ic_score_by_division+=",{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_ic_score_by_division_using+="]";
	series_sp_ic_score_by_division+="]";
	
	
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_division</font>"+ex);
}

//############################bar  sp_ic_score_by_division  End ############################ //

//############################bar  sp_top20_ic_score  Start ############################ /
/*
String categoryAxis_sp_top20_ic_score = "";
String[] categoryAxis_sp_top20_ic_score_array;
String categoryAxis_sp_top20_ic_score_using="";

String series_sp_top20_ic_score = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_top20_ic_score("+ParamYear+","+ParamMonth+")";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_top20_ic_score_using+="[";
		series_sp_top20_ic_score+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_top20_ic_score=rs.getString("center_list");
				categoryAxis_sp_top20_ic_score_array=categoryAxis_sp_top20_ic_score.split(",");
				series_sp_top20_ic_score+="{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
				for(int j=0; j< categoryAxis_sp_top20_ic_score_array.length; j++){
					if(j==0){
					categoryAxis_sp_top20_ic_score_using+="\""+categoryAxis_sp_top20_ic_score_array[j]+"\"";
					}else{
					categoryAxis_sp_top20_ic_score_using+=",\""+categoryAxis_sp_top20_ic_score_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_top20_ic_score+=",{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_top20_ic_score_using+="]";
	series_sp_top20_ic_score+="]";
	
	
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_top20_ic_score</font>"+ex);
}
*/
//############################bar  sp_top20_ic_score  End ############################ //
//############################ pie sp_ic_score_by_job_family  Start ######################### /

String sp_ic_score_by_job_family ="";
Integer sum_sp_ic_score_by_job_family=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_job_family("+ParamYear+","+ParamMonth+",'"+ParamCenter+"','"+ParamDivision+"','')";
		rs = st.executeQuery(Query);
		sp_ic_score_by_job_family+="[";
		Integer i =1;

		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_ic_score_by_job_family+="{\"category\":";
		sp_ic_score_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_ic_score_by_job_family+= ",\"value\":"+rs.getString("IC_Score") ;
		sum_sp_ic_score_by_job_family+=rs.getInt("IC_Score");
		sp_ic_score_by_job_family+="}";
		}else{
		sp_ic_score_by_job_family+=",{\"category\":";
		sp_ic_score_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_ic_score_by_job_family+= ",\"value\":"+rs.getString("IC_Score");
		sp_ic_score_by_job_family+="}";
		sum_sp_ic_score_by_job_family+=rs.getInt("IC_Score");
		}
	i++;
		}
		sp_ic_score_by_job_family+="]";
		
		//out.println("sum_sp_ic_score_by_job_family"+sum_sp_ic_score_by_job_family+"<br>");
		//out.println("sp_ic_score_by_job_family"+sp_ic_score_by_job_family+"<br>");
	
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_job_family</font>"+ex);
}

//############################pie  sp_ic_score_by_job_family  End ############################ /
//############################ pie sp_npr_by_center  Start ######################### /
String sp_npr_by_center ="";
Integer sum_npr_by_center=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_center("+ParamYear+","+ParamMonth+");";
		rs = st.executeQuery(Query);
		sp_npr_by_center+="[";
		Integer i =1;

		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_npr_by_center+="{\"category\":";
		sp_npr_by_center+= "\""+rs.getString("npr_center") +"\"";
		sp_npr_by_center+= ",\"value\":"+rs.getString("total") ;
		sum_npr_by_center+=rs.getInt("total");
		sp_npr_by_center+="}";
		}else{
		sp_npr_by_center+=",{\"category\":";
		sp_npr_by_center+= "\""+rs.getString("npr_center") +"\"";
		sp_npr_by_center+= ",\"value\":"+rs.getString("total");
		sp_npr_by_center+="}";
		sum_npr_by_center+=rs.getInt("total");
		}
	i++;
		}
		sp_npr_by_center+="]";
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_center</font>"+ex);
}

//############################pie  sp_npr_by_center  End ############################ /

//############################bar  sp_ic_score_by_output_type  Start ############################ /

String categoryAxis_sp_ic_score_by_output_type = "";
String[] categoryAxis_sp_ic_score_by_output_type_array;
String categoryAxis_sp_ic_score_by_output_type_using="";

String series_sp_ic_score_by_output_type = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_output_type("+ParamYear+","+ParamMonth+",'"+ParamCenter+"','"+ParamDivision+"','')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_ic_score_by_output_type_using+="[";
		series_sp_ic_score_by_output_type+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_ic_score_by_output_type=rs.getString("group_list");
				categoryAxis_sp_ic_score_by_output_type_array=categoryAxis_sp_ic_score_by_output_type.split(",");
				series_sp_ic_score_by_output_type+="{\"name\":"+"\""+rs.getString("output")+"\","+"\"data\":["+rs.getString("value_list")+"]}";
				for(int j=0; j< categoryAxis_sp_ic_score_by_output_type_array.length; j++){
					if(j==0){
					categoryAxis_sp_ic_score_by_output_type_using+="\""+categoryAxis_sp_ic_score_by_output_type_array[j]+"\"";
					}else{
					categoryAxis_sp_ic_score_by_output_type_using+=",\""+categoryAxis_sp_ic_score_by_output_type_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_ic_score_by_output_type+=",{\"name\":"+"\""+rs.getString("output")+"\","+"\"data\":["+rs.getString("value_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_ic_score_by_output_type_using+="]";
	series_sp_ic_score_by_output_type+="]";
	
	conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_output_type</font>"+ex);
}

//############################bar  sp_ic_score_by_output_type  End ############################ //

//############################bar  sp_count_emp_all_vs_jf2000  Start ############################ /

String categoryAxis_sp_count_emp_all_vs_jf2000 = "";
String[] categoryAxis_sp_count_emp_all_vs_jf2000_array;
String categoryAxis_sp_count_emp_all_vs_jf2000_using="";

String series_sp_count_emp_all_vs_jf2000 = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_count_emp_all_vs_jf2000("+ParamYear+","+ParamMonth+",'"+ParamCenter+"','"+ParamDivision+"','')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_count_emp_all_vs_jf2000_using+="[";
		series_sp_count_emp_all_vs_jf2000+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_count_emp_all_vs_jf2000=rs.getString("name_list");
				categoryAxis_sp_count_emp_all_vs_jf2000_array=categoryAxis_sp_count_emp_all_vs_jf2000.split(",");
				series_sp_count_emp_all_vs_jf2000+="{\"name\":"+"\""+rs.getString("typename")+"\","+"\"data\":["+rs.getString("total_list")+"]}";
				for(int j=0; j< categoryAxis_sp_count_emp_all_vs_jf2000_array.length; j++){
					if(j==0){
					categoryAxis_sp_count_emp_all_vs_jf2000_using+="\""+categoryAxis_sp_count_emp_all_vs_jf2000_array[j]+"\"";
					}else{
					categoryAxis_sp_count_emp_all_vs_jf2000_using+=",\""+categoryAxis_sp_count_emp_all_vs_jf2000_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_count_emp_all_vs_jf2000+=",{\"name\":"+"\""+rs.getString("typename")+"\","+"\"data\":["+rs.getString("total_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_count_emp_all_vs_jf2000_using+="]";
	series_sp_count_emp_all_vs_jf2000+="]";
	
	conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_count_emp_all_vs_jf2000</font>"+ex);
}

//############################bar  sp_count_emp_all_vs_jf2000  End ############################ //
//############################bar  sp_count_emp_by_job_grade  Start ############################ /

String categoryAxis_sp_count_emp_by_job_grade = "";
String[] categoryAxis_sp_count_emp_by_job_grade_array;
String categoryAxis_sp_count_emp_by_job_grade_using="";

String series_sp_count_emp_by_job_grade = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_count_emp_by_job_grade("+ParamYear+","+ParamMonth+",'"+ParamCenter+"','"+ParamDivision+"','')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_count_emp_by_job_grade_using+="[";
		series_sp_count_emp_by_job_grade+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_count_emp_by_job_grade=rs.getString("Category");
				categoryAxis_sp_count_emp_by_job_grade_array=categoryAxis_sp_count_emp_by_job_grade.split(",");
				series_sp_count_emp_by_job_grade+="{\"name\":"+"\""+rs.getString("job_grade")+"\","+"\"data\":["+rs.getString("total")+"]}";
				for(int j=0; j< categoryAxis_sp_count_emp_by_job_grade_array.length; j++){
					if(j==0){
					categoryAxis_sp_count_emp_by_job_grade_using+="\""+categoryAxis_sp_count_emp_by_job_grade_array[j]+"\"";
					}else{
					categoryAxis_sp_count_emp_by_job_grade_using+=",\""+categoryAxis_sp_count_emp_by_job_grade_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_count_emp_by_job_grade+=",{\"name\":"+"\""+rs.getString("job_grade")+"\","+"\"data\":["+rs.getString("total")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_count_emp_by_job_grade_using+="]";
	series_sp_count_emp_by_job_grade+="]";
	
	conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_count_emp_by_job_grade</font>"+ex);
}

//############################bar  sp_count_emp_by_job_grade  End ############################ //

//############################bar  sp_ic_score_by_department  Start ############################ /
/**
String categoryAxis_sp_ic_score_by_department = "";
String[] categoryAxis_sp_ic_score_by_department_array;
String categoryAxis_sp_ic_score_by_department_using="";

String series_sp_ic_score_by_department = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_department("+ParamYear+","+ParamMonth+",'"+ParamCenter+"','"+ParamDivision+"')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_ic_score_by_department_using+="[";
		series_sp_ic_score_by_department+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_ic_score_by_department=rs.getString("department_list");
				categoryAxis_sp_ic_score_by_department_array=categoryAxis_sp_ic_score_by_department.split(",");
				series_sp_ic_score_by_department+="{\"name\":"+"\""+rs.getString("view_name")+"\",\"axis\":\""+rs.getString("axis")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
				for(int j=0; j< categoryAxis_sp_ic_score_by_department_array.length; j++){
					if(j==0){
					categoryAxis_sp_ic_score_by_department_using+="\""+categoryAxis_sp_ic_score_by_department_array[j]+"\"";
					}else{
					categoryAxis_sp_ic_score_by_department_using+=",\""+categoryAxis_sp_ic_score_by_department_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_ic_score_by_department+=",{\"name\":"+"\""+rs.getString("view_name")+"\",\"axis\":\""+rs.getString("axis")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_sp_ic_score_by_department_using+="]";
	series_sp_ic_score_by_department+="]";
	
	conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_department</font>"+ex);
}
**/
//############################bar  sp_ic_score_by_department  End ############################ //



//Success fully Start
		//out.print("[{\"category_center\":"+categoryAxis_sp_ic_score_by_center_using+"},{\"series_center\":"+series_sp_ic_score_by_center+"},{\"category_division\":"+categoryAxis_sp_ic_score_by_division_using+"},{\"series_division\":"+series_sp_ic_score_by_division+"},{\"pie_sp_ic_score\":"+sp_ic_score_by_job_family+"},{\"sum_pie_sp_ic_score\":"+sum_sp_ic_score_by_job_family+"},{\"category_by_output_type\":"+categoryAxis_sp_ic_score_by_output_type_using+"},{\"series_by_output_type\":"+series_sp_ic_score_by_output_type+"},{\"category_emp_all_vs_jf2000\":"+categoryAxis_sp_count_emp_all_vs_jf2000_using+"},{\"series_emp_all_vs_jf2000\":"+series_sp_count_emp_all_vs_jf2000+"},{\"category_emp_by_job_grade\":"+categoryAxis_sp_count_emp_by_job_grade_using+"},{\"series_emp_by_job_grade\":"+series_sp_count_emp_by_job_grade+"},{\"category_by_department\":"+categoryAxis_sp_ic_score_by_department_using+"},{\"series_by_department\":"+series_sp_ic_score_by_department+"}]");//1
		out.print("[{\"category_center\":"+categoryAxis_sp_ic_score_by_center_using+"},{\"series_center\":"+series_sp_ic_score_by_center+"},{\"category_division\":"+categoryAxis_sp_ic_score_by_division_using+"},{\"series_division\":"+series_sp_ic_score_by_division+"},{\"pie_sp_ic_score\":"+sp_ic_score_by_job_family+"},{\"sum_pie_sp_ic_score\":"+sum_sp_ic_score_by_job_family+"},{\"category_by_output_type\":"+categoryAxis_sp_ic_score_by_output_type_using+"},{\"series_by_output_type\":"+series_sp_ic_score_by_output_type+"},{\"category_emp_all_vs_jf2000\":"+categoryAxis_sp_count_emp_all_vs_jf2000_using+"},{\"series_emp_all_vs_jf2000\":"+series_sp_count_emp_all_vs_jf2000+"},{\"category_emp_by_job_grade\":"+categoryAxis_sp_count_emp_by_job_grade_using+"},{\"series_emp_by_job_grade\":"+series_sp_count_emp_by_job_grade+"}]");//1
		
		//out.print("[{\"category\":"+categoryAxis_sp_ic_score_by_center_using+"},{\"series\":"+series_sp_ic_score_by_center+"}]");//1
		//out.print("[{\"category_division\":"+categoryAxis_sp_ic_score_by_division_using+"},{\"series_division\":"+series_sp_ic_score_by_division+"}]");//2
		//out.print("[{\"category\":"+categoryAxis_sp_top20_ic_score_using+"},{\"series\":"+series_sp_top20_ic_score+"}]");//4
		//out.println("sum_npr_by_center"+sum_npr_by_center+"<br>");
		//out.println("{\"pie_sp_ic_score\":"+sp_npr_by_center+"},{\"sum_sp_ic_score\":"+sum_npr_by_center+"}");
		//out.print("[{\"category_by_output_type\":"+categoryAxis_sp_ic_score_by_output_type_using+"},{\"series_by_output_type\":"+series_sp_ic_score_by_output_type+"}]");
		//out.print("[{\"category_emp_all_vs_jf2000\":"+categoryAxis_sp_count_emp_all_vs_jf2000_using+"},{\"series_emp_all_vs_jf2000\":"+series_sp_count_emp_all_vs_jf2000+"}]");
		//out.print("[{\"category_emp_by_job_grade\":"+categoryAxis_sp_count_emp_by_job_grade_using+"},{\"series_emp_by_job_grade\":"+series_sp_count_emp_by_job_grade+"}]");

		//out.print("[{\"category_by_department\":"+categoryAxis_sp_ic_score_by_department_using+"},{\"series_by_department\":"+series_sp_ic_score_by_department+"}]");
//Success fully Stop
//sp_ic_score_by_department

%>
