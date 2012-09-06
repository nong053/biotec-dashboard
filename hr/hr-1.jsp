<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 
<%
// Jsp  Server-side
String connectionURL="jdbc:mysql://10.226.202.114:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="bioteccockpit";
String Query="";
Connection conn= null;
Statement st;
ResultSet rs;
try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		out.print("hello jsp");
	}
}
catch(Exception ex){
out.println("Error"+ex);
}
%>

<style>
.content{
width:960px;
height:auto;
/*background:red;*/
margin:auto;
}
.content  #row1{
width:960px;
height:auto
background:blue;
clear:both;


}
.content  #row1 .box{
width:314px;
height:270px;
float:left;
margin:2px;

border-radius:5px;
   /* background: url("images/ui-bg_highlight-hard_100_f2f5f7_1x100.png") repeat-x scroll 50% top #ffffff;*/
    border: 1px solid #DDDDDD;
    color: #362B36;
}
.content  #row1 .box #head{
/*width:auto;
height:30px ;
background:#99ccff;
*/
   /*background: none repeat scroll 0 0 #DEEDF7;*/
    border-radius: 5px 5px 5px 5px;
    color: #2779AA;
    height: 26px;
    margin: 3px;
    padding: 5px;
    width: auto;
	background:url("images/ui-bg_highlight-soft_100_deedf7_1x100.png") repeat-x scroll  50% 50%  #DEEDF7;
    border: 1px solid #AED0EA;

}
.content  #row1 .box #head .title{
	padding:5px;
	text-align:center;
	
}
.content  #row1 .box #body{
width:auto;
height:250px;

}
.content #row2{
width:1000px;
height:300px;

clear:both;


}


.content #row2 #boxL{
width:630px;
height:300px;
border:1 solid blue;

float:left;
}
.content #row2 #boxL #box{
width:308px;
height:300px;
float:left;
margin:2px;
border-radius:5px;
border:1px solid #cccccc;
}
.content #row2 #boxL #box #head{
width:auto;
height:30px ;
background:#cccccc;

}
.content #row2 #boxL #box  #head #title{
	padding:5px;
	text-align:center;
}



.content #row2 #boxL #box  #body{
width:auto;
height:270px;

}


.content #row2 #boxR{

