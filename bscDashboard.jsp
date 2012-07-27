<!--
*********************************************************
*	EditDate	: April 2012							*
*	Project		: BIOTEC BSC Dashboard					*
*	Version		: Prototype Ver.001						*
*	Programmer	: Yoswadee								*
*********************************************************
Integration Data
---------------------------------------------------------

---------------------------------------------------------
*********************************************************
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	<Title> S&P Dashboard </Title> </head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<META HTTP-EQUIV="EXPIRES" CONTENT="-1" />
<%@ page contentType="text/html; charset=UTF-8" %>


<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.js"></script>

<!------------------   Zingchart          --------------------------> 
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/zingchart-html5beta-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/license.js"></script>

<!------------------  My Custom          --------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/kajax.js"></script>
<link type="text/css" href="<%=request.getContextPath()%>/chartLib/css/customchart.css" rel="stylesheet"/> 

<!-----------------   TreeTable & Sparkline ------------------------->
<link	type="text/css"	href="<%=request.getContextPath()%>/chartLib/css/jquery.treeTable.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.sparkline.js"></script> 

<!-----------------   Lib for Facebox       ------------------------->
<link type="text/css" href="<%=request.getContextPath()%>/chartLib/css/jquery.facebox.css" media="screen" rel="stylesheet"/> 
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.facebox.js"></script>


<!-- Use for call JQuery treetable  -->
<script type="text/javascript">
	$(document).ready(function()  {

		$('.targetAll').sparkline('html', {type: 'bullet', targetColor: '#D3DAFE' , targetColor: 'red' , width:"60px" , targetWidth:"3"} );
		
		$('.targetFinancialNode-1').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});
		$('.targetFinancialNode-2').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});
		

		$('.targetCustomerNode-1').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});
		$('.targetCustomerNode-2').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});

		$('.targetProcessNode-1').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});
		$('.targetProcessNode-2').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});

		$('.targetLearningNode-1').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});
		$('.targetLearningNode-2').sparkline('html', {type: 'bullet', targetColor: 'red' , width:"60px" , targetWidth:"3" , rangeColors : ['#A8B6FF', '#A8B6FF', '#A8B6FF']});

		var kvalue = [1,2,3,4,5,6,7,8,9,10,11,12];
        $('.trendFinancialNode-1').sparkline(kvalue , {barColor: 'red' , }); 
		var kvalue = [5,9,2,9,3,9,4,9,5,9,6,9,7,9];
		$('.trendFinancialNode-2').sparkline(kvalue , {barColor: 'red' , }); 

		var kvalue = [12,3,6,3,8,9,10,11,12,5,8,11];
        $('.trendCustomerNode-1').sparkline(kvalue , {barColor: 'red' , }); 
		var kvalue = [9,10,3,6,2,10,12,11,12,9,8,10];
		$('.trendCustomerNode-2').sparkline(kvalue , {barColor: 'red' , }); 

		var kvalue = [12,3,6,3,8,9,10,11,12,5,8,11];
        $('.trendProcessNode-1').sparkline(kvalue , {barColor: 'red' , }); 
		var kvalue = [9,10,3,6,2,10,12,11,12,9,8,10];
		$('.trendProcessNode-2').sparkline(kvalue , {barColor: 'red' , }); 

		var kvalue = [12,3,6,3,8,9,10,11,12,5,8,11];
        $('.trendLearningNode-1').sparkline(kvalue , {barColor: 'red' , }); 
		var kvalue = [9,10,3,6,2,10,12,11,12,9,8,10];
		$('.trendLearningNode-2').sparkline(kvalue , {barColor: 'red' , }); 

    });

/* -----------------  Use JQuery to Create Tree ------------------------*/
	$(document).ready(function()  {
	  $("#FinancialTree").treeTable();
	  $("#FinTree").treeTable();
	  $("#CustomerTree") .treeTable();
	  $("#ProcessTree") .treeTable();
	  $("#LearningTree") .treeTable();
	});
</script>
<!------------------------------------------------------------------------>


<body>
<%
int borderSpace = 1 ;
int bscFrmWidth = 450;
int bscFrmHeight = 350;

String bscYear = request.getParameter("bscYear");
String bscMonth = request.getParameter("bscMonth");
String bscOwner = request.getParameter("bscOwner");
%>

<Table width="100%" border="1" height="50" charset="utf-8">


