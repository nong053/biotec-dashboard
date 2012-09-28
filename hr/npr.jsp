<%@page contentType="text/html" pageEncoding="utf-8"%>
<!--<meta http-equiv="Content-type" content="text/html; charset=utf-8">-->
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%@ include file="../config.jsp"%>
<%
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamOrg = "สวทช.";
//String ParamOrg = request.getParameter("ParamOrg");
String Param_sp_center = "";
String sub_ParamOrg = "";

//out.print("ParamMonth"+ParamMonth);
//out.print("ParamYear"+ParamYear);
//out.print("ParamOrg"+ParamOrg);

/*
-- biotec_dwh --
Type: MYSQL
Server: 10.226.202.114
database: biotec_dwh
user: root
pass: bioteccockpit
*/
// Jsp  Server-side

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
		sp_npr_by_center+="{category:";
		sp_npr_by_center+= "\""+rs.getString("npr_center") +"\"";
		sp_npr_by_center+= ",value:"+rs.getString("total") ;
		sum_npr_by_center+=rs.getInt("total");
		sp_npr_by_center+="}";
		}else{
		sp_npr_by_center+=",{category:";
		sp_npr_by_center+= "\""+rs.getString("npr_center") +"\"";
		sp_npr_by_center+= ",value:"+rs.getString("total");
		sp_npr_by_center+="}";
		sum_npr_by_center+=rs.getInt("total");
		}
	i++;
		}
		sp_npr_by_center+="]";
		//out.println("-------------------------------------------------------"+"<br>");
		//out.println("sum_npr_by_center"+sum_npr_by_center+"<br>");
		//out.println("sp_npr_by_center"+sp_npr_by_center+"<br>");
		//out.println("-------------------------------------------------------"+"<br>");
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_center</font>"+ex);
}

//############################pie  sp_npr_by_center  End ############################ /
//############################bar  sp_npr_by_center_drilldown  Start ############################ /

String categoryAxis_npr_center = "";
String[] categoryAxis_npr_center_array;
String categoryAxis_npr_center_using="";

String series_job_center = "";
String series_job_center_array = "";
String series_job_center_using = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_center_drilldown("+ParamYear+","+ParamMonth+",'"+ParamOrg+"')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_npr_center_using+="[";
		series_job_center+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_npr_center=rs.getString("npr_list");
				categoryAxis_npr_center_array=categoryAxis_npr_center.split(",");
				series_job_center+="{name:"+"\""+rs.getString("job_type")+"\","+"data:["+rs.getString("total_list")+"]}";
				for(int j=0; j< categoryAxis_npr_center_array.length; j++){
					if(j==0){
					categoryAxis_npr_center_using+="\""+categoryAxis_npr_center_array[j]+"\"";
					}else{
					categoryAxis_npr_center_using+=",\""+categoryAxis_npr_center_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_job_center+=",{name:"+"\""+rs.getString("job_type")+"\","+"data:["+rs.getString("total_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_npr_center_using+="]";
	series_job_center+="]";
	
	//Success fully Start
	//out.println("categoryAxis_npr_center_using"+categoryAxis_npr_center_using+"<br>");
	//out.println("series_job_center"+series_job_center+"<br>");
	//Success fully Stop


		//num row start
		rs.last();
		int c = rs.getRow();
		//out.println("num_row"+c);
		rs.beforeFirst();
		//num row end

		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_center_drilldown</font>"+ex);
}

//############################bar  sp_npr_by_center  End ############################ /
//############################  pie sp_npr_by_type  Start ######################### /

String sp_npr_by_type ="";
Integer sum_npr_by_type=0;

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_type("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
		rs = st.executeQuery(Query);
		sp_npr_by_type+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){

		sp_npr_by_type+="{category:";
		sp_npr_by_type+= "\""+rs.getString("npr_type") +"\"";
		sp_npr_by_type+= ",value:"+rs.getString("total") ;
		sum_npr_by_type+=rs.getInt("total");
		sp_npr_by_type+="}";

		}else{
		sp_npr_by_type+=",{category:";
		sp_npr_by_type+= "\""+rs.getString("npr_type") +"\"";
		sp_npr_by_type+= ",value:"+rs.getString("total");
		sp_npr_by_type+="}";
		sum_npr_by_type+=rs.getInt("total");
		}
		
	i++;
		}
		sp_npr_by_type+="]";
		//out.println("-------------------------------------------------------"+"<br>");
		//out.println("sum_npr_by_type"+sum_npr_by_type+"<br>");
		//out.println("sp_npr_by_type"+sp_npr_by_type+"<br>");
		//out.println("-------------------------------------------------------"+"<br>");
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_type</font>"+ex);
}