width:630px;
height:300px;
border:1 solid blue;
float:left;

}
.content #row2 #boxR #box{
height:300px;
float:left;
margin:2px;
width:630px;
border-radius:5px;
border:1px solid #cccccc;
background:#EBEBEB;

}
.content #row2 #boxR #box #head{
width:auto;
height:30px ;
background:#cccccc;
}
.content #row2 #boxR #box #head #title{
	padding:5px;
	text-align:center;
}
.content #row2 #boxR  #box #body{
width:auto;
height:310px;
background:#ffffff;

}
#tabHr1{
height:250px;
}
#pie1{
 top: -10px;
  left: -20px;
}
#pie11{
 top: -10px;
  left: -20px;
}
</style>
<!--<% Integer a1 =1; %>-->
<script type="text/javascript">
//var aa = <%=a1%>;
//alert("jquery"+<%=a1%>);
$(document).ready(function(){

//var $summ;//secret you must define varible is $ 
/*###  pie1 start ###*/
var pieChart1= function(){
	var summ = 100; 
		$("#pie1").kendoChart({
		 theme: $(document).data("kendoSkin") || "metro",
			
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",
			
                            data: [ {
                                category: "สก.  ",
                                value: 20,
								//color: "#ff6103"
                            }, {
				
                                category: "ศช.",
                                value: 20
                            }, {
				
                                category: "ศว.   ",
                                value: 20,
								color:"#dee92d"
                            }, {
				
                                category: "ศอ.  ",
                                value: 20,
								color:"#e62d32"
                            }, {
				
                                category: "ศน.",
                                value: 10,
								color:"#ff7110"
                            }, {
				
                                category: "ศจ.",
                                value: 10,
								color:"#6C2E9B"
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            //format: "{0}%"
							template:"#= templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%",
					
				}
			}
	
			
		});


		
		
}
/*###  pie1 end ###*/
/*###  pie11 start ###*/
var pieChart11= function(){
		summ = 100; 
		$("#pie11").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",
                            data: [ {
                                category: "สก.  ",
                                value: 20,
								//color: "#ff6103"
                            }, {
                                category: "ศช.",
                                value: 20
                            }, {
				
                                category: "ศว.   ",
                                value: 20,
								color:"#dee92d"
                            }, {
				
                                category: "ศอ.  ",
                                value: 20,
								color:"#e62d32"
                            }, {
				
                                category: "ศน.",
                                value: 10,
								color:"#ff7110"
                            }, {
				
                                category: "ศจ.",
                                value: 10,
								color:"#6C2E9B"
                            }]
                        }],
			tooltip:{
			visible:true,
			template:"#=templateFormat(value,summ)#"
						},
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie11 end ###*/
/*###  pie2 start ###*/
var pieChart2= function(){
	summ = 100;
		theme:$(document).data("kendoSkin") || "metro",
		$("#pie2").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {

                                category: "พนักงาน               ",
                                value: 75
                            }, {

                                category: "พนักงานโครงการ ",
                                value: 25
                            }]
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
							template:"#=templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie2 end ###*/
/*###  pie3 start ###*/
var pieChart3= function(){
	summ =100;
		$("#pie3").kendoChart({
		theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {

                                category: "ต่ำกว่าปริญญาตรี",
                                value: 10
                            }, {

                                category: "ปริญญาตรี ",
                                value: 30
                            }, {

                                category: "ปริญญาโท",
                                value: 40
                            }, {

                                category: "ปริญญาเอก",
                                value: 20
								},{
                                category: "สูงกว่าปริญญาเอก",
                                value: 0
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            //format: "{0}%"
							template:"#=templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie3 end ###*/
/*###  pie4 start ###*/
var pieChart4= function(){
summ=100;
		$("#pie4").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "ปฎิบัติการ",
                                value: 15
                            }, {
	
                                category: "วิจัยและวิชาการ",
                                value: 40
                            }, {
		
                                category: "จัดการ ",
                                value: 40
                            }, {
			
                                category: "บริหาร ",
                                value: 5
                            }]
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%",
							template:"#=templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie4 end ###*/
/*###  pie5 start ###*/
var pieChart5= function(){
		var summ=100;
		$("#pie5").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 300,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "PPU",
                                value: 20
                            }, {
	
                                category: "PSU",
                                value: 40
                            }, {
		
                                category: "SSU ",
                                value: 40
                            }]
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
							template:"#=templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie5 end ###*/
/*###  pie6 start ###*/
var pieChart6= function(){
var summ=100;
		$("#pie6").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 300,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "เงินเดือนพนักงาน",
                                value: 20
                            }, {
	
                                category: "เงินเดือนลูกจ้าง",
                                value: 40
                            }, {
		
                                category: "เงินช่วยเหลือ	 ",
                                value: 20
                            }, {
			
                                category: "เงินสวัสดิการบำเหน็จ ",
                                value: 20
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            //format: "{0}%"
							template:"#=templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie6 end ###*/
/*###  pie7_1 start ###*/
function onSeriesHover(e) {
    console.log("Hovered value: " + e.value*2);
	
}


function onSeriesClick(e) {
  
	console.log(e.category  );

	//alert($subCategory);

	
}

var pieChart71= function(){
var summ=900;
		$("#pie71").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			name:"9",
			plotArea:{
						background:""
						
						
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 300,
			height: 180,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "BT",
                                value: 220
								 
                            }, {
	
                                category: "NT",
                                value: 240
                            }, {
		
                                category: "MT ",
                                value: 220
                            }, {
			
                                category: "NNT ",
                                value: 220
								
                            }]
                        }],
                        tooltip: {
                            visible: true,
                         //  format: "{0}"
						 //  template: "${ category } ,${ value }%"
						 template: "#= templateFormat(value,summ) #"

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

/*###  pie7_1 end ###*/
/*###  bar7_1 start ###*/
var barChart71= function(){

	$("#barChart71").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "NNT"
                        },
						chartArea:{
						width:300,
						height:220,
						background: ""
						},

						
                        legend: {
                            position: "bottom"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: true
                        },
                        series: [{
                            name: "Part Time",
                            data: [0, 5, 5, 3, 10.20]
                        }, {
                            name: "Full Time",
                            data: [3, 4, 6, 3,4]
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}"
                            }
                        },
                        categoryAxis: {
                            categories: [ "เยี่ยมเยือน" ," แลกเปลี่ยน", "ร่วมวิจัย ", "Postdoc", "นักศึกษา"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
                    });

		
		
}
/*###  bar7_1 end ###*/
/*###  pie7_2 start ###*/
var pieChart72= function(){
var summ = 180;
		$("#pie72").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 180,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "นักศึกษา",
                                value: 20
                            }, {
	
                                category: "เยี่ยมเยือน",
                                value: 40
                            }, {
		
                                category: "แลกเปลี่ยน	 ",
                                value: 20
                            }, {
			
                                category: "ร่วมวิจัย ",
                                value: 20
                            }, {
			
                                category: "Postdoc",
                                value: 60
                            }]
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%",
							template: "#= templateFormat2(value,summ) #"


                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie7_2 end ###*/
