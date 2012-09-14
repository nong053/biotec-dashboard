<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<% 
String ParamYear  = request.getParameter("ParamYear");
String ParamMonth  = request.getParameter("ParamMonth");
String ParamOrg  = request.getParameter("ParamOrg");
// convert to buddhism Year
Integer YearBY = (java.lang.Integer.parseInt(ParamYear))+543;
String titleStr = "";

String connectionURL="jdbc:mysql://localhost:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="root";
String Query="";
String center_name="";

Connection conn= null;
Statement st;
ResultSet  rs;
Class.forName(Driver).newInstance();
conn = DriverManager.getConnection(connectionURL,User,Pass);


st = conn.createStatement();
Query="CALL sp_owner_wavg_score(";
Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
rs = st.executeQuery(Query);
while(rs.next()){
	String ParamScore =  rs.getString("owner_wavg_score") ;
	titleStr="ผลสำเร็จ ศูนย์พันธุวิศวกรรมและเทคโนโลยีชีวภาพแห่งชาติได้ " + ParamScore +" คะแนน";
}

st = conn.createStatement();
Query="CALL sp_parent_kpi_list(";
Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
rs = st.executeQuery(Query);
String tableFun = "[";
int i=0;

while(rs.next()){
	if(i>0){
		tableFun += ",";
	}
	String kpi_code = rs.getString("kpi_code");
	String kpi = rs.getString("kpi") ;
	tableFun += "{Field2: \"";
	tableFun += "<div class =kpiN id="+i+">"+kpi_code+"</div>"+kpi;
	out.print("<div class=tootip id="+i+"><b>"+rs.getString("kpi_comment")+"</b></div>");

	//=============Get Url with Details Button Start============
	String urlpage = rs.getString("url");
	//out.print("["+urlpage+"]WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW") ;
	if(urlpage == null || urlpage.equals(""))
	{
		tableFun +="";
	}
	else
	{
		tableFun +=" <a href="+urlpage+" target=_blank><button class=k-button>รายละเอียด</button></a> ";
	}
	tableFun += "\", ";

	//=============Get Url with Details Button End============
	String target_value = rs.getString("target_value");
	tableFun += "Field3: \"";
	tableFun += "<div id=textR>"+ target_value +"</div> \",";

	String kpi_uom = rs.getString("kpi_uom");
	tableFun += "Field4: \"";
	tableFun += kpi_uom + "\",";

	String kpi_weighting = rs.getString("kpi_weighting");
	tableFun += "Field5: \"";
	tableFun +=  "<div id=textR>"+kpi_weighting +"</div> \",";

	String baseline = rs.getString("baseline") ;
	tableFun += "Field5_1: \"";
	tableFun += baseline + "\",";

	String performance_value = rs.getString("performance_value") ;
	tableFun += "Field6: \"";
	tableFun += "<div id=textR>"+ performance_value +"</div> \",";

//=================================Color Start=========================
	String performance_percentage = rs.getString("performance_percentage");

	Statement st1;
	ResultSet  rs1;
	String QueryColor = "";
	st1 = conn.createStatement();
	QueryColor="CALL sp_color_code(";
	QueryColor += performance_percentage+")";
	rs1 = st1.executeQuery(QueryColor);
	while(rs1.next())
	{
		tableFun += "";
	}

	tableFun += "Field7: \"";
	tableFun += "<center><div id='target'><div id='percentage'>" + performance_percentage +"</div></div></center> \",";

	String kpi_wavg_score = rs.getString("kpi_wavg_score");
	tableFun += "Field7_1: \"";
	tableFun += "<div id=textR>"+ kpi_wavg_score +"</div> \",";

	//===============GraphLine Start=====================
	tableFun += "Field9: \"";
	
	//Statement st2;
	//ResultSet  rs2;
	String QueryGraph = "";
	String KpiID= rs.getString("kpi_id");

	//st2 = conn.createStatement();
	QueryGraph = "CALL sp_parent_kpi_trend(";
	QueryGraph += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\","+KpiID+")";
	rs1 = st1.executeQuery(QueryGraph);
	while(rs1.next())
	{
		//	if(KpiID.equals(rs1.getString("kpi_id") ))
		//	{
				String Oct = rs1.getString("Oct");
				String Nov = rs1.getString("Nov");
				String Dec = rs1.getString("Dec");
				String Jan = rs1.getString("Jan");
				String Feb = rs1.getString("Feb");
				String Mar = rs1.getString("Mar");
				String Apr = rs1.getString("Apr");
				String May = rs1.getString("May");
				String Jun = rs1.getString("Jun");
				String Jul = rs1.getString("Jul");
				String Aug = rs1.getString("Aug");
				String Sep = rs1.getString("Sep");
				
				tableFun += "<div class=inlinesparkline>"
								+Oct+","
								+Nov+","
								+Dec+","
								+Jan+","
								+Feb+","
								+Mar+","
								+Apr+","
								+May+","
								+Jun+","
								+Jul+","
								+Aug+","
								+Sep
								+"</div>\"";
				tableFun += "}";
		//	}
	}
	//===============GraphLine End=====================
	i++;
}
tableFun += "]";



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
	width:100%;
	margin:auto;
	}
	.content #table_content{
	float:left;
	width:100%;
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
	background:#dafbd1;
	border-radius:3px;
	width:100%;
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
	background:#CCCCCC;
	padding:5px;
	display:inline;
	border-radius:5px;
	margin:2px;
	}/*
	.inlinesparkline{
	cursor:pointer;
	}
	.inlinesparkline_sub{
	cursor:pointer;
	}

###  Config file Header  Start###*/
#contentMain1{
	
	width:auto;
	height:auto;
	}
	#contentMain1 #contentL{
	
	width:200px;
	height:200px;
	float:left;
	}
	#contentMain1 #contentR{
	
	
	height:200px;
	float:right;
	}
	#contentMain1 #contentR #contentDetail{
	border:2px solid #DAFBD1;
	padding:20px;
	margin:auto;
	width:600px;
	margin-top:30px;
	height:40px;
	border-radius:10px;
	background-color:#63f763;
	font-size:16px;
	font-weight:bold;
	text-align:center;
	}
