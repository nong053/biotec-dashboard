<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%@ include file="../config.jsp"%>
<html>
    <head>
        <title>Finance Dashboard</title>
	<!--	<link href="../ChartLib_KendoUI/styles/examples.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.common.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.metro.css" rel="stylesheet"/>-->
		<link href="../styles/kendo.common.min.css" rel="stylesheet">
		<link href="../styles/kendo.default.min.css" rel="stylesheet">
		<!--<link href="../jqueryUI/css/smoothness/jquery-ui-1.8.20.custom.css" rel="stylesheet">-->
		<link href="../jqueryUI/css/cupertino/jquery-ui-1.8.21.custom.css" rel="stylesheet">
		 <link href="../styles/kendo.dataviz.min.css" rel="stylesheet">
		


        <script src="../js/jquery.min.js"></script>
		<script src="../js/kendo.all.min.js"></script>
		  <script src="../js/kendo.dataviz.min.js"></script>
	<!--	<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.20.custom.min.js"></script>-->
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.21.custom.min.js"></script>
		

	
	
	  
		
		<style type="text/css">
			html,
			body {
				background-color: white;
				color:black;
				margin:0px;
				padding:0px;
				font-size:11px;
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
			.contentMain{
			display:none;
			width:975px;
			margin:auto;
			}
		</style>
		<style scoped>
				#Main-Panel{
			
					padding: 3px;
					/*border: 1px solid #dedede;*/
					margin:0px;
					margin-bottom:2px;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 30px;
					width: 970px;
					position: relative;
					background:#008EC3;
					font-weight:bold;
					color:white;
				}
			</style>


	<%


		/*------------------- Set Variable --------------------*/

		String ParamYear = "";
		String ParamMonth = "";
		String ParamOrg = "";

		String V_Year = ""; // Values of Parameter Organization
		String V_Month = ""; // Values of Parameter Sales Region
		String V_Org = ""; // Values of Parameter Branch

		/*------------------- End Set Variable -------------------*/

		//###############Query Handler Organization start  ####################
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
	//insert code allow function start
	st = conn.createStatement();
		Query="CALL sp_business_area();";
		rs = st.executeQuery(Query);
		 
		while(rs.next()){
		//out.println(rs.getString("center_name"));
		V_Org+="<option value="+rs.getString("business_area")+">"+rs.getString("business_area")+"</option>";
		}
	//insert code allow function end
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
//############### Query Handler Organization end ###############

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
		//out.println(rs.getString("center_name"));
		V_Year+="<option value="+rs.getString("fiscal_year")+">"+rs.getString("buddhist_era_year")+"</option>";
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
		//out.println(rs.getString("center_name"));
		V_Month+="<option value="+rs.getString("fiscal_month_no")+">"+rs.getString("calendar_th_month_name")+"</option>";
		}
	//insert code allow function end
		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
