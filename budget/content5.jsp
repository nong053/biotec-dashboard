<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat" %>
<%@ include file="../config.jsp"%>
<%!
public static float Round(double Rval, int Rpl) {
  float p = (float)Math.pow(10,Rpl);
  Rval = Rval * p;
  float tmp = Math.round(Rval);
  return (float)tmp/p;
  }
%>
<%

String month=request.getParameter("month");
String year=request.getParameter("year");
//String month = "11";
//String year = "2012";
/*
Query="CALL sp_emp_by_mission(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);


String seriesPlanBarchart ="{\"series_center\": [{ \"name\": \"แผน\",\"data\": [";
String seriesMeetBarchart =",{ \"name\": \"ผูกพัน\",\"data\": [";
String seriesPayBarchart =",{ \"name\": \"เบิกจ่าย\",\"data\": [";
String categoryBarchart = "{\"category_center\":[";
String seriesBarchart = "";
int i = 0;

	while(rs.next()){
		if(i>0){
			seriesPlanBarchart += ",";
			seriesMeetBarchart += ",";
			seriesPayBarchart += ",";
			categoryBarchart += ",";
		}
		double Plan = rs.getDouble("mplan");
		double Meet = rs.getDouble("meet");
		double Pay = rs.getDouble("pay");
		String Type = rs.getString("type");

		seriesPlanBarchart += Round(Plan,2);
		seriesMeetBarchart += Round(Meet,2);
		seriesPayBarchart += Round(Pay,2);
		categoryBarchart += "\""+Type+"\"";
		i++;
	}
seriesPlanBarchart += "]}";
seriesMeetBarchart +="]}";
seriesPayBarchart +="]}]}";
categoryBarchart += "]}";
seriesBarchart =  seriesPlanBarchart+seriesMeetBarchart+seriesPayBarchart;


//=======================================End BarChart ============

Query="CALL sp_emp_by_mission(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);
i = 0;
int totalPie = 0;
String valuePie ="{\"value_pie\":[";

	while(rs.next()){
	if(i>0){
			valuePie += ",";
	}
		String category = rs.getString("mission_name");
		int total = rs.getInt("total");
	
		valuePie += "{\"category\": \"";
		valuePie += category;
		valuePie += "\",";
		valuePie += "\"value\": ";
		valuePie += total;
		valuePie += "}";
		totalPie = totalPie + total;
		i++;
}
valuePie += "]}";

out.print("["+seriesBarchart+","+categoryBarchart+",{\"totalPie\":\""+totalPie+"\"},"+valuePie+","]");
*/
//[{"series_center": [{ "name": "แผน","data": [1881.4,0.0,67.46,0.0]},{ "name": "ผล","data": [1341.58,0.0,184.98,0.0]}]},{"category_center":["???????","????????","????????????","???????"]}]
out.print("[ {\"serieChart\":[{ \"name\": \"แผน\",	\"data\": [270,90,100,80,110,30] } , { \"name\": \"ผูกพัน\",\"data\": [90,30,30,40,30,10] } , {\"name\": \"เบิกจ่าย\",       \"data\": [70,40,30,40,30,10]}]},{\"category\":[ \"สก.\",\"ศช.\",\"ศว.\",\"ศอ.\",\"ศจ.\",\"ศน.\"]},{\"value\":[{\"category\": \"IO ที่ปิดแล้ว \",\"value\": 30 }, { \"category\": \"IO ที่เหลืออยู่\", \"value\": 70}]},{\"sumVal\":\"100\"}]");
%>
