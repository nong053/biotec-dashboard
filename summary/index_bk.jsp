<%@page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
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
		


        <script src="../js/jquery.min.js"></script>
		<!--<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>-->
		<script type="text/javascript" src="../plugin/jquery.tooltip.js"></script>
		<script type="text/javascript" src="../js/kendo.all.min.js"></script>
		<!--<script type="text/javascript" src="../js/kendo.dataviz.min.js"></script>-->
		<script type="text/javascript" src="../js/jquery.sparkline.min.js"></script> 
		<script type="text/javascript" src="../jqueryUI/js/jquery-ui-1.8.21.custom.min.js"></script>
	<script src="../js/console.js"></script>
	
	  
		
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
				border-radius: 5px 5px 5px 5px;
				color: white;
				left: 40px;
				padding: 5px;
				position: relative;
				text-align: center;
				top: -35px;
				width: 20px;
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
				$("#gauge1").kendoRadialGauge({
					theme:$(document).data("kendoSlin") || "metro",
					pointer: {
                            value: 65
                        },
					

                        scale: {
							
                            minorUnit: 10,
                            startAngle: -30,
                            endAngle: 210,
                            max: 100,
							labels:{
							//template: "#= value #%",
							position:"outside",
							font:"8px,Tahoma"
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
				$("#gauge2").kendoRadialGauge({
				theme:$(document).data("kendoSkin") || "metro",
				pointer:{
				value:80
				}, 
				
					scale: {
                            minorUnit: 10,
                            startAngle: -30,
                            endAngle: 210,
                            max: 100,
							labels:{
							//template: "#= value #%",
							position:"outside",
							font:"8px,Tahoma"
							},
                          /* Rang Start*/
                            ranges: [
                                {
                                    from: 0,
                                    to: 100,
                                    color: "#99ccff"
                                }
                            ]
							/*Rang End*/
                        }
				});
				/*### kendoRadialGauge End ###*/

/*###  barChart Budget start ###*/

var barChartBudget= function(){

	$("#barChartBudget").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:320,
						height:110
						},

						
                        legend: {
                            position: "right"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: false
                        },
                        series: [{
                            name: "แผน",
                            data: [1, 5, 5, 3]
                        }, {
                            name: "ผล",
                            data: [2,3, 4, 6]
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}",
							   font:"11px"
                            }
                        },
                        categoryAxis: {
                            categories: [ "โครงการ" ," หน่วยงาน", "ครุภัณฑ์ ", "บุคลากร"],
							labels:{
							font:"11px"
							}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
                    });
}
barChartBudget();
/*###  barChart Budget  end ###*/

/*###  pieChart hr  start ###*/

function onSeriesHover(e) {
    //console.log("Hovered value: " + e.value*2);
	
}


function onSeriesClick(e) {
  
	//console.log(e.category  );

	//alert($subCategory);

	
}

var pieCharhr= function(){
var summ=900;
		$("#piehr").kendoChart({
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
							font:"11px"
							}
            },
			chartArea: {
			width: 300,
			height: 130
			},
			series: [{
                            type: "pie",

                            data: [ {
	
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
pieCharhr();

/*###  pieChart2 hr  end ###*/
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
							font:"11px"
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

/*###  pieChart3 hr  end ###*/
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
							font:"11px"
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
var lineChartHr= function(){

	$("#lineChartHr").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: ""
                        },
						chartArea:{
						width:325,
						height:170
						},

						
                        legend: {
                            position: "bottom",
							labels:{
							font:"11px"
							}
                        },
                        seriesDefaults: {
                            type: "line",
							//stack: true
                        },
                        series: [{
                            name: "ปีปัจจุบัน",
                            data: [10, 12, 11, 13, 12,11,13,12,13,13,13,13,12]
                        },{
                            name: "ปีที่แล้ว",
                            data: [10, 12, 13, 13, 13,10,13,14,12,13,12,13,10]
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}%",
								font:"11px"
                            }
                        },
                        categoryAxis: {
                            categories: [" ต.ค."," พ.ย."," ธ.ค."," ม.ค."," ก.พ."," มี.ค."," เม.ย."," พ.ค."," มิ.ย."," ก.ค."," ส.ค."," ก.ย."]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
                    });

		
		
}
lineChartHr();
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
								font:"8px,Tahoma"

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

var barChartBudget= function(){

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

                        series: [{
                           name: "รายได้แบ่งตามประเภท(ล้านบาท)",
                            data: [291.22, 75.39, 7.16, 67.38, 35.59,50.41],
							
							
							
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							    visible: true,
							   format: "{0}",
								font:"11px"
							  
                            }
                        },
                        categoryAxis: {
                            categories: [ "1" ," 2", "3 ", "4", "5","6"],
							labels:{
							font:"11px"
							}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}"
                        }
                    });
}
barChartBudget();
/*###  barChart Financial  end ###*/
/*###  Financial Stop ###*/


				//alert("ok for jquery");

				$("#form_1").submit(function(){
						$.ajax({
						url:'Process.jsp',
						type:'GET',
						dataType:'html',
						data:$(this).serialize(),
						success:function(data){
							//alert("data ok");
							$("#content").empty();
							
							$("#content").append(data);
							
							$(".kpiN").tooltip({
							txt:"Key Performance Indicator Key Performance Indicator",
							color:"black"
							});
						}						
						});
				return false;
				});