<tr	id="r4"><td colspan="2" align="left" class="tdmainheader"> 
<div align="center"> S&P Balanced Scorecard </div>
</td></tr>

<!------------------  Condition Combobox ------------------->
<tr><td colspan="2" align="left" class="tdcondition">
<form method="post" action="<%=request.getContextPath()%>/SNPDashBoard_New/bscDashboard.jsp?viewKPI=1">
&nbsp&nbsp&nbsp&nbsp&nbsp
ปี : 
<select name="bscYear" id="bscYear" >
<option value="1"<%if(bscYear.equals("1")) out.print(" selected=\"selected\"");%>>2011</option>
<option value="2"<%if(bscYear.equals("2")) out.print(" selected=\"selected\"");%>>2010</option>
<option value="3"<%if(bscYear.equals("3")) out.print(" selected=\"selected\"");%>>2009</option>
<option value="4"<%if(bscYear.equals("4")) out.print(" selected=\"selected\"");%>>2008</option>
</select>

&nbsp&nbsp&nbsp&nbsp&nbsp
เดือน : 
<select name="bscMonth" id="bscMonth" >
<option value="1"<%if(bscMonth.equals("1")) out.print(" selected=\"selected\"");%>>January</option>
<option value="2"<%if(bscMonth.equals("2")) out.print(" selected=\"selected\"");%>>February</option>
<option value="3"<%if(bscMonth.equals("3")) out.print(" selected=\"selected\"");%>>March</option>
<option value="4"<%if(bscMonth.equals("4")) out.print(" selected=\"selected\"");%>>April</option>
<option value="5"<%if(bscMonth.equals("5")) out.print(" selected=\"selected\"");%>>May</option>
<option value="6"<%if(bscMonth.equals("6")) out.print(" selected=\"selected\"");%>>June</option>
<option value="7"<%if(bscMonth.equals("7")) out.print(" selected=\"selected\"");%>>July</option>
<option value="8"<%if(bscMonth.equals("8")) out.print(" selected=\"selected\"");%>>August</option>
<option value="9"<%if(bscMonth.equals("9")) out.print(" selected=\"selected\"");%>>September</option>
<option value="10"<%if(bscMonth.equals("10")) out.print(" selected=\"selected\"");%>>October</option>
<option value="11"<%if(bscMonth.equals("11")) out.print(" selected=\"selected\"");%>>November</option>
<option value="12"<%if(bscMonth.equals("12")) out.print(" selected=\"selected\"");%>>December</option>
</select>

&nbsp&nbsp&nbsp&nbsp&nbsp
หน่วยงาน : 
<select name="bscOwner" id="bscOwner" >
<option value="1"<%if(bscOwner.equals("1")) out.print(" selected=\"selected\"");%>>NSTDA</option>
<option value="2"<%if(bscOwner.equals("2")) out.print(" selected=\"selected\"");%>>BIOTEC</option>
<option value="3"<%if(bscOwner.equals("3")) out.print(" selected=\"selected\"");%>>MTEC</option>
<option value="4"<%if(bscOwner.equals("4")) out.print(" selected=\"selected\"");%>>NECTEC</option>
<option value="5"<%if(bscOwner.equals("5")) out.print(" selected=\"selected\"");%>>NANOTEC</option>
</select>

&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="submit" value=" View KPI "/>

&nbsp&nbsp&nbsp&nbsp&nbsp
<%
	String viewKPI = request.getParameter("viewKPI");
	if(viewKPI.equals("0"))
		out.print("<!--");
%>
<a href="<%=request.getContextPath()%>/SNPDashBoard_New/PopupBullet.jsp?gvalue=22&own=<%=bscOwner%>" rel="facebox"><u>Score 22 of 30</u></a>
<%
	if(viewKPI.equals("0"))
		out.print("-->");
%>
</form></td></tr>


<tr><td colspan="1"  class="tdbscNameFin" align="left">
<a href="javascript:showhidebsc('FinancialRow' , 27 , 'ifrmgr1')" class="bsc">Financial</a>
</td>
<td   class="tdbscNameFin" align="center" width="<% out.print(bscFrmWidth); %>">
<a href="javascript:loadmetergraph('meterChart.jsp?gvalue=27','ifrmgr1');" class="bsc"> Return to Gauge Meter</a>
</td></tr> 


