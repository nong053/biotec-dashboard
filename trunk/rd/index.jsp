<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%@ include file="../config.jsp"%>

<html>
    <head>
        <title>R&D Dashboard</title>
		<link href="rd.css" rel ="stylesheet" type="text/css">
		<link href="../styles/kendo.common.min.css" rel="stylesheet">
		<link href="../styles/kendo.default.min.css" rel="stylesheet">
		<!--<link href="../jqueryUI/css/smoothness/jquery-ui-1.8.20.custom.css" rel="stylesheet">-->
		<link href="../jqueryUI/css/cupertino/jquery-ui-1.8.21.custom.css" rel="stylesheet">
		 <link href="../styles/kendo.dataviz.min.css" rel="stylesheet">
		


        <script src="../js/jquery.min.js"></script>
		<script src="../js/kendo.all.min.js"></script>
		  <script src="../js/kendo.dataviz.min.js"></script>
		<!--<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.20.custom.min.js"></script>-->
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!--	<script src="../js/console.js"></script>-->
	
	  
		
		<style type="text/css">
			html,
			body {
				background-color: white;
				color:black;
				margin:0px;
				padding:0px;
				font-size:12px;
				font:Tahoma;
			}

			#Detail-Panel {
				position:absolute;
				top:80px;
				left:0px;
				border-radius: 5px;
				border: 1px solid #dedede;
			}
			#loading{
			display:none;
			color:black;
			width:50px;
			height:50px;
			background-image:url("images/loading.gif");
			position:absolute ;
			position:center;
			z-index:5;
			
			
			}
			.inlinesparkline{
			width:100px;
			height:100px;
			}
			#contentMain{
			display:none;
			}
		</style>
		<style scoped>
				#Main-Panel{
					/*border: 1px solid #dedede;*/
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					padding:2px;
					margin:1px;
					width: 970px;
					position: relative;
					background:#008EC3 ;
					color:white;
					font-weight:bold;
				}
			</style>


	<%
	

		/*------------------- Set Variable -------------------*/

		String ParamYear = "";
		String ParamMonth = "";
		String ParamOrg = "";

		String V_Year = ""; // Values of Parameter Organization
		String V_Month = ""; // Values of Parameter Sales Region
		String V_Org = ""; // Values of Parameter Branch

//###############Query Handler Organization start  ####################
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
	//insert code allow function start
	st = conn.createStatement();
		Query="CALL sp_center();";
		rs = st.executeQuery(Query);
		 
		while(rs.next()){
		//out.println(rs.getString("center_name"));
		V_Org+="<option value="+rs.getString("center_name")+">"+rs.getString("center_name")+"</option>";
		}
	//insert code allow function end
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
//############### Query Handler Organization end ###############
		ResultSet rs1;
		Statement st1;
		int i=0;
		String Query1 ="";

//############### Query Handler Year start ###############
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
	//insert code allow function start
	st = conn.createStatement();
		Query="CALL sp_fiscal_year();";
		rs = st.executeQuery(Query);
		
		while(rs.next()){
			Query1  = "SELECT Date_format(SYSDATE(),'%Y') as year_date;";
			st1 = conn.createStatement();
			rs1 = st1.executeQuery(Query1);
			i = 0;
			while(rs1.next()){
				String present_year = rs1.getString("year_date");
				String query_year = rs.getString("fiscal_year");
				if(query_year.equals(present_year)){
					V_Year += "<option value=\""+rs.getString("fiscal_year")+"\"  selected='selected'>"+rs.getString("buddhist_era_year")+"</option>";
				}
				else{
					V_Year += "<option value=\""+rs.getString("fiscal_year")+"\">"+rs.getString("buddhist_era_year")+"</option>";
				}
			}
			i++;
		}
	//insert code allow function end
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
//############### Query Handler Year end ###############


