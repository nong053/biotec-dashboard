<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<html>
    <head>
        <title>BSC Dashboard</title>
		<link href="<%=request.getContextPath()%>/ChartLib_KendoUI/styles/examples.css" rel="stylesheet"/>
        <link href="<%=request.getContextPath()%>/ChartLib_KendoUI/styles/kendo.common.css" rel="stylesheet"/>
        <link href="<%=request.getContextPath()%>/ChartLib_KendoUI/styles/kendo.metro.css" rel="stylesheet"/>
        <script src="<%=request.getContextPath()%>/ChartLib_KendoUI/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/ChartLib_KendoUI/js/kendo.all.js"></script>
		
		<style type="text/css">
			html,
			body {
				background-color: white;
			}

			#Detail-Panel {
				position:absolute;
				top:80px;
				left:0px;
				border-radius: 5px;
				border: 1px solid #dedede;
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

		V_Year += "<option value=\"2012\">2012</option>";
		V_Year += "<option value=\"2011\">2011</option>";
		V_Year += "<option value=\"2010\">2010</option>";
		V_Year += "<option value=\"2009\">2009</option>";
		
		/*------------------- End Parameter Year -------------------*/

		/*------------------- Parameter Month -------------------*/

		V_Month += "<option value=\"1\">January</option>";
		V_Month += "<option value=\"2\">February</option>";
		V_Month += "<option value=\"3\">March</option>";
		V_Month += "<option value=\"4\">April</option>";
		V_Month += "<option value=\"5\">May</option>";
		V_Month += "<option value=\"6\">June</option>";
		V_Month += "<option value=\"7\">July</option>";
		V_Month += "<option value=\"8\">August</option>";
		V_Month += "<option value=\"9\">September</option>";
		V_Month += "<option value=\"10\">October</option>";
		V_Month += "<option value=\"11\">November</option>";
		V_Month += "<option value=\"12\">December</option>";

		/*------------------- End Parameter Month -------------------*/

		/*------------------- Organization Parameter -------------------*/

		V_Org +="<option value=\"NSTDA\">NSTDA</option>";
		V_Org +="<option value=\"BIOTEC\">BIOTEC </option>";
		V_Org +="<option value=\"MTEC\">MTEC</option>";
		V_Org +="<option value=\"NECTEC\">NECTEC</option>";
		V_Org +="<option value=\"NANOTEC\">NANOTEC</option>";
		
		/*------------------- End Organization Parameter -------------------*/

	%>

<!--------------------- Function --------------------->

	<script type="text/javascript">

		var conURL = "<%=connectionURL%>";
		var pw = "<%=password%>";

		var ParamYear = "<%=ParamYear%>";
		var ParamMonth = "<%=ParamMonth%>";
		var ParamOrg = "<%=ParamOrg%>";

		function getParamYear(value)
		{
			ParamYear = value;
		}

		function getParamMonth(value)
		{
			ParamMonth = value;
		}

		function getParamOrg(value)
		{
			ParamOrg = value;
		}

		function goUrl(iFrameID1)
		{
			var objFrame=document.getElementById(iFrameID1);

			//alert(ParamYear+' '+ParamMonth+' '+ParamOrg);
			objFrame.src='<%=request.getContextPath()%>/BiotecDashBoard/BSC_Details.jsp';
		}

	</script>

    </head>
    <body>
	<!--------------------------- HEADER --------------------------->
	<br/><h2><center><font color="black">Balanced Scorecard</font></center></h2>

	<div align="center">
		<div id="Main-Panel" class="k-content">
		<!--------------------------- Parameter --------------------------->
				<table width=100%>
				<tr>
					<td><label for="ParamYear">ปี :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
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

					<td><button id="get" class="k-button" onClick="goUrl('Details_TB')">&nbsp;&nbsp;OK&nbsp;&nbsp;</button></td>
				</tr>
		<!--------------------------- End Parameter --------------------------->

		<!--------------------------- Configuration --------------------------->
			<style scoped>
				#Main-Panel{
					font-family: Arial, Helvetica, sans-serif;
					margin:1em 0 0;
					padding: 15px 10px 10px;
					border: 1px solid #dedede;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 30px;
					width: 1300px;
					position: relative;
				}
			</style>

			<script>
			   $(document).ready(function(){
				  $("#ParamYear").kendoDropDownList();
			   });
			   $(document).ready(function(){
				  $("#ParamMonth").kendoDropDownList();
			   });
			   $(document).ready(function(){
				  $("#ParamOrg").kendoDropDownList();
			   });
			</script>
		<!--------------------------- End Configuration --------------------------->
		</div>
	
	</div>
	<!--------------------------- Details --------------------------->

	
	<table id="Detail-Panel" width="100%"><tr>
		<td>
			<iframe name="Details_TB" id="Details_TB" width=100% height="400" src="./bg.html" marginwidth="0" marginheight="0" vspace="0" hspace="0" frameborder="0" align="middle" scrolling="no">
			
			</iframe>
			
		</td>
		<td width="350px">
			<iframe name="Details_Chart" id="Details_Chart" width=100% height="400" src="./bg.html" marginwidth="0" marginheight="0" vspace="0" hspace="0" frameborder="0" align="middle" scrolling="no">
			</iframe>
		</td>
	</tr>
	
	</table>
	<!--------------------------- End Details --------------------------->
	</body>
</html>