<link href="npr.css" rel="stylesheet" type="text/css" /> 

<script type="text/javascript">

$(document).ready(function(){
//alert("jquery");

/*###  pie1 start ###*/
var pieChart1= function(){
	
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
			height: 270,
			background: ""
			},
			series: [{
                            type: "pie",
			
                            data: [ {
                                category: "สก.  ",
                                value: 20
                            }, {
				
                                category: "ศช.",
                                value: 20
                            }, {
				
                                category: "ศว.   ",
                                value: 20
                            }, {
				
                                category: "ศอ.  ",
                                value: 20
                            }, {
				
                                category: "ศน.",
                                value: 10
                            }, {
				
                                category: "ศจ.",
                                value: 10
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            format: "{0}%"

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
			height: 270,
			background: ""
			},
			series: [{
                            type: "pie",
			
                            data: [ {
                                category: "สก.  ",
                                value: 20
                            }, {
				
                                category: "ศช.",
                                value: 20
                            }, {
				
                                category: "ศว.   ",
                                value: 20
                            }, {
				
                                category: "ศอ.  ",
                                value: 20
                            }, {
				
                                category: "ศน.",
                                value: 10
                            }, {
				
                                category: "ศจ.",
                                value: 10
                            }]
                        }],
                        tooltip: {
                            visible: true,
                            format: "{0}%"

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
			height: 270,
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
                            format: "{0}%"

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
			height: 270,
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
                            format: "{0}%"

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
			height: 270,
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
                            format: "{0}%"

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
			height: 270,
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
                            format: "{0}%"

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
			height: 270,
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
                            format: "{0}%"

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
			width: 180,
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
						height:210,
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

		$("#pie72").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 180,
			height: 200,
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
							template: "#= templateFormat2(value,180) #"


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
                            text: "ไทย"
                        },
						chartArea:{
						width:300,
						height:210,
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

		$("#pie73").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			title: {
				 text: ""
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 180,
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
							template: "#= templateFormat2(value,200) #"

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
                            text: "ใหม่"
                        },
						chartArea:{
						width:300,
						height:210,
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
	pieChart71();
	barChart71();


	pieChart72();
	barChart72();


	pieChart73();
	barChart73();

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
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
									<table>
											<tr>
												<td>
												<div id="pie71"></div>
												</td>
												<td>
												<div id="barChart71"></div>
												</td>
											</tr>
									</table>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
								<table>
											<tr>
												<td>
												<div id="pie72"></div>
												</td>
												<td>
												<div id="barChart72"></div>
												</td>
											</tr>
									</table>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
								<table>
											<tr>
												<td>
												<div id="pie73"></div>
												</td>
												<td>
												<div id="barChart73"></div>
												</td>
											</tr>
									</table>
						</div>
				</div>
			
	</div>
</div>

<br style="clear:both">

