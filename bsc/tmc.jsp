<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%! 
    String getColorBall(int position,String color)
    {
		String ballScoll = "";
               if(position==1){
                       ballScoll+="<div id=ball1  class=ball style=background-color:"+color+"></div>";
                       ballScoll+="<div id=ball2  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id=ball3  class=ball style=background-color:#cccccc></div>";
               }else if(position==2){
                       ballScoll+="<div id=ball1  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id=ball2  class=ball style=background-color:"+color+"></div>";
                       ballScoll+="<div id=ball3  class=ball style=background-color:#cccccc></div>";
               }else if(position==3){
                       ballScoll+="<div id=ball1  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id=ball2  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id=ball3  class=ball style=background-color:"+color+"></div>";
               }
      return ballScoll;
    }
 %>

<% 
String ParamYear  = request.getParameter("ParamYear");
String ParamMonth  = request.getParameter("ParamMonth");
String ParamOrg  = request.getParameter("ParamOrg");
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
	titleStr="ศูนย์บริหารจัดการเทคโนโลยีได้ " + ParamScore +" คะแนน";
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

	tableFun += "Field7: \"";
	tableFun += "<center><div id='target'><div id='percentage'>" + performance_percentage +"</div></div></center> ";
	while(rs1.next())
	{
		int positionBall =  rs1.getInt("color_order");
		String colorCode = rs1.getString("color_code");
		tableFun += getColorBall(positionBall,colorCode);
	//	out.print(getColorBall(1,colorCode));

	}
	tableFun += "\",";

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

				tableFun += "<span class=inlinesparkline>"
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
								+"</span>\"";
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
		.ball{
       width:20px;
       height:20px;border-radius:100px; 
       float:left;
	}

	.content{
	width:100%
	}
	.content #table_content{
	float:left;
	width:100%
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
	background:#d8d3e0;
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


		/*###  Config file Header  Start###*/
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
	border:2px solid #cccccc;
	padding:20px;
	margin:auto;
	width:600px;
	margin-top:30px;
	height:40px;
	border-radius:10px;
	background-color:#6c2e9b;
	font-size:16px;
	font-weight:bold;
	text-align:center;
	color:white;
	}
/*### Config file   Header End###*/
	</style>

	<script type="text/javascript">
	$(document).ready(function(){

	var ballRed  = "<div id='ballRed'  class='ball' style='background-color:#e51e25; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballYellow  = "<div id='ballYellow'  class='ball' style='background-color:yellow; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballGreen  = "<div id='ballGreen'  class='ball' style='background-color:#8fbc01; width:20px;height:20px;border-radius:100px; float:left;'></div>";
	var ballGray  = "<div id='ballGray'  class='ball' style='background-color:#cccccc; width:20px;height:20px;border-radius:100px; float:left;'></div>";

	// TITLE BY JSON START
	/*########## Table Content Start ##########*/
	var $titleJ =[
             
              {
                  field: "Field2",
				  width: 200
			 },
              {
                  field: "Field3",
				  width: 60
			 },
              {
                  field: "Field4",
				  width:80
			 },
              {
                  field: "Field5",
				  width: 60
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
				  width: 100
			 },
              {
                  field: "Field7_1",
				  width: 80
			 },
              {
                  field: "Field9",
				  width:80
			 }];

	var $dataJ = <%=tableFun%>;



	$("#grid").kendoGrid({
		
          height: 490,
	      //groupable: true,
         // scrollable: true,
         // sortable: true,
          //pageable: true,
		 // detailInit: detailInit,

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

	    $("th.k-header , .k-minus").click(function(){
		//$('.inlinesparkline').sparkline(); 
		//$('.inlinesparkline').sparkline('html',{type:'line',width:'100'}); 

	});


		//#######################Menagement Table End #######################
	

		/*##########Function jQuery  add Deatail  result  End ########*/
		//#######################Menagement Tab Start ######################
		/*Remove  numberic  bottom tab*/
		$("ul.k-numeric li span").removeClass();
		$("ul.k-numeric li span").html("");
		/*Remove  numberic  bottom tab*/
		/*Header Bgcolor*/
		$("th.k-header").css({"background":"#8064a2 "});
		$(".k-grid-header").css({"background":"#8064a2 "});
		/*Header Bgcolor*/
		/*Content Suffer Color Row*/
		//$(".k-master-row").css({"background-color":"#d8d3e0"});
		 $("tr[data-uid]").css({"background":"#d8d3e0"});
		$(".k-alt").css({"background":"#edeaf0"});
		
		/*Content Suffer Suffer Color Row*/
		/*Footer Bgcolor*/
		$(".k-pager-wrap").css({"background":"#8064a2"});
		/*Footer Bgcolor*/
		//set font white
			$(".k-header").css({"color":"white"});
		//#######################Menagement Tab End #######################
			//set corner object
		$(".ball").corner();
	});

	

	</script>


 <!-- Define the HTML table, with rows, columns, and data -->

<!--### Header Start ###-->
<div id="contentMain1">
	<div id="contentL">
	<img src="owner_picture/tmc.jpg">
	</div>
	<div id="contentR">
		<div id="contentDetail">
	ตัวชี้วัดผลสำเร็จศูนย์บริการจัดการเทคโนโลยี <br>ประจำปีงบประมาณ <%=YearBY%>
		</div>
	</div>
</div>
<br style="clear:both">
<!--### Header End ###-->
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
		  
<!--<th class="k-hierarchy-cell k-header">&nbsp;</th>-->
     
		  <th  data-field="Field2"><center><b>ตัวชี้วัด</center></th>
		  <th data-field="Field3"><center><b>เป้าหมาย</b></center></th>
		  <th data-field="Field4"><center><b>หน่วยนับ</b></center></th>
		  <th data-field="Field5"><center><b>น้ำหนัก</b></center></th>
		  <th data-field="Field5_1"><center><b>ข้อมูลฐาน</b></center></th>
		  
		  <th data-field="Field6"><center><b>ผลงานสะสม</b></center></th>
		  <th data-field="Field7"><center><b>% เทียบเป้าหมาย</b></center></th>
		  <th data-field="Field7_1"><center><b>คะแนน<br>ถ่วงน้ำหนัก </b></center></th>
		  <th data-field="Field9"><center><b> กราฟ<br>ผลงานสะสม</b></center></th>

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
$("table#grid2 tbody tr:odd").css("background-color","#EDEAF0");
$("table#grid2 tbody tr:even").css("background","#D8D3E0");


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
		<tr bgcolor="#8064A2">
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




	