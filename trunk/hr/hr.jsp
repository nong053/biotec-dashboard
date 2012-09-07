<%@page contentType="text/html" pageEncoding="utf-8"%>
<!--<meta http-equiv="Content-type" content="text/html; charset=utf-8">-->
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamOrg = request.getParameter("ParamOrg");
String Param_sp_center = "";
/*
out.print("ParamMonth"+ParamMonth);
out.print("ParamYear"+ParamYear);
out.print("ParamOrg"+ParamOrg);
*/
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

String sp_emp_by_center="";

String sum_total_employee="";
String shortname="";

try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_center("+ParamYear+","+ParamMonth+");";
		rs = st.executeQuery(Query);
		Integer i =1 ;
		sp_emp_by_center+="[";
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_emp_by_center+="{category:";
	
		sp_emp_by_center+= "\""+rs.getString("center_th_shortname") +"\"";
		sp_emp_by_center+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_center+="}";
		}else{
		sp_emp_by_center+=",{category:";
	
		sp_emp_by_center+= "\""+rs.getString("center_th_shortname") +"\"";
		sp_emp_by_center+= ",value:"+rs.getString("total_employee");
		sum_total_employee+=rs.getString("total_employee");
		sp_emp_by_center+="}";
		}
		
	i++;
		}
		sp_emp_by_center+="]";
		//out.println(center_name);
		out.println("sp_emp_by_center"+sp_emp_by_center);
		
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}


//sp_emp_by_employ_type
String sp_emp_by_employ_type ="";
Integer j =1;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_employ_type("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
		

		//Query="CALL sp_emp_by_employ_type(2012,11,'ศจ.');";
		rs = st.executeQuery(Query);
		sp_emp_by_employ_type+="[";
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		
		if(j==1){
	
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
		
	j++;
		}
		sp_emp_by_employ_type+="]";
		//out.println(center_name);
		out.println("sp_emp_by_employ_type"+sp_emp_by_employ_type);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error</font>"+ex);
}



//sp_emp_by_education_level_group
String sp_emp_by_education_level_group ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_education_level_group("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
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


//############################  sp_emp_by_job_family  Start ############################ //
String sp_emp_by_job_family ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_job_family("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
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
//############################  sp_emp_by_job_family  End ############################ //


//############################  sp_emp_by_function_type  Start ############################ //

String sp_emp_by_function_type ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_function_type("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
		rs = st.executeQuery(Query);
		sp_emp_by_function_type+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
	
		sp_emp_by_function_type+="{category:";
	
		sp_emp_by_function_type+= "\""+rs.getString("function_type") +"\"";
		sp_emp_by_function_type+= ",value:"+rs.getString("total_employee") ;
		sp_emp_by_function_type+="}";
		}else{
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
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_emp_by_function_type</font>"+ex);
}

//############################  sp_emp_by_function_type  End ############################ //

//############################  sp_hr_expense  Start ############################ //

String sp_hr_expense ="";
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_hr_expense("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
		rs = st.executeQuery(Query);
		sp_hr_expense+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
	
		sp_hr_expense+="{category:";
	
		sp_hr_expense+= "\""+rs.getString("hr_group_name") +"\"";
		sp_hr_expense+= ",value:"+rs.getString("total_employee") ;
		sp_hr_expense+="}";
		}else{
		sp_hr_expense+=",{category:";
	
		sp_hr_expense+= "\""+rs.getString("hr_group_name") +"\"";
		sp_hr_expense+= ",value:"+rs.getString("total_employee");
		sp_hr_expense+="}";
		}
		
	i++;
		}
		sp_hr_expense+="]";
		out.println("-------------------------------------------------------");
		out.println("sp_hr_expense"+sp_hr_expense);
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_hr_expense</font>"+ex);
}

//############################  sp_hr_expense  End ############################ //

%>

<style>
.content{
width:960px;
height:auto;
/*background:red;*/
margin:auto;
}
.content  #row1{
width:960px;
height:auto
background:blue;
clear:both;


}
.content  #row1 .box{
width:314px;
height:270px;
float:left;
margin:2px;

