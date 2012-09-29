<!doctype html>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat" %>
<%@ include file="../config.jsp"%>
<html>
<head>
<title>Summary Dashboard</title>

			<!--	<link href="../ChartLib_KendoUI/styles/examples.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.common.css" rel="stylesheet"/>
        <link href="../ChartLib_KendoUI/styles/kendo.metro.css" rel="stylesheet"/>-->
		<link href="summary.css" rel="stylesheet" type="text/css" />
		<link href="../plugin/tooltip.css" rel="stylesheet" type="text/css">
		<link href="../styles/kendo.common.min.css" rel="stylesheet">
		<link href="../styles/kendo.default.min.css" rel="stylesheet">
		<link href="../jqueryUI/css/cupertino/jquery-ui-1.8.21.custom.css" rel="stylesheet">
		 <link href="../styles/kendo.dataviz.min.css" rel="stylesheet">
		  <link href="../plugin/tooltip.css" rel="stylesheet">

		 <!-- corner round-->

		 <link rel="stylesheet" type="text/css" href="css/niftyCorners.css">
		<link rel="stylesheet" type="text/css" href="css/niftyPrint.css" media="print">
		

		 <!-- corner round-->
		


        <script src="../js/jquery.min.js"></script>
		<!--<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>-->
		<script type="text/javascript" src="js/jquery.corner.js"></script>
		<script src="../plugin/jquery.tooltip.js"></script>
		<script src="../js/kendo.all.min.js"></script>
		  <script src="../js/kendo.dataviz.min.js"></script>
		  <script type="text/javascript" src="../js/jquery.sparkline.min.js"></script> 
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.21.custom.min.js"></script>
	<script src="../js/console.js"></script>
	<script type="text/javascript" src="js/nifty.js"></script> 
		<script type="text/javascript" src="../plugin/jquery.tooltip.js"></script>
	
	 

		<style type="text/css">
			body {
				
				background-color: white;
				color:black;
				font-size:11px;
				/*font-family:tahoma;*/
				font-family:Tahoma;
				margin:0px;
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
			  #gauge1 {
                    width: 110px;
                    height: 110px;
                    margin: 0 auto;
					top:-10px;
					left:0px;
                }
				 #gauge2 {
                    width: 110px;
                    height: 110px;
                    margin: 0 auto;
					top:-10px;
					left:0px;
                }
				 #gauge3 {
                      width: 110px;
                    height: 110px;
                    margin: 0 auto;
					top:-10px;
					left:0px;
                }
				#container-gauge{
					 background: transparent url("../content/dataviz/gauge/gauge-container-partial110.png") no-repeat 50% 50% ;
                    width: 110px;
                    height: 110px;
                    text-align: center;
                    margin: 0 auto 0px auto;
				
				}
				#gauge-container .k-slider {
                    margin-top: -11px;
                    width: 140px;
                }
				#container-gauge2{
					 background: transparent url("../content/dataviz/gauge/gauge-container-partial110.png") no-repeat 50% 50% ;
                    width: 110px;
                    height: 110px;
                    text-align: center;
                    margin: 0 auto 0px auto;
				
				}
					#container-gauge3{
					 background: transparent url("../content/dataviz/gauge/gauge-container-partial110.png") no-repeat 50% 50% ;
                    width: 110px;
                    height: 110px;
                    text-align: center;
                    margin: 0 auto 0px auto;
				
				}
				.gaugeValue{
				/*position:relative;
				width:30px;*/
				/*border:1px solid #cccccc;*/
				/*border-radius:5px;
				padding:5px;
				top:-35px;
				left:35px;
				text-align:center;
				background-color:#008EC3 ;
				color:white;
*/
				background-color: #008EC3;
				border-radius: 3px 3px 3px 3px;
				color: white;
				left: 35px;
				padding: 3px;
				position: relative;
				text-align: center;
				top: -33px;
				width: 30px;
				}
				
		</style>
				<!--------------------------- Configuration --------------------------->
			<style scoped>
				#Main-Panel{
					/*font-family: Arial, Helvetica, sans-serif;*/
					padding-left: 5px;
					border: 1px solid #dedede;
					font-weight:bold;
					color:white;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					border-radius: 5px;
					text-align: left;
					min-height: 0px;
					width:auto
					position: relative;
					background:#008EC3  ;
	
					
				}
			</style>
		</head>
		<body>

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
		String textMonth="[\"0\",";
		/*------------------- End Set Variable -------------------*/

		/*------------------- Parameter Year -------------------*/

		int i = 0;
		Query="CALL sp_fiscal_year;";
		String Query1 ="";
		ResultSet rs1;
		Statement st1;
		rs = st.executeQuery(Query);
		while(rs.next()){
			Query1  = "SELECT Date_format(SYSDATE(),'%Y') as year_date,Date_format(SYSDATE(),'%m') as month_date;";
			st1 = conn.createStatement();
			rs1 = st1.executeQuery(Query1);
			i = 0;
			while(rs1.next()){
				int presentMonth = rs1.getInt("month_date"); 
				int present_year = rs1.getInt("year_date");
		//		int presentMonth = 10; 
				//int present_year = 2012;

				presentMonth = presentMonth +2 ; 
				if(presentMonth>12){
					present_year = present_year+1; 
				}

				String present_yearStr = present_year+"";
				String query_year = rs.getString("fiscal_year");
				if(query_year.equals(present_yearStr)){
					V_Year += "<option value=\""+rs.getString("fiscal_year")+"\"  selected='selected'>"+rs.getString("buddhist_era_year")+"</option>";
				}
				else{
					V_Year += "<option value=\""+rs.getString("fiscal_year")+"\">"+rs.getString("buddhist_era_year")+"</option>";
				}
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
			 Query1  = "SELECT Date_format(SYSDATE(),'%m') as month_date;";
			st1 = conn.createStatement();
			rs1 = st1.executeQuery(Query1);
			while(rs1.next()){
				int presentMonth = rs1.getInt("month_date");
				//int presentMonth = 10;
				presentMonth = presentMonth +2 ;
				if(presentMonth>12){
					presentMonth=presentMonth-12;
				}
				String query_month = rs.getString("fiscal_month_no");
				String presentMonthStr = presentMonth+"";
				if(query_month.equals(presentMonthStr)){
					V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\"  selected='selected'>"+rs.getString("calendar_th_month_name")+"</option>";	
					
					if(i>0)	textMonth +=",";
					textMonth +="\""+rs.getString("calendar_th_month_name")+"\"";
				}else{
					V_Month += "<option value=\""+rs.getString("fiscal_month_no")+"\">"+rs.getString("calendar_th_month_name")+"</option>";	
			
					if(i>0)	textMonth +=",";
					textMonth +="\""+rs.getString("calendar_th_month_name")+"\"";
				}
			}
			i++;
		}
		textMonth+="]";
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


		/*------------------- End Organization Parameter -------------------*/
		%>

<!--------------------- Function --------------------->

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

	/*	function getParamYear(value)
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
*/
		/*########## Function jQuery Start#########*/

		$(document).ready(function(){
		//========================== Load Tooltip =======================
/*		$.ajax({
		url:'revTooltip.jsp',
		type:'get',
		dataType:'html',
		data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
		success:function(data){
				 var dataSplit= data.split(",");
				 var htmlInput="";
					for(var i=0; i<dataSplit.length; i++){
					htmlInput+="<div id='"+(i+101)+"' class='revTooltip' style='display:none'>"+dataSplit[i]+"</div>";
					//console.log(dataSplit[i]);
					}
					$(".revTooltip").empty();
					$("body").append(htmlInput);
					//console.log($(".revTooltip#1").length);
		}
		});
*/




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
			//	$("#piehr2").css("opacity","0.5");
				$(this).show();
			}).ajaxStop(function(){
				$(this).hide();
				//$("#piehr2").css("opacity","1");
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
		

	});

		/*########## Function jQuery End#########*/

	</script>





<!-- code for graphic-->


<!-- ui-dialog -->	
	<div id="dialog" title="Overall">
			<div id="chart"><p></p></div>
		</div>
<!-- ui-dialog -->	


<!-- code for graphic-->

		<!-- Start jQuery 0001-->
			<script type="text/javascript">
			$(document).ready(function(){
						//console.log("console"+console);

				/*### kendoRadialGauge Start ###*/
				
var gauge = function(selectorParam,valueParam){
$(selectorParam).kendoRadialGauge({
					theme:$(document).data("kendoSlin") || "metro",
					pointer: {
                            value: valueParam
                        },
                        scale: {
							
                            minorUnit: 10,
                            startAngle: -30,
                            endAngle: 210,
                            max: 100,
							labels:{
							//template: "#= value #%",
							position:"outside",
							font:"10px Tahoma"
							},
							
                         /* Rang Start*/
                            ranges: [
                               {
                                    from: 0,
                                    to: 100,
                                    color: "#99ccff "
                                }
                            ]

							/*Rang End*/
                        }
				});

}
				/*### kendoRadialGauge End ###*/

/*###  barChart Budget start ###*/
//var barChartBudget = function(selectorParam,valueParam){
var barChartBudget = function(categoryParam,seriesParam){
	$("#barChartBudget").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:315,
						height:140
						},

						
                        legend: {
                            position: "right"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
						series: seriesParam,
                      /*  series: [{
                            name: "แผน",
                            data: [1, 5, 5, 3]
                        }, {
                            name: "ผล",
                            data: [2,3, 4, 6]
                        }]*/
                        valueAxis: {
                               // format: "{0}%"
							  // format: "{0}",
							        //      rotation: 10,
							  font: "10px Tahoma",
								min : 0
                        },
                        categoryAxis: {
                         //   categories: [ "โครงการ" ," หน่วยงาน", "ครุภัณฑ์ ", "บุคลากร"]
							categories: categoryParam,
							labels:{
							font: "11px Tahoma"
							}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}",
							template: "#= addCommas(value) # ล้านบาท"

                        }
                    });
}
//barChartBudget();
/*###  barChart Budget  end ###*/

