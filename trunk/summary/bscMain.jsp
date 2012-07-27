<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<html>
    <head>
        <title>BSC Dashboard</title>
			<!--	<link href="../ChartLib_KendoUI/styles/examples.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.common.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.metro.css" rel="stylesheet"/>-->
		<link href="../styles/kendo.common.min.css" rel="stylesheet">
		<link href="../styles/kendo.default.min.css" rel="stylesheet">
		<link href="../jqueryUI/css/smoothness/jquery-ui-1.8.20.custom.css" rel="stylesheet">
		 <link href="../styles/kendo.dataviz.min.css" rel="stylesheet">
		


        <script src="../js/jquery.min.js"></script>
		<script src="../js/kendo.all.min.js"></script>
		  <script src="../js/kendo.dataviz.min.js"></script>
		  <script type="text/javascript" src="../js/jquery.sparkline.min.js"></script> 
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.20.custom.min.js"></script>
	<!--	<script src="../js/console.js"></script>-->
	
	  
		
		<style type="text/css">
			html,
			body {
				background-color: white;
				color:black;
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
				<!--------------------------- Configuration --------------------------->
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

		V_Year += "<option value=\"2012\" >2012</option>";
		V_Year += "<option value=\"2011\" selected='selected'>2011</option>";
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

		
		/*

		V_Org +="<option value=\"1\">NSTDA</option>";
		V_Org +="<option value=\"2\">BIOTEC </option>";
		V_Org +="<option value=\"3\">MTEC</option>";
		V_Org +="<option value=\"4\">NECTEC</option>";
		V_Org +="<option value=\"5\">NANOTEC</option>";
		*/


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

		/*########## Function jQuery Start#########*/
		$(document).ready(function(){
		  
		  /*$('.inlinesparkline').sparkline(); */

			var $width = $("body").width();
			//alert($width);
			var $widthWrap  =(($width/2)-25);
				//alert($widthWrap);
				$("#loading").css({"left":$widthWrap+"px"})

			$("#get").click(function(){
				$("#content").empty();
				
				$.ajax({
							url:'kendoUI.html',
							type:"GET",
							dataType:'html',
							success:function(data){
							$("#content").append(data);
							
							}
							
				});
			});
// Dialog For Graph Start
			$("#loading").ajaxStart(function(){
				$(this).show();
			}).ajaxStop(function(){
				$(this).hide();
			});

			// Dialog
				$('#dialog').dialog({
					autoOpen: false,
					width: 620,
					buttons: {
						"Ok": function() {
							$(this).dialog("close");
						}
					},
					legend:{
					position:"bottom"
					}
				});
			

	// Dialog Link
				$('.inlinesparkline').live("click",function(){
					//alert("hello");
					$('#dialog').dialog('open');


					return false;
				});
				$('#date').datepicker();
		
	// Dialog Link
// Dialog For Graph End


		});
//#######################Graph Program Start#######################
		$(document).ready(function(){
			$("#chart").kendoChart({
			title: {
				 text: "ข้อมูลผลการดำเนินงานเทียบเป้าหมาย"
			},
			series: [
				 { name: "ผลการดำเนินงาน", data: [2, 3, 4, 5,6,6,7,7,8,8,9,9],
				color: "BLUE"
				 }
				 , 
				
				 {
                            type: "line",
                            data: [10, 10, 10, 10, 10,10, 10, 10, 10, 10,10,10],
                            name: "เป้าหมาย",
                            color: "GREEN"
							
                  }
			],
			categoryAxis:{
			categories: [ "Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec" ]
			},
			legend:{
			position:"bottom"
			}
		});
		//#######################Graph Program End#######################
		
		
		
		//alert(g);
		
		//$("g").css("color","#cccccc").hide();
	});

		/*########## Function jQuery End#########*/

	</script>

    </head>
    <body>


<!-- code for graphic-->


	<!-- <input type="input" name="date"  id="date" > -->
	<div id="dialog" title="Overall">
			<div id="chart"><p></p></div>
		</div>
<!-- ui-dialog -->	


<!-- code for graphic-->

	<!--------------------------- HEADER --------------------------->
<h2><center><font color="black">Balanced Scorecard</font></center></h2>

	<div align="center">
		<div id="Main-Panel" class="k-content">
		<!--------------------------- Parameter --------------------------->
				<form method="GET" id="form_1">
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

					<td>
					<!--<button id="get" class="k-button" >&nbsp;&nbsp;OK&nbsp;&nbsp;</button>-->
					<input type="submit"value="&nbsp;&nbsp;OK&nbsp;&nbsp;"  class="k-button" id="submit1" >
					</td>
				</tr>
				</table>
				</form>
		<!--------------------------- End Parameter --------------------------->
		<!-- Start jQuery 0001-->
			<script type="text/javascript">
			$(document).ready(function(){
				//alert("ok for jquery");
				$("#form_1").submit(function(){
					//alert("ok submit"+$(this).serialize());
					
						/*
						if($("select#ParamOrg").val()=="NSTDA"){
							alert("NSTDA");
							
						}
						*/


						$.ajax({
						url:'Process.jsp',
						type:'GET',
						dataType:'html',
						data:$(this).serialize(),
						success:function(data){
							//alert("data ok");
							$("#content").empty();

							
							$("#content").append(data);
						
			
						

						}
						
						});

			
				return false;


			
				});
	
			});

			</script>
		<!-- End jQuery 0001-->


			<script>
			   $(document).ready(function(){
				  $("#ParamYear").kendoDropDownList();
			
				  $("#ParamMonth").kendoDropDownList();
	
				  $("#ParamOrg").kendoDropDownList();
			   });
			</script>
		<!--------------------------- End Configuration --------------------------->
		</div>
	
	</div>
	<!--------------------------- Details Start--------------------------->


	<div id="content">

	
	</div>
	<div id="loading" ></div>

	<!--------------------------- Details End--------------------------->

	</body>
</html>