//############### Query Handler Month start ###############
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
	//insert code allow function start
	st = conn.createStatement();
		Query="CALL sp_fiscal_month();";
		rs = st.executeQuery(Query);
		
		while(rs.next()){
			 Query1  = "SELECT Date_format(SYSDATE(),'%m') as month_date;";
			st1 = conn.createStatement();
			rs1 = st1.executeQuery(Query1);
			while(rs1.next()){
				int presentMonth = rs1.getInt("month_date");
				presentMonth = presentMonth +3 ;
				if(presentMonth>12){
					presentMonth=presentMonth-12;
				}
				String query_month = rs.getString("fiscal_month_no");
				String presentMonthStr = presentMonth+"";
				if(query_month.equals(presentMonthStr)){
					V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\"  selected='selected'>"+rs.getString("calendar_th_month_name")+"</option>";	
				}else{
					V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\">"+rs.getString("calendar_th_month_name")+"</option>";	
				}
			}
			i++;
		}
		//insert code allow function end
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
//############### Query Handler Month end ###############

		/*------------------- End Set Variable -------------------*/

		/*------------------- Parameter Year -------------------*/
/*
		V_Year += "<option value=\"2012\" selected='selected'>2555</option>";
		V_Year += "<option value=\"2011\" >2554</option>";
		V_Year += "<option value=\"2010\">2553</option>";
		V_Year += "<option value=\"2009\">2552</option>";
	*/	
		/*------------------- End Parameter Year -------------------*/

		/*------------------- Parameter Month -------------------*/
/*
		
		V_Month += "<option value=\"10\" selected='selected' >ตุลาคม </option>";
		V_Month += "<option value=\"11\">พฤศจิกายน </option>";
		V_Month += "<option value=\"12\">ธันวาคม</option>";
		V_Month += "<option value=\"1\">มกราคม </option>";
		V_Month += "<option value=\"2\">กุมภาพันธ์ </option>";
		V_Month += "<option value=\"3\">มีนาคม </option>";
		V_Month += "<option value=\"4\">เมษายน </option>";
		V_Month += "<option value=\"5\">พฤษภาคม </option>";
		V_Month += "<option value=\"6\">มิถุนายน </option>";
		V_Month += "<option value=\"7\">กรกฎาคม </option>";
		V_Month += "<option value=\"8\">สิงหาคม </option>";
		V_Month += "<option value=\"9\">กันยายน </option>";
*/
		/*------------------- End Parameter Month -------------------*/

		/*------------------- Organization Parameter -------------------*/
