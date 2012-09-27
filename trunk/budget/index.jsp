<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<!doctype html>
 <html>
    <head>
        <title>Budgeting Dashboard</title>
		<link href="budget.css" rel="stylesheet" type="text/css">
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
/*
			.ui-progressbar .ui-progressbar-value { 	
				background: url("images/progressbar.gif");
			}
*/
			.contentMain{
			display:none;
			width: 960px;
			margin:auto;
			}
			#tabs{
			display:none;
			width: 960px;
			margin:auto;
			
			}
		</style>
		<style scoped>
				#Main-Panel{
					margin:0px;
					margin-bottom:2px;
					padding: 3px;
					border: 1px solid #dedede;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
				/*	min-height: 30px;*/
					width:960px;
					position: relative;
					font-weight:bold;
					color:white;
					background-color:#008EC3 ;
				}
			</style>
	<%
String center_name="";
		/*------------------- Set Variable -------------------*/

		String ParamYear = "";
		String ParamMonth = "";
		String ParamOrg = "";

		String V_Year = ""; // Values of Parameter Organization
		String V_Month = ""; // Values of Parameter Sales Region
		String V_Org = ""; // Values of Parameter Branch

		/*------------------- End Set Variable -------------------*/


		/*------------------- Parameter Year -------------------*/
		String Query1 ="";
		int i = 0;
		Query="CALL sp_fiscal_year;";
		rs = st.executeQuery(Query);
		ResultSet rs1;
		Statement st1;

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



//		------------------- End Parameter Year -------------------*/

		/*------------------- Parameter Month -------------------*/
		
		Query="CALL sp_fiscal_month;";
		rs = st.executeQuery(Query);
		i = 0;
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
		//		------------------- End Parameter Month -------------------*/
		/*------------------- Organization Parameter -------------------*/


		V_Org +="<option value=\"NSTDA\">สก.</option>";
		V_Org +="<option value=\"BIOTEC\">ศช. </option>";
		V_Org +="<option value=\"MTEC\">ศว.</option>";
		V_Org +="<option value=\"NECTEC\">ศจ.</option>";
		V_Org +="<option value=\"NANOTEC\">ศน.</option>";


		/*------------------- End Organization Parameter -------------------*/
		//====================select1 query ============================
		String select1 ="";//"<option value=\"ALL\" >สวทช</option><option value=\"BIOTEC\" >ศช.</option>";

		Query="CALL sp_program_group;";
		rs = st.executeQuery(Query);
		i = 0;
		while(rs.next()){
			if(i==0){
				select1 += "<option value="+rs.getString("pg_code")+" selected='selected'>"+rs.getString("pg_name")+"</option>";
			}else{
				select1 += "<option value="+rs.getString("pg_code")+">"+rs.getString("pg_name")+"</option>";
			}
			i++;
		}

		String select2 ="";// "<option value=\"Food\" id=\"select21\">คลัสเตอร์อาหารและการเกษตร</option><option value=\"Uranium\" id=\"select22\">ยูเรเนียม</option>";

		///////////////===================================== Select2 Query ============================

		Query="select distinct cluster from dim_project_io_cctr where budget_type = 'project'  and grp_cluster = '01-Cluster' order by cluster";
		rs = st.executeQuery(Query);
		i = 0;
		while(rs.next()){
			if(i==0){
				select2 += "<option value="+rs.getString("cluster")+" selected='selected'>"+rs.getString("cluster")+"</option>";
			}else{
				select2 += "<option value="+rs.getString("cluster")+">"+rs.getString("cluster")+"</option>";
			}
			i++;
		}




	%>

	<script type="text/javascript">
