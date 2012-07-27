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
				font-size:11px;
				font:tahoma;

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
			.tootip{
			width:200px;
			height:auto;
			position:absolute;
			z-index:10;
			background:white;
			display:none;
			border-radius:5px;
			border:1px solid #cccccc;
			cursor:pointer;
			padding:5px;
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
					$('.inlinesparkline_sub').live("click",function(){
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

					
					<!--<td><label for="ParamOrg">หน่วยงาน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>-->
					<select name="ParamOrg" id="ParamOrg" onChange="getParamOrg(this.value);" style="display:none">
						<% //out.print(V_Org);%>
					</select>
				<!--	</td>-->
					
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
				
 /*jQuery Taps Start Here*/
			$("#form_1").submit(function(){
					 $("#tabBsc").show("fast",function(){
					$("a[href=#tab1]").trigger("click");
					 });
					
				return false;
				});

			$("a[href=#tab1]").click(function(){
				
					$.ajax({
						url:'nstda.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"NSTDA"},
						success:function(data){
						
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab1").append(data);

						
					 /*### Manage Tootip Start###*/
					 $(".kpiN").hover(function(e){
						var $X =  e.pageX+10;
						 var $Y = e.pageY+10
						$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
						console.log(e.pageX)
					 },function(){
						 $(".tootip").hide();
					 });
					/*### Manage Tootip Stop ###*/

						}
					});
			});
				$("a[href=#tab1_1]").click(function(){
			
					$.ajax({
						url:'nstda1.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":$("#ParamOrg").val()},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab1_1").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/

						}
					});
			});
			$("a[href=#tab1_2]").click(function(){
					$.ajax({
						url:'nstda1.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":$("#ParamOrg").val()},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab1_2").append(data);

							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			});
			$("a[href=#tab1_3]").click(function(){
					$.ajax({
						url:'nstda1.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":$("#ParamOrg").val()},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab1_3").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			});
			$("a[href=#tab2]").click(function(){
						$.ajax({
						url:'biotec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"BIOTEC "},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab2").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			});
			$("a[href=#tab3]").click(function(){

						$.ajax({
						url:'mtec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"MTEC  "},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab3").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			
			});
			$("a[href=#tab4]").click(function(){

				$.ajax({
						url:'nectec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"NECTEC  "},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab4").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			
			});
			$("a[href=#tab5]").click(function(){
//alert("hello tab5");
				$.ajax({
						url:'nanotec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"NANOTEC  "},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab5").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
					/*### Manage Tootip Stop ###*/
						}
					});
			
			});

				$("a[href=#tab6]").click(function(){

				$.ajax({
						url:'tmc.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYear").val(),"ParamMonth":$("#ParamMonth").val(),"ParamOrg":"TMC  "},
						success:function(data){
							//alert("data ok");
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							$("#tab6").append(data);
							/*### Manage Tootip Start###*/
								 $(".kpiN").hover(function(e){
									var $X =  e.pageX+10;
									 var $Y = e.pageY+10
									$(".tootip").css({"left":$X+"px","top":$Y+"px"}).fadeIn();
									console.log(e.pageX)
								 },function(){
									 $(".tootip").hide();
								 });
						/*### Manage Tootip Stop ###*/
						}
					});
			
			});
				


	 /*### jQuery Taps End Here ###*/



			});

			</script>
		<!-- End jQuery 0001-->


			<script>
			   $(document).ready(function(){
				  $("#ParamYear").kendoDropDownList();
			
				  $("#ParamMonth").kendoDropDownList();
	
				  $("#ParamOrg").kendoDropDownList();

				  /*jQuery Start Here ### File Config ###*/
				  $("#tabBsc").tabs();
				  $("#tabBsc").hide();
				  $(".ui-tabs-panel").css("padding","0px");

				  /*jQuery End Here  ### File Config ###*/
			   });
			</script>
		<!--------------------------- End Configuration --------------------------->
		</div>
	
	</div>
	<!--------------------------- Details Start--------------------------->
<div class="tootip" ><b>การลงทุนด้าน ว และ ท ในภาคการผลิต ภาคบริการและภาคการผลิต ภาคบริการและภาคเกษตรกรรม</b></div>

	<div id="content">
			
			<div id="tabBsc">
				<ul>
					<li>
					<a href="#tab1"> NSTDA</a>
					</li>
					<li>
					<a href="#tab1_1"> NSTDA->ด้านกลยุทธ์</a>
					</li>
					<li>
					<a href="#tab1_2"> NSTDA->ด้านวิจัยนโยบาย</a>
					</li>
					<li>
					<a href="#tab1_3"> NSTDA->ด้านบริหาร</a>
					</li>
					<li>
					<a href="#tab2"> BIOTEC</a>
					</li>
					<li>
					<a href="#tab3"> MTEC</a>
					</li>
					<li>
					<a href="#tab4"> NECTEC</a>
					</li>
					<li>
					<a href="#tab5"> NANOTEC</a>
					</li>
					<li>
					<a href="#tab6"> TMC</a>
					</li>
				</ul>
				<div id="tab1">
				content01 ...
				</div>
				<div id="tab1_1">
				content011 ...
				</div>
				<div id="tab1_2">
				content012 ...
				</div>
				<div id="tab1_3">
				content013 ...
				</div>
				<div id="tab2">
				content02 ...
				</div>
				<div id="tab3">
				content03 ...
				</div>
				<div id="tab4">
				content04 ...
				</div>
				<div id="tab5">
				content05 ...
				</div>
				<div id="tab6">
				content06...
				</div>
			</div>

	
	</div>
	<div id="loading" ></div>
	

	<!--------------------------- Details End--------------------------->

	</body>
</html>