/*

		V_Org +="<option value=\"NSTDA\">สก.</option>";
		V_Org +="<option value=\"BIOTEC\">ศช. </option>";
		V_Org +="<option value=\"MTEC\">ศว.</option>";
		V_Org +="<option value=\"NECTEC\">ศจ.</option>";
		V_Org +="<option value=\"NANOTEC\">ศน.</option>";

*/
		/*------------------- End Organization Parameter -------------------*/

	%>

	<script type="text/javascript">
			   /*#### Tab search above top start ###*/
	$(document).ready(function(){
		/*#### Loading Start ###*/
		var $width=($('body').width()/2)-50;
		//console.log($width);

		$("#loading").css({"top":"250px","left":$width+"px"}).ajaxStart(function(){
		$(this).show();
		}).ajaxStop(function(){
		$(this).hide();
		});
		/*#### Loading End ###*/

	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
	

	/*### jQuery Funtions Start ###*/
	$("#form_1").submit(function(){
		// Format
		/*
			series: [{
							name:"IC Score",
							data:[1261,488,484,445,442,372,355,314,309,269,262,244,242,231,228,216,211,176,170,161]
							},{
							name:"BSC",
							data:[1261,488,1261,445,442,1261,355,314,1309,269,262,1261,242,231,228,1261,211,176,1261,161]
							},{
							name:"EMPLOYEE(JF2000)",
							data:[1261,488,1484,1445,1442,1372,1355,314,1309,169,262,1244,1242,231,1228,1216,1211,1176,170,1161]
							}],

			 categories: ["NANOTEC-NLAB","BIOTEC-BTU","MTEC-PRU","NECTEC-IDSRU","NECTEC-INIRU","NECTEC-TMEC","MTEC-MCRU","NECTEC-WISRU","BIOTEC-AGU","BIOTEC-GEI","MTEC-CARU","MTC-MRRU","NECTEC-ICCRU","MTTEC-CERRU","BIOTEC-JRU","MTEC-ENVRU","NECTEC-AAERU","BIOTEC-MMU","MTEC-BMERU","MTEC-DERU"],
						
			*/
			$.ajax({
				url:'Top20Content.jsp',
				type:'get',
				dataType:'json',
				data:{'year':$("#ParamYear").val(), 'month':$("#ParamMonth").val()},
				success:function(data){
					
				//var objson=	eval("("+data+")");
				//console.log(objson);
				//baChart_sp_top20_ic_score(data[4]["category_top20_ic_score"],data[5]["series_top20_ic_score"]);
		
					$category =eval("("+data[0]['category']+")");

					baChart_sp_top20_ic_score($category,data[0]['series']);
				
				}
			});
	
			$.ajax({
			url:'DefaultContent.jsp',
			type:'get',
			dataType:'json',
			data:{"ParamMonth":$("#ParamMonth").val(),"ParamYear":$("#ParamYear").val()},
			success:function(data){
				$(".domParam").remove();
				$("body").append("<input type='hidden' name='domParamCenter' class='domParam' id='domParamCenter' value='BIOTEC'>");
				$("body").append("<input type='hidden' name='domParamMonth' class='domParam' id='domParamMonth' value='"+$("#ParamMonth").val()+"'>");
				$("body").append("<input type='hidden' name='domParamYear' class='domParam' id='domParamYear' value='"+$("#ParamYear").val()+"'>");


				//console.log(data);
				//$("#contentMain").empty();
/*				
				console.log(data[0]["category_center"]);
				console.log(data[1]["series_center"]);

				console.log(data[2]["category_division"]);
				console.log(data[3]["series_division"]);

				//console.log(data[4]["category_top20_ic_score"]);
				//console.log(data[5]["series_top20_ic_score"]);

				console.log(data[4]["pie_sp_ic_score"]);
				console.log(data[5]["sum_pie_sp_ic_score"]);
				
				console.log(data[6]["category_by_output_type"]);
				console.log(data[7]["series_by_output_type"]);

				console.log(data[8]["category_emp_all_vs_jf2000"]);
				console.log(data[9]["series_emp_all_vs_jf2000"]);
				
				console.log(data[10]["category_emp_by_job_grade"]);
				console.log(data[11]["series_emp_by_job_grade"]);
*/
				$("#divisionName").text($("#domParamCenter").val());
				var Year = parseInt($("#domParamYear").val());
				Year=Year+543;
				$("#ic_score_open").attr({"href":"https://app2.biotec.or.th/dw/icscore_02_open.asp?t=out&emp_out="+$("#domParamCenter").val()+",,&bgy="+Year+""});

				baChart_sp_ic_score_by_department('','');
				baChart_sp_ic_score_by_center(data[1]["series_center"],data[0]["category_center"]);
				baChart_sp_ic_score_by_division(data[2]["category_division"],data[3]["series_division"]);
				//baChart_sp_top20_ic_score(data[4]["category_top20_ic_score"],data[5]["series_top20_ic_score"]);
				pieChart_sp_ic_score_by_job_family(data[4]["pie_sp_ic_score"],data[5]["sum_pie_sp_ic_score"]);
				stackChart_sp_count_emp_all_vs_jf2000(data[8]["category_emp_all_vs_jf2000"],data[9]["series_emp_all_vs_jf2000"]);//1
				stackChart_sp_count_emp_by_job_grade(data[10]["category_emp_by_job_grade"],data[11]["series_emp_by_job_grade"]);//2
				stackChart_sp_ic_score_by_output_type(data[6]["category_by_output_type"],data[7]["series_by_output_type"]);//3
				$("#contentMain").show();
			}
			
			});
			return false;
	});
	//$("#submit1").trigger("click");
	/*### jQuery Funtions End ###*/

	/*###  baChart_sp_ic_score_by_center  start ###*/
function  checkBarTypeCenter(e){
	$("#domParamCenter").remove();
	$("#departmentName").empty();
	$("#departmentName").append("(Lab)");
	$("body").append("<input type='hidden' name='domParamCenter' class='domParam' id='domParamCenter' value='"+e.category+"'>");
	
	$.ajax({
			url:'CenterContent.jsp',
			type:'get',
			dataType:'json',
			data:{"ParamMonth":$("#domParamMonth").val(),"ParamYear":$("#domParamYear").val(),"ParamCenter":e.category},
			success:function(data){
				/*
				console.log(data[0]["category_center"]);
				console.log(data[1]["series_center"]);

				console.log(data[2]["category_division"]);
				console.log(data[3]["series_division"]);

				//console.log(data[4]["category_top20_ic_score"]);
				//console.log(data[5]["series_top20_ic_score"]);

				console.log(data[4]["pie_sp_ic_score"]);
				console.log(data[5]["sum_pie_sp_ic_score"]);
				
				console.log(data[6]["category_by_output_type"]);
				console.log(data[7]["series_by_output_type"]);

				console.log(data[8]["category_emp_all_vs_jf2000"]);
				console.log(data[9]["series_emp_all_vs_jf2000"]);
				
				console.log(data[10]["category_emp_by_job_grade"]);
				console.log(data[11]["series_emp_by_job_grade"]);
*/
				$("#divisionName").text($("#domParamCenter").val());
				var Year = parseInt($("#domParamYear").val());
				Year=Year+543;
				$("#ic_score_open").attr({"href":"https://app2.biotec.or.th/dw/icscore_02_open.asp?t=out&emp_out="+$("#domParamCenter").val()+",,&bgy="+Year+""});

				baChart_sp_ic_score_by_department('','');
				baChart_sp_ic_score_by_division(data[2]["category_division"],data[3]["series_division"]);
				pieChart_sp_ic_score_by_job_family(data[4]["pie_sp_ic_score"],data[5]["sum_pie_sp_ic_score"]);
				stackChart_sp_ic_score_by_output_type(data[6]["category_by_output_type"],data[7]["series_by_output_type"]);
				stackChart_sp_count_emp_all_vs_jf2000(data[8]["category_emp_all_vs_jf2000"],data[9]["series_emp_all_vs_jf2000"]);
				stackChart_sp_count_emp_by_job_grade(data[10]["category_emp_by_job_grade"],data[11]["series_emp_by_job_grade"]);
					
				

				$("#contentMain").show();
			}
	});

}
//bar1
var baChart_sp_ic_score_by_center= function(seriesParam, categoryParam){
	$("#baChart_sp_ic_score_by_center").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:300,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series:seriesParam,
                      valueAxis: [{
								name: "one",
                            title: { text: "" },
                           // min: 0,
                           // max: 2000,
						   labels: {
                                template: "#= kendo.format('{0:N0}', value ) # "
                            }
						   
                        }, {
                            name: "two",
                            title: { text: "" },
                           // min: 0,
                            //max: 450
                        }],
                        categoryAxis: {
                            categories:categoryParam,
							axisCrossingValue: [0,100],

                        },
                        tooltip: {
                            visible: true,
                            format: "{0:N0}"

                        },
						seriesClick:checkBarTypeCenter
				
                    });


}
/*###  baChart_sp_ic_score_by_center  end ###*/
/*###  baChart_sp_ic_score_by_division  start ###*/
function checkBarTypeDivision(e){
	$.ajax({
			url:'DivisionContent.jsp',
			type:'get',
			dataType:'json',
			data:{"ParamMonth":$("#domParamMonth").val(),"ParamYear":$("#domParamYear").val(),'ParamCenter':$("#domParamCenter").val(),"ParamDivision":e.category},
			success:function(data){

			$("#domParamDivision").remove();
			$("body").append("<input type='hidden' name='domParamDivision' class='domParam' id='domParamDivision' value='"+e.category+"'>");
/*
				console.log(data[0]["category_center"]);
				console.log(data[1]["series_center"]);

				console.log(data[2]["category_division"]);
				console.log(data[3]["series_division"]);

				//console.log(data[4]["category_top20_ic_score"]);
				//console.log(data[5]["series_top20_ic_score"]);

				console.log(data[4]["pie_sp_ic_score"]);
				console.log(data[5]["sum_pie_sp_ic_score"]);
				
				console.log(data[6]["category_by_output_type"]);
				console.log(data[7]["series_by_output_type"]);

				console.log(data[8]["category_emp_all_vs_jf2000"]);
				console.log(data[9]["series_emp_all_vs_jf2000"]);
				
				console.log(data[10]["category_emp_by_job_grade"]);
				console.log(data[11]["series_emp_by_job_grade"]);

				console.log(data[12]["category_by_department"]);
				console.log(data[13]["series_by_department"]);
*/
				$("#departmentName").text($("#domParamDivision").val());
				var Year = parseInt($("#domParamYear").val());
				Year=Year+543;
				$("#ic_score_open").attr({"href":"https://app2.biotec.or.th/dw/icscore_02_open.asp?t=out&emp_out="+$("#domParamCenter").val()+","+$("#domParamDivision").val()+",&bgy="+Year+""});

				baChart_sp_ic_score_by_department(data[12]["category_by_department"],data[13]["series_by_department"]);
				pieChart_sp_ic_score_by_job_family(data[4]["pie_sp_ic_score"],data[5]["sum_pie_sp_ic_score"]);
				stackChart_sp_ic_score_by_output_type(data[6]["category_by_output_type"],data[7]["series_by_output_type"]);
				stackChart_sp_count_emp_all_vs_jf2000(data[8]["category_emp_all_vs_jf2000"],data[9]["series_emp_all_vs_jf2000"]);
				stackChart_sp_count_emp_by_job_grade(data[10]["category_emp_by_job_grade"],data[11]["series_emp_by_job_grade"]);
			}
	});

}
//bar 2
var baChart_sp_ic_score_by_division= function(categoryParam,seriesParam){

	$("#baChart_sp_ic_score_by_division").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:300,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series:seriesParam,
                      valueAxis: [{
								name:"one",
                            title: { text: "" },
                            labels: {
                                template: "#= kendo.format('{0:N0}', value ) # "
                            }
							//min: 0,
                            //max: 600
                        }, {
                            name: "two",
                            title: { text: "" },
                           // min: 0,
                          //  max: 140
                        }],
                        categoryAxis: {
                            categories:categoryParam ,
							axisCrossingValue: [0,100],
							labels: {rotation : -90}
							
                        },
                        tooltip: {
                            visible: true,
                            format: "{0:N0}"
                        },
						seriesClick:checkBarTypeDivision
                    });
}