border-radius:5px;
   /* background: url("images/ui-bg_highlight-hard_100_f2f5f7_1x100.png") repeat-x scroll 50% top #ffffff;*/
    border: 1px solid #DDDDDD;
    color: #362B36;
}
.content  #row1 .box #head{
/*width:auto;
height:30px ;
background:#99ccff;
*/
   /*background: none repeat scroll 0 0 #DEEDF7;*/
    border-radius: 5px 5px 5px 5px;
    color: #2779AA;
    height: 26px;
    margin: 3px;
    padding: 5px;
    width: auto;
	background:url("images/ui-bg_highlight-soft_100_deedf7_1x100.png") repeat-x scroll  50% 50%  #DEEDF7;
    border: 1px solid #AED0EA;

}
.content  #row1 .box #head .title{
	padding:5px;
	text-align:center;
	
}
.content  #row1 .box #body{
width:auto;
height:250px;

}
.content #row2{
width:1000px;
height:300px;

clear:both;


}


.content #row2 #boxL{
width:630px;
height:300px;
border:1 solid blue;

float:left;
}
.content #row2 #boxL #box{
width:308px;
height:300px;
float:left;
margin:2px;
border-radius:5px;
border:1px solid #cccccc;
}
.content #row2 #boxL #box #head{
width:auto;
height:30px ;
background:#cccccc;

}
.content #row2 #boxL #box  #head #title{
	padding:5px;
	text-align:center;
}



.content #row2 #boxL #box  #body{
width:auto;
height:270px;

}


.content #row2 #boxR{

width:630px;
height:300px;
border:1 solid blue;
float:left;

}
.content #row2 #boxR #box{
height:300px;
float:left;
margin:2px;
width:630px;
border-radius:5px;
border:1px solid #cccccc;
background:#EBEBEB;

}
.content #row2 #boxR #box #head{
width:auto;
height:30px ;
background:#cccccc;
}
.content #row2 #boxR #box #head #title{
	padding:5px;
	text-align:center;
}
.content #row2 #boxR  #box #body{
width:auto;
height:310px;
background:#ffffff;

}
#tabHr1{
height:250px;
}
#pie1{
 top: -10px;
  left: -20px;
}
#pie11{
 top: -10px;
  left: -20px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
/*###  pie start ###*/

var pieChart= function(id_param,data_param,summ_param){

		$(id_param).kendoChart({
		 theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text:""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",
                            data:data_param
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
							template:"#= templateFormat(value,"+summ_param+")#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%",
					
				}
			}
	
			
		});
}


/*###  pie end ###*/

/* Using PieChart*/

pieChart("#pie_emp_by_center",<%=sp_emp_by_center%>,900);
pieChart("#pie_emp_by_employ_type",<%=sp_emp_by_employ_type%>,900);
pieChart("#pie_emp_by_education_level_group",<%=sp_emp_by_education_level_group%>,900);
pieChart("#pie_emp_by_job_family",<%=sp_emp_by_job_family%>,900);
pieChart("#pie_emp_by_function_type",<%=sp_emp_by_function_type%>,900);
pieChart("#pie_hr_expense",<%=sp_hr_expense%>,900);


/* Using PieChart*/





/* Tab2 Start*/

	



$("#tabHr1.ui-tabs-panel ").css({"padding":"0px"});
$("#tabHr1.ui-widget-content").css({"border":"0px"});


/*Tab2 End*/
/*### Config Tab End ###*/
});

//define function extenal jquery
function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}


</script>
<div class="content">
	<div id="row1">

				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานแยกตามศูนย์
							</div>
						</div>
						<div id="body">
									<div id="pie_emp_by_center"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_employ_type"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามระดับการศึกษา
							</div>
						</div>
						<div id="body">
							<div id="pie_emp_by_education_level_group"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามกลุ่มตำแหน่ง
								</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_job_family"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามหน้าที่
								</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_function_type"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนค่าใช้จ่ายบุคลากร
								</div>
						</div>
						<div id="body">
								<div id="pie_hr_expense"></div>
						</div>
				</div>
	</div>
	
</div>

</ul>
<br style="clear:both">

