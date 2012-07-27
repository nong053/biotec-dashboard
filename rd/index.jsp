<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<html>
    <head>
        <title>R&D Dashboard</title>
		<link href="rd.css" rel ="stylesheet" type="text/css">
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
			}
		</style>
		<style scoped>
				#Main-Panel{
					/*border: 1px solid #dedede;*/
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					padding:2px;
					margin:1px;
					width: 990px;
					position: relative;
					background:#008EC3 ;
					color:white;
					font-weight:bold;
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
	$("#form_1").submit(function(){
	
			$.ajax({
			'url':'content1.html',
			'type':'get',
			'dataType':'html',
			success:function(data){
				//alert(data);
				$("#contentMain").empty();
				$("#contentMain").append(data)
				barChartRd1();
				barChartRd2();
				barChartRd3();
				barChartRd4();
				pieChartRd1();
				stackChartRd1();
				stackChartRd2();
				stackChartRd3();
			}
			
			});
			return false;
	});
	$("#submit1").trigger("click");
	/*### jQuery Funtions End ###*/

	/*###  barChartRd1  start ###*/
function  checkBarType(e){
barChartRd2();
barChartRd3();
pieChartRd1();
stackChartRd1();
stackChartRd2();
stackChartRd3();
}
var barChartRd1= function(){
	$("#barChartRd1").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:320,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: [{
                            name: "IC Score",
                            data: [1940,1090,1870,1420]
                        }, {
                            name: "BSC",
                            data: [1944,1000,1850,1400]
                        }, {
                            name: "Employee(JF2000)",
                            data: [1934,1110,1820,1490]
                        }],
                      valueAxis: [{
                            title: { text: "" },
                            min: 0,
                            max: 2000
                        }, {
                            name: "Varaince",
                            title: { text: "" },
                            min: 0,
                            max: 450
                        }],
                        categoryAxis: {
                            categories: [ "BIOTEC" ," MTEC", "NECTECH ", "NANOTECH"],
							axisCrossingValue: [0,100]
							
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        },
						seriesClick:checkBarType
				
                    });


}

/*###  barChartRd1  end ###*/
/*###  barChartRd2  start ###*/
function checkBarType2(e){
barChartRd3();
pieChartRd1();
stackChartRd1();
stackChartRd2();
stackChartRd3();
}
var barChartRd2= function(){

	$("#barChartRd2").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:320,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: [{
                            name: "IC Score",
                            data: [488,309,269,228,176,130]
                        }, {
                            name: "BSC",
                            data: [488,389,299,248,116,120]
                        }, {
                            name: "EMPLOYEE(JF2000)",
                            data: [498,309,219,228,126,140]
                        }],
                      valueAxis: [{
                            title: { text: "" },
                            min: 0,
                            max: 600
                        }, {
                            name: "Varaince",
                            title: { text: "" },
                            min: 0,
                            max: 140
                        }],
                        categoryAxis: {
                            categories: [ "BTU" ," AGU", "GEI ", "JRU", "MMU","FBU"],
							axisCrossingValue: [0,100],
							
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        },
						seriesClick:checkBarType2
                    });
}

/*###  barChartRd2  end ###*/
/*###  barChartRd3  start ###*/
function checkBarType3(){
pieChartRd1();
stackChartRd1();
stackChartRd2();
stackChartRd3();
}
var barChartRd3= function(){
	$("#barChartRd3").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "",
							
                        },
						chartArea:{
						width:320,
						height:250
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: [{
                            name: "IC Score",
                            data: [488,309,269,228,176,130]
                        }, {
                            name: "BSC",
                            data: [488,389,299,248,116,120]
                        }, {
                            name: "EMPLOYEE(JF2000)",
                            data: [498,309,219,228,126,140]
                        }],
                       valueAxis: [{
                            title: { text: "" },
                         /*   min: 0,
                            max: 6*/
                        }, {
                            name: "Varaince",
                            title: { text: "" },
                        /*    min: 0,
                            max: 6*/
                        }],
                        categoryAxis: {
                            categories: [ "Lap1" ," Lap2", "Lap3 ", "Lap4", "Lap5","Lap6"],
							axisCrossingValue:[0,100]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        },
						seriesClick:checkBarType3
						
                    });
	
}

/*###  barChartRd3  end ###*/
/*###  barChartRd4  start ###*/

