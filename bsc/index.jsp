<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<!doctype html>
<html>
    <head>
        <title>BSC Dashboard</title>
			<!--	<link href="../ChartLib_KendoUI/styles/examples.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.common.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.metro.css" rel="stylesheet"/>-->
		<link href="bsc.css" rel="stylesheet">
		<link href="../styles/kendo.common.min.css" rel="stylesheet">
		<link href="../styles/kendo.default.min.css" rel="stylesheet">
		<link href="../jqueryUI/css/cupertino/jquery-ui-1.8.21.custom.css" rel="stylesheet">
		 <link href="../styles/kendo.dataviz.min.css" rel="stylesheet">
		 <link href="../plugin/tooltip.css" rel="stylesheet">


		<script src="../js/jquery.min.js"></script>  
        <!--<script src="../js/jquery.min.js" type="text/javascript"></script>-->
		<script type="text/javascript" src="../plugin/jquery.tooltip.js"></script>
		<script type="text/javascript" src="js/jquery.corner.js"></script>
		<script src="../js/kendo.all.min.js" type="text/javascript"></script>
		  <script src="../js/kendo.dataviz.min.js" type="text/javascript"></script>
		  <script type="text/javascript" src="../js/jquery.sparkline.min.js"  type="text/javascript"></script> 
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.21.custom.min.js"  type="text/javascript"></script>
	<!--	<script src="../js/console.js"></script>-->
	
	  
		
		<style type="text/css">
		/*Main Color Start*/
		/*
		#008EC3 
		#99ccff 
		#dbeef3
		*/
		/*Main Color End*/
			html,
			body {
				background-color: white;
				color:black;
				font-size:12px;
				font:Tahoma;
				margin:0;
				padding:0;

			}
			#content{
			width:975px;
			margin:auto;
			}

			#Detail-Panel {
				position:absolute;
				top:80px;
				left:0px;
				border-radius: 5px;
				border: 1px solid #dedede;
				background-color:#008EC3;
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
					margin:0px;
					margin-bottom:2px;
					padding: 3px;
					/*border: 1px solid #dedede;*/
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 30px;
					width: 970px;
					position: relative;
					background-color:#008EC3;
					color:white;
					font-weight:bold;
				}

			</style>

	<%
		/*------------------- Set Connection -------------------
		String connectionURL = "jdbc:mysql://localhost:3306/mysql"; 
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root"; 
		String password = "root";
		String query = "";
		Connection conn = null; 
		Statement st;
		ResultSet rs;
		------------------- End Set Connection -------------------*/

		/*------------------- Set Variable -------------------*/

		String ParamYear = "";
		String ParamMonth = "";
		String ParamOrg = "";

		String V_Year = ""; // Values of Parameter Organization
		String V_Month = ""; // Values of Parameter Sales Region
		String V_Org = ""; // Values of Parameter Branch

		/*------------------- End Set Variable -------------------*/
		/*------------------- Parameter Year & Month  -------------------*/
		
		rs = null;
		Query  = "SELECT Date_format(SYSDATE(),'%Y') as year_date,Date_format(SYSDATE(),'%m') as month_date;";
		rs = st.executeQuery(Query);
		rs.next();
		int	cYear =  Integer.parseInt(rs.getString("year_date"));
		int	cMonth = Integer.parseInt(rs.getString("month_date"))-1;
		if((cMonth+3) > 12) {
			cYear = cYear+1 ;
		}
		if((cMonth+3)%12!=0){
			cMonth = (cMonth+3)%12;
		}
		else{
			cMonth = 12;
		}
		Query="CALL sp_fiscal_year;";
		rs = st.executeQuery(Query);
		while(rs.next()){
			if( rs.getString("fiscal_year").equals(cYear+"")){
				V_Year += "<option value=\""+rs.getString("fiscal_year")+"\"  selected='selected'>"+rs.getString("buddhist_era_year")+"</option>";
			}
			else{
				V_Year += "<option value=\""+rs.getString("fiscal_year")+"\">"+rs.getString("buddhist_era_year")+"</option>";
			}
		}
		rs = null;
		Query="CALL sp_fiscal_month;";
		rs = st.executeQuery(Query);
		while(rs.next()){
			if(rs.getString("fiscal_month_no").equals(cMonth+"")){
				V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\"  selected='selected'>"+rs.getString("calendar_th_month_name")+"</option>";	
			}else{
				V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\">"+rs.getString("calendar_th_month_name")+"</option>";
			}				
		}
		// set select
	conn.close();	
		//		------------------- End Parameter Year & Month -------------------*/

		/*------------------- End Organization Parameter -------------------*/

	%>

<!--------------------- Function --------------------->

	<script type="text/javascript">

		var conURL = "<%=connectionURL%>";
		var pw = "<%=Pass%>";
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
			var $height = $("body").height();
			//alert($height);
			var $heightWrap= (($height/2)+50);
			var $widthWrap  =(($width/2)-25);
			//	alert($heightWrap);
				$("#loading").css({"left":$widthWrap+"px","top":$heightWrap+"px"});

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
	
		
				$('#date').datepicker();
		
	// Dialog Link
