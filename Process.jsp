

<% 

String ParamYear  = request.getParameter("ParamYear");
String ParamMonth  = request.getParameter("ParamMonth");
String ParamOrg  = request.getParameter("ParamOrg");

String titleStr = "";
//out.print("{"+ParamYear+","+ParamMonth+","+ParamOrg+"}");
//out.print('{"0":"nong","1":"nuy","2":"TEST"}');
//out.print(ParamOrg);

//out.print(ParamOrg);
//out.print(ParamOrg.trim());


if(ParamOrg.equals("NSTDA")){
	
	
	titleStr=" ผลการดำเนินงานสะสมของ นายทวีศักดิ์ กออนันตกูล ได้ 36.42 %&nbsp;&nbsp;  ";

}else if(ParamOrg.equals("BIOTEC")){
	
	titleStr=" ผลการดำเนินงานสะสมของ นายวีระศักดิ์ อุดมกิจเดชา ได้ 47.5%&nbsp;&nbsp; ((45+50)/2) ";

}else if(ParamOrg.equals("MTEC")){
	
	titleStr="";


}else if(ParamOrg.equals("NECTEC")){
	
	titleStr="";


}else{
	
	titleStr="";

//NANOTEC
}

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
	width:99%
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
	border-radius:10px;
	width:99%;
	color:black;
	margin:2px;
	}
	#table_title  #title{

padding:15px;
padding-top:20px;
font-weight:bold;
font-size:16px;

	}
	#textR{
	/*background:red;*/
	text-align:right;
	padding-right:5px;
	}
	#kpiN{
	background:#CCCCCC;
	padding:5px;
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

	var ballRed  = "<div id='ballRed' style='background-color:red; width:25px;height:25px;border-radius:100px; float:left;'>1</div>";
	var ballYellow  = "<div id='ballRed' style='background-color:yellow; width:25px;height:25px;border-radius:100px; float:left;'>2</div>";
	var ballGreen  = "<div id='ballRed' style='background-color:green; width:25px;height:25px;border-radius:100px; float:left;'>3</div>";
	var ballGray  = "<div id='ballRed' style='background-color:#cccccc; width:25px;height:25px;border-radius:100px; float:left;'></div>";
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
				   width: 60
              },
              {
                  field: "Field2",
				  width: 310
			 },
              {
                  field: "Field3",
				  width: 70
			 },
              {
                  field: "Field4",
				  width:100
			 },
              {
                  field: "Field5",
				  width: 70
			 },
              {
                  field: "Field5_1",
				  width: 100
			 },
              {
                  field: "Field5_2",
				  width: 100
			 },
              {
                  field: "Field6",
				  width: 90
			 },
              {
                  field: "Field7",
				  width: 110
			 },
              {
                  field: "Field7_1",
				  width: 80
			 },
              {
                  field: "Field8",
				  width:100
			 },
              {
                  field: "Field9"
			 }];


