<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="config.jsp"%>
<%
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamOrg = request.getParameter("ParamOrg");


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
		Query="CALL sp_ic_score_by_division("+ParamYear+","+ParamMonth+",'02')";
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

//############################bar  sp_top20_ic_score  End ############################ //
//############################ pie sp_ic_score_by_job_family  Start ######################### /
/*
String sp_ic_score_by_job_family ="";
Integer sum_sp_ic_score_by_job_family=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_ic_score_by_job_family(2012,10,'02','','');";
		rs = st.executeQuery(Query);
		sp_ic_score_by_job_family+="[";
		Integer i =1;

		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_ic_score_by_job_family+="{category:";
		sp_ic_score_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_ic_score_by_job_family+= ",value:"+rs.getString("IC_Score") ;
		sum_sp_ic_score_by_job_family+=rs.getInt("IC_Score");
		sp_ic_score_by_job_family+="}";
		}else{
		sp_ic_score_by_job_family+=",{category:";
		sp_ic_score_by_job_family+= "\""+rs.getString("job_family") +"\"";
		sp_ic_score_by_job_family+= ",value:"+rs.getString("IC_Score");
		sp_ic_score_by_job_family+="}";
		sum_sp_ic_score_by_job_family+=rs.getInt("IC_Score");
		}
	i++;
		}
		sp_ic_score_by_job_family+="]";
		out.println("-------------------------------------------------------"+"<br>");
		out.println("sum_sp_ic_score_by_job_family"+sum_sp_ic_score_by_job_family+"<br>");
		out.println("sp_ic_score_by_job_family"+sp_ic_score_by_job_family+"<br>");
		out.println("-------------------------------------------------------"+"<br>");
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_ic_score_by_job_family</font>"+ex);
}
*/
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
		Query="CALL sp_npr_by_center(2012,10);";
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
/*
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
		Query="CALL sp_ic_score_by_output_type(2012,11,'02','','')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_sp_ic_score_by_output_type_using+="[";
		series_sp_ic_score_by_output_type+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_sp_ic_score_by_output_type=rs.getString("output_list");
				categoryAxis_sp_ic_score_by_output_type_array=categoryAxis_sp_ic_score_by_output_type.split(",");
				series_sp_ic_score_by_output_type+="{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
				for(int j=0; j< categoryAxis_sp_ic_score_by_output_type_array.length; j++){
					if(j==0){
					categoryAxis_sp_ic_score_by_output_type_using+="\""+categoryAxis_sp_ic_score_by_output_type_array[j]+"\"";
					}else{
					categoryAxis_sp_ic_score_by_output_type_using+=",\""+categoryAxis_sp_ic_score_by_output_type_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_sp_ic_score_by_output_type+=",{\"name\":"+"\""+rs.getString("view_name")+"\","+"\"data\":["+rs.getString("val_list")+"]}";
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
*/
//############################bar  sp_ic_score_by_output_type  End ############################ //

//Success fully Start
		out.print("[{\"category_center\":"+categoryAxis_sp_ic_score_by_center_using+"},{\"series_center\":"+series_sp_ic_score_by_center+"},{\"category_division\":"+categoryAxis_sp_ic_score_by_division_using+"},{\"series_division\":"+series_sp_ic_score_by_division+"},{\"category_top20_ic_score\":"+categoryAxis_sp_top20_ic_score_using+"},{\"series_top20_ic_score\":"+series_sp_top20_ic_score+"},{\"pie_sp_ic_score\":"+sp_npr_by_center+"},{\"sum_pie_sp_ic_score\":"+sum_npr_by_center+"}]");//1

		//out.print("[{\"category\":"+categoryAxis_sp_ic_score_by_division_using+"},{\"series\":"+series_sp_ic_score_by_division+"}]");//2
		//out.print("[{\"category\":"+categoryAxis_sp_top20_ic_score_using+"},{\"series\":"+series_sp_top20_ic_score+"}]");//4
		//out.println("sum_npr_by_center"+sum_npr_by_center+"<br>");
		//out.println("{\"pie_sp_ic_score\":"+sp_npr_by_center+"},{\"sum_sp_ic_score\":"+sum_npr_by_center+"}");
		//out.print("[{\"category_by_output_type\":"+categoryAxis_sp_ic_score_by_output_type_using+"},{\"series_by_output_type\":"+series_sp_ic_score_by_output_type+"}]");
//Success fully Stop

%>
