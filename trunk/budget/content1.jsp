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
String center = request.getParameter("center");
//String month = "11";
//String year = "2012";
//out.print(month+year+center);
/*
Query="CALL sp_emp_by_mission(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);

String seriesPlanBarchart ="{\"series_center\": [{ \"name\": \"แผน\",\"data\": [";
String seriesReleaseBarchart =",{ \"name\": \"Release\",\"data\": [";
String seriesMeetBarchart =",{ \"name\": \"ผูกพัน\",\"data\": [";
String seriesPayBarchart =",{ \"name\": \"เบิกจ่าย\",\"data\": [";
String categoryBarchart = "{\"category_center\":[";
String seriesBarchart = "";
int i = 0;

	while(rs.next()){
		if(i>0){
			seriesPlanBarchart += ",";
			seriesReleaseBarchart += ",";
			seriesMeetBarchart += ",";
			seriesPayBarchart += ",";
			categoryBarchart += ",";
		}
		double Plan = rs.getDouble("mplan");
		double Release = rs.getDouble("release");
		double Meet = rs.getDouble("meet");
		double Pay = rs.getDouble("pay");
		String Type = rs.getString("type");

		seriesPlanBarchart += Round(Plan,2);
		seriesReleaseBarchart += Round(Release,2);
		seriesMeetBarchart += Round(Meet,2);
		seriesPayBarchart += Round(Pay,2);
		categoryBarchart += "\""+Type+"\"";
		i++;
	}
seriesPlanBarchart += "]}";
seriesReleaseBarchart += "]}";
seriesMeetBarchart +="]}";
seriesPayBarchart +="]}]}";
categoryBarchart += "]}";
seriesBarchart =  seriesPlanBarchart+seriesReleaseBarchart+seriesMeetBarchart+seriesPayBarchart;

/////////====================================END Barchart1======================

Query="CALL sp_emp_by_mission(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);

String seriesProject1Barchart ="{\"series_center\": [{ \"name\": \"Project\",\"data\": [";
String categoryProject1Barchart = "{\"category_center\":[";
int i = 0;

	while(rs.next()){
		if(i>0){
			seriesProject1Barchart += ",";
			categoryProject1Barchart += ",";
		}
		double number = rs.getDouble("number");
		String Type = rs.getString("type");

		seriesProject1Barchart += Round(number,2);
		categoryBarchart += "\""+Type+"\"";
		i++;
	}
seriesProject1Barchart +="]}]}";
categoryBarchart += "]}";


//=========================================End Barchart 2==========================

Query="CALL sp_emp_by_mission(";
Query += year +"," + month +");";
rs = st.executeQuery(Query);

String seriesProject2Barchart ="{\"series_center\": [{ \"name\": \"Project\",\"data\": [";
String categoryProject2Barchart = "{\"category_center\":[";
int i = 0;

	while(rs.next()){
		if(i>0){
			seriesProject2Barchart += ",";
			categoryProject2Barchart += ",";
		}
		double number = rs.getDouble("number");
		String Type = rs.getString("type");

		seriesProject2Barchart += Round(number,2);
		categoryProject2Barchart += "\""+Type+"\"";
		i++;
		//{"series_center": [{ "name": "แผน","data": [1881.4,0.0,67.46,0.0]}]},{"category_center":["???????","????????","????????????","???????"]}] 
	}
seriesProject2Barchart +="]}]}";
categoryProject2Barchart += "]}";

out.print("["+seriesBarchart+","+categoryBarchart+","+seriesProject1Barchart+","+categoryProject1Barchart+","+seriesProject2Barchart+","+categoryProject2Barchart+"]");

//=========================================End Barchart 3==========================


*/
if(center.equals("NSTDA")){
out.print("[{\"series1\": [ {  \"name\": \"แผน\",\"data\": [600,170,700,100,250,900,150,160]} ,{ \"name\": \"Release\", \"data\": [300,130,700,70,20,900,60,60]}, { \"name\": \"ผูกพัน\",\"data\": [20,10,60,10,0,700,5,10] } , {\"name\": \"เบิกจ่าย\",\"data\": [50,60,200,10,0,700,10,15] }]}, {\"category1\":[ \"Cluster\", \"Platform\", \"Essential Program\",\"Improvement Project\",\"Director Initiative\", \"Investment\", \"Seed Money\", \"Others\"]}]");
}else{
out.print("[{\"series1\": [ {  \"name\": \"แผน\",\"data\": [1100,170,700,100,250,900,230,160]} ,{ \"name\": \"Release\", \"data\": [300,130,700,170,20,900,60,60]}, { \"name\": \"ผูกพัน\",\"data\": [20,10,60,10,110,700,115,10] } , {\"name\": \"เบิกจ่าย\",\"data\": [50,60,200,10,120,700,120,115] }]}, {\"category1\":[ \"Cluster\", \"Platform\", \"Essential\",\"Improvement\",\"Director\", \"Investment\", \"Seed Money\", \"Others\"]}]");
}

//,{\"series2\": [{\"name\": \"Project\",\"data\": [15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89]}]},{\"category2\":[\"Project Z\", \"Project Y\", \"Project X\", \"Project W\", \"Project V\", \"Project U\", \"Project T\", \"Project S\", \"Project R\", \"Project Q\"]},{\"series3\": [{\"name\": \"Project\",\"data\":[89,85,80,75,70,68,66,65,63,60]}]} ,{\"category3\":[\"Project A\", \"Project B\", \"Project C\", \"Project D\", \"Project E\", \"Project F\", \"Project H\", \"Project I\", \"Project J\", \"Project K\"]} ]");

%>