//############################ pie sp_npr_by_type  End ############################ /
//############################bar  sp_npr_by_type_drilldown  Start ############################ /

String categoryAxis_npr_type = "";
String[] categoryAxis_npr_type_array;
String categoryAxis_npr_type_using="";

String series_job_type = "";
String series_job_type_array = "";
String series_job_type_using = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_type_drilldown("+ParamYear+","+ParamMonth+",'"+ParamOrg+"','ALL')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_npr_type_using+="[";
		series_job_type+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_npr_type=rs.getString("npr_list");
				categoryAxis_npr_type_array=categoryAxis_npr_type.split(",");
				series_job_type+="{name:"+"\""+rs.getString("npr_country_group")+"\","+"data:["+rs.getString("total_list")+"]}";
				for(int j=0; j< categoryAxis_npr_type_array.length; j++){
					//out.println(categoryAxis_npr_type_array[j]+"<br>");
					if(j==0){
					categoryAxis_npr_type_using+="\""+categoryAxis_npr_type_array[j]+"\"";
					}else{
					categoryAxis_npr_type_using+=",\""+categoryAxis_npr_type_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_job_type+=",{name:"+"\""+rs.getString("npr_country_group")+"\","+"data:["+rs.getString("total_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_npr_type_using+="]";
	series_job_type+="]";
	
	//Success fully Start
	//out.println("categoryAxis_npr_type_using-----------2"+categoryAxis_npr_type_using+"<br>");
	//out.println("series_job_type-----------2"+series_job_type+"<br>");
	//Success fully Stop
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_type_drilldown</font>"+ex);
}

//############################bar  sp_npr_by_type_drilldown  End ############################ /

//############################ pie sp_npr_by_country_group  Start ######################### /

String sp_npr_by_country_group ="";
Integer sum_npr_by_country_group=0;
try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_country_group("+ParamYear+","+ParamMonth+",'"+ParamOrg+"');";
		rs = st.executeQuery(Query);
		sp_npr_by_country_group+="[";
		Integer i =1;
		while(rs.next()){
		//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
		if(i==1){
		sp_npr_by_country_group+="{category:";
		sp_npr_by_country_group+= "\""+rs.getString("npr_country_group") +"\"";
		sp_npr_by_country_group+= ",value:"+rs.getString("total") ;
		sum_npr_by_country_group+=rs.getInt("total");
		sp_npr_by_country_group+="}";

		}else{
		sp_npr_by_country_group+=",{category:";
		sp_npr_by_country_group+= "\""+rs.getString("npr_country_group") +"\"";
		sp_npr_by_country_group+= ",value:"+rs.getString("total");
		sp_npr_by_country_group+="}";
		sum_npr_by_country_group+=rs.getInt("total");
		}
		
	i++;
		}
		sp_npr_by_country_group+="]";
		//out.println("-------------------------------------------------------"+"<br>");
		//out.println("sum_npr_by_country_group"+sum_npr_by_country_group+"<br>");
		//out.println("sp_npr_by_country_group"+sp_npr_by_country_group+"<br>");
		//out.println("-------------------------------------------------------"+"<br>");
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_country_group</font>"+ex);
}

//############################pie  sp_npr_by_country_group  End ############################ /
//############################bar  sp_npr_by_country_group_drilldown  Start ############################ /

String categoryAxis_npr_country_group = "";
String[] categoryAxis_npr_country_group_array;
String categoryAxis_npr_country_group_using="";