var barChartRd4= function(){
	$("#barChartRd4").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "Top 20 IC Score"
                        },
						chartArea:{
						width:950,
						height:300
						},

						
                        legend: {
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: [{
							name:"IC Score",
							data:[1261,488,484,445,442,372,355,314,309,269,262,244,242,231,228,216,211,176,170,161]
							},{
							name:"BSC",
							data:[1261,488,1261,445,442,1261,355,314,1309,269,262,1261,242,231,228,1261,211,176,1261,161]
							},{
							name:"EMPLOYEE(JF2000)",
							data:[1261,488,1484,1445,1442,1372,1355,314,1309,169,262,1244,1242,231,1228,1216,1211,1176,170,1161]
							}],
                       valueAxis: [{
                            title: { text: "" },
                            min: 0,
                            max: 1400
                        }, {
                            name: "Varaince",
                            title: { text: "" },
                            min: 0,
                            max: 140
                        }],
                        categoryAxis: {
							labels: {
                                rotation: -90
                            },
                            categories: ["NANOTEC-NLAB","BIOTEC-BTU","MTEC-PRU","NECTEC-IDSRU","NECTEC-INIRU","NECTEC-TMEC","MTEC-MCRU","NECTEC-WISRU","BIOTEC-AGU","BIOTEC-GEI","MTEC-CARU","MTC-MRRU","NECTEC-ICCRU","MTTEC-CERRU","BIOTEC-JRU","MTEC-ENVRU","NECTEC-AAERU","BIOTEC-MMU","MTEC-BMERU","MTEC-DERU"],
							axisCrossingValue: [0,100]
                        },

						
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
                    });
	
}

/*###  barChartRd4  end ###*/
/*###  pieChartRd1 start ###*/



var pieChartRd1= function(){

		$("#pieRd1").kendoChart({
			//theme: $(document).data("kendoSkin") || "metro",
			theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:""
						
						
			},
			legend: {
                            position: "right"
            },
			chartArea: {
			width: 320,
			height: 190
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "JF2000",
                                value: 220
								 
                            }, {
	
                                category: "JF2001",
                                value: 240
                            }, {
		
                                category: "JF2002 ",
                                value: 220
                            }, {
			
                                category: "JF2003 ",
                                value: 220
								
                            }, {
			
                                category: "JF2004 ",
                                value: 220
								
                            }]
                        }],
                        tooltip: {
                            visible: true,
                         //  format: "{0}"
						 //  template: "${ category } ,${ value }%"
						 template: "#= templateFormat(value,900) #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			},
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  pieChartRd1 End ###*/
/*###  stackChartRd1 start ###*/



var stackChartRd1= function(){

		$("#stackRd1").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                            position: "top"
                        },
						chartArea:{
						width:320,
						height:150
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series: [{
                            name: "Revenue",
                            data: [67.96, 68.93, 75]
                        }, {
                            name: "Publication",
                            data: [15.7, 16.7, 20]
                        }, {
                            name: "Prototype",
                            data: [15.7, 16.7, 20]
                        }, {
                            name: "Patent",
                            data: [15.7, 16.7, 20]
                        }],
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories: ["ICScore", "Completed", "Piperline"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChartRd2 start ###*/
var stackChartRd2= function(){

		$("#stackRd2").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                           // position: "top"
							visible:false
                        },
						chartArea:{
						width:320,
						height:90
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series: [{
                            name: "Employee(All)",
                            data: [356,0]
                        }, {
                            name: "Employee(JF2000)",
                            data: [  0,412]
                        }],
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories: ["Employee(All)", "Employee(JF2000)"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChartRd2 End ###*/
/*###  stackChartRd3 start ###*/
var stackChartRd3= function(){

		$("#stackRd3").kendoChart({

			theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
                        legend: {
                            position: "top"
                        },
						chartArea:{
						width:320,
						height:85
						},
                        seriesDefaults: {
                            type: "bar",
                            stack: true
                        },
                        series: [{
                            name: "A1",
                            data: [67]
                        }, {
                            name: "A2",
                            data: [20]
                        }, {
                            name: "A3",
                            data: [20]
                        }, {
                            name: "AR1",
                            data: [15.7]
                        }, {
                            name: "AR2",
                            data: [15.7]
                        }, {
                            name: "Other",
                            data: [15.7]
                        }],
                        valueAxis: {
                            labels: {
                              //  format: "{0}%"
							  visible:false
                            }
                        },
                        categoryAxis: {
                            categories: ["Type"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
			//seriesHover:onSeriesHover,
			
	
			
		});


		
		
}

/*###  stackChartRd3 End ###*/

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

<!-- TAB MANAGEMENT END -->

	</div>
	<div id="loading" ></div>

	<!--------------------------- Details End--------------------------->

	</body>
</html>