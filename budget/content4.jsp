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
/*
String month=request.getParameter("month");
String year=request.getParameter("year");
//String month = "11";
//String year = "2012";

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
		//{"series_center": [{ "name": "แผน","data": [1881.4,0.0,67.46,0.0]}]},{"category_center":["???????","????????","????????????","???????"]}] 
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
			series: [
				 { 
						 name: "แผน",
						data: [270,90,100,80,110,30],
						color: "BLUE"
				 } ,
				 {
                            name: "ผูกพัน",
                            data: [90,30,30,40,30,10]
                   } ,
				 {
                            name: "เบิกจ่าย",
                            data: [70,40,30,40,30,10]
                   }
			],
			categoryAxis:{
			categories: [ "สก.","ศช.","ศว.","ศอ.","ศจ.","ศน."],
*/
out.print("[{\"series1\": [ {  \"name\": \"แผน\",\"data\": [270,90,100,80,110,30]} , { \"name\": \"ผูกพัน\",\"data\": [90,30,30,40,30,10] } , {\"name\": \"เบิกจ่าย\",\"data\": [70,40,30,40,30,10] }]}, {\"category1\":[ \"สก.\",\"ศช.\",\"ศว.\",\"ศอ.\",\"ศจ.\",\"ศน.\"]},{\"series2\": [{\"name\": \"Project\",\"data\": [15.7, 16.7, 20, 23.5, 26.6, 26.6, 70, 80, 82, 89]}]},{\"category2\":[\"Project Z\", \"Project Y\", \"Project X\", \"Project W\", \"Project V\", \"Project U\", \"Project T\", \"Project S\", \"Project R\", \"Project Q\"]},{\"series3\": [{\"name\": \"Project\",\"data\":[89,85,80,75,70,68,66,65,63,60]}]} ,{\"category3\":[\"Project A\", \"Project B\", \"Project C\", \"Project D\", \"Project E\", \"Project F\", \"Project H\", \"Project I\", \"Project J\", \"Project K\"]} ]");
%>