/*###  pieChart hr  start ###*/

function onSeriesHover(e) {
    //console.log("Hovered value: " + e.value*2);
	
}
function onSeriesClick(e) {
  
	//console.log(e.category  );

	//alert($subCategory);
}
var pieChartHR= function(selectorParam,valueParam,sumParam){
	    $(selectorParam).kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:"",
						
						

			},
			legend: {
                            position: "right",
							labels:{
							font: "11px Tahoma"
							}
            },
			chartArea: {
			width: 300,
			height: 130,
			opacity:0
				
			},
			series: [{
                            type: "pie",
                            data: valueParam//[{totalPieHR3:312.14},{value_piehr3:[{category:"คชจ. ดำเนินการ",value: 234.14},{category: "คชจ. บุคลากร",value: 122.0}]}]

							/*	 [ {
	
                                category: "RDDE",
                                value: 220
								 
                            }, {
	
                                category: "HRD",
                                value: 240
                            }, {
		
                                category: "Infra ",
                                value: 220
                            }, {
			
                                category: "Int Mat ",
                                value: 220
								
                            }, {
			
                                category: "TT ",
                                value: 220
								
                            }]
*/
                        }],
                        tooltip: {
                            visible: true,
                         //  format: "{0}"
						 //  template: "${ category } ,${ value }%"
						 template: "#= templateFormat(value,"+sumParam+") #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			},
			//seriesHover:onSeriesHover,
			seriesClick:onSeriesClick
		});
}
//pieCharhr();