/*###  baChart_sp_ic_score_by_division  end ###*/
/*###  baChart_sp_ic_score_by_department  start ###*/
function checkBarTypeDepartment(e){
			$.ajax({
			url:'DepartmentContent.jsp',
			type:'get',
			dataType:'json',
			data:{"ParamMonth":$("#domParamMonth").val(),"ParamYear":$("#domParamYear").val(),"ParamCenter":$("#domParamCenter").val(),"ParamDivision":$("#domParamDivision").val(),"ParamDepartment":e.category},
			success:function(data){

			$("#domParamDepartment").remove();
			$("body").append("<input type='hidden' name='domParamDepartment' class='domParam' id='domParamDepartment' value='"+e.category+"'>");
/*
				console.log(data[0]["category_center"]);
				console.log(data[1]["series_center"]);

				console.log(data[2]["category_division"]);
				console.log(data[3]["series_division"]);

				//console.log(data[4]["category_top20_ic_score"]);
				//console.log(data[5]["series_top20_ic_score"]);

				console.log(data[4]["pie_sp_ic_score"]);
				console.log(data[5]["sum_pie_sp_ic_score"]);
				
				console.log(data[6]["category_by_output_type"]);
				console.log(data[7]["series_by_output_type"]);

				console.log(data[8]["category_emp_all_vs_jf2000"]);
				console.log(data[9]["series_emp_all_vs_jf2000"]);
				
				console.log(data[10]["category_emp_by_job_grade"]);
				console.log(data[11]["series_emp_by_job_grade"]);

				console.log(data[12]["category_by_department"]);
				console.log(data[13]["series_by_department"]);
*/
				var Year = parseInt($("#domParamYear").val());
				Year=Year+543;
				$("#ic_score_open").attr({"href":"https://app2.biotec.or.th/dw/icscore_02_open.asp?t=out&emp_out="+$("#domParamCenter").val()+","+$("#domParamDivision").val()+","+$("#domParamDepartment").val()+"&bgy="+Year+""});

				pieChart_sp_ic_score_by_job_family(data[4]["pie_sp_ic_score"],data[5]["sum_pie_sp_ic_score"]);
				stackChart_sp_ic_score_by_output_type(data[6]["category_by_output_type"],data[7]["series_by_output_type"]);
				stackChart_sp_count_emp_all_vs_jf2000(data[8]["category_emp_all_vs_jf2000"],data[9]["series_emp_all_vs_jf2000"]);
				stackChart_sp_count_emp_by_job_grade(data[10]["category_emp_by_job_grade"],data[11]["series_emp_by_job_grade"]);
			}
			});
}
var baChart_sp_ic_score_by_department= function(categoryParam,seriesParam){
	$("#baChart_sp_ic_score_by_department").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "",
							
                        },
						chartArea:{
						width:300,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series:seriesParam,
                       valueAxis: [{
								name: "one",
                            title: { text: "" },
							 labels: {
                                template: "#= kendo.format('{0:N0}', value ) # "
                            }
                         /*   min: 0,
                            max: 6*/
                        }, {
                            name: "two",
                            title: { text: "" },
                        /*    min: 0,
                            max: 6*/
                        }],
                        categoryAxis: {
                            categories:categoryParam,
							axisCrossingValue:[0,100],
							labels: {rotation : -90}
                        },
                        tooltip: {
                            visible: true,
                             format: "{0:N0}"
                        },
						seriesClick:checkBarTypeDepartment
						
                    });
	
}

