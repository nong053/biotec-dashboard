<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<%
<%
/*
	String paramYear= request.getParameter("paramYear");
	String paramMonth= request.getParameter("paramMonth");
	String paramOrg= request.getParameter("paramOrg");
*/
	String paramYear="2012";
	String paramMonth="11";
	String paramOrg="สวทช.";
%>
<!-- Tab3 -->
<%
String $htmlTable1="";
Query="CALL sp_balance_sheet_list_by_center("+paramYear+","+paramMonth+",'"+paramOrg+"');";
rs=st.executeQuery(Query);
$htmlTable1+="<table  id='finance_tb1'  width='700' cellpadding='1px' cellspacing='1px' >";
	$htmlTable1+="<thead>";
//tr#########################################1
		$htmlTable1+="<tr>";
			$htmlTable1+="<th width='200'>";
				$htmlTable1+="รายการ";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="สก.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ศช.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ศว.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ศอ.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ศจ.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ศน.";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="ทุนประเดิม";
			$htmlTable1+="</th>";

			$htmlTable1+="<th>";
				$htmlTable1+="รวม";
			$htmlTable1+="</th>";


		$htmlTable1+="</tr>";
//tr#########################################1


	$htmlTable1+="</thead>";

	$htmlTable1+="<tbody>";

// Loop while into tbody

	while(rs.next()){
		$htmlTable1+="<tr>";
			$htmlTable1+="<td><div class='level"+rs.getString("level")+"'>"+rs.getString("account_name")+"</div></td>";
			$htmlTable1+="<td>"+rs.getString("pMonthAmt")+"</td>";
			$htmlTable1+="<td>"+rs.getString("currentAmt")+"</td>";
			$htmlTable1+="<td>"+rs.getString("currentAmt")+"</td>";
			$htmlTable1+="<td>"+rs.getString("pYearAmt")+"</td>";
		$htmlTable1+="</tr>";
		
	}

// Loop while into tbody

	$htmlTable1+="</tbody>";
	$htmlTable1+="</table>";
	conn.close();

//sucessfully

//out.print($htmlTable1);
%>

