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
			.inlinesparkline{
			width:100px;
			height:100px;
			}
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

		Query="CALL sp_fiscal_year;";
		rs = st.executeQuery(Query);
		int i = 0;
		while(rs.next()){
			if(i==0){
				V_Year += "<option value=\""+rs.getString("fiscal_year")+"\"  selected='selected'>"+rs.getString("buddhist_era_year")+"</option>";
				ParamYear = rs.getString("fiscal_year");
				}else{
				V_Year += "<option value=\""+rs.getString("fiscal_year")+"\">"+rs.getString("buddhist_era_year")+"</option>";
				}
				i++;
		}
/*
		V_Year += "<option value=\"2012\"  selected='selected'>2555</option>";
		V_Year += "<option value=\"2011\">2554</option>";
		V_Year += "<option value=\"2010\">2553</option>";
		V_Year += "<option value=\"2009\">2552</option>";
		
		------------------- End Parameter Year -------------------*/

		/*------------------- Parameter Month -------------------*/

		Query="CALL sp_fiscal_month;";
		rs = st.executeQuery(Query);
		i = 0;
		while(rs.next()){
			if(i==0){
				V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\"  selected='selected'>"+rs.getString("calendar_th_month_name")+"</option>";
				ParamMonth = rs.getString("fiscal_month_no");
			}else{
				V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\">"+rs.getString("calendar_th_month_name")+"</option>";
				
			}
			i++;
		}
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

		------------------- End Parameter Month -------------------*/
		/*------------------- Organization Parameter -------------------*/


		V_Org +="<option value=\"NSTDA\">สก.</option>";
		V_Org +="<option value=\"BIOTEC\">ศช. </option>";
		V_Org +="<option value=\"MTEC\">ศว.</option>";
		V_Org +="<option value=\"NECTEC\">ศจ.</option>";
		V_Org +="<option value=\"NANOTEC\">ศน.</option>";


		/*------------------- End Organization Parameter -------------------*/

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
	//alert("hello submit");
	$("#tabs").slideDown(500,function(){
		$("a[href=#content1]").trigger("click");
	//	 $("#select1").kendoDropDownList();
	});
	return false;
	});
	/*### Main Content Start ###*/
	

	/*### Tabs Content Start ###*/
		$("#select1").change(function(){
				$.ajax({
				url:"content1.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"center":$(this).val()},
				success:function(data){
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart1(serie1,category1);

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

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart22(serie2,category2);

					var serie3 = data[4]["series3"];
					var category3 = data[5]["category3"];
					barChart23(serie3,category3);
				
				}
			});
		});




	$("a[href=#content1]").click(function(){
		var dropDown = $("#select1").data("kendoDropDownList");
		dropDown.select(0);				
			$.ajax({
				url:"content1.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"center":$("#select1").val()},
				success:function(data){

				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$("#content1").slideDown("slow",function(){
					//console.log(data);
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					//console.log(serie1);
					//console.log(category1);
					barChart1(serie1,category1);

				});
				
				/*### call function sufferRow  Start ###*/
				colorSufferRow();
				callProgressbar("#progressbar11",30);
				callProgressbar("#progressbar12",32);
				callProgressbar("#progressbar13",34);
				callProgressbar("#progressbar14",50);
				callProgressbar("#progressbar15",55);
				callProgressbar("#progressbar16",60);
				callProgressbar("#progressbar17",62);
				callProgressbar("#progressbar18",68);
				callProgressbar("#progressbar19",70);
				callProgressbar("#progressbar110",80);


				callProgressbar("#progressbar21",79);
				callProgressbar("#progressbar22",70);
				callProgressbar("#progressbar23",69);
				callProgressbar("#progressbar24",66);
				callProgressbar("#progressbar25",50);
				callProgressbar("#progressbar26",45);
				callProgressbar("#progressbar27",42);
				callProgressbar("#progressbar28",39);
				callProgressbar("#progressbar29",32);
				callProgressbar("#progressbar210",30);
				/*### call function sufferRow  Start ###*/
				
				}
			});
			return false;
	});

	$("a[href=#content2]").click(function(){
			var dropDown = $("#select2").data("kendoDropDownList");
			dropDown.select(0);
			//alert($("#select2").val());

			$.ajax({
				url:"content2.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"cluster":$("#select2").val()},
				success:function(data){
				
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				//$("#content2").append(data).hide();
				$("#content2").slideDown("slow",function(){
				//console.log(data);

				var serie1 = data[0]["series1"];
				var category1 = data[1]["category1"];
				//console.log(serie1);
				//console.log(category1);
				barChart21(serie1,category1);

				var serie2 = data[2]["series2"];
				var category2 = data[3]["category2"];
				barChart22(serie2,category2);

				var serie3 = data[4]["series3"];
				var category3 = data[5]["category3"];
				barChart23(serie3,category3);
				});
				//$("#select2").kendoDropDownList();
				
				}
			});
			return false;
	});

		$("a[href=#content3]").click(function(){

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
				$("#content3").slideDown(function(){
				//console.log(data);

				var serie1 = data[0]["series1"];
				var category1 = data[1]["category1"];
				//console.log(serie1);
				//console.log(category1);
				barChart31(serie1,category1);
/*
				var serie2 = data[2]["series2"];
				var category2 = data[3]["category2"];
				barChart32(serie2,category2);

				var serie3 = data[4]["series3"];
				var category3 = data[5]["category3"];
				barChart33(serie3,category3);
*/
				});
			
				
				}
			});
			return false;
	});

	$("a[href=#content4]").click(function(){

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
				//$("#content4").append(data).hide();
				$("#content4").slideDown("slow",function(){
				//console.log(data);

				var serie1 = data[0]["series1"];
				var category1 = data[1]["category1"];
				//console.log(serie1);
				//console.log(category1);
				barChart41(serie1,category1);
				/*
				var serie2 = data[2]["series2"];
				var category2 = data[3]["category2"];
				barChart42(serie2,category2);

				var serie3 = data[4]["series3"];
				var category3 = data[5]["category3"];
				barChart43(serie3,category3);
				*/


				});
			
				
				}
			});
			return false;
	});

	$("a[href=#content5]").click(function(){

			$.ajax({
				url:"content5.jsp",
				type:"get",
				dataType:"json",
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
				success:function(data){
				$("#content1").hide();
				$("#content2").hide();
				$("#content3").hide();
				$("#content4").hide();
				$("#content5").hide();
				$("#content5").slideDown("slow",function(){
				var serie1 = data[0]["serieChart"];
				var category1 = data[1]["category"];
				barChart51(category1,serie1);

				var value = data[2]["value"];
				var sum = data[3]["sumVal"];
				pieChart52(value,sum);
				
				});
			
				
				}
			});
			return false;
	});

	
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
			seriesClick:onSeriesClick,
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
                           title: {text: "งบประมาณ(ล้านบาท)" , font:"14px Tahoma"},
						   //title: {text: "งบประมาณ(ล้านบาท)" },
                            min: 0,
                            max: 1200,
						
							
		
							
                        },

			categoryAxis:{
			categories: categoryParam//[ "Cluster", "Platform", "Essential Program","Improvement Project","Director Initiative", "Investment", "Seed Money", "Others" ]
					
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(value)# ล้านบาท"
                        }
		});
}


	/*### barChart1 End ###*/
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
                            min: 0,
                            max: 1200
                        },

			categoryAxis:{
			categories: categoryParam,// [ "B1","A1","A7","A8","B1-1","B1-2","B1-3","B1-4","B1-5","B1-6","B1-7","B1-8","B1-9","B1-10","B1-11" ],
			
			},
                        tooltip: {
                            visible: true,
                           // format: "{0} ล้านบาท",
							template: "#= addCommas(value)# ล้านบาท"
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
				data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"category":category},

				success:function(data){
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart22(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart23(serie2,category2);
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
							template: "#= addCommas(value)# ล้านบาท"
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
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart32(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart33(serie2,category2);
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
							template: "#= addCommas(value)# ล้านบาท"
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
					var serie1 = data[0]["series1"];
					var category1 = data[1]["category1"];
					barChart42(serie1,category1);

					var serie2 = data[2]["series2"];
					var category2 = data[3]["category2"];
					barChart43(serie2,category2);
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
							template: "#= addCommas(value)# ล้านบาท"
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
					var value = data[0]["value"];
					var sum = data[1]["sumVal"];
					pieChart52(value,sum);
					}
			});
}

	  /*### barChart52Start###*/

