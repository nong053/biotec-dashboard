

<% 

String ParamYear  = request.getParameter("ParamYear");
String ParamMonth  = request.getParameter("ParamMonth");
//String ParamOrg  = request.getParameter("ParamOrg");

String titleStr = "";
//out.print("{"+ParamYear+","+ParamMonth+","+ParamOrg+"}");
//out.print('{"0":"nong","1":"nuy","2":"TEST"}');
//out.print(ParamOrg);

//out.print(ParamOrg);
//out.print(ParamOrg.trim());



%>



	<style type="text/css">
	#test{
	color:red;
	font-size:20px;
	font-weight:bold;
	}
	#target{
	width:auto;
	margin:auto;
	}
	#target #percentage{
/*	float:left;*/
	width:70px;
	}
	#target #score{
	/*float:right;*/
	width:auto;
	display:block;
	padding:5px;
	}
	.content{
	width:100%
	}
	.content #table_content{
	float:left;
	width:645px;
	}
	.content #graph_content{
	float:right;
	width:35%;
	height:auto;
	background-color:#CFCFCF;

	background-image:url("images/highlight.png");
	border-radius:10px;
	}
	.chart-wrapper{
	background-image:url("images/chart-wrapper.png");
	background-color:#CFCFCF;
	}
	#head_graph{
	/*background-color:#CFCFCF;*/
	}
	#table_title{
	background:#CFCFCF;
	border-radius:3px;
	width:99%;
	color:black;
	margin:0px;
	}
	#table_title  #title{

padding:5px;