<tr id="FinancialRow">
<!--  Column 1,1 -->
<!------------------------------------ Show BSC Financial Table ----------------------------------------->
<td align="top" charset="utf-8" valign="top"> 
<div id="FinancialTable" style="height:<% out.print(bscFrmHeight); %>px;overflow:auto;"></div> 
</td>
<!--  Column 1,2 -->
<!------------------------------------ Show BSC Financial Chart ----------------------------------------->
<td width="<% out.print(bscFrmWidth); %>" valign="bottom">
		<div id=divfrm1 style="height:<% out.print(bscFrmHeight); %>px;">
				<iframe name="ifrmgr1" id = "ifrmgr1"
				width=<% out.print(bscFrmWidth); %> height="<% out.print(bscFrmHeight); %>"
				src="<%=request.getContextPath()%>/SNPDashBoard_New/meterChart.jsp?gvalue=27" 
				marginwidth="0" marginheight="0" 
				vspace="0" hspace="0" frameborder="0" 
				align="middle" scrolling="no">
				</iframe> 
		</div>
</td>
</tr>
<!----------------------------------------- End Financial Chart----------------------------------------->

<tr><td colspan="1"  class="tdbscNameCus"><a href="javascript:showhidebsc('CustomerRow' , 23 , 'ifrmgr2')" class="bsc">Customer</a></td>
<td   class="tdbscNameCus" align="center" width="<% out.print(bscFrmWidth); %>">
<a href="javascript:loadmetergraph('meterChart.jsp?gvalue=23','ifrmgr2');	" class="bsc">Return to Gauge Meter</a>
</td>
</tr>
<tr id="CustomerRow">
<!--  Column 2,1 -->
<!------------------------------------ Show BSC Custommer Table ----------------------------------------->
<td align="top" charset="utf-8">
<div id="CustomerTable" style="height:<% out.print(bscFrmHeight); %>px;overflow:auto;" > </div>
</td>
<!--  Column 2,2 -->
<!------------------------------------ Show BSC Customer Chart ----------------------------------------->
<td width="<% out.print(bscFrmWidth); %>" " >
		<iframe name="ifrmgr2" id = "ifrmgr2"
		width=<% out.print(bscFrmWidth); %> height="<% out.print(bscFrmHeight); %>"
		src="meterChart.jsp?gvalue=23"  
		marginwidth="0" marginheight="0" 
		vspace="0" hspace="0" frameborder="0" 
		align="middle" scrolling="no">
		</iframe> 
</td>
</tr>
<!----------------------------------------- END ------------------------------------------------->


<tr><td colspan="1" class="tdbscNamePro"><a href="javascript:showhidebsc('ProcessRow' , 14 , 'ifrmgr3')" class="bsc">Process</a></td>
<td   class="tdbscNamePro" align="center" width="<% out.print(bscFrmWidth); %>">
<a href="javascript:loadmetergraph('meterChart.jsp?gvalue=14','ifrmgr3');	" class="bsc" >Return to Gauge Meter</a>
</td>
</tr>
<tr id="ProcessRow">
<!--  Column 3,1 -->
<!------------------------------------ Show BSC Process Table ----------------------------------------->
<td align="top" charset="utf-8">
<div id="ProcessTable" style="height:<% out.print(bscFrmHeight); %>px;overflow:auto;" > </div>
</td>
<!--  Column 2,2 -->
<!------------------------------------ Show BSC Process Chart ----------------------------------------->
<td width="<% out.print(bscFrmWidth); %>" " >
		<iframe name="ifrmgr3" id = "ifrmgr3"
		width=<% out.print(bscFrmWidth); %> height="<% out.print(bscFrmHeight); %>"
		src="meterChart.jsp?gvalue=14" 
		marginwidth="0" marginheight="0" 
		vspace="0" hspace="0" frameborder="0" 
		align="middle" scrolling="no">
		</iframe> 
</td>
</tr>
<!----------------------------------------- END ------------------------------------------------->



<tr><td colspan="1" class="tdbscNameLearn">
<a href="javascript:showhidebsc('LearningRow' , 29 , 'ifrmgr4')" class="bsc">Lerning & Growth</a></td>
<td   class="tdbscNameLearn" align="center" width="<% out.print(bscFrmWidth); %>">
<a href="javascript:loadmetergraph('meterChart.jsp?gvalue=29','ifrmgr4');	" class="bsc" >Return to Gauge Meter</a>
</td>

