<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%
// Jsp  Server-side
//Define Connection
String connectionURL="jdbc:mysql://localhost/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
//Define Connection

//set variable
String V_Year = ""; // Values of Parameter Organization
String V_Month = ""; // Values of Parameter Sales Region
String V_Org = ""; // Values of Parameter Branch
//set variable

Connection conn= null;
Statement st;
ResultSet rs;


//Query Handler Organization start
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
//Query Handler Organization end

//Query Handler Year start
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
//Query Handler Year end


//Query Handler Month start
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
//Query Handler Month end


%>
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
					width: 960px;
					position: relative;
					background:#008EC3 ;
					font-weight:bold;
					color:white;
				}
				#tabHr{
				width:960px;
				margin:auto;
				}
			</style>


	

	<script type="text/javascript">
		/*#### Tab search above top start ###*/
	$(document).ready(function(){
	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
	

	/*### jQuery Funtions Start ###*/


	/*### Function Ajax Management Start###*/
	var includeHr_1 = function(){
		//AJAX1
				$.ajax({
					url:'hr.jsp',
					type:'get',
					dataType:'html',
					//catch:false,
					data:{"ParamMonth":$("#ParamMonthSubmit").val(),"ParamYear":$("#ParamYearSubmit").val(),"ParamOrg":$("#ParamOrgSubmit").val()},
					success:function(data){
						//alert(data);
						$("#content1").append(data);
					}
					
				});
				//AJAX1
	} 

	var includeNpr_2 = function(){
		$.ajax({
		url:'npr.jsp',
		type:'get',
		dataType:'html',
		data:{"ParamMonth":$("#ParamMonthSubmit").val(),"ParamYear":$("#ParamYearSubmit").val(),"ParamOrg":$("#ParamOrgSubmit").val()},
		success:function(data){
		//alert("hellodworld");
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
			//delete all area content
			
			$("#content1").empty();
			$("#content2").empty();
			//$("a[href=#content1]").trigger("click");
			
			$("#contentMain").show();
			$("#tabHr").tabs();
			$(".ui-tabs-panel").css("padding","0px");
			
				console.log($("#ParamMonth").val());
				console.log($("#ParamYear").val());
				console.log($("#ParamOrg").val());
				
				//AJAX1
				$.ajax({
					url:'hr.jsp',
					type:'get',
					dataType:'html',
					catch:false,
					data:{"ParamMonth":$("#ParamMonth").val(),"ParamYear":$("#ParamYear").val(),"ParamOrg":$("#ParamOrg").val()},
					success:function(data){
					//	$("#content1").append(data);
					
						$(".paramSubmit").remove();

						$("body").append("<input type='text' value='"+$("#ParamMonth").val()+"' name='ParamMonthSubmit' id='ParamMonthSubmit' class='paramSubmit'> ");
						$("body").append("<input type='text' value='"+$("#ParamYear").val()+"' name='ParamYearSubmit' id='ParamYearSubmit' class='paramSubmit'>");
						$("body").append("<input type='text' value='"+$("#ParamOrg").val()+"' name='ParamOrgSubmit' id='ParamOrgSubmit' class='paramSubmit'>");
						
						$("a[href=#content1]").trigger("click");
					}
					
				});
				//AJAX1

			//includeHr_1();
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
					<select name="ParamOrg" id="ParamOrg">
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