font-weight:bold;
font-size:14px;

	}
	#textR{
	/*background:red;*/
	text-align:right;
	padding-right:5px;
	}
	.kpiN{
	background:#99ccff ;
	padding:2px;
	display:inline;
	border-radius:5px;
	margin:2px;
	}
	.inlinesparkline{
	cursor:pointer;
	}
	</style>
	<!--<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/kendo.all.min.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
    <link href="styles/kendo.common.min.css" rel="stylesheet">
    <link href="styles/kendo.default.min.css" rel="stylesheet">
	<link href="jqueryUI/css/smoothness/jquery-ui-1.8.20.custom.css" rel="stylesheet">
	<script type="text/javascript" src="jqueryUI/js/jquery-ui-1.8.20.custom.min.js"></script>--> 
	<script type="text/javascript">
	$(document).ready(function(){

	var ballRed  = "<div id='ballRed' class='ball' style='background-color:#e51e25; color:white;width:17px;height:17px; border-radius:100px; float:left;'>1</div>";
	var ballYellow  = "<div id='ballYellow' class='ball' style='background-color:yellow; color:white;width:17px;height:17px;float:left;border-radius:100px; border:1px solid #cccccc;'>2</div>";
	var ballGreen  = "<div id='ballGreen' class='ball' style='background-color:#8fbc01; color:white;width:17px;height:17px; float:left; border-radius:100px;border:1px solid #cccccc;'>3</div>";
	var ballGray  = "<div id='ballGray' class='ball' style='background-color:#cccccc; width:17px;height:17px;border-radius:100px; float:left;'></div>";

	
	/*setTimeout(function(){
	//$(".ball").corner("0px");
	
	},100);*/

/*
var ballRed = $("<div id='ballRed'>HELLO</div>").css({"background-color":"red","border-radius":"100px","width":"50px","height":"50px"});
var ballGray = $("<div id='ballRed'>HELLO</div>").css({"background-color":"#cccccc","border-radius":"100px","width":"50px","height":"50px"});
var ballYellow = $("<div id='ballRed'>HELLO</div>").css({"background-color":"yellow","border-radius":"100px","width":"50px","height":"50px"});
var ballGreen = $("<div id='ballRed'>HELLO</div>").css({"background-color":"green","border-radius":"100px","width":"0px","height":"50px"});
 $("body").prepend(ballRed);
 $("body").prepend(ballGray);
 $("body").prepend(ballYellow);
 $("body").prepend(ballGreen);
	*/

	//alert("hello jquery");
	// TITLE BY JSON START
	/*########## Table Content Start ##########*/
	var $titleJ =[
              {
                  field: "Field1",
				  title:"testtttt",
				   width: 40
              },
              {
                  field: "Field2",
				  width: 180
			 },
              {
                  field: "Field3",
				  width: 50
			 },
              {
                  field: "Field4",
				  width:50
			 },
              {
                  field: "Field5",
				  width: 50
			 },
              {
                  field: "Field5_1",
				  width: 50
			 },
              
              {
                  field: "Field6",
				  width: 50
			 },
              {
                  field: "Field7",
				  width: 100
			 }];


var $titleJ2 =[
              {
                  field: "Field1",
				  title:"ตัวชีวัด",
				   width: 210
              },
              {
                  field: "Field2",
				   title:"หน่วยงาน",
				  width: 100
			 },
              {
                  field: "Field3",
				   title:"เป้าหมาย",
				  width: 80
			 },
              {
                  field: "Field4",
				   title:"หน่วยวัด",
				  width: 70
			 },
              {
                  field: "Field5",
				   title:"น้ำหนัก",
				  width: 60
			 },
              {
                  field: "Field5_1",
				  title:"baseline",
				  width: 70

			 },
              {
                  field: "Field5_2",
				   title:"actual",
				  width: 70
			 },
              {
                  field: "Field6",
				   title:"ผลงานสะสม",
				  width: 80
			 },
              {
                  field: "Field7",
				   title:"%เทียบแผน",
				  width: 80
			 },
              {
                  field: "Field7_1",
				   title:"% เฉลี่ยถ่วงน้ำหนัก",
				  width: 150
			 },
              {
                  field: "Field8",
				   title:"ข้อมูลล่าสุด",
				   width:100
			 },
              {
                  field: "Field9",
				  title:"แนวโน้ม",
				  width: 100
			 }];


	// TITLE BY JSON END
	//CONTENT BY JSON START 

//ST/ST/PA&FI/IM/IM/LG
//Lag/Lead:: KS1/KS1-A/KS5/KS7/KS7-B/KS9-A
/*
ตัวชี้วัด::
 การลงทุนด้าน ว และ ท ในภาคการผลิต ภาคบริการและภาคการผลิต ภาคบริการและภาคเกษตรกรรม
/มลูค่าผลกระทบต่อเศรษฐกิจและสังคมของประเทศที่เกิดจากการนำผลงานวิจัยไปใช้ประโยชน์
/สัดส่วนรายได้ต่อค่าใช้จ่ายทั้งหมด
/สัดส่วนบทบาทความวารสารารนานาชาติต่อคลาการวิจัย
/สัดส่วนทรัพย์สินทางปัญญาต่อบุคคลาการวิจัย
/ร้อยละความสำเร็จในการผลักดัน 9 กลยุทธ์ได้ตามแผน
น้ำหนัก:: 25/25/10/15/15/10
*/
//หนวยนับ::เท่าของการลงทุนปี54/เท่าของค่าใช้จ่าย/-/ฉบับ/100คน/ปี/ร้อยละ
	var $dataJ =[
                  {
                      Field1: "ST",
					  Field2: "<div class='kpiN'>KS1</div>การลงทุนด้าน ว และ ท ในภาคการผลิต ภาคบริการและภาคการผลิต",

                      Field3: " <div id='textR'>1.1</div> ",
					  Field4: "เท่าของการลงทุนปี54",
                      Field5: "<div id='textR'>25</div>",
					  Field5_1:"4,500 (ล้านบาท)",
				
					  Field6: " <div id='textR'>0.44<div>",
                      Field7: "<center><div id='target'> <div id='score'>"+ballRed+""+ballGray+""+ballGray+" 40%</div></div></center> "
				
                     
					  
                     
                  },
                  {
                      Field1: "ST ",
					  
					  Field2: "<div class='kpiN'>KS1-A</div>มูลค่าผลกระทบต่อเศรษฐกิจและสังคมของประเทศ",
               
					  Field3: "<div id='textR'>2.4</div> ",
					  Field4: " เท่าของค่าใช้จ่าย",
                      Field5: " <div id='textR'>25</div>",
					  Field5_1:"9290(ล้านบาท)",
					 
					  Field6: "<div id='textR'>0.58</div>",
                      Field7: " <center><div id='target'> <div id='score'>"+ballRed+""+ballGray+""+ballGray+" 24%</div></div></center> "
					
				
				  },
                  {
                      Field1: "PA&FI ",
					  Field2: "<div class='kpiN'>KS5</div>สัดส่วนรายได้ต่อค่าใช้จ่ายทั้งหมด <a href='File/test.pdf' target='_blank'><button class='k-button'>รายละเอียด</button></a>",
                    
					  Field3: "<div id='textR'>1</div>  ",
					  Field4: "-",
                      Field5: "<div id='textR'> 10</div>",
					  Field5_1:"1.07",
				
					  Field6: "<div id='textR'>1.13 <div>",
                      Field7: "<center><div id='target'> <div id='score'>"+ballGray+""+ballGray+""+ballGreen+" 113%</div></div></center>"
				
                  },
                  {
                      Field1: "IM ",
					  Field2: "<div class='kpiN'>KS7</div>สัดส่วนบทบาทความวารสารารนานาชาติต่อคลาการวิจัย ",
                      
					  Field3: "<div id='textR'>40</div>  ",
					  Field4: " ฉบับ/100 คน/ปี",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"36",
	
					  Field6: "<div id='textR'>4.3<div> ",
                      Field7: "<center><div id='target'> <div id='score'>"+ballRed+""+ballGray+""+ballGray+" 11%</div></div></center> "
					
                  },
                  {
                      Field1: "IM ",
					  Field2: " <div class='kpiN'>KS7-B</div>สัดส่วนทรัพย์สินทางปัญญาต่อบุคคลาการวิจัย",
                      
					  Field3: "<div id='textR'>20</div>  ",
					  Field4: "ฉบับ/100 คน/ปี",
                      Field5: "<div id='textR'>15</div> ",
					  Field5_1:"20",
			
					  Field6: "<div id='textR'>5<div>",
                      Field7: " <center><div id='target'><div id='score'>"+ballRed+""+ballGray+""+ballGray+" 25%</div></div></cener>"
                  },
                  {
                      Field1: "LG ",
					  Field2: "<div class='kpiN'>KS9-A</div> ร้อยละความสำเร็จในการผลักดัน 9 กลยุทธ์ได้ตามแผน",
                      
					  Field3: "<div id='textR'>100</div>  ",
					  Field4: "ร้อยละ ",
                      Field5: "<div id='textR'>10 <div>",
					  Field5_1:"-",
		
					  Field6: "<div id='textR'>36<div>",
                      Field7: " <center><div id='target'><div id='score'>"+ballRed+""+ballGray+""+ballGray+"36%</div></div></cener>"
				
                  }
				  
				  
				  ]; 		
	


	var $dataJ2 =[
                  {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "BIOTEC",

                      Field3: " 100 ",
					  Field4: "ร้อบละ",
                      Field5: "15",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"500 (ล้านบาท)",
					  Field6: " 0.50",
                      Field7: " ",
					 Field7_1:"8.01	",
					  Field8: "2012-05-10 12:00:31 ",
					  Field9: ""
                     
					  
                     
                  },
                  {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "MTEC",

                      Field3: " 100 ",
					  Field4: "ร้อบละ",
                      Field5: "10",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0.7 ",
                      Field7: " ",
					 Field7_1:"8.00",
					  Field8: "2012-05-10 12:00:31  ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "NANOTEC",

                      Field3: "  100",
					  Field4: "ร้อบละ",
                      Field5: "15",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0,5 ",
                      Field7: " ",
					 Field7_1:"7.01",
					  Field8: "2012-05-10 12:00:31  ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "NECTEC",

                      Field3: " 100 ",
					  Field4: "ร้อบละ",
                      Field5: "15",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0.6 ",
                      Field7: " ",
					 Field7_1:"8.03",
					  Field8: " 2012-05-10 12:00:31 ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "BIOTEC",

                      Field3: " 100 ",
					  Field4: "ล้านบาท",
                      Field5: "15",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0.7 ",
                      Field7: " ",
					 Field7_1:"8.04",
					  Field8: "2012-05-10 12:00:31  ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "MTEC",

                      Field3: " 129 ",
					  Field4: "ล้านบาท",
                      Field5: "20",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0.8 ",
                      Field7: " ",
					 Field7_1:"7.30",
					  Field8: " 2012-05-10 12:00:31 ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "NANOTEC",

                      Field3: "120  ",
					  Field4: "ล้านบาท",
                      Field5: "25",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: " 0.6",
                      Field7: " ",
					 Field7_1:"7.71",
					  Field8: " 2012-05-10 12:00:31 ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "NECTEC",

                      Field3: " 120 ",
					  Field4: "ล้านบาท",
                      Field5: "25",
					  Field5_1:"1,500 (ล้านบาท)",
					  Field5_2:"800 (ล้านบาท)",
					  Field6: "0.4 ",
                      Field7: " ",
					 Field7_1:"7.56",
					  Field8: "2012-05-10 12:00:31  ",
					  Field9: ""
                     
					  
                     
                  }
				  
				  ]; 
	//CONTENT BY JSON END

	$("#grid").kendoGrid({

		theme:$(document).data("kendoSkin") || "blueOpal",
		//theme:$(document).data("kendoSlin") || "metro",
		
          height: 300,
	
	      //groupable: true,
			scrollable: false,
          //sortable: true,
         pageable: true,
		/*  detailInit: detailInit,*/

		/*   dataBound: function() {
                            this.expandRow(this.tbody.find("tr.k-master-row").first());
                        },*/

          columns: $titleJ,
          dataSource: {
              data: $dataJ,
			  pageSize: 10
          }
		
      });
	  /*########## Table Content End ##########*/
			//SET SPARKLINE
		//$(".k-pager-wrap").remove();

		//console.log($(".k-grid td").get());
	//	console.log($("th.k-header").get());
		/*Header Bgcolor*/
		$("th.k-header").css({"background":"#99ccff "});
		$(".k-grid-header").css({"background":"#99ccff "});
		/*Header Bgcolor*/

		/*Footer Bgcolor*/
		$(".k-pager-wrap").css({"background":"#99ccff"});
		$('.k-pager-wrap').css({"padding":"0px"});
		/*Footer Bgcolor*/

		$(".k-grid td").css({"padding-top":"0px","padding-bottom":"0px"});
		$("ul.k-numeric li span").removeClass();
		$("ul.k-numeric li span").html("");
		$(".k-pager-wrap ").html("<div id='right' style='text-align:right; padding-right:20px;'><span style='font-weight:bold';>สรุปคะแนน 30.4</span<></div>" );
		$('.inlinesparkline').sparkline(); 
		//$('.inlinesparkline').sparkline('html',{type:'line',width:'100'}); 
		$('.inlinebar').sparkline('html', {type: 'bullet',height: '30',width:'200', barColor: 'red'} );

	    $("th.k-header").click(function(){
		$('.inlinesparkline').sparkline(); 
		//$('.inlinesparkline').sparkline('html',{type:'line',width:'100'}); 

	});
		//#######################Menagement Table Start ######################
		//alert($("table#grid tr td:eq(3)").length);
		//alert($("table#grid tr td:eq(3)").text());


		//#######################Menagement Table End #######################
	

	 function detailInit(e) {
	
					//alert("hello");
							$("<div/>").kendoGrid({
								
								scrollable: true,
								sortable: true,
								pageable: true,
								 dataBound: function() {
                            this.expandRow(this.tbody.find("tr.k-master-row").first());
                        },
								columns: $titleJ2,
								dataSource: {
								data: $dataJ2,
								pageSize: 8
							}
							}).appendTo(e.detailCell);
						 
				// REMOVE COLUMN START
				$("tr.k-detail-row td.k-hierarchy-cell").remove();
				// REMOVE COLUMN END
			
                } // End Function detailInit



		/*##########Function jQuery  add Deatail  result  Start ########*/
/*
$(".k-grid-pager").append("<span style='float:right; padding-right:210px;'><b>% เฉลี่ยถ่วงน้ำหนักรวม  = 36.42   </b></span>");
*/

		/*##########Function jQuery  add Deatail  result  End ########*/
		//set Ball corner
		$(".ball").corner("0px");
	});

	

	</script>


 <!-- Define the HTML table, with rows, columns, and data -->

 <div id="table_title">
	<!--<div id="title">-->
	<%
	//out.print(titleStr);
	%>
<!--<span class="inlinebar">4.5,5,5,5,5,5</span>-->
	
	<!--</div>-->
 </div>
 
 <div class="content">
 <div id="table_content">
 <table id="grid">
  <thead>
      <tr color="#99ccff ">
		  
<!--<th class="k-hierarchy-cell k-header">&nbsp;</th>-->
          <th data-field="Field1" ><center>มุมมอง</center></th>
		  <th  data-field="Field2"><center>ตัวชี้วัด</center></th>
		 
		  <th data-field="Field3"><center>เป้าหมาย</center></th>
		  <th data-field="Field4"><center>หน่วยวัด</center></th>
		  <th data-field="Field5"><center>น้ำหนัก</center></th>
		  <th data-field="Field5_1"><center>Baseline</center></th>
		
		  <th data-field="Field6"><center>ผลสะสม</center></th>
		  <th data-field="Field7"><center>%เทียบแผน</center></th>
	

        

	  </tr>
  </thead>
  <tbody>
      <tr>
          <td></td>
          <td></td>
		  <td></td>
          <td></td>
		  <td></td>
          <td></td>
		  <td></td>
          <td></td>
		 
</tr>

  </tbody>
 </table>

 </div>

</div>



	