<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
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
			width: 985px;
			margin:auto;
			}
			#tabs{
			display:none;
			width: 980px;
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
					width:980px;
					position: relative;
					font-weight:bold;
					color:white;
					background-color:#008EC3 ;
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

		V_Year += "<option value=\"2012\" selected='selected' >2555</option>";
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

	/*### Main Content Start ###*/
	$("form#form_1").submit(function(){
	//alert("hello submit");
	$("#tabs").slideDown(500,function(){
		$("a[href=#content1]").trigger("click");
		 $("#select1").kendoDropDownList();
	});
	return false;
	});
	/*### Main Content Start ###*/
	

	/*### Tabs Content Start ###*/

	$("a[href=#content1]").click(function(){
	
			$.ajax({
				'url':'content1.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				//alert(data);

				$("#content1").empty();
				$("#content2").empty();
				$("#content3").empty();
				$("#content4").empty();
				$("#content5").empty();

				$("#content1").append(data).hide();
				$("#content1").slideDown("fast",function(){
				barChart1();
				barChart2(15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89);
				barChart3(89,85,80,75,70,68,66,65,63,60);
				});
				$("#select1").kendoDropDownList();
				
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

			$.ajax({
				'url':'content2.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				
				$("#content1").empty();
				$("#content2").empty();
				$("#content3").empty();
				$("#content4").empty();
				$("#content5").empty();

				$("#content2").append(data).hide();
				$("#content2").slideDown(function(){
				barChart21();
				barChart22();
				barChart23();
				});
				$("#select2").kendoDropDownList();
				
				}
			});
			return false;
	});

		$("a[href=#content3]").click(function(){

			$.ajax({
				'url':'content3.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				
				$("#content1").empty();
				$("#content2").empty();
				$("#content3").empty();
				$("#content4").empty();
				$("#content5").empty();

				$("#content3").append(data).hide();
				$("#content3").slideDown(function(){
				barChart31();
				barChart32();
				barChart33();

				});
			
				
				}
			});
			return false;
	});

$("a[href=#content4]").click(function(){

			$.ajax({
				'url':'content4.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				
				$("#content1").empty();
				$("#content2").empty();
				$("#content3").empty();
				$("#content4").empty();
				$("#content5").empty();


				$("#content4").append(data).hide();
				$("#content4").slideDown(function(){
				barChart41();
				barChart42();
				barChart43();
				});
			
				
				}
			});
			return false;
	});

	$("a[href=#content5]").click(function(){

			$.ajax({
				'url':'content5.html',
				'type':'get',
				'dataType':'html',
				success:function(data){
				
				$("#content1").empty();
				$("#content2").empty();
				$("#content3").empty();
				$("#content4").empty();
				$("#content5").empty();


				$("#content5").append(data).hide();
				$("#content5").slideDown(function(){
				barChart51();
				pieChart52();
				});
			
				
				}
			});
			return false;
	});

	
		$("#tabs").tabs();
	/*### Tabs Content End ###*/



    /*### barChart1 Start###*/

var barChart1 = function(){
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
			series: [
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
				
				 
			],
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)",font:"12px" },
                            min: 0,
                            max: 1200,
							
		
							
                        },

			categoryAxis:{
			categories: [ "Cluster", "Platform", "Essential Program","Improvement Project","Director Initiative", "Investment", "Seed Money", "Others" ],
					
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
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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

var barChart21 = function(){
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
			series: [
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
				
				 
			],
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" },
                            min: 0,
                            max: 1200
                        },

			categoryAxis:{
			categories: [ "B1","A1","A7","A8","B1-1","B1-2","B1-3","B1-4",
"B1-5","B1-6","B1-7","B1-8","B1-9","B1-10","B1-11" ],
			
			}
		});
}
	/*### barChart21 End ###*/
	  /*### barChart22Start###*/

var barChart22 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart22").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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

var barChart23 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart23").kendoChart({
						theme:$(document).data("kendoSkin") || "metro",
						title: {
                            text: "Top 10 project  least spending"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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
var barChart31 = function(){
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
			series: [
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
				
				 
			],
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" },
                          /*  min: 0,
                            max: 1200
							*/
                        },

			categoryAxis:{
			categories: [ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
			
			}
		});
}
	/*### barChart31 End ###*/
	  /*### barChart32Start###*/

var barChart32 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart32").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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
	/*### barChart32 End ###*/
	  /*### barChart33 Start###*/

var barChart33 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart33").kendoChart({
						title: {
                            text: "Top 10 project  least spending"
                        },
						theme:$(document).data("kendoSkin") || "metro",
						
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
                        },
                        seriesDefaults: {
                            type: "bar"
                        },
                        series: [{
                            name: "Project",
                            data: [89,85,80,75,70,68,66,65,63,60],
							//color:"red"
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
	/*### barChart33 End ###*/

	/*### barChart41 Start###*/
var barChart41 = function(){
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
			series: [
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
				
				 
			],
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" },
                          /*  min: 0,
                            max: 1200
							*/
                        },

			categoryAxis:{
			categories: [ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
			
			}
		});
}
	/*### barChart41 End ###*/
	  /*### barChart42Start###*/

var barChart42 = function(){
	//alert("require baChart"+$("#barchart1").length);
			
			$("#barChart42").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: "Top 10 project most spending"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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
	/*### barChart42 End ###*/
	  /*### barChart43 Start###*/

var barChart43 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart43").kendoChart({
						theme:$(document).data("kendoSkin") || "metro",
						title: {
                            text: "Top 10 project  least spending"
                        },
					
                        legend: {
                            position: "bottom"
                        },
                        chartArea: {
                            background: "",
							height:350
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
	/*### barChart43 End ###*/


	/*### barChart51 Start###*/
var barChart51 = function(){
	//alert("require baChart"+$("#barchart1").length);
		
			$("#barChart51").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: "ศูนย์ "
			},
			chartArea: {
			height: 300
			 },
			legend: {
                            position: "right"
            },
			series: [
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
				
				 
			],
			valueAxis: {
                            title: { text: "งบประมาณ(ล้านบาท)" },
                          /*  min: 0,
                            max: 1200
							*/
                        },

			categoryAxis:{
			categories: [ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
			
			}
		});
}
	/*### barChart51 End ###*/
	  /*### barChart52Start###*/

var pieChart52 = function(){
		
			$("#pieChart52").kendoChart({
					theme:$(document).data("kendoSkin") || "metro",
					title: {
                            text: ""
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
                            data: [ {
                                category: "IO ที่ปิดแล้ว ",
                                value: 30
                            }, {
                                category: "IO ที่เหลืออยู่",
                                value: 70
                            }]
                        }],
                        valueAxis: {
                            labels: {
								visible: true,
                                format: "{0}%"
                            }
                        },
                        
                        tooltip: {
                            visible: true,
                            format: "{0}%"
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
			content1...		
		</div>
		<div id="content2">
			content2...			
		</div>
		<div id="content3">
			content3...
		</div>
		<div id="content4">
			content4...
		</div>
		<div id="content5">
			content5...
		</div>
	</div>


<!-- TAB MANAGEMENT END -->

	</div>
	<div id="loading" ></div>

	<!--------------------------- Details End--------------------------->

	</body>
</html>