String series_job_country_group = "";
String series_job_country_group_array = "";
String series_job_country_group_using = "";

try{
	//out.println("---------------------------------------------"+i);
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_npr_by_country_group_drilldown("+ParamYear+","+ParamMonth+",'"+ParamOrg+"','ALL')";
		rs = st.executeQuery(Query);
		Integer i=0;
		categoryAxis_npr_country_group_using+="[";
		series_job_country_group+="[";
		while(rs.next()){
			if(i==0){
				categoryAxis_npr_country_group=rs.getString("working_range_list");
				categoryAxis_npr_country_group_array=categoryAxis_npr_country_group.split(",");
				series_job_country_group+="{name:"+"\""+rs.getString("npr_status")+"\","+"data:["+rs.getString("total_list")+"]}";
				for(int j=0; j< categoryAxis_npr_country_group_array.length; j++){
					if(j==0){
					categoryAxis_npr_country_group_using+="\""+categoryAxis_npr_country_group_array[j]+"\"";
					}else{
					categoryAxis_npr_country_group_using+=",\""+categoryAxis_npr_country_group_array[j]+"\"";
					}//if
				}//for
			}else{//if
			series_job_country_group+=",{name:"+"\""+rs.getString("npr_status")+"\","+"data:["+rs.getString("total_list")+"]}";
			}
		i++;
		}//while
	categoryAxis_npr_country_group_using+="]";
	series_job_country_group+="]";
	
	//Success fully Start
	//out.println(categoryAxis_npr_country_group_using+"<br>");
	//out.println(series_job_country_group+"<br>");
	//Success fully Stop
		conn.close();
	}
}
catch(Exception ex){
out.println("<font color='red'>Error sp_npr_by_country_group_drilldown</font>"+ex);
}

//############################bar  sp_npr_by_country_group_drilldown  End ############################ /

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
width:313px;
height:550px;
float:left;
margin:2px;
border-radius:5px;
    /*background: url("images/ui-bg_highlight-hard_100_f2f5f7_1x100.png") repeat-x scroll 50% top #F2F5F7;*/
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
	background: url("images/ui-bg_highlight-soft_100_deedf7_1x100.png") repeat-x scroll  50% 50%  #DEEDF7;
    border: 1px solid #AED0EA;

}
.content  #row1 .box #head .title{
	padding:5px;
	text-align:center;
	
}
.content  #row1 .box #body{
width:auto;
height:200px;

}
.content #row2{
width:990px;
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

</style>
<script type="text/javascript">
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

$(document).ready(function(){
var ParamOrg = "สวทช.";
/*###  pie center start ###*/

var pieChartCenter= function(id_param,data_param,summ_param){

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
			},
			seriesClick:checkBarTypeCenter
	
			
		});
}


/*###  pie center end ###*/

/*###  pie type start ###*/

var pieChartByType= function(id_param,data_param,summ_param){

		$(id_param).kendoChart({
		 theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
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
			},
			seriesClick:checkBarTypeByType
	
			
		});
}


/*###  pie type end ###*/
/*###  pie country_group start ###*/

var pieChartByCountryGroup= function(id_param,data_param,summ_param){

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
			},
			seriesClick:checkBarTypeByCountryGroup
	
			
		});
}


/*###  pie country_group end ###*/

/*###  bar start ###*/
var barChart= function(id_param,categoryAxis_param,series_param,title_param){
//var categoryAxis_param = ["นักวิจัยร่วมวิจัย","นักวิจัยหลังปริญญาเอก","นักศึกษาร่วมวิจัย (โท/เอก)"];
	$(id_param).kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text:title_param
                        },
						chartArea:{
						width:290,
						height:210,
						background: ""
						},

						
                        legend: {
                            position: "bottom"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: true
                        },
                        series:series_param,
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}",
							   font:"10px Tahoma"
                            }
                        },
                        categoryAxis: {
                            categories:categoryAxis_param,
							labels:{
								font:"11px Tahoma"
								}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
                    });
}