//############### Query Handler Month end ###############
	%>

	<script type="text/javascript">
	/*#### Tab search above top start ###*/
	$(document).ready(function(){

	/*Config table suffer table*/
	var sufferTable = function(){
//#######################Menagement Tab Start ######################
		/*Remove  numberic  bottom tab*/
		$("ul.k-numeric li span").removeClass();
		$("ul.k-numeric li span").html("");
		/*Remove  numberic  bottom tab*/
		/*Header Bgcolor*/
		$("th.k-header").css({"background":"#008EC3 "});
		$(".k-grid-header").css({"background":"#008EC3 "});
		/*Header Bgcolor*/

		/*Footer Bgcolor*/
		$(".k-pager-wrap").css({"background":"#008EC3"});
		/*Footer Bgcolor*/
		
		}
var setFont = function(){
		/*Config font*/
		$(".k-draghandle").css({"font-size":"50%"}); 
		//$(".k-grid td").css({"padding":"0px"});
		$(".k-grid td").css({"padding-top":"0px","padding-bottom":"0px"});
		/*Config font*/
}
var setHeader= function(){
	//Set and Config Parameter Now!
	$(".k-header").css({"padding":"2px"});
}

var setHeaderDateYear = function(){
	$(".k-grid-header-wrap table thead ").prepend("<tr><th></th><th style='border-bottom:1px solid white; border-left:1px solid white; color:white;'>รายการ</th><th colspan='3' style='border-bottom:1px solid white; border-left:1px solid white; color:white;'>ปีนี้</th><th style='border-bottom:1px solid white; border-left:1px solid white; color:white;'>ปีที่แล้ว</th></tr>");

}
//#######################Menagement Tab End #######################

var lineChart1 = function(){
			
			$("#chart").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			height:300,
			width:550
			},
			title: {
				 text: "รายได้"
			},
			legend: {
                            position: "bottom"
            },
			series: [
				 { 
						 name: "Balance 2554", data: [6500, 6500, 6500, 6500,6500,6500,6500,6500,6500,6500,6500,6500],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "Balance 2555",
                            data: [6100, 5200, 6300, 7200,4100,7800,6100,7000,5300,7300,6200,7100]
						
						

                   }, 
				
				 {
                            type: "line",
                            data: [0.5, 0.5, 0.5, 0.5, 0.5,0.5, 0.5, 0.5, 0.5, 0.5,0.5,0.5],
                            name: "% Variance",
                            color: "GREEN",
							axis:"Variance"
							
							
                  }
			],
			valueAxis: [{
                            title: { text: "Balance " },
                            min: 0,
                            max: 8000
                        }, {
                            name: "Variance",
                            title: { text: "%Variance" },
                            min: 0,
                            max: 5
                        }],

			categoryAxis:{
		 categories: [" ต.ค."," พ.ย."," ธ.ค."," ม.ค."," ก.พ."," มี.ค."," เม.ย."," พ.ค."," มิ.ย."," ก.ค."," ส.ค."," ก.ย."],
			axisCrossingValue: [0,100]
			}
		});
		
}//function line chart end
var lineChart2 = function(){
			
			$("#chart").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			height:300,
			width:550
			},
			title: {
				 text: "ค่าใช้จ่าย"
			},
			legend: {
                            position: "bottom"
            },
			series: [
				 { 
						 name: "Balance 2554", data: [6500, 6500, 6500, 6500,6500,6500,6500,6500,6500,6500,6500,6500],
						color: "BLUE"
				 } ,
				 {
                            name: "Balance 2555",
                            data: [7000, 7000, 7000, 7000,7000,7000,7000,7000,7000,7000,7000,7000]
						
						

                   }, 
				
				 {
                            type: "line",
                            data: [0.5, 0.5, 0.5, 0.5, 0.5,0.5, 0.5, 0.5, 0.5, 0.5,0.5,0.5],
                            name: "% Variance",
                            color: "GREEN",
							axis:"Variance"
							
							
                  }
			],
			valueAxis: [{
                            title: { text: "Balance " },
                            min: 0,
                            max: 8000
                        }, {
                            name: "Variance",
                            title: { text: "%Variance" },
                            min: 0,
                            max: 5
                        }],

			categoryAxis:{
			 categories: [" ต.ค."," พ.ย."," ธ.ค."," ม.ค."," ก.พ."," มี.ค."," เม.ย."," พ.ค."," มิ.ย."," ก.ค."," ส.ค."," ก.ย."],
			axisCrossingValue: [0,100]
			}
		});

}//function line chart end
function checkBarType(e){
//control background opacity 
$("a.ui-dialog-titlebar-close").click(function(){
$(".contentMain").css("opacity","1");
return false;
});
	//alert("HELLO WORLD");
	$(".contentMain").css("opacity","0.5");
	var $category = e.category;
	var $subCategory  = $category.substring(0,2);
	if($subCategory=="01"){

	lineChart1();
	$("#boxB").dialog({
	title:"รายได้ค่าใช้จ่าย",
	width:600,
	buttons:{
		"OK":function(){
			$(this).dialog("close");
			$(".contentMain").css("opacity","1");
		}
	},
	regend:{
	position:"botom"
	}
	});

	}else{
	lineChart2();
	
	$("#boxB").dialog({
	title:"รายได้ค่าใช้จ่าย",
	width:600,
	buttons:{
		"OK":function(){
			$(this).dialog("close");
			$(".contentMain").css("opacity","1");
		}
	},
	regend:{
	position:"position"
	}

	});

	}

}
/*### Financial Pie Chart Start###*/
	var pieChart3= function(){
		$("#chart2").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			width:230,
			height:300
			},
			title: {
				 text: "สัดส่วนงบรายได้ค่าใช้จ่าย"
			},
			legend: {
                            position: "bottom"
            },
			series: [{
                            type: "pie",
                            data: [ {
								valueid:"01",
                                category: "01-รายได้ ",
                                value: 50.94
                            }, {
								valueid:"02",
                                category: "02-ค่าใช้จ่าย",
                                value: 49.06
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            //format: "{0}%"
							template :"#= tootipFormat(value,900) #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			},
			seriesClick:checkBarType
			
		});

}//function pie chart end
/*### Financial Pie Chart Start###*/
	var pieChart33= function(){
		$("#chart2").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			width:230,
			height:300
			},
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			series: [{
                            type: "pie",
                            data: [ {
								valueid:"01",
                                category: "01-รายได้ ",
                                value: 50.94
                            }, {
								valueid:"02",
                                category: "02-ค่าใช้จ่าย",
                                value: 49.06
                            }]
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
							template :"#= tootipFormat(value,900) #"

                        },
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
			
		});

}//function pie chart end
/*### Financial Pie Chart End###*/

	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
   
	/*#### Tab search above top end ###*/

	/*#### jquery manage tab below start ###*/
	$( "#tabs" ).tabs();
	// ajax start 01
	$("[href=#content1]").click(function(){
	//alert("hello jquery");
	$("#content1").empty();
	$("#content2").empty();
	$("#content3").empty();
	$("#content4").empty();
	$.ajax({
		url:'sp_balance_sheet_list_by_center.jsp',
		type:'get',
		dataType:'html',
		data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramOrg':$('#domParamOrg').val()},
		success:function(data){
		//alert(data);
		$("#content1").html(data);


		//pieChart1();
		}
	});
	});
		// ajax end 01
		
		// ajax start 02
	$("[href=#content2]").click(function(){
	//alert("hello jquery");
	$("#content1").empty();
	$("#content2").empty();
	$("#content3").empty();
	$("#content4").empty();
	$.ajax({
		'url':'sp_profit_and_loss_list_by_center.jsp',
		'type':'get',
		'dataType':'html',
		data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramOrg':$("#domParamOrg").val()},
		success:function(data){
		$("#content2").append(data);
		//$(".k-plus").trigger("click");




		$("#chart2").empty();
		sufferTable();
		setFont();
		setHeader();

	setHeaderDateYear();

		}
	});
	
	});
		// ajax end 02
		// ajax start 03

	$("[href=#content3]").click(function(){
	//alert("hello jquery");
	$("#content1").empty();
	$("#content2").empty();
	$("#content3").empty();
	$("#content4").empty();
	$.ajax({
		'url':'sp_balance_sheet_list.jsp',
		'type':'get',
		'dataType':'html',
		data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramOrg':$("#domParamOrg").val()},
		success:function(data){
		//alert(data);
		$("#content3").append(data);
		//sufferTable();
		
		}
	});
	
	});
		// ajax end 03
		// ajax start 04
	$("[href=#content4]").click(function(){
	//alert("hello jquery");
	$("#content2").empty();
	$("#content1").empty();
	$("#content3").empty();
	$("#content4").empty();
	$.ajax({
		'url':'sp_profit_and_loss_list.jsp',
		'type':'get',
		'dataType':'html',
		data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramOrg':$("#domParamOrg").val()},
		success:function(data){
		//alert(data);
		$("#content4").append(data);
		//pieChart33();
		sufferTable();
		setFont();
		setHeader();
		}
	});
	});
		// ajax end 04

		$("form#form_1").live("submit",function(){
			$(".contentMain").show();
			//embeded dom id document for process start
				$(".domParam").remove();
				$("body").append("<input type='text' name='domParamYear' id='domParamYear' class='domParam' value='"+$("#ParamYear").val()+"'>");

				$("body").append("<input type='text' name='domParamMonth' id='domParamMonth' class='domParam' value='"+$("#ParamMonth").val()+"'>");

				$("body").append("<input type='text' name='domParamOrg' id='domParamOrg' class='domParam' value='"+$("#ParamOrg").val()+"'>");

			//embeded dom id document for process end

			$("[href=#content1]").trigger("click");
			return false;
		});
	
	/*###  jQuery Config Start ###*/

	$(".ui-tabs-panel").css("padding","2px");
	/*###  jQuery Config End ###*/
	/*#### jquery manage tab below end ###*/
	});