</tr>
<tr id="LearningRow">
<!--  Column 3,1 -->
<!------------------------------------ Show BSC Learning & growth Table ----------------------------------------->
<td align="top" charset="utf-8">
<div id="LearningTable" style="height:<% out.print(bscFrmHeight); %>px;overflow:auto;" > </div>
</td>
<!--  Column 2,2 -->
<!------------------------------------ Show BSC Process Chart ----------------------------------------->
<td width="<% out.print(bscFrmWidth); %>" " >
		<iframe name="ifrmgr4" id = "ifrmgr4"
		width=<% out.print(bscFrmWidth); %> height="<% out.print(bscFrmHeight); %>"
		src="meterChart.jsp?gvalue=29" 
		marginwidth="0" marginheight="0" 
		vspace="0" hspace="0" frameborder="0" 
		align="middle" scrolling="no">
		</iframe> 
</td>
</tr>
<!----------------------------------------- END ------------------------------------------------->

</Table>





<!---------------------------------------Main Function area  -------------------------->
<script type="text/javascript">
function changeText2(){
	var userInput = document.getElementById('userInput').value;
	//document.getElementById('boldStuff2').innerHTML = userInput;
	$("#boldStuff2").get(0).innerHTML = 'Henbe';
	$("#price").get(0).innerHTML = '999'
}

</script>

<script type="text/javascript">
    jQuery(document).ready(function($) {
      $('a[rel*=facebox]').facebox({
        loadingImage : '<%=request.getContextPath()%>/chartLib/images/loading.gif',
        closeImage   : '<%=request.getContextPath()%>/chartLib/images/closelabel.png'
      })
    })
  </script>

<script type="text/javascript">
//ajaxdata()
document.getElementById('FinancialTable').innerHTML = ajaxdata("bscFinancial.jsp");
document.getElementById('CustomerTable').innerHTML = ajaxdata("bscCustomer.jsp");
document.getElementById('ProcessTable').innerHTML = ajaxdata("bscProcess.jsp");
document.getElementById('LearningTable').innerHTML = ajaxdata("bscLearning.jsp");
</script>


<script language="javascript">
function loadiframe(GrName){
var objFrame=document.getElementById("ifrmgr1");
objFrame.src=  "graph"+ document.getElementById('g1').value +".jsp";
}

function loadmetergraph(ivalue ,iFrameID)
{
	var objFrame=document.getElementById(iFrameID);
	objFrame.src=  ivalue;
}


function showhidebsc(rowid , meterValue , meterFrame ){
	//var row = document.getElementById("r4")
	var mFrame = document.getElementById(meterFrame).src;
	//alert(mFrame);
	var row = document.getElementById(rowid);

	
	if (row.style.display == 'none')
	{	
			if (mFrame != '<%=request.getContextPath()%>/SNPDashBoard_New/meterChart.jsp?gvalue='+meterValue)
				{
					loadmetergraph('meterChart.jsp?gvalue='+meterValue,meterFrame);	
				}

				row.style.display='';
	}
	else
	{			row.style.display='none';	}
}


function popupKPI(kName){
	
	var KPIName = kName;
	//alert(kName);
	window.open('bscKPIDetail.jsp?head='+kName,'','width=560,height=450,toolbar=0,menubar=no,directories=no,location=no,status=no,scrollbars=0,resizable=no,left=300,top=100');
	//return false;
}
</script> 

 

<script type="text/javascript">
$("FinancialRow").click(function () {
      $(this).hide("slide", { direction: "down" }, 1000);
/*
<iframe id="chgMe" src="Source1.htm">Frames are not supported on your browser.</iframe>
<button onclick="document.getElementById('chgMe').src='Source2.htm'">Next</button>



$.ajax
({
  type: "GET",
  url: "http://localhost2/web/e_reports/e_documents/dpt_report1.php?dpt=01&limit=7&tbw=510",
  cache: false,
  data: "name="+document.form1.name.value+"&email="+document.form1.email.value,
  contentTypeString: "application/x-www-form-urlencoded",
  success: function(data, textStatus, XMLHttpRequest){
    $("#results").append(data);
  }
});

$("#results").load
({
  url: "http://localhost2/web/e_reports/e_documents/dpt_report1.php?dpt=01&limit=7&tbw=510" + " #container" ,
  data: "name="+document.form1.name.value+"&email="+document.form1.email.value
  }
});
*/
</script>

</body>
</html>