/*### Config file   Header End###*/
	
	</style>

	<script type="text/javascript">

	var ballRed  = "<div id='ballRed'  class='ball' style='background-color:#e51e25; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballYellow  = "<div id='ballYellow'  class='ball' style='background-color:yellow; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballGreen  = "<div id='ballGreen'  class='ball' style='background-color:#8fbc01; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballGray  = "<div id='ballGray'  class='ball' style='background-color:#cccccc; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	
	// TITLE BY JSON START
	/*########## Table Content Start ##########*/
	var $titleJ =[
            
              {
                  field: "Field2",
				  width: 240
			 },
              {
                  field: "Field3",
				  width: 60
			 },
              {
                  field: "Field4",
				  width:60
			 },
              {
                  field: "Field5",
				  width: 50
			 },
              {
                  field: "Field5_1",
				  width: 80
			 },
            
              {
                  field: "Field6",
				  width: 80
			 },
              {
                  field: "Field7",
				  width: 90
			 },
              {
                  field: "Field7_1",
				  width: 80
			 },
              {
                  field: "Field9",
				  width: 80
			 }];


	var $dataJ = <%=tableFun%>;


//var $dataJ = [{Field2: "EXIM BANK 1697-9_11130_2700", Field3: "21239",Field4: "17",Field5: "590373.53",Field5_1: "68446.16",Field6: "-521927.37",Field7: "590373.53",Field7_1: "590373.53",Field9: "1,4,4,7,8,9,10"}] ;
/*
	var $dataJ =[
                  {
                    
					  Field2: "<div class='kpiN'>KS1</div>สัดส่วนโครงการ RDDE/TT ที่มีการประเมินผลกระทบจากผลงานวิจัยต่อโครงการ RDD/TT ที่ดำเนินการทั้งหมด",
                      Field3: " <div id='textR'>0.15</div> ",
					  Field4: "-",
                      Field5: "<div id='textR'>25</div>",
					  Field5_1:"4,500 (ล้านบาท)",

					  Field6: " <div id='textR'>0.44  <br>2,000 <br>ล้านบาท<div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>10.10</div>",
					 
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,1,11,14,16,20,1</span> "
                     
					  
                     
                  },
                  {
                 
					  Field2: "<div class='kpiN'>KS5</div>ร้อยละความสำเร็จในการขับเคลื่อน Flagship- ผลิตภัณฑ์จากทรัพยากรชีวภาพ เพื่อการถ่ายทอดเชิงพาณิชย์ - เทคโนโลยี สวทช. นำไปเผยแพร่แก่ชุมชน ชึ่งก่อให้เกิดรายได้เพื่ม และเป็นชุมชนต้นแบบให้กับชุมชนอื่นๆ",
                    
					  Field3: "<div id='textR'>100</div>  ",
					  Field4: "ร้อยละ",
                      Field5: "<div id='textR'> 15</div>",
					  Field5_1:"1.07",
				
					  Field6: "<div id='textR'>1.13 <div>",
                      Field7: "<center><div id='target'><div id='percentage'>113%</div> <div id='score'>"+ballGray+""+ballGray+""+ballGreen+"</div></div></center>",
					  Field7_1:"<div id='textR'>11.30<div>",
					
					  Field9: "  <span class='inlinesparkline'>1,4,4,7,8,9,10</span>"
                  },
                  {
                   
					  Field2: "<div class='kpiN'>KS7</div>จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัยลิขสิทิธิ์/สิทธิประโยชน์และบริการเทคนิค/วิชาการ",
                      
					  Field3: "<div id='textR'>100</div>  ",
					  Field4: " ล้านบาท",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"15",
			
					  Field6: "<div id='textR'>4.30<div> ",
                      Field7: "<center><div id='target'><div id='percentage'>11%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					   Field7_1:"<div id='textR'>1.61<div>",
					 
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,10</span> "
                  },
                  {
                
					  Field2: " <div class='kpiN'>KS7-B</div>สัดส่วนรายได้ ต่อค่าใช้จ่าย(SBBU)",
                      
					  Field3: "<div id='textR'>0.69</div>  ",
					  Field4: "-",
                      Field5: "<div id='textR'>5</div> ",
					  Field5_1:"20",
					 
					  Field6: "<div id='textR'>5.00<div>",
                      Field7: " <center><div id='target'><div id='percentage'>25%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></cener>",
					  Field7_1:"<div id='textR'>3.75<div>",
					
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,10</span>"
                  },
                  {
                
					  Field2: "<div class='kpiN'>KS9-A</div> จัดการระบบการรับงานทุกประเภทโดยใช้ระบบคุณภาพตามมาตรฐาน ISO 9001",
                      
					  Field3: "<div id='textR'>สอดคล้องกับมาตรฐาน ISO 9001</div>  ",
					  Field4: "- ",
                      Field5: "<div id='textR'>10 </div>",
					  Field5_1:"-",
				
					  Field6: "<div id='textR'>36.00<div>",
                      Field7: " <center><div id='target'><div id='percentage'>36%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></cener>",
					  Field7_1:"<div id='textR'>3.60</div>",
					  
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,10</span>"
                  },
					
                  {
                  
					  
					  Field2: "<div class='kpiN'>KS1-A</div>สัดส่วน IC scoreต่อบุคคากรวิจัย</a> ",
               
					  Field3: "<div id='textR'>ไม่ต่ำกว่า 11.5</div> ",
					  Field4: " -",
                      Field5: " <div id='textR'>30</div>",
					  Field5_1:"9,290(ล้านบาท)",
					
					  Field6: "<div id='textR'>0.58</div>",
                      Field7: " <center><div id='target'><div id='percentage'>24%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					  Field7_1:"<div id='textR'>6.05</div>",
					 
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,10</span> "
				  }
				  
				  ]; 		
	*/


	$("#grid").kendoGrid({
		
           height: 630,
	      //groupable: true,
         // scrollable: true,
          //sortable: true,
         // pageable: true,
		//  detailInit: detailInit,

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
		$('.inlinebar').sparkline('html', {type: 'bullet',height: '30',width:'200', barColor: 'red'} );
	    $("th.k-header , .k-minus").click(function(){
		//$('.inlinesparkline').sparkline(); 
		//$('.inlinesparkline').sparkline('html',{type:'line',width:'100'}); 

	});


		//#######################Menagement Table Start ######################


		//#######################Menagement Table End #######################

	


		/*##########Function jQuery  add Deatail  result  End ########*/

		
		//#######################Menagement Tab Start ######################
		$("ul.k-numeric li span").removeClass();
		$("ul.k-numeric li span").html("");
		/*Remove  numberic  bottom tab*/
		/*Header Bgcolor*/
		$("th.k-header").css({"background":"#33cc33 "});
		$(".k-grid-header").css({"background":"#33cc33 "});
		/*Header Bgcolor*/
		/*Content Suffer Color Row*/
		 $("tr[data-uid]").css({"background":"#d7e4bd"});
		$(".k-alt").css({"background":"#dafbd1"});
		/*Content Suffer Suffer Color Row*/
		/*Footer Bgcolor*/
		$(".k-pager-wrap").css({"background":"#33cc33"});
	
		/*Footer Bgcolor*/
		//set font white
			$(".k-header").css({"color":"white"});

		/*### management grid2 Start###*/
		var $title21=[{
			field:"Field21",
			width:100
		},{
			field:"Field22",
			width:200
		}];
		var $data21=[{
			
			Field21:"test21",
			Field22:"test content22"
		},{
			Field21:"2test21",
			Field22:"2test content22"
		}];
/*
		$("#grid2").kendoGrid({
			columns:$title21,
			dataSource:{
			data:$data21,
			pageSize:10
			}
		});
*/
		/*### Management grid2 End###*/
		//#######################Menagement Tab End #######################


	</script>


 <!-- Define the HTML table, with rows, columns, and data -->


<div id="contentMain1">
	<div id="contentL">
	<img src="owner_picture/biotec.jpg">
	</div>
	<div id="contentR">
		<div id="contentDetail">
	ตัวชี้วัดผลสำเร็จศูนย์พันธุวิศวกรรมและเทคโนโลยีชีวภาพ<br>ประจำปีงบประมาณ  <%=YearBY%>
		</div>
	</div>
</div>





 <div id="table_title" style="clear:both">
 
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
		  
<!--<th class="k-hierarchy-cell k-header">&nbsp;</th>
          <th data-field="Field1" ><center><b>มุมมอง</b></center></th>-->
		  <th  data-field="Field2"><center><b>ตัวชี้วัด</center></th>
		  <th data-field="Field3"><center><b>เป้าหมาย</b></center></th>
		  <th data-field="Field4"><center><b>หน่วยนับ</b></center></th>
		  <th data-field="Field5"><center><b>น้ำหนัก</b></center></th>
		  <th data-field="Field5_1"><center><b>ข้อมูลฐาน</b></center></th>
		 
		  <th data-field="Field6"><center><b>ผลงานสะสม</b></center></th>
		  <th data-field="Field7"><center><b>% เทียบ<br>เป้าหมาย</b></center></th>
		  <th data-field="Field7_1"><center><b>คะแนน<br>ถ่วงน้ำหนัก </b></center></th>
		  <th data-field="Field9"><center><b> กราฟคะแนน<br>ถ่วงน้ำหนัก</b></center></th>

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
     
      	
</tr>

  </tbody>
 </table>

 </div>

</div>


<style>
	table#grid2 thead th{
	padding:5px;
	}
	table#grid2 thead tr th{
		text-align:left;
	}
	ol {
	font-weight:bold;
	}
	ol li{
	font-weight:normal;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	//alert("hello wold");
	//console.log($("table#grid2 tbody tr:odd").get());
$("table#grid2 tbody tr td").css("padding","5px");
$("table#grid2 tbody tr:odd").css("background-color","#d7e4bd");
$("table#grid2 tbody tr:even").css("background","#dafbd1");


//set corner object
$(".ball").corner();

});
</script>

<p>

</p>
 <div id="table_title" style="clear:both">
 
	<div id="title">

งานในหน้าที่ ที่ใช้ Resource ของหน่วยงาน
<!--<span class="inlinebar">4.5,5,5,5,5,5</span>-->

	</div>
 </div>

<table id="grid2"  width="100%">
	<thead >
		<tr bgcolor="#33CC33">
			<th data-field="Field21" style="text-align:center;color:white;">ลำดับ</th>
			<th data-field="Field22" style="text-align:center;color:white;">งานที่ได้รับมอบหมาย</th>
		</tr>
	</thead>
	<tbody>
	<%
	st = conn.createStatement();
	Query="CALL sp_owner_assignment(";
	Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
	rs = st.executeQuery(Query);
	while(rs.next()){
%>
		<tr>
			<td style="text-align:center"><%=rs.getString("assign_order")%></td> 
			<td><%=rs.getString("assign_desc")%></td>
		</tr>
<%}%>
	</tbody>
</table>

<%
	st = conn.createStatement();
	Query="CALL sp_owner_comment(";
	Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
	rs = st.executeQuery(Query);
	while(rs.next()){
			out.print(rs.getString("comment")); 
	}
%>

<br style="clear:both">



	