//click trigger();
		$("form.#form_1 #submit1").trigger("click");
		
			});



/*###  pieChart hr  Defind start ###*/
function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}
/*### pieChart hr  Defind   end ###*/

			</script>
		<!-- End jQuery 0001-->
			<script>
			   $(document).ready(function(){

				

				  $("#ParamYear").kendoDropDownList({
				  theme:$(document).data("kendoSkin") || "metro",
					  height:20,
					  width:50
				  });
			
				  $("#ParamMonth").kendoDropDownList({
				   height: 400
				  });
	
				  $("#ParamOrg").kendoDropDownList();
			   });
			</script>


		<div id="tooltip"></div>
		<div class="content" style="width:990px; margin:auto;">
			<div id="row1">
					
						<div id="boxL">

							<!-- ### BSC Dashboard Start ###-->
							<div id="Main-Panel" class="k-content">
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
												<div id="title" style="color:white;">
												งบประมาณ
												</div>
											</div>
											<div id="content">
											
													<div id="contentL">
														<div id="container-gauge2">
															<div id="gauge1">
															gauge1
															</div>
															<div class="gaugeValue">65%</div>
														</div>
															<div id="head">
																<div id="title">
																งบดำเนินการ
																</div>
															</div>
															<div id="content">
																	<div id="l">
																		แผนทั้งปี 
																		</div>
																		<div id="r">
																	4,694.01 ล้านบาท
																		</div>
																		<div id="l">
																		ผลการใช้จ่าย 
																		</div>
																		<div id="r">
																	3,177.33 ล้านบาท
																		</div>

															</div>
													</div>
													<div id="contentR">
														<div id="container-gauge">
																<div id="gauge2">
																gauge2
																</div>
																<div class="gaugeValue">80%</div>
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
																<div id="r">
																1,4000.00 ล้านบาท
																</div>
																<div id="l"  style="width:40%;">
																ผลการใช้จ่าย 
																</div>
																<div id="r" style="width:55%;">
																818.74 ล้านบาท
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
									ค่าใช้จ่ายบุคคลากรเทียบกับค่าใช้จ่ายดำเนินการสะสม
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
																	<input type="radio"  name="radio1" checked>
																	</td>
																	<td>
																	ไม่รวมค่าเสือม
																	</td>
																</tr>
																<tr>
																	<td>
																	<input type="radio"  name="radio1">
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
										<div id="title">
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
																	1,160.00 ล้านบาท
																	</td>
																</tr>
																<tr>
																	<td>
																	แผน ณ Q4
																	</td>
																	<td align="right">
																	1,160.00 ล้านบาท
																	</td>
																</tr>
																<tr>
																	<td>
																	ผลรวมรายได้
																	</td>
																	<td align="right">
																	550.43 ล้านบาท
																	</td>
																</tr>
															</table>
														</div>
												</div>
												<div id="contentR">
													<div id="container-gauge3">
														<div id="gauge3"></div>
														<div class="gaugeValue">65%</div>
													</div>
													
												</div>
										</div>
									
										<div id="contentBottom">
											<div id="titleBottom">
								รายได้แบ่งตามประเภท
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
















