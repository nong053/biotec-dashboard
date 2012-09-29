<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<%! 
    String getColorBall(int position,String color,int id)
    {
		String ballScoll = "";
               if(position==1){
                       ballScoll+="<div id=visualball style='margin-left:13px;margin-top:10px'><div id="+id+"  class=ball style=background-color:"+color+"></div>";
                       ballScoll+="<div id="+id+"  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id="+id+"  class=ball style=background-color:#cccccc></div></div>";
               }else if(position==2){
                       ballScoll+="<div id=visualball style='margin-left:13px;margin-top:10px'><div id="+id+"  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id="+id+"  class=ball style=background-color:"+color+"></div>";
                       ballScoll+="<div id="+id+"  class=ball style=background-color:#cccccc></div></div>";
               }else if(position==3){
                       ballScoll+="<div id=visualball style='margin-left:13px;margin-top:10px'><div id="+id+"  class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id="+id+"   class=ball style=background-color:#cccccc></div>";
                       ballScoll+="<div id="+id+"   class=ball style=background-color:"+color+"></div></div>";
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


Query="CALL sp_owner_wavg_score(";
Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
rs = st.executeQuery(Query);
while(rs.next()){
	String ParamScore =  rs.getString("owner_wavg_score") ;
	titleStr="ผลสำเร็จ สำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติได้ " + ParamScore +" คะแนน";
}
//=================================== DataJ Start===============================================


Query="CALL sp_parent_kpi_list(";
Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
rs = st.executeQuery(Query);
String tableFun = "[";
int i=0;

while(rs.next()){
	if(i>0)
		{
		tableFun += ",";
	}
	String OwnerID = rs.getString("owner_id") ;
	tableFun += "{Field0: \"";
	tableFun += OwnerID;
	tableFun += "\", ";

	String KpiID= rs.getString("kpi_id");
	tableFun += "Field0_1: \"";
	tableFun += KpiID;
	tableFun += "\", ";


	String perspective_code = rs.getString("krs.perspective_code");
	tableFun += "Field1: \"";
	tableFun += perspective_code;
	tableFun += "\", ";

	String kpi_code = rs.getString("krs.kpi_code");
	String kpi = rs.getString("kpi") ;
	tableFun += "Field2: \"";
	tableFun += "<div class =kpiN id="+i+">"+kpi_code+"</div>"+kpi;
	out.print("<div class=tootip id="+i+"><b>"+rs.getString("kpi_comment")+"</b></div>");

	//=============Get Url with Details Button Start============
	String urlpage = rs.getString("url");
	if(urlpage == null || urlpage.equals(""))
	{
		tableFun +="";
	}
	else
	{
		tableFun +=" <a href="+urlpage+"?ks="+kpi_code+"&yy="+ParamYear+"&mm="+ParamMonth+" target=_blank><button class=k-button>รายละเอียด</button></a> ";
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
		tableFun += getColorBall(positionBall,colorCode,(i+20000));
	//	out.print(getColorBall(1,colorCode));
		
			Statement st2;
			ResultSet  rs2;
			String QueryColorRange = "";
			st2 = conn.createStatement();
			QueryColorRange="CALL sp_color_range;";
			rs2 = st2.executeQuery(QueryColorRange);
					out.print("<div class=commentball id="+(i+20000)+">");
				while(rs2.next()){
					out.print(rs2.getString("description")+"<br />");
				}
					out.print("</div>");
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

//=================================== DataJ  END ===============================================



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
	background:#dbeef3 ;
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
	}

				.tootip{
			width:200px;
			height:auto;
			position:absolute;
			z-index:10;
			background:white;
			display:none;
			border-radius:5px;
			border:1px solid #cccccc;
			cursor:pointer;
			padding:5px;
			}
			.commentball{
			width:200px;
			height:auto;
			position:absolute;
			z-index:10;
			background:white;
			display:none;
			border-radius:5px;
			border:1px solid #cccccc;
			cursor:pointer;
			padding:5px;
			}

	/*
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
	background-color:#008EC3 ;
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
                  field: "Field1",
				  title:"testtttt",
				   width: 55
              },
              {
                  field: "Field2",
				  width: 230
			 },
              {
                  field: "Field3",
				  width: 65
			 },
              {
                  field: "Field4",
				  width:80
			 },
              {
                  field: "Field5",
				  width: 55
			 },
              {
                  field: "Field5_1",
				  width: 80
			 },
             
              {
                  field: "Field6",
				  width: 85
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
				 // width: 80
			 }];


var $titleJ2 =[
	
              {
                  field: "Field1",
				  title:"Testตัวชีวัด",
				   width: 277
              },
              {
                  field: "Field3",
				  title:"เป้าหมาย",
				  width:65
				 
			 },
              {
                  field: "Field4",
				   title:"หน่วยวัด",
					 width:80
				
			
			 },
              {
                  field: "Field5",
				   title:"น้ำหนัก",
				 width:55
			
			 },
              {
                  field: "Field5_1",
				  title:"Baseline",
				 width:80
					
				

			 },
          
              {
                  field: "Field6",
				   title:"ผลงานสะสม",
				 width:85
				 
			 },
              {
                  field: "Field7",
				   title:"%เทียบแผน",
				 width:100
				
			 },
              {
                  field: "Field7_1",
				   title:"% เฉลี่ยถ่วงน้ำหนัก",
				 width:80
		
				
			 },
              
              {
                  field: "Field9",
				  title:"กราฟผลงานสะสม",
			
				 
			 }];



	// TITLE BY JSON END
	//CONTENT BY JSON START 
	var $dataJ = <%=tableFun%>;
/*
	var $dataJ =[
                  {
						Field0: "1",
													Field0_1: "1",

					  Field1: "test",
					  Field2: "<div class='kpiN'>KS1</div>สัดส่วนโครงการ RDDE/TT ที่มีการประเมินผลกระทบจากผลงานวิจัยต่อโครงการ RDD/TT ที่ดำเนินการทั้งหมด",

                      Field3: " <div id='textR'>0.15</div> ",
					  Field4: "-",
                      Field5: "<div id='textR'>25</div>",
					  Field5_1:"4,500 (ล้านบาท)",
				
					  Field6: " <div id='textR'>0.44  <br>2,000 <br>ล้านบาท<div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>10.10</div>",
					 
					  Field9: " <span class='inlinesparkline'>1,4,4,7,8,9,10</span> "
                     
					  
                     
                  },
                  {
					  						Field0: "2",
													Field0_1: "21",

					  Field1: "test",
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
					  						Field0: "3",
													Field0_1: "31",

					  Field1: "test",
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
					  						Field0: "4",
													Field0_1: "41",
					  Field1: "test",
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
					  						Field0: "5",
													Field0_1: "51",
					  Field1: "test",
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
                  						Field0: "6",
													Field0_1: "61",

					  Field1: "test",
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
	
var $dataJ2 =[
                  {
		                  						Field0: "1",

                      Field1: "<b>(BIOTEC)</b> Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					 

                      Field3: "<div id='textR'>100</div> ",
					  Field4: "ร้อบละ",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: " <div id='textR'>0.50</div>",
                      Field7: " <center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>8.01	</div>",
					
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
                  {
					                    						Field0: "1",

                      Field1: "<b>(MTEC) </b>Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
				

                      Field3: " <div id='textR'>100</div>",
					  Field4: "ร้อบละ",
                      Field5: "<div id='textR'>10</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: "<div id='textR'>0.70 </div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center>  ",
					 Field7_1:"<div id='textR'>8.00</div>",
				
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					                    						Field0: "2",

                      Field1: "<b>(NANOTEC)</b> Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					

                      Field3: "  <div id='textR'>100</div>",
					  Field4: "ร้อบละ",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					 
					  Field6: "<div id='textR'>0.50 </div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center>  ",
					 Field7_1:"<div id='textR'>7.01</div>",
					 
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					                    						Field0: "3",

                      Field1: "<b>(NECTEC)</b> Lead2 ร้อยละความสำเร็จในการส่งมอบ flagship",
					

                      Field3: " <div id='textR'>100</div> ",
					  Field4: "ร้อบละ",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: "<div id='textR'>0.60 </div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center>  ",
					 Field7_1:"<div id='textR'>8.03</div>",
					 
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					                    						Field0: "4",

                      Field1: "<b>(BIOTEC)</b>Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
				

                      Field3: " <div id='textR'>100 </div>",
					  Field4: "ล้านบาท",
                      Field5: "<div id='textR'>15</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: "<div id='textR'>0.70</div>",
                      Field7: "<center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center>  ",
					 Field7_1:"<div id='textR'>8.04</div>",
					
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					                    						Field0: "4",

                      Field1: "<b>(MTEC)</b> Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
				

                      Field3: " <div id='textR'>129</div> ",
					  Field4: "ล้านบาท",
                      Field5: "<div id='textR'>20</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: "<div id='textR'>0.80</div> ",
                      Field7: " <center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>7.30</div>",
					  
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					                    						Field0: "5",

                      Field1: "<b>(NANOTEC)</b> Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
				

                      Field3: "<div id='textR'>120</div>  ",
					  Field4: "ล้านบาท",
                      Field5: "<div id='textR'>25</div>",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: " <div id='textR'>0.60</div>",
                      Field7: " <center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>7.71</div>",
					 
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  },
				   {
					  Field0: "6",

                      Field1: "<b>(NECTEC)</b> Lead4 จำนวนรายได้อุดหนุนการวิจัย รับจ้าง/ร่วมวิจัย ลิขสิทธิ์/สิทธิประโยชน์ และบริการเทคนิควิชาการ",
				

                      Field3: " <div id='textR'>120 </div>",
					  Field4: "ล้านบาท",
                      Field5: "25",
					  Field5_1:"1,500 (ล้านบาท)",
					  
					  Field6: "<div id='textR'> 0.40 </div>",
                      Field7: " <center><div id='target'><div id='percentage'>40%</div> <div id='score'>"+ballRed+""+ballGray+""+ballGray+"</div></div></center> ",
					 Field7_1:"<div id='textR'>7.56</div>",
					  
					  Field9: "<span class='inlinesparkline_sub'>1,4,4,7,5,9,10</span>"
                     
					  
                     
                  }
				  
				  ]; 
*/

	
	//CONTENT BY JSON END

//console.log($dataJ2[0]["Field3"]);

//$dataJ2[0]["Field3"];


 /*Management Range mounse over Start*/
var tooltip = function(){
	  $(".kpiN").hover(function(e){
								  var $AX =  e.pageX+10;
								  var $AY = e.pageY+10;
								   var $pos = e.target.id;
								   var classT = ".tootip#"+$pos;
								   var classT_text = $(classT).text();
								   //alert("["+classT_text+"]");
								   if($.trim(classT_text)!=""){
									$("#tooltip").hide().empty();
								  $("#tooltip").append(classT_text).css({"left":$AX+"px","top":$AY+"px"}).fadeIn();
								   }
							  },function(){
								  $("#tooltip").hide().empty();
								 
		  });

}
var ballScore = function(){

	  $(".ball").hover(function(e){
								  var $AX =  e.pageX+10;
								  var $AY = e.pageY+10;
								   var $pos = e.target.id;
								   var $classB = ".commentball#"+$pos;
								   var classB_html = $($classB).html();
								   if($.trim(classB_html)!=""){
								$("#tooltip").hide().empty();
								  $("#tooltip").append(classB_html).css({"left":$AX+"px","top":$AY+"px"}).fadeIn();
								   }
							  },function(){
								  $("#tooltip").hide().empty();
								 
		  });

}
	 /*Management Range mounse over End*/



	$("#grid").kendoGrid({
		
           height: 540,
	      //groupable: true,
         /* scrollable: true,
          sortable: true,
          pageable: true,*/
		  detailInit: detailInit,

		/*   dataBound: function() {
                            this.expandRow(this.tbody.find("tr.k-master-row").first());
                        },*/

          columns: $titleJ,
          dataSource: {
              data: $dataJ,
			  pageSize: 100
          }
		
      });
	  /*########## Table Content End ##########*/
			//SET SPARKLINE
		$('.inlinesparkline').sparkline(); 
		$('.inlinebar').sparkline('html', {type: 'bullet',height: '30',width:'200', barColor: 'red'} );
	    $("th.k-header , .k-minus").click(function(){
	//		alert("test");
		//$('.inlinesparkline').sparkline(); 
		//$('.inlinesparkline').sparkline('html',{type:'line',width:'100'}); 

	});


		//#######################Menagement Table Start ######################


		//#######################Menagement Table End #######################

	

	 function detailInit(e) {
		 //alert(e.data.Field0);
		 $.ajax({
		 url:'nstdalv1.jsp',
			type:'get',
		dataType:'html',
		data:{'year':<%=ParamYear%>,'month':<%=ParamMonth%>,'name':"<%=ParamOrg%>",'owner_id':e.data.Field0,'kpi_id':e.data.Field0_1},
		success:function(data){
			 //console.log(data);
			
							var tableFun2 = eval("(" + data + ")");

							$("<table bgcolor='#f5f5f5'><th></th></table>").kendoGrid({
								columns: $titleJ2,
								dataSource: {
								data: tableFun2,
								pageSize: 100,
							}
							}).appendTo(e.detailCell);
							$('.inlinesparkline_sub').sparkline(); 
							/*### Manage Tootip Start###*/
							tooltip();
							ballScore();
							
							/*### Manage Tootip Stop###*/
							
			 }
	 });
						 
						 /*Content Suffer Color Row*/
						// $("tr[data-uid]").css({"background-color":"#d7e4bd"});
						$(".k-alt").css({"background-color":"#dbeef3"});
						/*Content Suffer Suffer Color Row*/
						//set corner object
						$(".ball").corner();

				// REMOVE COLUMN START
			//	$("tr.k-detail-row td.k-hierarchy-cell").remove();
				// REMOVE COLUMN END
			
                } // End Function detailInit
	
		/*##########Function jQuery  add Deatail  result  End ########*/

		
		//#######################Menagement Tab Start ######################
		/*Remove  numberic  bottom tab*/
		$("ul.k-numeric li span").removeClass();
		$("ul.k-numeric li span").html("");
		/*Remove  numberic  bottom tab*/
		/*Header Bgcolor*/
		$("th.k-header").css({"background":"#008EC3  "});
		$(".k-grid-header").css({"background":"#008EC3  "});
		//$(".k-link").css({"color":"white"});
		//set font white
			$(".k-header").css({"color":"white"});
			$(".k-link").css({"color":"white"});
			
		
		/*Header Bgcolor*/
		/*Content Suffer Color Row*/
		//$(".k-master-row").css({"background-color":"#d7e4bd"});
	//	$("tr[data-uid]").css({"background-color":"#99ccff "});
		$(".k-alt").css({"background":"#dbeef3"});
		/*Content Suffer Suffer Color Row*/
		/*Footer Bgcolor*/
		$(".k-pager-wrap").css({"background":"#008EC3 "});
		/*Footer Bgcolor*/
		//#######################Menagement Tab End #######################

		//set corner object
		$(".ball").corner();
	});

	

	</script>


 <!-- Define the HTML table, with rows, columns, and data -->
<div id="contentMain1">
	<div id="contentL">
	<img src="owner_picture/nstda.jpg">
	</div>
	<div id="contentR">
		<div id="contentDetail">
		<center>
ตัวชี้วัดผลสำเร็จสำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติ<br>
ประจำปีงบประมาณ <%=YearBY%> 
		</center>
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
		  
<!--<th class="k-hierarchy-cell k-header">&nbsp;</th>-->
          <th data-field="Field1" ><center><b>มุมมอง</b></center></th>
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
$("table#grid2 tbody tr:odd").css("background-color","#DBEEF3");
$("table#grid2 tbody tr:even").css("background","white");


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
		<tr bgcolor="#008EC3">
			<th data-field="Field21" style="text-align:center;color:white;">ลำดับ</th>
			<th data-field="Field22" style="text-align:center;color:white;">งานที่ได้รับมอบหมาย</th>
		</tr>
	</thead>
	<tbody>
	<%
	
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
	
	Query="CALL sp_owner_comment(";
	Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\")";
	rs = st.executeQuery(Query);
	while(rs.next()){
			out.print(rs.getString("comment").replaceAll("\n","<br>")); 
	}
%>

<br style="clear:both">



	