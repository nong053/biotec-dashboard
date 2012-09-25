<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<!--- Tab2 -->
<%
//	String paramYear= request.getParameter("paramYear");
//	String paramMonth= request.getParameter("paramMonth");
	String paramYear= "2012";
	String paramMonth= "11";
	String paramMonthPerv= "";
	String paramMonthCurent= "";
	//String paramOrg=request.getParameter("paramOrg");
	String paramOrg="สวทช.";

	Integer paramYearInt =Integer.parseInt(paramYear);
	Integer paramLastYear = paramYearInt+542;
	Integer paramCurentYear=paramYearInt+543;

	if(paramMonth.equals("1")){
	paramMonthCurent="ต.ค.";
	paramMonthPerv="พ.ย.";
	}else if(paramMonth.equals("2")){
	paramMonthCurent="พ.ย.";
	paramMonthPerv="ธ.ค.";
	}else if(paramMonth.equals("3")){
	paramMonthCurent="ธ.ค.";
	paramMonthPerv="ม.ค.";
	}else if(paramMonth.equals("4")){
	paramMonthCurent="ม.ค.";
	paramMonthPerv="ก.พ.";
	}else if(paramMonth.equals("5")){
	paramMonthCurent="ก.พ.";
	paramMonthPerv="มี.ค.";
	}else if(paramMonth.equals("6")){
	paramMonthCurent="มี.ค";
	paramMonthPerv="เม.ษ.";
	}else if(paramMonth.equals("7")){
	paramMonthCurent="เม.ษ.";
	paramMonthPerv="พ.ค.";
	}else if(paramMonth.equals("8")){
	paramMonthPerv="พ.ค.";
	paramMonthPerv="มิ.ย.";
	}else if(paramMonth.equals("9")){
	paramMonthCurent="มิ.ย.";
	paramMonthPerv="ก.ค.";
	}else if(paramMonth.equals("10")){
	paramMonthCurent="ก.ค.";
	paramMonthPerv="ส.ค.";
	}else if(paramMonth.equals("11")){
	paramMonthCurent="ส.ค.";
	paramMonthPerv="ก.ย.";
	}else if(paramMonth.equals("12")){
	paramMonthCurent="ก.ย.";
	paramMonthPerv="ต.ค.";
	}
/*
	out.print("paramLastYear"+paramLastYear+"<br>");
	out.print("paramCurentYear"+paramCurentYear+"<br>");
	out.print("paramMonthCurent"+paramMonthCurent+"<br>");
	out.print("paramMonthPerv"+paramMonthPerv+"<br>");
*/
	String dataDefault="";

	Query="CALL sp_profit_and_loss_list_by_center_per_level(2012,11,'สวทช.',4,null);";
	rs=st.executeQuery(Query);
	Integer i=0;
	dataDefault+="[";
	while(rs.next()){

		/*
		out.print("account_name"+rs.getString("account_name")+"<br>");
		out.print("account_key"+rs.getString("account_key")+"<br>");
		out.print("account_id"+rs.getString("account_id")+"<br>");
		out.print("level"+rs.getString("level")+"<br>");
		out.print("hlevel"+rs.getString("hlevel")+"<br>");
		out.print("pMonthAmt"+rs.getString("pMonthAmt")+"<br>");
		out.print("currentAmt"+rs.getString("currentAmt")+"<br>");
		out.print("pYearAmt"+rs.getString("pYearAmt")+"<br>");
		out.print("<br>-------------------------------------------------------------------<br>");
		*/
		
		if(i==0){
		dataDefault+="{" ;
		dataDefault+="Field0:\"01\"," ;
		dataDefault+="Field1:\"<div id='textL'>รายได้ </div> \",";
		dataDefault+="Field2:\"<div id='textR'>1,992.54 </div>\",";
		dataDefault+="Field3:\"<div id='textR'>1,806.36</div>\",";
		dataDefault+="Field5:\"<div id='textR'>10.31%</div>\",";
		dataDefault+="Field6:\"<div id='textR'>2,030.21<div>\",";
		dataDefault+="}" ;
	}else{
		dataDefault+=",{" ;
		dataDefault+="Field0:\"01\"," ;
		dataDefault+="Field1:\"<div id='textL'>รายได้ </div>\",";
		dataDefault+="Field2:\"<div id='textR'>1,992.54 </div>\",";
		dataDefault+="Field3:\"<div id='textR'>1,806.36</div>\",";
		dataDefault+="Field5:\"<div id='textR'>10.31%</div>\",";
		dataDefault+="Field6:\"<div id='textR'>2,030.21<div>\"";
		dataDefault+="}" ;
	}//if
}//while
	dataDefault+="]";

	  /*

	  {
					  Field0: "01",
                      Field1: "<div id='textL'>รายได้ </div>",
					  Field2: "<div id='textR'>1,992.54 </div>",
                      Field3: " <div id='textR'>1,806.36</div> ",
				
                      Field5: "<div id='textR'>10.31%</div>",
					  Field6: " <div id='textR'>2,030.21<div>",
                  
                  }
*/

out.print(dataDefault);

%>