var barChartCenter= function(id_param,categoryAxis_param,series_param,title_param){
//var categoryAxis_param = ["นักวิจัยร่วมวิจัย","นักวิจัยหลังปริญญาเอก","นักศึกษาร่วมวิจัย (โท/เอก)"];
	$(id_param).kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text:title_param
                        },
						chartArea:{
						width:290,
						height:210,
						background: ""
						},

						
                        legend: {
                            position: "bottom"
                        },
                        seriesDefaults: {
                            type: "bar",
							stack: true
                        },
                        series:series_param,
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}",
							   font:"10px Tahoma"
                            }
                        },
                        categoryAxis: {
                            categories:categoryAxis_param,
							labels:{
								font:"11px Tahoma"
								}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
                    });
}

/*###  bar end ###*/
/*
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamOrg = request.getParameter("ParamOrg");
pieChartByType("#pie_sp_npr_by_type",<%=sp_npr_by_type%>,<%=sum_npr_by_type%>);

*/
function checkBarTypeCenter(e){
		ParamOrg = e.category;
		//console.log(ParamOrg);
	// ==============================Pie 2 Change====================================
		$.ajax({
		url:'sp_npr_by_type.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg},
		success:function(data){
			//console.log(data);
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		$("#string_type_pie").empty();
		$("#string_type_pie").append(ParamOrg);
		pieChartByType("#pie_sp_npr_by_type",data[0]["category_pie"],data[1]["sum_pie"]);
		}
	});
	// ==============================Pie 3 Change====================================
		$.ajax({
		url:'sp_npr_by_country_group.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg},
		success:function(data){
		//	console.log(data);
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		$("#string_country_pie").empty();
		$("#string_country_pie").append(ParamOrg);
		pieChartByCountryGroup("#pie_sp_npr_by_country_group",data[0]["category_pie"],data[1]["sum_pie"]);
		}
	});

	// ============================= Bar  1  Change ==================== 
	$.ajax({
		url:'sp_npr_by_center_drilldown.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg},
		success:function(data){
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		barChartCenter("#bar_sp_npr_by_center_drilldown",data[0]["category"],data[1]["series"],ParamOrg);
		}
	});
//======================== Change Bar 2 ===================
$.ajax({
		url:'sp_npr_by_type_drilldown.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg,'ParamNprlist':"ALL"},
		success:function(data){
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		barChart("#bar_sp_npr_by_type_drilldown",data[0]["category"],data[1]["series"],"ทุกประเภท");
		}
	});
// =================================== Change Bar 3 ========================
	$.ajax({
		url:'sp_npr_by_country_group_drilldown.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg,'ParamWorkingRangelist':"ALL"},
		success:function(data){
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		barChart("#bar_sp_npr_by_country_group_drilldown",data[0]["category"],data[1]["series"],"ทุกสัญชาติ");
		}
	});


}//function

function checkBarTypeByType(e){
	$.ajax({
		url:'sp_npr_by_type_drilldown.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg,'ParamNprlist':e.category},
		success:function(data){
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		barChart("#bar_sp_npr_by_type_drilldown",data[0]["category"],data[1]["series"],e.category);
		}
	});
}
function checkBarTypeByCountryGroup(e){
	$.ajax({
		url:'sp_npr_by_country_group_drilldown.jsp',
		type:'get',
		dataType:'json',
		data:{'ParamMonth':<%=ParamMonth%>,'ParamYear':<%=ParamYear%>,'ParamOrg':ParamOrg,'ParamWorkingRangelist':e.category},
		success:function(data){
		//console.log(data[0]["category"]);
		//console.log(data[1]["series"]);
		//console.log(data);
		barChart("#bar_sp_npr_by_country_group_drilldown",data[0]["category"],data[1]["series"],e.category);
		}
	});
}

/* Using PieChart*/