/*###  pieChart2 hr  end ###

var pieCharthr2= function(){
var summ=900;
		$("#piehr2").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:""

			},
			legend: {
                            position: "right",
							labels:{
							font: "11px Tahoma"
							}
            },
			chartArea: {
			width: 300,
			height: 130
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "คชจ. ดำเนินการ",
                                value: 220
								 
                            }, {
	
                                category: "คชจ.บุคลากร",
                                value: 240
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
			seriesClick:onSeriesClick
		});


		
		
}
pieCharthr2();
*/
/*###  pieChart3 hr  end ###*/
/*
var pieCharthr3= function(){
var summ=900;
		$("#piehr3").kendoChart({
		theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:""
						
						
			},
			legend: {
                            position: "right",
							labels:{
							font: "11px Tahoma"
							}
            },
			chartArea: {
			width: 300,
			height: 130
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "ปฎิบัติการ.",
                                value: 15
								 
                            }, {
	
                                category: "วิจัยและวิชาการ ",
                                value: 40
                            }, {
	
                                category:"จัดการ ",
                                value: 40
                            }, {
	
                                category: "บริหาร",
                                value: 5
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
			seriesClick:onSeriesClick
	
			
		});


		
		
}
pieCharthr3();

/*###  pieChart3 hr  end ###*/

/*###  lineChart hr start ###*/
var lineChartHr= function(serieParam,categoryParam){
	$("#lineChartHr").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:310,
						height:170
						},

					
                        legend: {
                            position: "bottom",
							labels:{
						font: "11px Tahoma"
							}
                        },
                        seriesDefaults: {
                            type: "line",
							//stack: true
                        },
                        series: serieParam
							/* [{
                            name: "ปีปัจจุบัน",
                            data: [10, 12, 11, 13, 12,11,13,12,13,13,13,13,12]
                        },{
                            name: "ปีที่แล้ว",
                            data: [10, 12, 13, 13, 13,10,13,14,12,13,12,13,10]
                        }]*/
						,
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}%",
								font: "11px Tahoma"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam,// [" ต.ค."," พ.ย."," ธ.ค."," ม.ค."," ก.พ."," มี.ค."," เม.ย."," พ.ค."," มิ.ย."," ก.ค."," ส.ค."," ก.ย."],
							labels:{
							font:"11px Tahoma"
							}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
                    });

		
		
}
//lineChartHr();
/*###  lineChart hr end ###*/
/*###  Financial Start ###*/
/*###  kendoRadialGauge financial stat ###*/
	$("#gauge3").kendoRadialGauge({
					theme:$(document).data("kendoSkin") || "metro",
					pointer: {
                            value: 65
                        },

                        scale: {
                            minorUnit: 10,
                            startAngle: -25,
                            endAngle: 210,
                            max: 100,
							labels: {
								//template: "#= value #%",
                                position:"outside",
								font: "11px Tahoma"

                            },
                           /* Rang Start*/
                          ranges: [
                                {
                                    from: 0,
                                    to: 100,
                                    color: "#99ccff"
                                }
                            ]
						
							/*Rang End */
                        }
				});

/*### kendoRadialGauge financial end  ###*/
/*###  barChart Financial start ###*/