/*###  function for kendo tootip Start ###*/

function tootipFormat(value,summ){
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}
/*###  function for kendo tootip End ###*/

	</script>
    </head>
    <body>

	<!--------------------------- HEADER --------------------------->

<!--<h2><center><font color="black">Financial Dashboard</font></center></h2>-->

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
					<select name="ParamMonth" id="ParamMonth">
						<%out.print(V_Month);%>
					</select>
					</td>

					<td><label for="ParamOrg">ศูนย์ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamOrg" id="ParamOrg" >
						<%out.print(V_Org);%>
					</select>
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


	<div class="contentMain">





<!-- TAB MANAGEMENT START -->

		<div id="tabs">
			<ul>
				<li ><a href="#content1">งบแสดงฐานะการเงิน</a></li>
				<li ><a href="#content2">งบรายได้ค่าใช้จ่าย</a></li>
				<li ><a href="#content3">งบแสดงฐานะการเงินแยกศูนย์</a></li>
				<li ><a href="#content4">งบรายได้ค่าใช้จ่ายแยกศูนย์</a></li>
			
			</ul>
			<div id="content1">content1</div>
			<div id="content2">content2</div>
			<div id="content3">content3</div>
			<div id="content4">content4</div>
<br style="clear:both" />
</div>
<!-- TAB MANAGEMENT END -->

	</div>
	<div id="loading" ></div>
	<!--------------------------- Details End--------------------------->
	</body>
</html>