//pie_sp_npr_by_center
pieChartCenter("#pie_sp_npr_by_center",<%=sp_npr_by_center%>,<%=sum_npr_by_center%>);
pieChartByType("#pie_sp_npr_by_type",<%=sp_npr_by_type%>,<%=sum_npr_by_type%>);
pieChartByCountryGroup("#pie_sp_npr_by_country_group",<%=sp_npr_by_country_group%>,<%=sum_npr_by_country_group%>);
/* Using PieChart*/
barChartCenter("#bar_sp_npr_by_center_drilldown", <%=categoryAxis_npr_center_using%>, <%=series_job_center%>,'สวทช.' )	;
barChart("#bar_sp_npr_by_type_drilldown", <%=categoryAxis_npr_type_using%>, <%=series_job_type%>,'ทุกประเภท');
barChart("#bar_sp_npr_by_country_group_drilldown", <%=categoryAxis_npr_country_group_using%>, <%=series_job_country_group%>,'ทุกสัญชาติ');
/* Using BarChart*/

/* Using BarChart*/


/*###  kendoui panalBar start  ###*/
$("#panelBar1").kendoPanelBar({
expandMode: "single",
animation: {
        // fade-out closing items over 1000 milliseconds
        close: {
            duration: 15000,
            effects: "fadeOut"
        },
       // fade-in and expand opening items over 500 milliseconds
       open: {
           duration: 5500,
           effects: "expandVertical fadeIn"
       }
	  }
});
$("#panelBar2").kendoPanelBar({
	expandMode:"single"
});

/*###  kendoui panalBar end  ###*/

/*###  kendoui barchart1 start  ###*/


/*###  kendoui barchart1 end  ###*/
	




//alert($("#panelBar2").length);

$("#panelBar2 .panel1").click(function(){


});
$("#panelBar2 .panel2").click(function(){


});
$("#panelBar2 .panel1").trigger("click");


/*### Config Tab Start ###*/


//$(".ui-tabs-panel").css({"padding":"0px"});


/* Tab2 Start*/

	

$("#tabHr1").tabs();
$("#tabHr1 ul li").css({"font-weight":"normal"});

$("a[href=#hrContent21]").trigger("click");

$("a[href=#hrContent21]").click(function(){

});

$("a[href=#hrContent22]").click(function(){

});




/*Tab2 End*/



/*### Config Tab End ###*/


});


//define function extenal jquery

//function templateFormat(value,summ) {
  // var value1 = Math.floor(value);
 //  var value2 = Math.floor((value/summ)*100);
  // return value1 + " , " + value2 + " %";
//}

function templateFormat(value,summ) {
   var value1 = addCommas(value.toFixed(2));
   var value2 = ((value/summ)*100).toFixed(2);
   return value1 + " , " + value2 + " %";
}


</script>
<div class="content">
	<div id="row1">
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วน NPR ตามศูนย์
							</div>
						</div>
						<div id="body">
									<table>
											<tr>
												<td>
												<font color="gray" size=3><center><%=ParamOrg%></center></font>
												<br>
												<div id="pie_sp_npr_by_center"></div>
												</td>
												
											</tr>
											<tr>
												<td><hr size=1 noshade color="gray">
												<div id="bar_sp_npr_by_center_drilldown"></div>
												</td>
											</tr>
									</table>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วน NPR ตามประเภท
							</div>
						</div>
						<div id="body">
								<table>
											<tr>
												<td align="center">
												<font color="gray" size=3><div id=string_type_pie><%out.print(ParamOrg);%></div></font>
												<br>
												<div id="pie_sp_npr_by_type"></div>
												</td>
												
											</tr>
												<td><hr size=1 noshade color="gray">
												<div id="bar_sp_npr_by_type_drilldown"></div>
												</td>
											<tr>

											</tr>
									</table>
						</div>
				</div>


				
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วน NPR ตามสัญชาติ
							</div>
						</div>
						<div id="body">
								<table>
											<tr>
												<td align="center">
													<font color="gray" size=3><div id=string_country_pie><%out.print(ParamOrg);%></div></font>
													<br>
													<div id="pie_sp_npr_by_country_group"></div>
												</td>
												
											</tr>
											<tr>
												<td><hr size=1 noshade color="gray">
												<div id="bar_sp_npr_by_country_group_drilldown"></div>
												</td>
											</tr>
									</table>
						</div>
				</div>
			
	</div>
</div>

<br style="clear:both">
