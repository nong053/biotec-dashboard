<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<html>
    <head>
        <title>HR Dashboard</title>
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
					margin-bottom:2px;
					padding: 3px;
					border: 1px solid #dedede;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 30px;
					width: 980px;
					position: relative;
					background:#008EC3 ;
					font-weight:bold;
					color:white;
				}
				#tabHr{
				width:985px;
				margin:auto;
				}
			</style>


	<%
		/*------------------- Set Connection -------------------*/
		String connectionURL = "jdbc:mysql://localhost:3306/mysql"; 
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root"; 
		String password = "root";
		String query = "";
		Connection conn = null; 
		Statement st;
		ResultSet rs;
		/*------------------- End Set Connection -------------------*/

		/*------------------- Set Variable -------------------*/

		String ParamYear = "";
		String ParamMonth = "";
		String ParamOrg = "";

		String V_Year = ""; // Values of Parameter Organization
		String V_Month = ""; // Values of Parameter Sales Region
		String V_Org = ""; // Values of Parameter Branch

		/*------------------- End Set Variable -------------------*/

		/*------------------- Parameter Year -------------------*/

		V_Year += "<option value=\"2012\" selected='selected'>2555</option>";
		V_Year += "<option value=\"2011\" >2554</option>";
		V_Year += "<option value=\"2010\">2553</option>";
		V_Year += "<option value=\"2009\">2552</option>";
		
		/*------------------- End Parameter Year -------------------*/

		/*------------------- Parameter Month -------------------*/

		
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

		/*------------------- End Parameter Month -------------------*/
		/*------------------- Organization Parameter -------------------*/


		
		V_Org +="<option value=\"NSTDA\">สก.</option>";
		V_Org +="<option value=\"BIOTEC\">ศช. </option>";
		V_Org +="<option value=\"MTEC\">ศว.</option>";
		V_Org +="<option value=\"NECTEC\">ศจ.</option>";
		V_Org +="<option value=\"NANOTEC\">ศน.</option>";


		/*------------------- End Organization Parameter -------------------*/

	%>

	<script type="text/javascript">
			   /*#### Tab search above top start ###*/
	$(document).ready(function(){
	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
	

	/*### jQuery Funtions Start ###*/


	/*### Function Ajax Management Start###*/
	var includeHr_1 = function(){
		$.ajax({
		url:'hr-1.jsp',
		type:'get',
		dataType:'html',
		success:function(data){
		//alert(data);
		$("#content1").append(data);
		}
	});
	} 

	var includeNpr_2 = function(){
		$.ajax({
		url:'npr-2.jsp',
		type:'get',
		dataType:'html',
		success:function(data){
		//alert(data);
		$("#content2").append(data);
		}
	});
	} 

	$("a[href=#content1]").click(function(){
		$("#content1").empty();
		$("#content2").empty();
		includeHr_1();
	});
	


	$("a[href=#content2]").click(function(){
		$("#content1").empty();
		$("#content2").empty();
		includeNpr_2();

	});
	
	

	
	/*### Function Ajax Management End###*/
		
		$("form#form_1").submit(function(){
			
			$("#content1").empty();
			$("#content2").empty();
			/*
			$.ajax({
				'url':'hr-1.jsp',
				'type':'get',
				'dataType':'html',
				success:function(data){
				$(".contentMain").append(data);
				}
			});

		*/
		$("#contentMain").show();
		$("#tabHr").tabs();
		$(".ui-tabs-panel").css("padding","0px");
		includeHr_1();
		
		


			return false;
		});

	/*### jQuery Funtions End ###*/
	/*### tab hr ###*/
	/* ### Tab1 Start ###*/
		
	/*###  Tab1 End ###*/



	

	});


	</script>



    </head>
    <body>



		



	<!--------------------------- HEADER --------------------------->

<!--<h2><center><font color="black">HR Dashboard</font></center></h2>-->

	<div align="center">
		<div id="Main-Panel" class="k-content">
		<!--------------------------- Parameter --------------------------->
				<form method="GET" id="form_1">
				<table width=100%>
				<tr>
					<td><label for="ParamYear">ปีงบประมาณ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamYear" id="ParamYear" onChange="getParamYear(this.value);">
						<%out.print(V_Year);%>
					</select>
					</td>

					<td><label for="ParamMonth">เดือน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamMonth" id="ParamMonth" onChange="getParamMonth(this.value);">
						<%out.print(V_Month);%>
					</select>
					</td>

					<td><label for="ParamOrg">ศูนย์ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select name="ParamOrg" id="ParamOrg" onChange="getParamOrg(this.value);">
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


	<div id="contentMain">

<!-- TAB MANAGEMENT START -->
		<!--### Management HR TAB ###-->
			<div id="tabHr"  >
				<ul >
						<li><a href="#content1">HR</a></li>
						<li><a href="#content2">NPR</a></li>
				</ul>
				<div id="content1"></div>
				<div id="content2"></div>

			</div>
<!--### Management HR TAB ###-->

<!-- TAB MANAGEMENT END -->

	</div>
	<div id="loading" ></div>




	<!--------------------------- Details End--------------------------->

	</body>
</html>