var pieChart52 = function(valueParam,sumParam){
			$("#pieChart52").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "สัดส่วนจำนวน IO",font:"14px Tahoma"
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
	var callProgressbar=function($nameProgressbar,$value){
			$($nameProgressbar).progressbar({
			value:$value
			});
		/*Set Color progressbar*/
		$(".ui-corner-left").css({"background":"#008EC3 "});
		$(".value > .ui-corner-all").css("border-radius","0px");
		$(".ui-progressbar-value").css("border-radius","0px");
		$(".ui-progressbar").css("height","10px");
	}
	/*### Set Manage  Progressbar###*/
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
						<!--This is Content 1 html ==================================================-->
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
										<option value="NSTDA" id="select11">สวทช</option>
										<option value="BIOTEC" id="select12">ศช.</option>
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
												<th colspan="2"><div class="projectHead1">Top 10 Project Most Spending </div></th>
										</tr>
										<tr>
												<th  width="60%"><div class="projectHead">Project </div></th>
												<th  width="40%"><div class="projectHead">Value %</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName">ProjectZ</div></td>
											<td>
												<div class="projectValue">
														<div class="percentage">
														30%
														</div>
														<div class="value">
															 <div id="progressbar11"></div>
														</div>
											  </div>
											</td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectY</td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														32%
														</div>
														<div class="value">
															 <div id="progressbar12"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectX</td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														34%
														</div>
														<div class="value">
															 <div id="progressbar13"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectW</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														50%
														</div>
														<div class="value">
															 <div id="progressbar14"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectV</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														55%
														</div>
														<div class="value">
															 <div id="progressbar15"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectU</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														60%
														</div>
														<div class="value">
															 <div id="progressbar16"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectT</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														62%
														</div>
														<div class="value">
															 <div id="progressbar17"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectS</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														68%
														</div>
														<div class="value">
															 <div id="progressbar18"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectR</div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														70%
														</div>
														<div class="value">
															 <div id="progressbar19"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectQ</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														80%
														</div>
														<div class="value">
															 <div id="progressbar110"></div>
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
												<th  width="40%"><div class="projectHead">Value %</div></th>
										</tr>
									</thead>
									</tbody>
										<tr>
											<td><div class="projectName">ProjectA</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														79%
														</div>
														<div class="value">
															 <div id="progressbar21"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectB</td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														70%
														</div>
														<div class="value">
															 <div id="progressbar22"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectC</td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														69%
														</div>
														<div class="value">
															 <div id="progressbar23"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectD</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														66%
														</div>
														<div class="value">
															 <div id="progressbar24"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectE</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														50%
														</div>
														<div class="value">
															 <div id="progressbar25"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectF</div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														45%
														</div>
														<div class="value">
															 <div id="progressbar26"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectG</div></td>
											<td>
											<div class="projectValue">
														<div class="percentage">
														42%
														</div>
														<div class="value">
															 <div id="progressbar27"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectH</div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														39%
														</div>
														<div class="value">
															 <div id="progressbar28"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectI</div></td>
										<td>
											<div class="projectValue">
														<div class="percentage">
														32%
														</div>
														<div class="value">
															 <div id="progressbar29"></div>
														</div>
											  </div>

											  </td>
										</tr>
										<tr>
											<td><div class="projectName">ProjectJ</div></td>
									<td>
											<div class="projectValue">
														<div class="percentage">
														30%
														</div>
														<div class="value">
															 <div id="progressbar210"></div>
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
<!-- END -->
		</div>
		<div id="content2">
				<!--This is Content 2 html -->

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
										<option value="Food" id="select21">คลัสเตอร์อาหารและการเกษตร</option>
										<option value="Uranium" id="select22">ยูเรเนียม</option>
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
						
								<div id="barChart22"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart23"></div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END -->
		</div>
		<div id="content3">
				<!--This is Content 3 html -->
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
						
								<div id="barChart32"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart33"></div>
						</div>
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
						
								<div id="barChart42"></div>
						</div>
						<div id="contentR">
						
								<div id="barChart43"></div>

						</div>
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