/*###  baChart_sp_ic_score_by_department  end ###*/

/*###  stackChart_sp_top20_ic_score  start ###*/
var baChart_sp_top20_ic_score= function(categoryParam,seriesParam){
	$("#baChart_sp_top20_ic_score").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "Top 20 IC Score"
                        },
						chartArea:{
						width:950,
						height:300
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: seriesParam,
                       valueAxis: [{
                            title: { text: "" },
							 labels: {
                                template: "#= kendo.format('{0:N0}', value ) # "
                            }
                           // min: 0,
                           // max: 1400
                        }, {
                            name: "Varaince",
                            title: { text: "" },
                            min: 0,
                            max: 140
                        }],
                        categoryAxis: {
							labels: {
                                rotation: -90
                            },
                            categories: categoryParam,
							axisCrossingValue: [0,100]
                        },

						
                        tooltip: {
                            visible: true,
                             format: "{0:N0}"
                        }
                    });
	
}

/*###  StackChart_sp_top20_ic_score  end ###*/
/*###  pieChart_sp_ic_score_by_job_family start ###*/



var pieChart_sp_ic_score_by_job_family= function(categoryParam,sum_pie_sp_ic_score){

		$("#pieChart_sp_ic_score_by_job_family").kendoChart({
			//theme: $(document).data("kendoSkin") || "metro",
			theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:""
						
						
			},
			legend: {
                            position: "right"
            },
			chartArea: {
			width: 310,
			height: 190
			},
			series: [{
                            type: "pie",

                            data:categoryParam
                        }],
                        tooltip: {
                            visible: true,
                         //  format: "{0}"
						   template: "${ value }, #= kendo.format('{0:P}', percentage)#"
						 //template: "#= templateFormat(value,"+sum_pie_sp_ic_score+") #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			},
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  pieChart_sp_ic_score_by_job_family End ###*/
/*###  stackChart_sp_ic_score_by_output_type start ###*/



var stackChart_sp_ic_score_by_output_type= function(categoryParam,seriesParam){

		$("#stackChart_sp_ic_score_by_output_type").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                            position: "top"
                        },
						chartArea:{
						width:300,
						height:150
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series: seriesParam,
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories:categoryParam
                        },
                        tooltip: {
                            visible: true,
                             format: "{0:N0}"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChart_sp_count_emp_all_vs_jf2000 start ###*/
var stackChart_sp_count_emp_all_vs_jf2000= function(categoryParam,seriesParam){

		$("#stackChart_sp_count_emp_all_vs_jf2000").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                           // position: "top"
							visible:false
                        },
						chartArea:{
						width:300,
						height:90
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series:seriesParam,
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories:categoryParam
                        },
                        tooltip: {
                            visible: true,
                             format: "{0:N0}"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChart_sp_count_emp_all_vs_jf2000 End ###*/
/*###  stackChart_sp_count_emp_by_job_grade start ###*/
var stackChart_sp_count_emp_by_job_grade= function(categoryParam,seriesParam){

		$("#stackChart_sp_count_emp_by_job_grade").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                            position: "top",
							visible:false
                        },
						chartArea:{
						width:300,
						height:85
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series: seriesParam,
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories:categoryParam
                        },
                        tooltip: {
                            visible: true,
                             format: "{0:N0}",
							template: "#= series.name # ,  #= value #"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChart_sp_count_emp_by_job_grade End ###*/
	$("form.#form_1 #submit1").trigger("click");

});

/*###  pieChart hr  Defind start ###*/
function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}
/*### pieChart hr  Defind   end ###*/
	</script>



    </head>
    <body>



		



	<!--------------------------- HEADER --------------------------->

	<div align="center">
		<div id="Main-Panel" class="k-content">
		<!--------------------------- Parameter --------------------------->
				<form method="GET" id="form_1">
				<table width=100%>
				<tr>
					<td><label for="ParamYear">ปีงบประมาณ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamYear" id="ParamYear" >
						<%out.print(V_Year);%>
					</select>
					</td>

					<td><label for="ParamMonth">เดือน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamMonth" id="ParamMonth" >
						<%out.print(V_Month);%>
					</select>
					</td>

					<td>
					</td>

					<td>
					<!--<button id="get" class="k-button" >&nbsp;&nbsp;OK&nbsp;&nbsp;</button>-->
					<input type="submit"value="&nbsp;&nbsp;OK&nbsp;&nbsp;"  class="k-button" id="submit1" >
					</td>
				</tr>
				</table>
				</form>
		
		
		</div>
	
	</div>
	<!--------------------------- Details Start--------------------------->


	<div id="contentMain">

<!-- TAB MANAGEMENT START -->
<div id="content">
		<div id="row1">
				<div id="column1">
						<div id="head1">
							<div id="title1">
						<!--<button>Up NC</button>-->
							IC Score Per NC
							</div>
						</div>
						<div id="content1">
								<div id="baChart_sp_ic_score_by_center"></div>
						</div>
				</div>
				<div id="column2">
						<div id="head2">
								<div id="title2">
									<div id="divisionName">BIOTEC(RU)</div>
							</div>
						</div>
						<div id="content2">
								<div id="baChart_sp_ic_score_by_division"></div>
						</div>
				</div>
				<div id="column3">
						<div id="head3">
							<div id="title3">
							
							<div id="departmentName">(Lab)</div>
							</div>
						</div>
						<div id="content3">
							<div id="baChart_sp_ic_score_by_department"></div>
						</div>
				</div>
		</div>
		<div id="row2">
				<div id="column21">
						<div class="head">
								<div class="title">
								 Employee(Count)
								</div>
						</div>
						<div class="content">
								<div id="stackChart_sp_count_emp_all_vs_jf2000"></div>
								<div id="stackChart_sp_count_emp_by_job_grade"></div>
						</div>
				</div>
				<div id="column22">
						<div class="head">
								<div class="title">
								 IC Score by OutpuType<a id="ic_score_open" href="#" target="_blank"><button>Open</button></a>
								</div>
						</div>
						<div class="content">
								<div id="stackChart_sp_ic_score_by_output_type"></div>
						</div>
				</div>
				<div id="column23">
						<div class="head">
								<div class="title">
								IC Score by JobFamily
								</div>
						</div>
						<div class="content">
									<div id="pieChart_sp_ic_score_by_job_family">
									</div>
						</div>
				</div>
		</div>
		<div id="row3">
			<div id="baChart_sp_top20_ic_score"></div>
		</div>
</div>
<!-- TAB MANAGEMENT END -->

	</div>
	

	<!--------------------------- Details End--------------------------->
			<div id="loading" >
				<br>
				<br>
				<br>
				<br>
				<span id="loading_span" style="margin-top:100px;">
					<b>Loading...</b>
				</span>
			</div>
	</body>
</html>