/*###  bar7_2 start ###*/
var barChart72= function(){

	$("#barChart72").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "NNT"
                        },
						chartArea:{
						width:300,
						height:180,
						background: ""
						},

						
                        legend: {
                            position: "right"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: true
                        },
                        series: [{
                            name: "ไทย",
                            data: [0, 5, 5, 3]
                        }, {
                            name: "ต่างชาติ",
                            data: [3, 4, 6, 3]
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}"
                            }
                        },
                        categoryAxis: {
                            categories: [ "BT" ," NT", "MT ", "NNT"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
                    });

		
		
}
/*###  bar7_2 end ###*/
/*###  pie7_3start ###*/
var pieChart73= function(){
var  summ = 200;
		$("#pie73").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 180,
			background: ""
			},
			series: [{
                            type: "pie",

                            data: [ {
	
                                category: "ชาวต่างชาติ",
                                value: 60
                            }, {
	
                                category: "ชาวไทย",
                                value: 140
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            format: "{0}%",
							template: "#= templateFormat2(value,summ) #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			}
	
			
		});


		
		
}
/*###  pie7_3 end ###*/
/*###  bar7_3 start ###*/
var barChart73= function(){

	$("#barChart73").kendoChart({
                        theme: $(document).data("kendoSkin") || "metro",
                        title: {
                            text: "NNT"
                        },
						chartArea:{
						width:300,
						height:180,
						background: ""
						},

						
                        legend: {
                            position: "right"
                        },
                        seriesDefaults: {
                            type: "column",
							stack: true
                        },
                        series: [{
                            name: "ใหม่",
                            data: [0, 5, 5, 3]
                        }, {
                            name: "ต่อเนื่อง",
                            data: [3, 4, 6, 3]
                        }],
                        valueAxis: {
                            labels: {
                               // format: "{0}%"
							   format: "{0}"
                            }
                        },
                        categoryAxis: {
                            categories: [ "<1 ปี" ," 1-2  ปี ", "2-3  ปี ", ">3   ปี"]
                        },
                        tooltip: {
                            visible: true,
                            format: "{0}%"
                        }
                    });

		
		
}
/*###  bar7_3 end ###*/

/*###  using all pie start ###*/

pieChart2();
pieChart3();
pieChart4();
pieChart5();
pieChart6();



/*###  using all pie end  ###*/

/*###  kendoui panalBar start  ###*/
$("#panelBar1").kendoPanelBar({
expandMode: "single",
animation: {
        // fade-out closing items over 1000 milliseconds
        close: {
            duration: 15000,
            effects: "fadeOut"
        },
       // fade-in and expand opening items over 500 milliseconds
       open: {
           duration: 5500,
           effects: "expandVertical fadeIn"
       }
	  }
});
$("#panelBar2").kendoPanelBar({
	expandMode:"single"
});

/*###  kendoui panalBar end  ###*/

/*###  kendoui barchart1 start  ###*/
$("#panelBar1 .panel1").live("click",function(){
	
	pieChart71();
	barChart71();
	
});
$("#panelBar1 .panel1").trigger("click");

$("#panelBar1 .panel2").click(function(){
		pieChart72();
		barChart72();
});
$("#panelBar1 .panel3").click(function(){
	//alert("hello world");
		pieChart73();
		barChart73();
});
/*###  kendoui barchart1 end  ###*/
	




//alert($("#panelBar2").length);

$("#panelBar2 .panel1").click(function(){

pieChart1();
});
$("#panelBar2 .panel2").click(function(){

pieChart11();
});
$("#panelBar2 .panel1").trigger("click");


/*### Config Tab Start ###*/


//$(".ui-tabs-panel").css({"padding":"0px"});


/* Tab2 Start*/

	

$("#tabHr1").tabs();
$("#tabHr1 ul li").css({"font-weight":"normal"});

$("a[href=#hrContent21]").trigger("click");
pieChart1();
$("a[href=#hrContent21]").click(function(){
	pieChart1();
});

$("a[href=#hrContent22]").click(function(){
	pieChart11();
});

$("#tabHr1.ui-tabs-panel ").css({"padding":"0px"});
$("#tabHr1.ui-widget-content").css({"border":"0px"});


/*Tab2 End*/



/*### Config Tab End ###*/


});


//define function extenal jquery

function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}

function templateFormat2(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}

function templateFormat3(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}

</script>
<div class="content">
	<div id="row1">
<!--
				<div class="box">
						<div id="body">
								<div id="tabHr1">
								<ul>
										<li><a href="#hrContent21">	พนักงานตามหน่วยงาน</a></li>
										<li><a href="#hrContent22">อัตรางานว่าง</a></li>
								</ul>

								<div id="hrContent21">
										<table >
												<tr>
														<td>
																<div id="pie1"></div>
														</td>
																						
												</tr>									
										</table>
										
								</div>
								<div id="hrContent22">
									<table>
												<tr>
														<td>
																<div id="pie11"></div>
														</td>
																						
												</tr>									
										</table>
								</div>
						</div>
						</div>
				</div>

-->
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานแยกตามศูนย์
							</div>
						</div>
						<div id="body">
									<div id="pie1"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
								<div id="pie2"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามระดับการศึกษา
							</div>
						</div>
						<div id="body">
							<div id="pie3"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามกลุ่มตำแหน่ง
								</div>
						</div>
						<div id="body">
								<div id="pie4"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามหน้าที่
								</div>
						</div>
						<div id="body">
								<div id="pie5"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนค่าใช้จ่ายบุคลากร
								</div>
						</div>
						<div id="body">
								<div id="pie6"></div>
						</div>
				</div>
	</div>
	
</div>

</ul>
<br style="clear:both">

