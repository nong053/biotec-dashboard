<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<%
	String paramYear= request.getParameter("paramYear");
	String paramMonth= request.getParameter("paramMonth");
	String paramArea=(request.getParameter("paramArea").trim());
	String paramParentKey=request.getParameter("paramParentKey");

/*
	out.print("paramYear"+paramYear+"<br>");
	out.print("paramMonth"+paramMonth+"<br>");
	out.print("paramArea"+paramArea+"<br>");
	out.print("paramParentKey"+paramParentKey+"<br>");
*/

String dataLevel2="";
	Query="CALL sp_profit_and_loss_list_by_center_per_level("+paramYear+","+paramMonth+",'"+paramArea+"',5,"+paramParentKey+");";
	rs=st.executeQuery(Query);
	Integer i=0;
	dataLevel2+="[";
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
		dataLevel2+="{" ;

		dataLevel2+="\"account_name\":\""+rs.getString("account_name")+"\",";
		dataLevel2+="\"account_key\":"+rs.getString("account_key")+",";
		dataLevel2+="\"Field1\":\"<div class='textL level"+rs.getString("level") +" parent_key"+rs.getString("parent_key")+"'  id='account_key"+rs.getString("account_key")+" '>"+rs.getString("account_name")+" </div>\",";
		dataLevel2+="\"Field2\":\"<div class='textR'>"+rs.getString("pMonthAmt")+"</div>\",";
		dataLevel2+="\"Field3\":\"<div class='textR'>"+rs.getString("currentAmt")+"</div>\",";
		dataLevel2+="\"Field5\":\"<div class='textR'>0%</div>\",";
		dataLevel2+="\"Field6\":\"<div class='textR'>"+rs.getString("pYearAmt")+"</div>\"";
		dataLevel2+="}" ;
		}else{
		dataLevel2+=",{" ;
		dataLevel2+="\"account_name\":\""+rs.getString("account_name")+"\",";
		dataLevel2+="\"account_key\":"+rs.getString("account_key")+",";
		dataLevel2+="\"Field1\":\"<div class='textL level"+rs.getString("level") +" parent_key"+rs.getString("parent_key")+"'  id='account_key"+rs.getString("account_key")+" '>"+rs.getString("account_name")+" </div>\",";
		dataLevel2+="\"Field2\":\"<div class='textR'>"+rs.getString("pMonthAmt")+"</div>\",";
		dataLevel2+="\"Field3\":\"<div class='textR'>"+rs.getString("currentAmt")+"</div>\",";
		dataLevel2+="\"Field5\":\"<div class='textR'>0%</div>\",";
		dataLevel2+="\"Field6\":\"<div class='textR'>"+rs.getString("pYearAmt")+"</div>\"";
		dataLevel2+="}" ;
		}
i++;
}//while

	dataLevel2+="]";
	out.print(dataLevel2);
/*
var $dataJ21 =[
                  {
                      Field1: "เงินอุดหนุนจากรัฐบาล",
					  Field2: "<div id='textR'>1,391.88</div>",
                      Field3: "<div id='textR'> 1,279.12 </div>",
					
                      Field5: "<div id='textR'>8.82%</div>",
					  Field6: "<div id='textR'>1,440.10 </div>",
                  
                     
                  },{
                      Field1: "เงินอะดหนุนอื่น",
					  Field2: "<div id='textR'>2,391.88</div>",
                      Field3: " <div id='textR'>216.80 </div>",
					
                      Field5: "<div id='textR'>10.68%</div>",
					  Field6: "<div id='textR'>230.99 </div>",
                  }];
*/
%>