//===================================== Function to add comma in decimal
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
//==========================================end=====================

		

		var conURL = "<%=connectionURL%>";
		var pw = "<%=Pass%>";
		var ParamYear = "<%=ParamYear%>";
		var ParamMonth = "<%=ParamMonth%>";
		//var ParamOrg = "<%=ParamOrg%>";

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

			   /*#### Tab search above top start ###*/
	$(document).ready(function(){
	  $("#ParamYear").kendoDropDownList();

	  $("#ParamMonth").kendoDropDownList();

	  $("#ParamOrg").kendoDropDownList();
	var dropdownList1 = $("#select1").kendoDropDownList();
	var dropdownList2 =$("#select2").kendoDropDownList();

	/*### jQuery Funtions Start ###*/

	/*### Main Content Start ###*/
	
		$("form#form_1").submit(function(){
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$("#tabs").show();
				$(".paramSubmit").remove();
				$("body").append("<input type='hidden' value='"+$("#ParamMonth").val()+"' name='ParamMonthSubmit' id='ParamMonthSubmit' class='paramSubmit'> ");
				$("body").append("<input type='hidden' value='"+$("#ParamYear").val()+"' name='ParamYearSubmit' id='ParamYearSubmit' class='paramSubmit'>");

				if($("#pageCon1").val()){
						$("a[href=#content1]").trigger("click");
				}else if($("#pageCon2").val()){
						$("a[href=#content2]").trigger("click");
				}else if($("#pageCon3").val()){
						$("a[href=#content3]").trigger("click");
				}else if($("#pageCon4").val()){
						$("a[href=#content4]").trigger("click");
				}else if($("#pageCon5").val()){
						$("a[href=#content5]").trigger("click");
				}else{
						$("a[href=#content1]").trigger("click");
				}

				//$("#tabs").slideDown(500,function(){
					//$("a[href=#content1]").trigger("click");

		//	});

	return false;
	});
	$("a[href=#content1]").click(function(){
			includeCon1();
	});

	$("a[href=#content2]").click(function(){
			includeCon2();
	});

		$("a[href=#content3]").click(function(){
			includeCon3();
	});

	$("a[href=#content4]").click(function(){
			includeCon4();
	});

	$("a[href=#content5]").click(function(){
			includeCon5();
	});

	/*### Main Content Start ###*/
	

	/*### Tabs Content Start ###*/
		$("#select1").change(function(){
				$.ajax({
				url:"content1.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"pg_code":$(this).val()},
				success:function(data){
					console.log(data);
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart1(serie1,category1);
					colorSufferRow();
	/*
					var progressbarID1 =["111","112","113","114","115","116","117","118","119","1110"];
					var progressbarID2 =["121","122","123","124","125","126","127","128","129","1210"];
					var dataValueID1 = [4,6,8,10,12,14,16,18,20,22];
					var dataNameID1 = [5,7,9,11,13,15,17,19,21,23];
					var dataValueID2 = [24,26,28,30,32,34,36,38,40,42];
					var dataNameID2 = [25,27,29,31,33,35,37,39,41,43];
					var lengthProgressBar1 = data[2]["lengthProgressBar1"];
					var lengthProgressBar2 = data[3]["lengthProgressBar2"];
					for(var i=0;i<lengthProgressBar1;i++){
						callProgressbar(progressbarID1[i],parseFloat(data[dataValueID1[i]]["value"]).toFixed(2),data[dataNameID1[i]]["name"]);
					}
					for(var i=0;i<lengthProgressBar1;i++){
						callProgressbar(progressbarID2[i],parseFloat(data[dataValueID2[i]]["value"]).toFixed(2),data[dataNameID2[i]]["name"]);
					}
*/								
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+data[42]["active_category"]);

					callProgressbar("111",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("112",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("113",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("114",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("115",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("116",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("117",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("118",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("119",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("1110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("121",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("122",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("123",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("124",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("125",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("126",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("127",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("128",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("129",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("1210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);

				}
			});
		});

		$("#select2").change(function(){
				//alert($(this).val());
				$.ajax({
				url:"content2.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"cluster":$(this).val()},
				success:function(data){

					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					//console.log(serie1);
					//console.log(category1);

					barChart21(serie1,category1);

					colorSufferRow();
									$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+data[42]["active_category"]);

					callProgressbar("211",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("212",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("213",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("214",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("215",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("216",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("217",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("218",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("219",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("2110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("221",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("222",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("223",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("224",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("225",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("226",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("227",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("228",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("229",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("2210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);

					/*
					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart22(serie2,category2);

					var serie3 = data[4]["series3"];
					var category3 = data[5]["category3"];
					barChart23(serie3,category3);
				*/
				}
			});
		});

	var includeCon1 = function(){
//	$("a[href=#content1]").click(function(){
		var dropDown = $("#select1").data("kendoDropDownList");
		dropDown.select(0);				
			$.ajax({
				url:"content1.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonthSubmit").val(),"year":$("#ParamYearSubmit").val(),"pg_code":$("#select1").val()},
				//data:{"ParamYear":$("#ParamYearSubmit").val(),"ParamMonth":$("#ParamMonthSubmit").val(),"ParamOrg":"NS"},
				success:function(data){

				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$(".pageRemember").remove();
				$("body").append("<input type='hidden' id='pageCon1' class='pageRemember' name='pageCon1' value='pageCon1'>");

				$("#content1").slideDown("slow",function(){
					console.log(data);
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart1(serie1,category1);
				});
				
				/*### call function sufferRow  Start ###*/
				colorSufferRow();
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+data[42]["active_category"]);

				callProgressbar("111",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
				callProgressbar("112",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
				callProgressbar("113",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
				callProgressbar("114",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
				callProgressbar("115",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
				callProgressbar("116",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
				callProgressbar("117",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
				callProgressbar("118",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
				callProgressbar("119",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
				callProgressbar("1110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


				callProgressbar("121",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
				callProgressbar("122",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
				callProgressbar("123",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
				callProgressbar("124",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
				callProgressbar("125",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
				callProgressbar("126",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
				callProgressbar("127",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
				callProgressbar("128",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
				callProgressbar("129",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
				callProgressbar("1210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);

				/*### call function sufferRow  End ###*/
		
				
				}
			});
			return false;
	};
	var includeCon2 = function(){
	//$("a[href=#content2]").click(function(){
			var dropDown = $("#select2").data("kendoDropDownList");
			dropDown.select(0);
			//alert($("#select2").val());
			$.ajax({
				url:"content2.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"cluster":$("#select2").val()},
				success:function(data){
					//console.log(data);

				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$(".pageRemember").remove();
				$("body").append("<input type='hidden' id='pageCon2' class='pageRemember' name='pageCon2' value='pageCon2'>");

				//$("#content2").append(data).hide();
				$("#content2").slideDown("slow",function(){
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart21(serie1,category1);		
					colorSufferRow();
					console.log(data);
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+data[42]["active_category"]);

					callProgressbar("211",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("212",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("213",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("214",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("215",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("216",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("217",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("218",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("219",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("2110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("221",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("222",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("223",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("224",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("225",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("226",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("227",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("228",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("229",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("2210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);

				});
				
				//$("#select2").kendoDropDownList();
				
				}
			});
			return false;
	};
	var includeCon3 = function(){
		//$("a[href=#content3]").click(function(){
			$.ajax({
				url:"content3.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
				success:function(data){
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$(".pageRemember").remove();
				$("body").append("<input type='hidden' id='pageCon3' class='pageRemember' name='pageCon3' value='pageCon3'>");

				$("#content3").slideDown(function(){

					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart31(serie1,category1);
					colorSufferRow();
					console.log(data);

				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+data[42]["active_category"]);

					callProgressbar("311",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("312",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("313",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("314",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("315",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("316",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("317",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("318",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("319",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("3110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("321",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("322",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("323",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("324",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("325",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("326",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("327",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("328",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("329",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("3210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);


				});
			
				
				}
			});
			return false;
	};
	var includeCon4 = function(){
//	$("a[href=#content4]").click(function(){

			$.ajax({
				url:"content4.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
				success:function(data){
				
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$(".pageRemember").remove();
				$("body").append("<input type='hidden' id='pageCon4' class='pageRemember' name='pageCon4' value='pageCon4'>");

				$("#content4").slideDown("slow",function(){

					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart41(serie1,category1);
					colorSufferRow();
					console.log(data);
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Cost Center Most Spending of "+data[42]["active_category"]);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Cost Center Least Spending of "+data[42]["active_category"]);

					callProgressbar("411",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("412",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("413",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("414",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("415",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("416",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("417",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("418",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("419",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("4110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("421",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("422",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("423",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("424",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("425",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("426",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("427",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("428",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("429",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("4210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);


				});
			
				
				}
			});
			return false;
	};

//	$("a[href=#content5]").click(function(){
	var includeCon5 = function(){

			$.ajax({
				url:"content5.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
				success:function(data){
					console.log(data);
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$(".pageRemember").remove();
				$("body").append("<input type='hidden' id='pageCon5' class='pageRemember' name='pageCon5' value='pageCon5'>");
				$("#content5").slideDown("slow",function(){
				var serie1 = data[0]["series1"];
				var category1 = data[1]["category1"];
				barChart51(category1,serie1);

				var value = data[3]["value_pie"];
				var sum = data[2]["totalPie"];
			    var value_center = data[4]["active_category"];
				//console.log(data[4]["active_category"]);
				pieChart52(value,sum,value_center);
				
				});
			
				
				}
			});
			return false;
	};

	
		$("#tabs").tabs();
	/*### Tabs Content End ###*/
    /*### barChart1 Start###*/

var barChart1 = function(seriesParam,categoryParam){
	//alert("hello barChart");
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart1").kendoChart({
			theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text: " "
			},
			//seriesClick:onSeriesClick,
			chartArea: {
			height: 260
			 },
			legend: {
                            position: "right"
            },
			series: seriesParam,
				/*[
				 { 
						 name: "แผน",
						data: [600,170,700,100,250,900,150,160],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "Release",
                            data: [300,130,700,70,20,900,60,60]
						
						

                   } ,
				 {
                            name: "ผูกพัน",
                            data: [20,10,60,10,0,700,5,10]
						
						

                   } ,
				 {
                            name: "เบิกจ่าย",
                            data: [50,60,200,10,0,700,10,15]
						
						

                   }
				
				 
			],*/
			valueAxis: {
							// ie can not reading font-size
                           title: {text: "งบประมาณ(ล้านบาท)" , font:"14px Tahoma"}
						   //title: {text: "งบประมาณ(ล้านบาท)" },
                       
						
							
		
							
                        },

			categoryAxis:{
			categories: categoryParam//[ "Cluster", "Platform", "Essential Program","Improvement Project","Director Initiative", "Investment", "Seed Money", "Others" ]
					
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(parseFloat(value).toFixed(2))# ล้านบาท"
                        }, seriesClick:funContent1

		});
}


	/*### barChart1 End ###*/
				
	function funContent1(e){
			var category = e.category;
			$.ajax({
				url:'content1_1.jsp',
				type:'get',
				dataType:'json',
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"pg_code":$("#select1").val(),"spa":category},

				success:function(data){
				//console.log(data);
				colorSufferRow();
/*
				var progressbarID1 =["111","112","113","114","115","116","117","118","119","1110"];
				var progressbarID2 =["121","122","123","124","125","126","127","128","129","1210"];
				var dataValueID1 = [4,6,8,10,12,14,16,18,20,22];
				var dataNameID1 = [5,7,9,11,13,15,17,19,21,23];
				var dataValueID2 = [24,26,28,30,32,34,36,38,40,42];
				var dataNameID2 = [25,27,29,31,33,35,37,39,41,43];
				var lengthProgressBar1 = data[2]["lengthProgressBar1"];
				var lengthProgressBar2 = data[3]["lengthProgressBar2"];
				for(var i=0;i<lengthProgressBar1;i++){
					callProgressbar(progressbarID1[i],parseFloat(data[dataValueID1[i]]["value"]).toFixed(2),data[dataNameID1[i]]["name"]);
				}
				for(var i=0;i<lengthProgressBar2;i++){
					callProgressbar(progressbarID2[i],parseFloat(data[dataValueID2[i]]["value"]).toFixed(2),data[dataNameID2[i]]["name"]);
				}
*/
				console.log(data);
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+category);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+category);

				callProgressbar("111",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
				callProgressbar("112",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
				callProgressbar("113",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
				callProgressbar("114",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
				callProgressbar("115",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
				callProgressbar("116",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
				callProgressbar("117",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
				callProgressbar("118",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
				callProgressbar("119",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
				callProgressbar("1110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


				callProgressbar("121",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
				callProgressbar("122",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
				callProgressbar("123",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
				callProgressbar("124",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
				callProgressbar("125",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
				callProgressbar("126",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
				callProgressbar("127",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
				callProgressbar("128",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
				callProgressbar("129",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
				callProgressbar("1210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);

					/*
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart22(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart23(serie2,category2);
					*/
					}
			});
}

	  /*### barChart2Start###*/

var barChart2 = function(a,b,c,d,e,f,g,h,i,j){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart2").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: [{
                            name: "Project",
                            data: [a,b,c,d,e,f,g,h,i,j]
                        }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: ["Project Z", "Project Y", "Project X", "Project W", "Project V", "Project U", "Project T", "Project S", "Project R", "Project Q"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart2 End ###*/
	  /*### barChart3 Start###*/

var barChart3 = function(a,b,c,d,e,f,g,h,i,j){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart3").kendoChart({
						theme:$(document).data("kendoSkin") || "metro",
						title: {
                            text: "Top 10 project  least spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: [{
                            name: "Project",
                            data: [a,b,c,d,e,f,g,h,i,j]
                        }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: ["Project A", "Project B", "Project C", "Project D", "Project E", "Project F", "Project H", "Project I", "Project J", "Project K"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart3 End ###*/



function onSeriesClick(e){
//alert(e.category);
//alert($("#row211 .head .title").html());
var trim =$.trim(e.category);

if(trim=="Cluster"){
$("#row211 .head .title").html("แหล่งทุน "+trim);
barChart2(1, 7, 10, 13.5, 16.6, 16.6, 20, 40,43, 49);
barChart3(57,56,55,54,53,52,51,45,12,11);

}else if(trim=="Platform"){
$("#row211 .head .title").html("แหล่งทุน "+trim);
barChart2(1, 7, 10, 13.5, 16.6, 16.6, 20, 40,43, 49);
barChart3(57,56,55,54,53,52,51,45,12,11);

}else if(trim=="Improvement Project"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);
$("#row211 .head .title").html("แหล่งทุน "+trim);

}else if(trim=="Essential Program"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);
$("#row211 .head .title").html("แหล่งทุน "+trim);

}else if(trim=="Director Initiative"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);

}else if(trim=="Investment"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);
$("#row211 .head .title").html("แหล่งทุน "+trim);

}else if(trim=="Seed Money"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);
$("#row211 .head .title").html("แหล่งทุน "+trim);

}else if(trim=="Others"){
barChart2(1, 2, 3, 4, 4, 5, 6, 7,8, 9);
barChart3(57,56,55,54,53,52,51,45,12,11);
$("#row211 .head .title").html("แหล่งทุน "+trim);

}

	
	
	
	


}






	  /*### barChart21 Start###*/

var barChart21 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart21").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: " "
			},
			chartArea: {
			height: 260
			 },
			legend: {
                            position: "right"
            },
			series: seriesParam,/*[
				 { 
						 name: "แผน",
						data: [600,170,700,100,250,900,150,160,600,170,700,100,250,900,150],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "Release",
                            data: [300,130,700,70,20,900,60,60,300,130,700,70,20,900,60]
						
						

                   } ,
				 {
                            name: "ผูกพัน",
                            data: [20,10,60,10,0,700,5,10,20,10,60,10,0,700,5]
						
						

                   } ,
				 {
                            name: "เบิกจ่าย",
                            data: [50,60,200,10,0,700,10,15,50,60,200,10,0,700,10]
						
						

                   }
				
				 
			],*/
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" ,font:"14px Tahoma"},
                           // min: 0,
                            //max: 1200
                        },

			categoryAxis:{
			categories: categoryParam,// [ "B1","A1","A7","A8","B1-1","B1-2","B1-3","B1-4","B1-5","B1-6","B1-7","B1-8","B1-9","B1-10","B1-11" ],
			
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(parseFloat(value).toFixed(2))# ล้านบาท"
                        },
							seriesClick:funContent2
		});
}
	/*### barChart21 End ###*/

	function funContent2(e){
			var category = e.category;
			$.ajax({
				url:'content2_1.jsp',
				type:'get',
				dataType:'json',
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"cluster":$("#select2").val(),"spa":category},

				success:function(data){
					colorSufferRow();
									$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+category);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+category);

					try{
					callProgressbar("211",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("212",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("213",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("214",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("215",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("216",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("217",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("218",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("219",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("2110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("221",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("222",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("223",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("224",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("225",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("226",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("227",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("228",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("229",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("2210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);
					}
					catch(err)
						{
						console.log(err);
					}
					/*
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart22(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart23(serie2,category2);
					*/
					}
			});
}

	  /*### barChart22Start###*/

var barChart22 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart22").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: [{
                            name: "Project",
                            data: [15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89]
                        }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: ["Project Z", "Project Y", "Project X", "Project W", "Project V", "Project U", "Project T", "Project S", "Project R", "Project Q"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart22 End ###*/
	  /*### barChart23 Start###*/

var barChart23 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart23").kendoChart({
						theme:$(document).data("kendoSkin") || "metro",
						title: {
                            text: "Top 10 project  least spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: [{
                            name: "Project",
                            data: [89,85,80,75,70,68,66,65,63,60]
                        }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: ["Project A", "Project B", "Project C", "Project D", "Project E", "Project F", "Project H", "Project I", "Project J", "Project K"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart23 End ###*/

	/*### barChart31 Start###*/
var barChart31 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart31").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: " "
			},
			chartArea: {
			height: 260
			 },
			legend: {
                            position: "right"
            },
			series: seriesParam,
				/*[
				 { 
						 name: "แผน",
						data: [1400,190,190,210,180,50],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "Release",
                            data: [1350,180,180,200,170,40]
						
						

                   } ,
				 {
                            name: "ผูกพัน",
                            data: [800,30,40,50,30,10]
						
						

                   } ,
				 {
                            name: "เบิกจ่าย",
                            data: [390,70,60,70,70,20]
						
						

                   }
				
				 
			],*/
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" ,font:"14px Tahoma"},
                          /*  min: 0,
                            max: 1200
							*/
                        },

			categoryAxis:{
			categories: categoryParam,//[ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
			
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(parseFloat(value).toFixed(2))# ล้านบาท"
                        },
						seriesClick:funContent3
		});
}
	/*### barChart31 End ###*/

function funContent3(e){
			var center = e.category;
			$.ajax({
				url:'content3_1.jsp',
				type:'get',
				dataType:'json',
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"center":center},

				success:function(data){

				colorSufferRow();
					console.log(data);
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Project Most Spending of "+center);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Project Least Spending of "+center);

					callProgressbar("311",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("312",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("313",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("314",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("315",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("316",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("317",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("318",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("319",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("3110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("321",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("322",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("323",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("324",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("325",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("326",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("327",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("328",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("329",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("3210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);
					/*
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart32(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart33(serie2,category2);*/
				}
			});
}



	  /*### barChart32Start###*/

var barChart32 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart32").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                           // position: "bottom"
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: seriesParam,// [{
                           // name: "Project",
                         //   data: [15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89]
                     //   }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam//["Project Z", "Project Y", "Project X", "Project W", "Project V", "Project U", "Project T", "Project S", "Project R", "Project Q"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart32 End ###*/
	  /*### barChart33 Start###*/

var barChart33 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart33").kendoChart({
						title: {
                            text: "Top 10 project  least spending"
                        },
						theme:$(document).data("kendoSkin") || "metro",
						
					
                        legend: {
                            position: "bottom",
								visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: seriesParam,// [{
                          //  name: "Project",
                         //   data: [89,85,80,75,70,68,66,65,63,60],
							//color:"red"
                     //   }],
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam//["Project A", "Project B", "Project C", "Project D", "Project E", "Project F", "Project H", "Project I", "Project J", "Project K"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart33 End ###*/

	/*### barChart41 Start###*/
var barChart41 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart41").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: " "
			},
			chartArea: {
			height: 260
			 },
			legend: {
                            position: "right"
            },
			series: seriesParam,
				/* [
				 { 
						 name: "แผน",
						data: [270,90,100,80,110,30],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "ผูกพัน",
                            data: [90,30,30,40,30,10]
						
						

                   } ,
				 {
                            name: "เบิกจ่าย",
                            data: [70,40,30,40,30,10]
						
						

                   }
				
				 
			],*/
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)",font:"14px Tahoma" },
                          /*  min: 0,
                            max: 1200
							*/
                        },

			categoryAxis:{
			categories: categoryParam, // [ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
			
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(parseFloat(value).toFixed(2))# ล้านบาท"
                        },
						seriesClick:funContent4
		});
}

function funContent4(e){
			var center = e.category;
			$.ajax({
				url:'content4_1.jsp',
				type:'get',
				dataType:'json',
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"center":center},

				success:function(data){
					colorSufferRow();
				$("#contentL .projectHead1").empty();
				$("#contentL .projectHead1").append("Top 10 Cost Center Most Spending of "+center);
				$("#contentR .projectHead1").empty();
				$("#contentR .projectHead1").append("Top 10 Cost Center Least Spending of "+center);

					callProgressbar("411",parseFloat(data[2]["value"]).toFixed(2),data[3]["name"]);
					callProgressbar("412",parseFloat(data[4]["value"]).toFixed(2),data[5]["name"]);
					callProgressbar("413",parseFloat(data[6]["value"]).toFixed(2),data[7]["name"]);
					callProgressbar("414",parseFloat(data[8]["value"]).toFixed(2),data[9]["name"]);
					callProgressbar("415",parseFloat(data[10]["value"]).toFixed(2),data[11]["name"]);
					callProgressbar("416",parseFloat(data[12]["value"]).toFixed(2),data[13]["name"]);
					callProgressbar("417",parseFloat(data[14]["value"]).toFixed(2),data[15]["name"]);
					callProgressbar("418",parseFloat(data[16]["value"]).toFixed(2),data[17]["name"]);
					callProgressbar("419",parseFloat(data[18]["value"]).toFixed(2),data[19]["name"]);
					callProgressbar("4110",parseFloat(data[20]["value"]).toFixed(2),data[21]["name"]);


					callProgressbar("421",parseFloat(data[22]["value"]).toFixed(2),data[23]["name"]);
					callProgressbar("422",parseFloat(data[24]["value"]).toFixed(2),data[25]["name"]);
					callProgressbar("423",parseFloat(data[26]["value"]).toFixed(2),data[27]["name"]);
					callProgressbar("424",parseFloat(data[28]["value"]).toFixed(2),data[29]["name"]);
					callProgressbar("425",parseFloat(data[30]["value"]).toFixed(2),data[31]["name"]);
					callProgressbar("426",parseFloat(data[32]["value"]).toFixed(2),data[33]["name"]);
					callProgressbar("427",parseFloat(data[34]["value"]).toFixed(2),data[35]["name"]);
					callProgressbar("428",parseFloat(data[36]["value"]).toFixed(2),data[37]["name"]);
					callProgressbar("429",parseFloat(data[38]["value"]).toFixed(2),data[39]["name"]);
					callProgressbar("4210",parseFloat(data[40]["value"]).toFixed(2),data[41]["name"]);
					/*
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart42(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart43(serie2,category2);*/
				}
			});
}

	/*### barChart41 End ###*/
	  /*### barChart42Start###*/

var barChart42 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
			
			$("#barChart42").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: seriesParam,
							/*[{
                            name: "Project",
                            data: [15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89]
                        }],*/
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam//["Project Z", "Project Y", "Project X", "Project W", "Project V", "Project U", "Project T", "Project S", "Project R", "Project Q"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart42 End ###*/
	  /*### barChart43 Start###*/

var barChart43 = function(seriesParam,categoryParam){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart43").kendoChart({
						theme:$(document).data("kendoSkin") || "metro",
						title: {
                            text: "Top 10 project  least spending"
                        },
					
                        legend: {
                            position: "bottom",
							visible:false
                        },
                        chartArea: {
                            background: "",
							height:290
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: seriesParam,
							/*[{
                            name: "Project",
                            data: [89,85,80,75,70,68,66,65,63,60]
                        }],*/
                        valueAxis: {
                            labels: {
                                format: "{0}%"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam //["Project A", "Project B", "Project C", "Project D", "Project E", "Project F", "Project H", "Project I", "Project J", "Project K"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
		});
}
	/*### barChart43 End ###*/


	/*### barChart51 Start###*/
var barChart51 = function(categoryParam,seriesParam){
			$("#barChart51").kendoChart({	
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: " "
			},
			chartArea: {
			height: 300
			 },
			legend: {
                            position: "right"
            },
			series: seriesParam,
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" ,font:"14px Tahoma"},
                
                        },

			categoryAxis:{
			categories: categoryParam,
			
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(parseFloat(value).toFixed(2))# ล้านบาท"
                        },
						seriesClick:funContent5
		});
}
	/*### barChart51 End ###*/

	function funContent5(e){
			var center = e.category;
			$.ajax({
				url:'content5_1.jsp',
				type:'get',
				dataType:'json',
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"center":center},

				success:function(data){
					var sum = data[0]["totalPie"];
					var value = data[1]["value_pie"];
					//console.log(center);
					pieChart52(value,sum,center);
					}
			});
}

	  /*### barChart52Start###*/

var pieChart52 = function(valueParam,sumParam,center){
	var textIO = "สัดส่วนจำนวน IO ของ "+center;
			$("#pieChart52").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: textIO,font:"14px Tahoma"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
                        },
                        seriesDefaults: {
                            type: "pie"
                        },
                       series: [{
                            type: "pie",
                            data: valueParam
								/*[ {
                                category: "IO ที่ปิดแล้ว ",
                                value: 30
                            }, {
                                category: "IO ที่เหลืออยู่",
                                value: 70
                            }]*/
                        }],
                        valueAxis: {
                            labels: {
								visible: true,
                                format: "{0}%"
                            }
                        },
                        
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
							 template: "#= templateFormat(value,"+sumParam+") #"
                        }
		});
}
	/*### pieChart52 End ###*/

	/*###  jQuery Config Start ###*/
	

	$(".ui-tabs-panel").css("padding","0px");

	/*###  jQuery Config End ###*/


	/*### jQuery Funtions End ###*/

	/*### Manage Table Start###*/
	var colorSufferRow = function(){
		//console.log($("table#top10Tbl"));
		
		$("table#top10Tbl tbody tr:odd").css({"background-color":"#dbeef3"});
		
	}

	/*### Manage Table End###*/

	/*### Set Manage  Progressbar###*/

	var callProgressbar=function($idChart,$value,$namePro){
			//alert($nameProgressbar);
			var bar = "#progressbar"+ $idChart;
			var percent = ".percentage .progressPer" + $idChart;
			var name = ".projectName .namePro" + $idChart;
			var value = parseInt($value) ;
				
			$(percent).empty();
			$(percent).append($value+"%");

			$(name).empty();
			$(name).append($namePro);

			$(bar).progressbar({
			value:value
			});
/*
			var pGress = setInterval(function(){
				var pVal = $(bar).progressbar('option', 'value');
				var pCnt = !isNaN(pVal) ? (pVal + 1) : 1;
				if (pCnt > 100) {
					 clearInterval(pGress);
				 } else {
				$(bar).progressbar({value: $value});
				 }		    
			},10);*/
		//var uiprogressbar = bar+" .ui-progressbar-value";
		/*Set Color progressbar*/
		$(".ui-corner-left").css({"background":"#008EC3 "});
		$(".value > .ui-corner-all").css("border-radius","0px");
		$(".ui-progressbar-value").css("border-radius","0px");
		$(".ui-progressbar").css("height","10px");
	}
	/*### Set Manage  Progressbar###*/
	});
/*###  pieChart hr  Defind start ###
function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}*/
function templateFormat(value,summ) {
   var value1 = addCommas(value.toFixed(2));
   var value2 = ((value/summ)*100).toFixed(2);
   return value1 + " , " + value2 + " %";
}

/*### pieChart hr  Defind   end ###*/

	</script>



    </head>
    <body>



		



	<!--------------------------- HEADER --------------------------->

<!--<h2><center><font color="black">Budgeting Dashboard</font></center></h2>-->

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
	<div id="tabs">
		<ul>
			<li><a href="#content1">งบโครงการ-แหล่งทุน</a></li>
			<li><a href="#content2">งบโครงการ-แหล่งทุน(คลัสเตอร์)</a></li>
			<li><a href="#content3">งบโครงการ-ผู้ดำเนินการ</a></li>
			<li><a href="#content4">งบหน่วยงาน</a></li>
			<li><a href="#content5">งบครุภัณฑ์-หน่วยงาน</a></li>
		</ul>
		<div id="content1">
						<!--This is Content 1 html =========================================================================-->
<div id="content">
	<div id="row1">
		<div id="column11">
				<div class="head">
						<div class="title">
							<table>
								<tr>
									<td>
									แหล่งทุน :
									</td>
									<td>
									<select id="select1">
									<%=select1%>
									</select>

									</td>
								</tr>
							</table>
						</div>
				</div>
				<div class="content">
				
						<div id="barChart1"></div>
						<center><b>แหล่งทุน</b></center><br>
				</div>
		</div>
	</div>
	<div  id="row2">
		<div id="column21">
			<div id="row211">
				<div class="head">
					<!--<div class="title">
					
					</div>-->
				</div>
			</div>
			<div id="row212">
				<div class="content">
						<div id="contentL">
						
								<!--<div id="barChart2"></div>
								<div id="barChart12"></div>-->

								<table width="100%" id="top10Tbl" >
									<thead>
										<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Most Spending of </div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro111"></div></div></td>
											<td>
												<div class="projectValue">
														<div class="percentage">
															<div class="progressPer111">
																
															</div>
														</div>
														<div class="value">
															 <div id="progressbar111"></div>
														</div>
											  </div>
											</td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro112"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer112"></div>		
														</div>
														<div class="value">
															 <div id="progressbar112"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro113"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer113"></div>		
														</div>
														<div class="value">
															 <div id="progressbar113"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro114"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer114"></div>		
														</div>
														<div class="value">
															 <div id="progressbar114"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro115"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer115"></div>	
														</div>
														<div class="value">
															 <div id="progressbar115"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro116"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer116"></div>			
														</div>
														<div class="value">
															 <div id="progressbar116"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro117"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer117"></div>		
														</div>
														<div class="value">
															 <div id="progressbar117"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro118"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer118"></div>									
														</div>
														<div class="value">
															 <div id="progressbar118"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro119"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer119"></div>		
														</div>
														<div class="value">
															 <div id="progressbar119"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro1110"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer1110"></div>	
														</div>
														<div class="value">
															 <div id="progressbar1110"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>


						</div>
						<div id="contentR">
						
							<!-- #contentL .projectHead1
							#contentR .projectHead1
							<div id="barChart3"></div>
								<div id="barChart13"></div>-->
								<table width="100%" id="top10Tbl" >
									<thead>
									<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Least Spending</div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro121"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer121">
														</div>
														</div>
														<div class="value">
															 <div id="progressbar121"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro122"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer122"></div>									
														</div>
														<div class="value">
															 <div id="progressbar122"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro123"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer123"></div>									
														</div>
														<div class="value">
															 <div id="progressbar123"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro124"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer124"></div>	
														</div>
														<div class="value">
															 <div id="progressbar124"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro125"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer125"></div>
														</div>
														<div class="value">
															 <div id="progressbar125"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro126"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer126"></div>
														</div>
														<div class="value">
															 <div id="progressbar126"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro127"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer127"></div>
														</div>
														<div class="value">
															 <div id="progressbar127"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro128"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer128"></div>
														</div>
														<div class="value">
															 <div id="progressbar128"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro129"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer129"></div>
														</div>
														<div class="value">
															 <div id="progressbar129"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro1210"></div></div></td>
									<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer1210"></div>
														</div>
														<div class="value">
															 <div id="progressbar1210"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END=============================================================================================== -->
		</div>
		<div id="content2">
				<!--This is Content 2 html =========================================================================-->

		<div id="content">
	<div id="row1">
		<div id="column11">
				<div class="head">
						<div class="title">
							<table>
								<tr>
									<td>
									คลัสเตอร์ :
									</td>
									<td>
									<select id="select2"  style="width:300px;">
									<%=select2%>
									</select>
									</td>
								</tr>
							</table>
						</div>
				</div>
				<div class="content">
				
						<div id="barChart21"></div>
						<center><b>โปรแกรม</b></center><br>
				</div>
		</div>
	</div>
	<div  id="row2">
		<div id="column21">
			<div id="row211">
				<div class="head">
					<!--<div class="title">
					โปรแกรม
					</div>-->
				</div>
			</div>
			<div id="row212">
				<div class="content">
									<div id="contentL">
						
								<!--<div id="barChart2"></div>
								<div id="barChart12"></div>-->

								<table width="100%" id="top10Tbl" >
									<thead>
										<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Most Spending of </div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro211"></div></div></td>
											<td>
												<div class="projectValue">
														<div class="percentage">
															<div class="progressPer211">
																
															</div>
														</div>
														<div class="value">
															 <div id="progressbar211"></div>
														</div>
											  </div>
											</td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro212"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer212"></div>		
														</div>
														<div class="value">
															 <div id="progressbar212"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro213"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer213"></div>		
														</div>
														<div class="value">
															 <div id="progressbar213"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro214"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer214"></div>		
														</div>
														<div class="value">
															 <div id="progressbar214"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro215"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer215"></div>	
														</div>
														<div class="value">
															 <div id="progressbar215"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro216"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer216"></div>			
														</div>
														<div class="value">
															 <div id="progressbar216"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro217"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer217"></div>		
														</div>
														<div class="value">
															 <div id="progressbar217"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro218"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer218"></div>									
														</div>
														<div class="value">
															 <div id="progressbar218"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro219"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer219"></div>		
														</div>
														<div class="value">
															 <div id="progressbar219"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro2110"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer2110"></div>	
														</div>
														<div class="value">
															 <div id="progressbar2110"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>


						</div>
						<div id="contentR">
						
							<!--	<div id="barChart3"></div>
								<div id="barChart13"></div>-->
								<table width="100%" id="top10Tbl" >
									<thead>
									<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Least Spending</div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro221"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer221">
														</div>
														</div>
														<div class="value">
															 <div id="progressbar221"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro222"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer222"></div>									
														</div>
														<div class="value">
															 <div id="progressbar222"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro223"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer223"></div>									
														</div>
														<div class="value">
															 <div id="progressbar223"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro224"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer224"></div>	
														</div>
														<div class="value">
															 <div id="progressbar224"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro225"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer225"></div>
														</div>
														<div class="value">
															 <div id="progressbar225"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro226"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer226"></div>
														</div>
														<div class="value">
															 <div id="progressbar226"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro227"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer227"></div>
														</div>
														<div class="value">
															 <div id="progressbar227"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro228"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer228"></div>
														</div>
														<div class="value">
															 <div id="progressbar228"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro229"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer229"></div>
														</div>
														<div class="value">
															 <div id="progressbar229"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro2210"></div></div></td>
									<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer2210"></div>
														</div>
														<div class="value">
															 <div id="progressbar2210"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>
						</div>


						<!--
						<div id="contentL">
						
								<div id="barChart22"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart23"></div>
						</div>
						-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END =======================================================================================-->
		</div>
		<div id="content3">
				<!--This is Content 3 html ==================================================================-->
		<div id="content">
	<div id="row1"  style="height:295px;">
		<div id="column11">
				
				<div class="content">
				
						<div id="barChart31"></div>
						<center><b>ศูนย์</b></center><br>
				</div>
		</div>
	</div>
	<div  id="row2">
		<div id="column21">
			<div id="row211">
				<div class="head">
					<!--<div class="title">
					ศูนย์
					</div>-->
				</div>
			</div>
			<div id="row212">
				<div class="content">
							<div id="contentL">
						
								<!--<div id="barChart2"></div>
								<div id="barChart12"></div>-->

								<table width="100%" id="top10Tbl" >
									<thead>
										<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Most Spending of </div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro311"></div></div></td>
											<td>
												<div class="projectValue">
														<div class="percentage">
															<div class="progressPer311">
																
															</div>
														</div>
														<div class="value">
															 <div id="progressbar311"></div>
														</div>
											  </div>
											</td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro312"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer312"></div>		
														</div>
														<div class="value">
															 <div id="progressbar312"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro313"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer313"></div>		
														</div>
														<div class="value">
															 <div id="progressbar313"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro314"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer314"></div>		
														</div>
														<div class="value">
															 <div id="progressbar314"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro315"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer315"></div>	
														</div>
														<div class="value">
															 <div id="progressbar315"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro316"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer316"></div>			
														</div>
														<div class="value">
															 <div id="progressbar316"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro317"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer317"></div>		
														</div>
														<div class="value">
															 <div id="progressbar317"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro318"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer318"></div>									
														</div>
														<div class="value">
															 <div id="progressbar318"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro319"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer319"></div>		
														</div>
														<div class="value">
															 <div id="progressbar319"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro3110"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer3110"></div>	
														</div>
														<div class="value">
															 <div id="progressbar3110"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>


						</div>
						<div id="contentR">
						
							<!--	<div id="barChart3"></div>
								<div id="barChart13"></div>-->
								<table width="100%" id="top10Tbl" >
									<thead>
									<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Least Spending</div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro321"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer321">
														</div>
														</div>
														<div class="value">
															 <div id="progressbar321"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro322"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer322"></div>									
														</div>
														<div class="value">
															 <div id="progressbar322"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro323"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer323"></div>									
														</div>
														<div class="value">
															 <div id="progressbar323"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro324"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer324"></div>	
														</div>
														<div class="value">
															 <div id="progressbar324"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro325"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer325"></div>
														</div>
														<div class="value">
															 <div id="progressbar325"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro326"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer326"></div>
														</div>
														<div class="value">
															 <div id="progressbar326"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro327"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer327"></div>
														</div>
														<div class="value">
															 <div id="progressbar327"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro328"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer328"></div>
														</div>
														<div class="value">
															 <div id="progressbar328"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro329"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer329"></div>
														</div>
														<div class="value">
															 <div id="progressbar329"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro3210"></div></div></td>
									<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer3210"></div>
														</div>
														<div class="value">
															 <div id="progressbar3210"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>
						</div>
				<!--		<div id="contentL">
						
								<div id="barChart32"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart33"></div>
						</div>-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END -->
		</div>
		<div id="content4">
				<!--This is Content 4 html -->

		<div id="content">
	<div id="row1"  style="height:295px;">
		<div id="column11">
				<div class="content">
						<div id="barChart41"></div>
						<center><b>ศูนย์</b></center><br>
				</div>
		</div>
	</div>
	<div  id="row2" >
		<div id="column21">
			<div id="row211">
				<div class="head">
				</div>
			</div>
			<div id="row212">
				<div class="content">
							<div id="contentL">
						
								<!--<div id="barChart2"></div>
								<div id="barChart12"></div>-->

								<table width="100%" id="top10Tbl" >
									<thead>
										<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Most Spending of </div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro411"></div></div></td>
											<td>
												<div class="projectValue">
														<div class="percentage">
															<div class="progressPer411">
																
															</div>
														</div>
														<div class="value">
															 <div id="progressbar411"></div>
														</div>
											  </div>
											</td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro412"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer412"></div>		
														</div>
														<div class="value">
															 <div id="progressbar412"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro413"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer413"></div>		
														</div>
														<div class="value">
															 <div id="progressbar413"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro414"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer414"></div>		
														</div>
														<div class="value">
															 <div id="progressbar414"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro415"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer415"></div>	
														</div>
														<div class="value">
															 <div id="progressbar415"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro416"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer416"></div>			
														</div>
														<div class="value">
															 <div id="progressbar416"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro417"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer417"></div>		
														</div>
														<div class="value">
															 <div id="progressbar417"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro418"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer418"></div>									
														</div>
														<div class="value">
															 <div id="progressbar418"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro419"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer419"></div>		
														</div>
														<div class="value">
															 <div id="progressbar419"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro4110"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer4110"></div>	
														</div>
														<div class="value">
															 <div id="progressbar4110"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>


						</div>
						<div id="contentR">
						
							<!--	<div id="barChart3"></div>
								<div id="barChart13"></div>-->
								<table width="100%" id="top10Tbl" >
									<thead>
									<tr id="h1">
												<th colspan="2"><div class="projectHead1">Top 10 Project Least Spending</div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">% Remaining vs Plan</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName"><div class="namePro421"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer421">
														</div>
														</div>
														<div class="value">
															 <div id="progressbar421"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro422"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer422"></div>									
														</div>
														<div class="value">
															 <div id="progressbar422"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro423"></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer423"></div>									
														</div>
														<div class="value">
															 <div id="progressbar423"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro424"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer424"></div>	
														</div>
														<div class="value">
															 <div id="progressbar424"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro425"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer425"></div>
														</div>
														<div class="value">
															 <div id="progressbar425"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro426"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer426"></div>
														</div>
														<div class="value">
															 <div id="progressbar426"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro427"></div></div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer427"></div>
														</div>
														<div class="value">
															 <div id="progressbar427"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro428"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer428"></div>
														</div>
														<div class="value">
															 <div id="progressbar428"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro429"></div></div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer429"></div>
														</div>
														<div class="value">
															 <div id="progressbar429"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName"><div class="namePro4210"></div></div></td>
									<td>
											<div class="projectValue">
														<div class="percentage">
														<div class="progressPer4210"></div>
														</div>
														<div class="value">
															 <div id="progressbar4210"></div>
														</div>
											  </div>

											  </td>
										</tr>
									</tbody>
								</table>
						</div>
				<!--		<div id="contentL">
						
								<div id="barChart42"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart43"></div>

						</div>-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END -->
		</div>
		<div id="content5">
		<!--This is Content 5 html -->
<div id="content">
	<div id="row1"  style="height:340px;">
		<div id="column11">
				<div class="content"  style="height:340px;" >
						<div id="barChart" style="float:left; width:60%;">
							<div id="barChart51"></div>
						</div>
						<div id="pieChart" style="float:right;width:40%;">
							<div id="pieChart52"></div>
						</div>

						<center><b>ศูนย์</b></center>
				</div>
		</div>
	</div>
	
</div>
<br style="clear:both">
<!-- END -->

		</div>
		<br style="clear:both">
	</div>


<!-- TAB MANAGEMENT END -->

	</div>
	<div id="loading" ></div>

	<!--------------------------- Details End--------------------------->

	</body>
</html>