var barChartFinancial= function(serieParam,categoryParam){
	$("#barChartFinancial").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:310,
						height:140
						},
                        legend: {
                            visible: false
                        },
                        seriesDefaults: {
                            type: "column",
							 labels: {
                                visible: true,
                                format: "{0}"
                            },
							stack: false
                        },

                        series: serieParam,
							/*[{
                           name: "รายได้แบ่งตามประเภท(ล้านบาท)",
                           data: [291.22, 75.39, 7.16, 67.38, 35.59,50.41],
							
                        }],*/
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							    visible: true,
							   format: "{0}",
								font: "10px Tahoma"
                            }
                        },
                        categoryAxis: {
                            categories: categoryParam,//["1","2", "3", "4", "5","6"],
							labels:{
							font: "11px Tahoma"
							},
							text:{}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}",
                            //template: "setto"
							template: "#= getTooltip(category) #"
							//template: "#= templateFormat(value,900) #"
                        }
                    });
}
//barChartFinancial();
/*###  barChart Financial  end ###
###  Financial Stop ###*/
/*// This is before Edit
				$("#form_1").submit(function(){
					$.ajax({
						url:'processBudget.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
						//	console.log(data2[0]["gauge1"]);
					//		console.log(data2[0]["plang1"]);
					//		console.log(data2[0]["resultg1"]);
					//		console.log(data2[0]["gauge2"]);
					//		console.log(data2[1]["series_center"]);
					//		console.log(data2[2]["category_center"]);


							var pecent = parseFloat(data2[0]["gauge1"]).toFixed(2);
							gauge("#gauge1",pecent);
							$("#container-gauge2 .gaugeValue").empty();
							$("#container-gauge2 .gaugeValue").append(pecent);
							$(".r#plan1").empty();
							var plan = parseFloat(data2[0]["plang1"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$(".r#plan1").append(planwC);
							$(".r#result1").empty();
							var result = parseFloat(data2[0]["resultg1"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$(".r#result1").append(resultwC);
							//===================End Gauge1

							var pecent = parseFloat(data2[0]["gauge2"]).toFixed(2);
							gauge("#gauge2",pecent);
							$("#container-gauge .gaugeValue").empty();
							$("#container-gauge .gaugeValue").append(pecent);
							$(".r#plan2").empty();
							var plan = parseFloat(data2[0]["plang2"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$(".r#plan2").append(planwC);
							$(".r#result2").empty();
							var result = parseFloat(data2[0]["resultg2"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$(".r#result2").append(resultwC);
						//=======================End Gauge 2 =====================
						//========================Bar Chart ===============
							var seriesBudget = data2[1]["series_center"];
							var categoryBudget = data2[2]["category_center"];
							//console.log(data2[1]["series_center"]);
							//console.log(data2[2]["category_center"]);
							barChartBudget(categoryBudget,seriesBudget);
							//====================End Bar Chart ================
						}
					});
				});
/*
		$("#form_1").submit(function(){
					$.ajax({
						url:'processHR.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
							//console.log(data2[0]["totalPieHR1"]);
							//console.log(data2[1]["value_piehr1"]);
							//console.log(data2[2]["totalPieHR2"]);
							//console.log(data2[3]["value_piehr2"]);
							//console.log(data2[4]["categorylinehr3"]);
							//console.log(data2[5]["value_linehr3"]);

							//============= HR Pie 1================
							var totalPieHR1 = data2[0]["totalPieHR1"];
							var valuePieHR1 = data2[1]["value_piehr1"];
							pieChartHR("#piehr",valuePieHR1,totalPieHR1);
							// ========End HR Pie 1===============
							// ======= HR Pie 2=================
							var totalPieHR2 = data2[2]["totalPieHR2"];
							var valuePieHR2 = data2[3]["value_piehr2"];
							pieChartHR("#piehr3",valuePieHR2,totalPieHR2);
							// ========End HR Pie 2 ===============
							// ======= HR Line 3=================
							var categoryLineHR2 = data2[4]["categorylinehr3"];
							var  valueLineHR3 = data2[5]["value_linehr3"];
							lineChartHr(valueLineHR3,categoryLineHR2);
							// ========End HR Line 3 ===============
						}
					});
				});
*/
///////////////// Gague 1 Working
var ParamYearArr = <%=textMonth%>;

			$("#form_1").submit(function(){

				//var ParamYearPlus = parseInt($("#ParamYear").val());
				//var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlus =2012;
				var ParamMonthPlus = 12;
				
				var ParamYearPlusText = "";
				var ParamMonthPlusText = "";
				if(ParamMonthPlus>12){
					ParamYearPlus=ParamYearPlus +1;
					ParamMonthPlus=ParamMonthPlus-12;
				}
				ParamYearPlusText = (ParamYearPlus +543)+"" ;
				ParamMonthPlusText = ParamYearArr[ParamMonthPlus];

					$.ajax({
						url:'processBudget1.jsp',
						type:'get',
						dataType:'json',
						//data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
					    data:{"month":ParamMonthPlus,"year":ParamYearPlus},

						success:function(data2){
						//	alert("Year="+ParamYearPlusText+" Month="+ParamMonthPlusText);
							$(".budget#title").empty();
							$(".budget#title").append("งบประมาณ ณ "+ParamMonthPlusText+" "+ParamYearPlusText);
							var pecent = parseFloat(data2[0]["gauge1"]).toFixed(2);
							gauge("#gauge1",pecent);
							$("#container-gauge2 .gaugeValue").empty();
							$("#container-gauge2 .gaugeValue").append(pecent);
							$(".r#plan1").empty();
							var plan = parseFloat(data2[0]["plang1"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$(".r#plan1").append(planwC);
							$(".r#result1").empty();
							var result = parseFloat(data2[0]["resultg1"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$(".r#result1").append(resultwC);
							//===================End Gauge1
						}
					});
				});

///////////////// Gague 2 Working
			$("#form_1").submit(function(){
				
			
				//var ParamYearPlus = parseInt($("#ParamYear").val());
				//var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlus =2012;
				var ParamMonthPlus = 12;

				var ParamYearPlusText = "";
				var ParamMonthPlusText = "";
				if(ParamMonthPlus>12){
					ParamYearPlus=ParamYearPlus +1;
					ParamMonthPlus=ParamMonthPlus-12;
				}

					$.ajax({
						url:'processBudget2.jsp',
						type:'get',
						dataType:'json',
					    data:{"month":ParamMonthPlus,"year":ParamYearPlus},
						success:function(data2){
							var pecent = parseFloat(data2[0]["gauge2"]).toFixed(2);
							gauge("#gauge2",pecent);
							$("#container-gauge .gaugeValue").empty();
							$("#container-gauge .gaugeValue").append(pecent);
							$(".r#plan2").empty();
							var plan = parseFloat(data2[0]["plang2"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$(".r#plan2").append(planwC);
							$(".r#result2").empty();
							var result = parseFloat(data2[0]["resultg2"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$(".r#result2").append(resultwC);
							//===================End Gauge2
						}
					});
				});

///////////////// Barchart Budget Working
			$("#form_1").submit(function(){
				//var ParamYearPlus = parseInt($("#ParamYear").val());
				//var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlus =2012;
				var ParamMonthPlus = 12;

				var ParamYearPlusText = "";
				var ParamMonthPlusText = "";
				if(ParamMonthPlus>12){
					ParamYearPlus=ParamYearPlus +1;
					ParamMonthPlus=ParamMonthPlus-12;
				}

					$.ajax({
						url:'processBudget3.jsp',
						type:'get',
						dataType:'json',
					    data:{"month":ParamMonthPlus,"year":ParamYearPlus},
						success:function(data2){
							//========================Bar Chart ===============
							var seriesBudget = data2[0]["series_center"];
							var categoryBudget = data2[1]["category_center"];
							//console.log(data2[1]["series_center"]);
							//console.log(data2[2]["category_center"]);
							barChartBudget(categoryBudget,seriesBudget);
							//====================End Bar Chart ================						
							}
					});
				});
/*
			$("#form_1").submit(function(){
					$.ajax({
						url:'processHR.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
							console.log(data2);
							//console.log(data2[0]["totalPieHR1"]);
							//console.log(data2[1]["value_piehr1"]);
							//console.log(data2[2]["totalPieHR2"]);
							//console.log(data2[3]["value_piehr2"]);
							//console.log(data2[4]["categorylinehr3"]);
							//console.log(data2[5]["value_linehr3"]);

							//============= HR Pie 1================
							var totalPieHR1 = data2[0]["totalPieHR1"];
							var valuePieHR1 = data2[1]["value_piehr1"];
							pieChartHR("#piehr",valuePieHR1,totalPieHR1);
							// ========End HR Pie 1===============
							// ======= HR Pie 2=================
							var totalPieHR2 = data2[2]["totalPieHR2"];
							var valuePieHR2 = data2[3]["value_piehr2"];
							pieChartHR("#piehr3",valuePieHR2,totalPieHR2);
							// ========End HR Pie 2 ===============
							// ======= HR Line 3=================
							var categoryLineHR2 = data2[4]["categorylinehr3"];
							var  valueLineHR3 = data2[5]["value_linehr3"];
							lineChartHr(valueLineHR3,categoryLineHR2);
							// ========End HR Line 3 ===============
						}
					});
				});

*/
//////////============================== Pie Hr Chart 1
	$("#form_1").submit(function(){
					$.ajax({
						url:'processHR1.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
						//	console.log(data2);
							//============= HR Pie 1================
							var totalPieHR1 = data2[0]["totalPieHR1"];
							var valuePieHR1 = data2[1]["value_piehr1"];
							pieChartHR("#piehr",valuePieHR1,totalPieHR1);
							// ========End HR Pie 1===============
						}
					});
				});
//////////============================== Pie Hr Chart 2
	$("#form_1").submit(function(){
					$.ajax({
						url:'processHR2.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
						//	console.log(data2);
							//============= HR Pie 2================
					var totalPieHR2 = data2[0]["totalPieHR2"];
							var valuePieHR2 = data2[1]["value_piehr2"];
							pieChartHR("#piehr3",valuePieHR2,totalPieHR2);
								// ========End HR Pie 2===============
						}
					});
				});


//////////============================== Line Hr Chart 1
	$("#form_1").submit(function(){
					$.ajax({
						url:'processHR3.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
							//console.log(data2);
						// ======= HR Line 3=================
							var categoryLineHR2 = data2[0]["categorylinehr3"];
							var  valueLineHR3 = data2[1]["value_linehr3"];
							lineChartHr(valueLineHR3,categoryLineHR2);
							// ========End HR Line 3 ===============
						}
					});
				});





		$("#form_1").submit(function(){
				var ParamYearPlus = parseInt($("#ParamYear").val());
				var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlusText = "";
				var ParamMonthPlusText = "";
				if(ParamMonthPlus>12){
					ParamYearPlus=ParamYearPlus +1;
					ParamMonthPlus=ParamMonthPlus-12;
				}
				ParamYearPlusText = (ParamYearPlus +543)+"" ;
				ParamMonthPlusText = ParamYearArr[ParamMonthPlus];

		$.ajax({
		url:'revTooltip.jsp',
		type:'get',
		dataType:'html',
		data:{"month":ParamMonthPlus,"year":ParamYearPlus},
		success:function(data){
				$(".revenue#title").empty();
				$(".revenue#title").append("รายได้ ณ "+ParamMonthPlusText+" "+ParamYearPlusText);

				 var dataSplit= data.split(",");
				 var htmlInput="";
					for(var i=0; i<dataSplit.length; i++){
					htmlInput+="<div id='"+(i+101)+"' class='revTooltip' style='display:none'>"+dataSplit[i]+"</div>";
					//console.log(dataSplit[i]);
					}
					$(".revTooltip").remove();
					$("body").append(htmlInput);
					//console.log($(".revTooltip#1").length);
		}
		});
				});






	/*	$("#form_1").submit(function(){
					$.ajax({
						url:'processRevenue.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val()},
						success:function(data2){
							//console.log(data2)
							var pecent = parseFloat(data2[0]["gauge3"]).toFixed(2);
							gauge("#gauge3",pecent);
							$("#container-gauge3 .gaugeValue").empty();
							$("#container-gauge3 .gaugeValue").append(pecent);
							$("#plan3").empty();
							var plan = parseFloat(data2[0]["plang3"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$("#plan3").append(planwC);
							$("#revenue3").empty();
							var result = parseFloat(data2[0]["revenueg3"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$("#revenue3").append(resultwC);
							//===================End Gauge3
							var serieBar = data2[1]["value_barrevenue2"];
							var categoryBar = data2[2]["categorybarrevenue2"];
							barChartFinancial(serieBar,categoryBar);

						}
					});
				});*/
//==========================Revenue Gauge =====================
						$("#form_1").submit(function(){
				//var ParamYearPlus = parseInt($("#ParamYear").val());
				//var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlus =2012;
				var ParamMonthPlus = 12;
							var ParamYearPlusText = "";
							var ParamMonthPlusText = "";
							if(ParamMonthPlus>12){
								ParamYearPlus=ParamYearPlus +1;
								ParamMonthPlus=ParamMonthPlus-12;
							}

					$.ajax({
						url:'processRevenue1.jsp',
						type:'get',
						dataType:'json',
						data:{"month":ParamMonthPlus,"year":ParamYearPlus},
						success:function(data2){
							//console.log(data2)
							var pecent = parseFloat(data2[0]["gauge3"]).toFixed(2);
							gauge("#gauge3",pecent);
							$("#container-gauge3 .gaugeValue").empty();
							$("#container-gauge3 .gaugeValue").append(pecent);
							$("#plan3").empty();
							var plan = parseFloat(data2[0]["plang3"]).toFixed(2);
							var planwC = addCommas(plan);
							planwC += " ล้านบาท";
							$("#plan3").append(planwC);
							$("#revenue3").empty();
							var result = parseFloat(data2[0]["revenueg3"]).toFixed(2);
							var resultwC = addCommas(result);
							resultwC += " ล้านบาท";
							$("#revenue3").append(resultwC);
							//===================End Gauge3
						}
					});
				});
				//====================Revenue Chart ==================
		$("#form_1").submit(function(){
				//var ParamYearPlus = parseInt($("#ParamYear").val());
				//var ParamMonthPlus = (parseInt($("#ParamMonth").val()))+1;
				var ParamYearPlus =2012;
				var ParamMonthPlus = 12;
							var ParamYearPlusText = "";
							var ParamMonthPlusText = "";
							if(ParamMonthPlus>12){
								ParamYearPlus=ParamYearPlus +1;
								ParamMonthPlus=ParamMonthPlus-12;
							}

					$.ajax({
						url:'processRevenue2.jsp',
						type:'get',
						dataType:'json',
						data:{"month":ParamMonthPlus,"year":ParamYearPlus},
						success:function(data2){
							//console.log(data2)
						    var serieBar = data2[0]["value_barrevenue2"];
							var categoryBar = data2[1]["categorybarrevenue2"];
							barChartFinancial(serieBar,categoryBar);
						}
					});
				});
//====================== Radio Button Click
		$(".radio1").click(function(){
			//$("#loading").ajaxStart(function(){
			//	$("#piehr2").css("opacity","0.2");
		///	}).ajaxStop(function(){
		//		$("#piehr2").css("opacity","1");
		//	});
			//alert("yes");
			//alert($("input:radio[id=notsum]:checked").val());
					$.ajax({
						url:'processHRvsOper.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"flag":$(this).val()},
						
						success:function(data2){
							//console.log(data2)
							//============= HR Pie 3================
							var totalPieHR1 = data2[0]["totalPieHR3"];
							var valuePieHR1 = data2[1]["value_piehr3"];
							pieChartHR("#piehr2",valuePieHR1,totalPieHR1);
							// ========End HR Pie 3===============

						}
					});
				});
/*
		$("#sum").click(function(){
					$.ajax({
						url:'processHRvsOper.jsp',
						type:'get',
						dataType:'json',
						data:{"month":$("#ParamMonth").val(),"year":$("#ParamYear").val(),"flag":$("input.radio1").val()},
						success:function(data2){
							console.log(data2)
							//============= HR Pie 3================
							var totalPieHR1 = data2[0]["totalPieHR3"];
							var valuePieHR1 = data2[1]["value_piehr3"];
							pieChartHR("#piehr2",valuePieHR1,totalPieHR1);
							// ========End HR Pie 3===============

						}
					});
				});

*/

				$("#form_1").submit(function(){
						//	$("#piehr2").empty();
						//	$("#notsum").trigger("click");
						$("#checkRadio1").trigger("click");
						$.ajax({
						url:'Process.jsp',
						type:'GET',
						dataType:'html',
						data:$(this).serialize(),
						success:function(data){
							//alert("data ok");

							//$("body").append("<>")
							$("#content").empty();
							
							$("#content").append(data);
							
							$(".kpiN").tooltip({
							//txt:"Key Performance Indicator Key Performance Indicator",
							color:"black"
							});
									
							$(".ball").tooltip({
							//txt:"Key Performance Indicator Key Performance Indicator",
							color:"black"
							});

							
						}						
						});
				return false;
				});
//click trigger();
		$("form.#form_1 #submit1").trigger("click");
		$("#checkRadio1").trigger("click");
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
 /*  
   	function getTooltip(category) {
	var fieldtest ="";
				   $(document).ready(function(){
						$.ajax({
							url:'revTooltip.jsp',
							type:'GET',
							dataType:'text',
							data:{"bsc_id":category},
							success:function(data){
								fieldtest = data;
								//alert(test);
							}
						});
					});
					setTimeout(function(){
							console.log(fieldtest);

					},2000);
	    console.log(fieldtest);
		return fieldtest;
}
*/
   	function getTooltip(category) {
	var tooltipStr = "";
	var id = (parseInt(category)+100).toFixed(2);
	var idStr = ".revTooltip#"+id;
	//console.log(category);
	//console.log(idStr);

	//console.log($(".revTooltip#1").length);
	//console.log($(idStr).text());
return	$(idStr).text();
	
	
	}


/*### pieChart hr  Defind   end ###*/

			</script>
		<!-- End jQuery 0001-->
			<script>
			   $(document).ready(function(){
				  $("#ParamYear").kendoDropDownList({
				  theme:$(document).data("kendoSkin") || "metro",
					  height:400,
					  //width:50
				  });
				  $("#ParamMonth").kendoDropDownList({
				   height: 400
				  });
	
				  $("#ParamOrg").kendoDropDownList();
			   });
			</script>
		<div id="tooltip"></div>
		<div class="content" style="width:970px; margin:auto;">
			<div id="row1">
						<div id="boxL">
							<!-- ### BSC Dashboard Start ###-->
							<div id="Main-Panel" class="k-content">
									<form method="GET" id="form_1">
									<table width=100%>
									<tr>
										<td><label for="ParamYear">ปีงบประมาณ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<select name="ParamYear" id="ParamYear" >
											<%out.print(V_Year);%>
										</select>
										</td>

										<td><label for="ParamMonth">เดือน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<select name="ParamMonth" id="ParamMonth" >
											<%out.print(V_Month);%>
										</select>
										</td>
										<!--
										<td><label for="ParamOrg">หน่วยงาน :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<select name="ParamOrg" id="ParamOrg" onChange="getParamOrg(this.value);">
											<%out.print(V_Org);%>
										</select>
										</td>
										-->
										<td>
										<input type="submit"value="&nbsp;&nbsp;OK&nbsp;&nbsp;"  class="k-button" id="submit1" >
										</td>
									</tr>
									</table>
									</form>
						</div>
							<div id="content">
							</div>
							<div id="loading" ></div>
							<!-- ### BSC Dashboard End ###-->
						</div>
				
						<div id="boxR">
							<!-- ### Budget Dashboard End ###-->
							<div id="mainContent">
											<div id="head" style="background-color:#008EC3;">
												<div id="title" class="budget" style="color:white;">
												งบประมาณ
												</div>
											</div>
											<div id="content">
											
													<div id="contentL">
														<div id="container-gauge2">
															<div id="gauge1">
															
															</div>
															<div class="gaugeValue"></div>
														</div>
															<div id="head">
																<div id="title">
																งบดำเนินงาน
																</div>
															</div>
															<div id="content">
																	<div id="l">
																		แผนทั้งปี 
																		</div>
																		<div class="r" id="plan1">
																		</div>
																		<div id="l">
																		ผลการใช้จ่าย 
																		</div>
																		<div class="r" id="result1">
																		</div>

															</div>
													</div>
													<div id="contentR">
														<div id="container-gauge">
																<div id="gauge2">
																
																</div>
																<div class="gaugeValue"></div>
														</div>
																<div id="head">
																	<div id="title">
																	งบก่อสร้าง
																	</div>
															</div>
															<div id="content">
																<div id="l">
																แผนทั้งปี 
																</div>
																<div class="r" id="plan2">
															
																</div>
																<div id="l" >
																ผลการใช้จ่าย 
																</div>
																<div class="r" id="result2" >
																
																</div>
													
															</div>
													</div>
											</div>
											<div id="bottom">
												<div id="title">
												งบดำเนินงาน(ล้านบาท)
												</div>
											<div id="barChartBudget"></div>
											</div>
							</div>
							<!-- ### Budget Dashboard End ###-->
						</div>
			</div>
			
			<div id="row2">
					<div id="boxL">
							<div id="head">
							<div id="title">
							บุคลากร
							</div>
							</div>
							<div id="mainContent">
							
									<div id="contentL">
											<div id="head">
												<div id="title">
											จำนวนบุคลากรแยกตามพันธกิจ
												</div>
											</div>
											<div id="content">
											
												<div id="contentTop">
												<div id="piehr"></div>
												</div>
															
												<div id="contentBottom">
													<div id="titleTop">
												Employee Turnover
													</div>
												<div id="lineChartHr"></div>
												</div>
											</div>
									</div>
									<div id="contentR">
											<div id="head">
												<div id="title">
									ค่าใช้จ่ายบุคลากรเทียบกับค่าใช้จ่ายดำเนินการสะสม
												</div>
											</div>
											<div id="content">
													
													<div id="contentBottom">
														<div id="title">
														<span style="text-align:center;float:left;font-weight:bold; width:100%;" >สัดส่วนพนักงานตามกลุ่มตำแหน่ง </span>
														</div>
														<div id="piehr3"></div>
													</div>

														<div id="contentTop">
													<div id="title">
														<form>
															<table border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td>
																	<input type="radio"  name="radio1" class="radio1" id ="checkRadio1"checked value=0>
																	</td>
																	<td>
																	ไม่รวมค่าเสือม
																	</td>
																</tr>
																<tr>
																	<td>
																	<input type="radio"  name="radio1" class="radio1" id ="checkRadio2" value=1>
																	</td>
																	<td>
																	รวมค่าเสือม
																	</td>
																</tr>
															</table>
														</form>
														</div>
													<div id="piehr2"></div>
													
													</div>



											</div>
									</div>
							</div>
					</div>
					<div id="boxR">
								<div id="head">
										<div id="title" class="revenue">
										รายได้
										</div>
								</div>
								<div id="mainContent">
										<div id="contentTop">
												<div id="contentL">
														<div id="head">
															<div id="title">
															% รายได้เทียบแผนทั้งปี
															</div>
														</div>
														<div id="content">
															<table  width="168" style="font-size:11px;">
																<tr>
																	<td>
																	แผนรายได้ทั้งปี
																	</td>
																	<td align="right">
																	<div id="plan3"></div>
																	</td>
																</tr>
																<tr>
																	<td>
																	ผลรวมรายได้
																	</td>
																	<td align="right">
																	<div id="revenue3"></div>
																	</td>
																</tr>
															</table>
														</div>
												</div>
												<div id="contentR">
													<div id="container-gauge3">
														<div id="gauge3"></div>
														<div class="gaugeValue"></div>
													</div>
													
												</div>
										</div>
									
										<div id="contentBottom">
											<div id="titleBottom">
								รายได้แบ่งตามประเภท (ล้านบาท)
											</div>
											<div id="#contentBottom">
												<div id="barChartFinancial"></div>
											</div>
										</div>
								</div>
					</div>
			</div>
		</div>

</body>
</html>
















