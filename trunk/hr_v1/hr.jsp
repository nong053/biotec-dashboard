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

		</style>
		<style scoped>
				#Main-Panel{
					font-family: Arial, Helvetica, sans-serif;
					margin:1em ;
					padding: 3px;
					border: 1px solid #dedede;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 30px;
					width: auto;
					position: relative;
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

		V_Year += "<option value=\"2012\" >2555</option>";
		V_Year += "<option value=\"2011\" selected='selected'>2554</option>";
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


		V_Org +="<option value=\"NSTDA\">NSTDA</option>";
		V_Org +="<option value=\"BIOTEC\">BIOTEC </option>";
		V_Org +="<option value=\"MTEC\">MTEC</option>";
		V_Org +="<option value=\"NECTEC\">NECTEC</option>";
		V_Org +="<option value=\"NANOTEC\">NANOTEC</option>";


		/*------------------- End Organization Parameter -------------------*/

	%>

	<script type="text/javascript">
			   /*#### Tab search above top start ###*/
	$(document).ready(function(){
	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
	

	/*### jQuery Funtions Start ###*/
		$("form#form_1").submit(function(){

			$(".contentMain").empty();
			$.ajax({
				'url':'content1.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				$(".contentMain").append(data);
				}
			})

			return false;
		});

	/*### jQuery Funtions End ###*/

	});


	</script>



    </head>
    <body>



		



	<!--------------------------- HEADER --------------------------->

<h2><center><font color="black">HR Dashboard</font></center></h2>

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

					<td><label for="ParamOrg">หน่วยงาน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
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


	<div class="contentMain">





<!-- TAB MANAGEMENT START -->


		
		
		


<!-- TAB MANAGEMENT END -->




	</div>
	<div id="loading" ></div>

	<!--------------------------- Details End--------------------------->

	</body>
</html>