<%@page contentType="text/html" pageEncoding="utf-8"%><%@page import="java.sql.*"%><%@page import="java.io.*"%><%@page import="java.lang.*"%>

<% /*
	out.print("[{					  \"Field0\": \"2\",                      \"Field1\": \"Test\",                      \"Field3\": \"2\",					  \"Field4\": \"ล้านบาท\",                     \"Field5\": \"25\",					 \"Field5_1\":\"1,500 (ล้านบาท)\",					  					  \"Field6\": \"0.40\",                  \"Field7\": \"50\",	 \"Field7_1\": \"t\",	  \"Field9\": \"flsas\" }]"); */


//=================================== DataJ2 Start===============================================
String kpi_id = request.getParameter("kpi_id");   //Parameter to get query
String owner_id = request.getParameter("owner_id"); //Parameter to get query
String ParamYear  = request.getParameter("year");
String ParamMonth  = request.getParameter("month");
String ParamOrg  = request.getParameter("name");

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
Query="CALL sp_child_kpi_list(";
Query += ParamYear+"," + ParamMonth +",\""+ParamOrg+"\","+  kpi_id + "," +  owner_id +")";
rs = st.executeQuery(Query);
String tableFun2 = "[";
int i=0;

while(rs.next()){
	if(i>0){
		tableFun2 += ",";
	}
	String kpi_code = rs.getString("krs.kpi_code");
	String lead_kpi = rs.getString("lead_kpi") ;
	tableFun2 += "{\"Field1\": \"<div class=kpiN id="+(i+1000)+">"+kpi_code+"</div><div class=tootip id="+(i+1000)+">"+rs.getString("kpi_comment")+"</div>";
	tableFun2 += lead_kpi;
//	out.print("<div class=\"tootip\" id=\""+(i+1000)+"\"><b>"+rs.getString("kpi_comment")+"</b></div>");


	//=============Get Url with Details Button Start============
	String urlpage = rs.getString("url");
	if(urlpage == null || urlpage.equals(""))
	{
		tableFun2 +="";
	}
	else
	{
		tableFun2 +=" <a href="+urlpage+" target=_blank><button class=k-button>รายละเอียด</button></a> ";
	}
	tableFun2 += "\", ";

	//=============Get Url with Details Button End============
	String target_value = rs.getString("krs.target_value");
	tableFun2 += "\"Field3\": \"";
	tableFun2 += "<div id=textR>"+ target_value +"</div> \",";

	String kpi_uom = rs.getString("krs.kpi_uom");
	tableFun2 += "\"Field4\": \"";
	tableFun2 += kpi_uom + "\",";

	String kpi_weighting = rs.getString("krs.kpi_weighting");
	tableFun2 += "\"Field5\": \"";
	tableFun2 +=  "<div id=textR>"+kpi_weighting +"</div> \",";

	String baseline = rs.getString("baseline") ;
	tableFun2 += "\"Field5_1\": \"";
	tableFun2 += baseline + "\",";

	String performance_value = rs.getString("performance_value") ;
	tableFun2 += "\"Field6\": \"";
	tableFun2 += "<div id=textR>"+ performance_value +"</div> \",";

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
		tableFun2 += "";
	}

	tableFun2 += "\"Field7\": \"";
	tableFun2 += "<center><div id='target'><div id='percentage'>" + performance_percentage +"</div></div></center> \",";

	String kpi_wavg_score = rs.getString("kpi_wavg_score");
	tableFun2 += "\"Field7_1\": \"";
	tableFun2 += "<div id=textR>"+ kpi_wavg_score +"</div> \",";

	//===============GraphLine Start=====================
	tableFun2 += "\"Field9\": \"";
	
	//Statement st2;
	//ResultSet  rs2;
	String QueryGraph = "";
	String ChildKpiID = rs.getString("child_kpi_id");
	//st2 = conn.createStatement();
	QueryGraph = "CALL sp_child_kpi_trend(";
	QueryGraph += ParamYear+"," + ParamMonth +","+owner_id+","+ChildKpiID+")";
	rs1 = st1.executeQuery(QueryGraph);
	while(rs1.next())
	{
		//	if(KpiID.equals(rs1.getString("kpi_id") ))
		//	{
				Integer Oct = rs1.getInt("Oct");
				Integer Nov = rs1.getInt("Nov");
				Integer Dec = rs1.getInt("Dec");
				Integer Jan = rs1.getInt("Jan");
				Integer Feb = rs1.getInt("Feb");
				Integer Mar = rs1.getInt("Mar");
				Integer Apr = rs1.getInt("Apr");
				Integer May = rs1.getInt("May");
				Integer Jun = rs1.getInt("Jun");
				Integer Jul = rs1.getInt("Jul");
				Integer Aug = rs1.getInt("Aug");
				Integer Sep = rs1.getInt("Sep");

				tableFun2 += "<span class=inlinesparkline_sub>"
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
				tableFun2 += "}";
		//	}
	}
	//===============GraphLine End=====================
	i++;
}
tableFun2 += "]";

out.print(tableFun2);
				  %>