// Dialog For Graph End


		});
//#######################Graph Program Start#######################
		$(document).ready(function(){
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
<!--<h2><center><font color="black">Balanced Scorecard</font></center></h2>-->

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
				  $("#ParamYear").kendoDropDownList();
				  $("#ParamMonth").kendoDropDownList();
				  $("#ParamOrg").kendoDropDownList();

				  /*jQuery Start Here ### File Config ###*/
				  $("#tabBsc").tabs();
				  $("#tabBsc").hide();
				  $(".ui-tabs-panel").css("padding","0px");

			$("#form_1").submit(function(){
			
							$("#tab1").empty();
							$("#tab1_1").empty();
							$("#tab1_2").empty();
							$("#tab1_3").empty();
							$("#tab2").empty();
							$("#tab3").empty();
							$("#tab4").empty();
							$("#tab5").empty();
							$("#tab6").empty();
							 $("#tabBsc").show();

						$(".paramSubmit").remove();
						$("body").append("<input type='hidden' value='"+$("#ParamMonth").val()+"' name='ParamMonthSubmit' id='ParamMonthSubmit' class='paramSubmit'> ");
						$("body").append("<input type='hidden' value='"+$("#ParamYear").val()+"' name='ParamYearSubmit' id='ParamYearSubmit' class='paramSubmit'>");
						//$("body").append("<input type='hidden' value='"+$("#ParamOrg").val()+"' name='ParamOrgSubmit' id='ParamOrgSubmit' class='paramSubmit'>");
						if($("#pageNSTDA").val()){
								$("a[href=#tab1]").trigger("click");
						}else if($("#pageNS").val()){
								$("a[href=#tab1_1]").trigger("click");
						}else if($("#pageCT").val()){
								$("a[href=#tab1_2]").trigger("click");
						}else if($("#pageCPMOHRD").val()){
								$("a[href=#tab1_3]").trigger("click");
						}else if($("#pageBIOTEC").val()){
								$("a[href=#tab2]").trigger("click");
						}else if($("#pageMTEC").val()){
								$("a[href=#tab3]").trigger("click");
						}else if($("#pageNECTEC").val()){
								$("a[href=#tab4]").trigger("click");
						}else if($("#pageNANOTEC").val()){
								$("a[href=#tab5]").trigger("click");
						}else if($("#pageTMC").val()){
								$("a[href=#tab6]").trigger("click");
						}else{
								$("a[href=#tab1]").trigger("click");
						}
					// $("#tabBsc").show("fast",function(){
				//	$("a[href=#tab1]").trigger("click");
					// });
			//		
				return false;
				});
		//$("a[href=#tab1]").trigger("click");
	$("a[href=#tab1]").click(function(){
			includeNSTDA();
	});

	$("a[href=#tab1_1]").click(function(){
			includeNS();
	});

		$("a[href=#tab1_2]").click(function(){
			includeCT();
	});

	$("a[href=#tab1_3]").click(function(){
			includeCPMOHRD();
	});

	$("a[href=#tab2]").click(function(){
			includeBIOTEC();
	});

	$("a[href=#tab3]").click(function(){
			includeMTEC();
	});

	$("a[href=#tab4]").click(function(){
			includeNECTEC();
	});

$("a[href=#tab5]").click(function(){
			includeNANOTEC();
	});

$("a[href=#tab6]").click(function(){
			includeTMC();
	});

 /*Management Range mounse over Start*/
var tooltip = function(){
	  $(".kpiN").hover(function(e){
								  var $AX =  e.pageX+10;
								  var $AY = e.pageY+10;
								   var $pos = e.target.id;
								   var classT = ".tootip#"+$pos;
								   var classT_text = $(classT).text();
								   //alert("["+classT_text+"]");
								   if($.trim(classT_text)!=""){
								$("#tooltip").hide().empty();
								  $("#tooltip").append(classT_text).css({"left":$AX+"px","top":$AY+"px"}).fadeIn();
								   }
							  },function(){
								  $("#tooltip").hide().empty();
								 
		  });

}
var ballScore = function(){

	  $(".ball").hover(function(e){
								  var $AX =  e.pageX+10;
								  var $AY = e.pageY+10;
								   var $pos = e.target.id;
								   var $classB = ".commentball#"+$pos;
								   var classB_html = $($classB).html();
								   if($.trim(classB_html)!=""){
									$("#tooltip").hide().empty();
								  $("#tooltip").append(classB_html).css({"left":$AX+"px","top":$AY+"px"}).fadeIn();
								   }
							  },function(){
								  $("#tooltip").hide().empty();
								 
		  });

}
 /*Management Range mounse over*/

	var includeNSTDA = function(){
		//	$("a[href=#tab1]").click(function(){
					$.ajax({
						url:'nstda.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"NSTDA"},
						//data:{"ParamMonth":$("#ParamMonthSubmit").val(),"ParamYear":$("#ParamYearSubmit").val(),"ParamOrg":$("#ParamOrgSubmit").val()},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageNSTDA' class='pageRemember' name='pageNSTDA' value='pageNSTDA'>");
							$("#tab1").append(data);

						
					 /*### Manage Tootip Start###*/
							tooltip();
							ballScore();
					/*### Manage Tootip Stop###*/



						}
					});
	};


				//$("a[href=#tab1_1]").click(function(){
					var includeNS = function(){
					$.ajax({
						url:'ns.jsp',
						type:'GET',
						dataType:'html',
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"NS"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageNS' class='pageRemember' name='pageNS' value='pageNS'>");
							$("#tab1_1").append(data);
					/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
					/*### Manage Tootip Stop###*/

						}
					});
			};

			var includeCT = function(){
			//$("a[href=#tab1_2]").click(function(){
					$.ajax({
						url:'ct.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"CT"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageCT' class='pageRemember' name='pageCT' value='pageCT'>");
							$("#tab1_2").append(data);
				/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
					/*### Manage Tootip Stop###*/
						}
					});
			};

			var includeCPMOHRD = function(){

		//	$("a[href=#tab1_3]").click(function(){
					$.ajax({
						url:'cpmo-hrd.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"CPMO-HRD"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageCPMOHRD' class='pageRemember' name='pageCPMOHRD' value='pageCPMOHRD'>");
							$("#tab1_3").append(data);
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			};
				var includeBIOTEC = function(){
		////	$("a[href=#tab2]").click(function(){
						$.ajax({
						url:'biotec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"BIOTEC"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageBIOTEC' class='pageRemember' name='pageBIOTEC' value='pageBIOTEC'>");
							$("#tab2").append(data);
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			};

	//		$("a[href=#tab3]").click(function(){
				var includeMTEC = function(){
						$.ajax({
						url:'mtec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"MTEC"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageMTEC' class='pageRemember' name='pageMTEC' value='pageMTEC'>");
							$("#tab3").append(data);
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			
			};

			var includeNECTEC = function(){
			//$("a[href=#tab4]").click(function(){
				$.ajax({
						url:'nectec.jsp',
						type:'GET',
						dataType:'html',
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"NECTEC"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageNECTEC' class='pageRemember' name='pageNECTEC' value='pageNECTEC'>");
							$("#tab4").append(data);
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			
			};
				//		$("a[href=#tab5]").click(function(){

			var includeNANOTEC = function(){
				$.ajax({
						url:'nanotec.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"NANOTEC"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageNANOTEC' class='pageRemember' name='pageNANOTEC' value='pageNANOTEC'>");
							$("#tab5").append(data);
						/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			
			};

				//$("a[href=#tab6]").click(function(){
				var includeTMC = function(){
				$.ajax({
						url:'tmc.jsp',
						type:'GET',
						dataType:'html',
					//	data:$(this).serialize(),
						data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"TMC"},
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
							$(".pageRemember").remove();
							$("body").append("<input type='hidden' id='pageTMC' class='pageRemember' name='pageTMC' value='pageTMC'>");
							$("#tab6").append(data);
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							/*### Manage Tootip Stop###*/
						}
					});
			
			};
				


	 /*### jQuery Taps End Here ###*/




		 	$("form.#form_1 #submit1").trigger("click");
			$("a[href=#tab1]").trigger("click");
			});

			</script>
		<!-- End jQuery 0001-->


			<script type="text/javascript">
			   $(document).ready(function(){

				  /*jQuery End Here  ### File Config ###*/

			   });
			</script>
			<script type="text/javascript">
			   $(document).ready(function(){
			   });
			</script>

		<!--------------------------- End Configuration --------------------------->
		</div>
	
	</div>
	<!--------------------------- Details Start--------------------------->


	<div id="content">
			<div class="tootip" ><b>การลงทุนด้าน ว และ ท ในภาคการผลิต ภาคบริการและภาคการผลิต ภาคบริการและภาคเกษตรกรรม</b></div>
			<div id="tooltip"></div>
			<div id="tabBsc">
				<ul>
					<li>
					<a href="#tab1"> NSTDA</a>
					</li>
					<li>
					<a href="#tab2"> BIOTEC</a>
					</li>
					<li>
					<a href="#tab4"> NECTEC</a>
					</li>
					<li>
					<a href="#tab5"> NANOTEC</a>
					</li>
					<li>
					<a href="#tab3"> MTEC</a>
					</li>
					<li>
					<a href="#tab6"> TMC</a>
					</li>
					<li>
					<a href="#tab1_3"> CPMO-HRD</a>
					</li>
					<li>
					<a href="#tab1_1"> NS </a>
					</li>
					<li>
					<a href="#tab1_2"> CT </a>
					</li>
				
				</ul>
				<div id="tab1">
				</div>
				<div id="tab1_1">
				</div>
				<div id="tab1_2">
				</div>
				<div id="tab1_3">
				</div>
				<div id="tab2">
				</div>
				<div id="tab3">
				</div>
				<div id="tab4">
				</div>
				<div id="tab5">
				</div>
				<div id="tab6">
				</div>
			</div>

	
	</div>
	<div id="loading" ></div>
	

	<!--------------------------- Details End--------------------------->

	</body>
</html>