var $titleJ2 =[
              {
                  field: "Field1",
				  title:"ตัวชีวัด",
				   width: 340
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
				   title:"หน่วยวัด"
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
				  width: 60
			 },
              {
                  field: "Field6",
				   title:"ผลงานสะสม",
				  width: 100
			 },
              {
                  field: "Field7",
				   title:"เทียบแผน",
				  width: 100
			 },
              {
                  field: "Field7_1",
				   title:"% เฉลี่ยถ่วงน้ำหนัก",
				  width: 130
			 },
              {
                  field: "Field8",
				   title:"ข้อมูลล่าสุด",
				   width:100
			 },
              {
                  field: "Field9",
				  title:"แนวโน้ม"
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
					  Field2: "<div id='kpiN'>KS1</div>การลงทุนด้าน ว และ ท ในภาคการผลิต ภาคบริการและภาคการผลิต ภาคบริการและภาคเกษตรกรรม",

                      Field3: " <div id='textR'>1.1</div> ",
					  Field4: "เท่าของการลงทุนปี54",
                      Field5: "<div id='textR'>25</div>",
					  Field5_1:"4,500 (ล้านบาท)",
					  Field5_2:"2,000(ล้านบาท)",
					  Field6: " <div id='textR'>0.44<div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>10.10</div>",
					  Field8: " 2012-05-10<br>12:00:31",
					  Field9: " <span class='inlinesparkline'>1,4,4,7,5,9,10</span> "
                     
					  
                     
                  },
                  {
                      Field1: "ST ",
					  
					  Field2: "<div id='kpiN'>KS1-A</div>มูลค่าผลกระทบต่อเศรษฐกิจและสังคมของประเทศที่เกิดจากการนำผลงานวิจัยไปใช้ประโยชน์ <a href='File/test.pdf' target='_blank'><button class='k-button'>รายละเอียด</button></a> ",
               
					  Field3: "<div id='textR'>2.4</div> ",
					  Field4: " เท่าของค่าใช้จ่าย",
                      Field5: " <div id='textR'>25</div>",
					  Field5_1:"9290(ล้านบาท)",
					  Field5_2:"5,4000(ล้านบาท)",
					  Field6: "<div id='textR'>0.58</div>",
                      Field7: " <center><div id='target'><div id='percentage'>24%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					  Field7_1:"<div id='textR'>6.05</div>",
					  Field8: "2012-05-10<br>12:00:31 ",
					  Field9: " <span class='inlinesparkline'>1,4,4,7,5,9,10</span> "
				  },
                  {
                      Field1: "PA&FI ",
					  Field2: "<div id='kpiN'>KS5</div>สัดส่วนรายได้ต่อค่าใช้จ่ายทั้งหมด",
                    
					  Field3: "<div id='textR'>1</div>  ",
					  Field4: "-",
                      Field5: "<div id='textR'> 10</div>",
					  Field5_1:"1.07",
					  Field5_2:"1.13",
					  Field6: "<div id='textR'>1.13 <div>",
                      Field7: "<center><div id='target'><div id='percentage'>113%</div> <div id='score'>"+ballGray+""+ballGray+""+ballGreen+"</div></div></center>",
					  Field7_1:"<div id='textR'>11.30<div>",
					  Field8: " 2012-05-10<br>12:00:31",
					  Field9: "  <span class='inlinesparkline'>1,4,4,7,5,9,10</span>"
                  },
                  {
                      Field1: "IM ",
					  Field2: "<div id='kpiN'>KS7</div>สัดส่วนบทบาทความวารสารารนานาชาติต่อคลาการวิจัย ",
                      
					  Field3: "<div id='textR'>40</div>  ",
					  Field4: " ฉบับ/100 คน/ปี",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"36",
					  Field5_2:"4.3",
					  Field6: "<div id='textR'>4.3<div> ",
                      Field7: "<center><div id='target'><div id='percentage'>11%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					   Field7_1:"<div id='textR'>1.61<div>",
					  Field8: " 2012-05-10<br>12:00:31",
					  Field9: " <span class='inlinesparkline'>1,4,4,7,5,9,10</span> "
                  },
                  {
                      Field1: "IM ",
					  Field2: " <div id='kpiN'>KS7-B</div>สัดส่วนทรัพย์สินทางปัญญาต่อบุคคลาการวิจัย",
                      
					  Field3: "<div id='textR'>20</div>  ",
					  Field4: "ฉบับ/100 คน/ปี",
                      Field5: "<div id='textR'>15</div> ",
					  Field5_1:"20",
					  Field5_2:"5",
					  Field6: "<div id='textR'>5<div>",
                      Field7: " <center><div id='target'><div id='percentage'>25%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></cener>",
					  Field7_1:"<div id='textR'>3.75<div>",
					  Field8: " 2012-05-10<br>12:00:31",
					  Field9: " <span class='inlinesparkline'>1,4,4,7,5,9,10</span>"
                  },
                  {
                      Field1: "LG ",
					  Field2: "<div id='kpiN'>KS9-A</div> ร้อยละความสำเร็จในการผลักดัน 9 กลยุทธ์ได้ตามแผน",
                      
					  Field3: "<div id='textR'>100</div>  ",
					  Field4: "ร้อยละ ",
                      Field5: "<div id='textR'>10 <div>",
					  Field5_1:"-",
					  Field5_2:"36",
					  Field6: "<div id='textR'>36<div>",
                      Field7: " <center><div id='target'><div id='percentage'>36%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></cener>",
					  Field7_1:"<div id='textR'>3.60</div>",
					  Field8: " 2012-05-10<br>12:00:31",
					  Field9: " <span class='inlinesparkline'>1,4,4,7,5,9,10</span>"
                  }/*,
                  {
                      Field1: " ",
					  Field2: "",
					  Field3: "",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: "",
                      Field7:  "",
					  Field7_1:"",
					  Field8: "% เฉลี่ยถ่วงน้ำหนักรวม   ",
					  Field9: "36.42"
                  }*/
				  
				  
				  ]; 		
	


	var $dataJ2 =[
                  {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "BIOTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
                  {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "MTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "NANOTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					  Field2: "NECTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "BIOTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "MTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "NANOTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  },
				   {
                      Field1: "Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
					  Field2: "NECTEC",

                      Field3: "  ",
					  Field4: "",
                      Field5: "",
					  Field5_1:"",
					  Field5_2:"",
					  Field6: " ",
                      Field7: " ",
					 Field7_1:"",
					  Field8: " ",
					  Field9: ""
                     
					  
                     
                  }
				  
				  ]; 
	//CONTENT BY JSON END

	$("#grid").kendoGrid({
		
          height: 500,
	      //groupable: true,
          scrollable: true,
          sortable: true,
          pageable: true,
		  detailInit: detailInit,

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
								
								scrollable: false,
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
						 
                } // End Function detailInit



		/*##########Function jQuery  add Deatail  result  Start ########*/

$(".k-grid-pager").append("<span style='float:right; padding-right:210px;'><b>% เฉลี่ยถ่วงน้ำหนักรวม  = 36.42   </b></span>");


		/*##########Function jQuery  add Deatail  result  End ########*/
	});

	

	</script>


 <!-- Define the HTML table, with rows, columns, and data -->

 <div id="table_title">
	<div id="title">
	<%
	out.print(titleStr);
	%>
<!--<span class="inlinebar">4.5,5,5,5,5,5</span>-->
	
	</div>
 </div>
 
 <div class="content">
 <div id="table_content">
 <table id="grid">
  <thead>
      <tr>
		  
<th class="k-hierarchy-cell k-header">&nbsp;</th>
          <th data-field="Field1" ><center>มุมมอง</center></th>
		  <th  data-field="Field2"><center>ตัวชี้วัด</center></th>
		 
		  <th data-field="Field3"><center>เป้าหมาย</center></th>
		  <th data-field="Field4"><center>หน่วยวัด</center></th>
		  <th data-field="Field5"><center>น้ำหนัก</center></th>
		  <th data-field="Field5_1"><center>Baseline</center></th>
		  <th data-field="Field5_2"><center>Actual</center></th>
		  <th data-field="Field6"><center>ผลงานสะสม</center></th>
		  <th data-field="Field7"><center>%เทียบแผน</center></th>
		  <th data-field="Field7_1"><center>% เฉลี่ย<br>ถ่วงน้ำหนัก</center></th>

          <th data-field="Field8"><center>ข้อมูลล่าสสุด</center></th>
		  <th data-field="Field9"><center>แนวโน้ม</center></th>

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



	