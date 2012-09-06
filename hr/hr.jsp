<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.lang.*"%> 

<%
String ParamMonth = request.getParameter("ParamMonth");
String ParamYear = request.getParameter("ParamYear");
String ParamOrg = request.getParameter("ParamOrg");
String Param_sp_center = "";

out.print("ParamMonth"+ParamMonth);
out.print("ParamYear"+ParamYear);
out.print("ParamOrg"+ParamOrg);

// Jsp  Server-side
String connectionURL="jdbc:mysql://10.226.202.114:3306/biotec_dwh";
String Driver = "com.mysql.jdbc.Driver";
String User="root";
String Pass="bioteccockpit";
String Query="";
String center_name="";

String total_employee1="";
String center_th_shortname1="";

Connection conn= null;
Statement st;
ResultSet rs;

try{
Class.forName(Driver).newInstance();
conn=DriverManager.getConnection(connectionURL,User,Pass);
	if(!conn.isClosed()){
		st = conn.createStatement();
		Query="CALL sp_emp_by_center(2012,11);";
		rs = st.executeQuery(Query);
		
		while(rs.next()){
		//out.println(rs.getString("total_employee"));
		//out.println(rs.getString("center_th_shortname"));
		//total_employee1+=rs.getString("total_employee");

		center_th_shortname1+="[";
		center_th_shortname1+=rs.getString("center_th_shortname");
		center_th_shortname1+="]";
		//center_name+="<option>"+rs.getString("center_name")+"</option>";

		}
		out.print(center_th_shortname1);

		conn.close();
	}
}
catch(Exception ex){
out.println("Error"+ex);
}

%>

<style>
.content{
width:960px;
height:auto;
/*background:red;*/
margin:auto;
}
.content  #row1{
width:960px;
height:auto
background:blue;
clear:both;


}
.content  #row1 .box{
width:314px;
height:270px;
float:left;
margin:2px;

border-radius:5px;
   /* background: url("images/ui-bg_highlight-hard_100_f2f5f7_1x100.png") repeat-x scroll 50% top #ffffff;*/
    border: 1px solid #DDDDDD;
    color: #362B36;
}
.content  #row1 .box #head{
/*width:auto;
height:30px ;
background:#99ccff;
*/
   /*background: none repeat scroll 0 0 #DEEDF7;*/
    border-radius: 5px 5px 5px 5px;
    color: #2779AA;
    height: 26px;
    margin: 3px;
    padding: 5px;
    width: auto;
	background:url("images/ui-bg_highlight-soft_100_deedf7_1x100.png") repeat-x scroll  50% 50%  #DEEDF7;
    border: 1px solid #AED0EA;

}
.content  #row1 .box #head .title{
	padding:5px;
	text-align:center;
	
}
.content  #row1 .box #body{
width:auto;
height:250px;

}
.content #row2{
width:1000px;
height:300px;

clear:both;


}


.content #row2 #boxL{
width:630px;
height:300px;
border:1 solid blue;

float:left;
}
.content #row2 #boxL #box{
width:308px;
height:300px;
float:left;
margin:2px;
border-radius:5px;
border:1px solid #cccccc;
}
.content #row2 #boxL #box #head{
width:auto;
height:30px ;
background:#cccccc;

}
.content #row2 #boxL #box  #head #title{
	padding:5px;
	text-align:center;
}



.content #row2 #boxL #box  #body{
width:auto;
height:270px;

}


.content #row2 #boxR{

width:630px;
height:300px;
border:1 solid blue;
float:left;

}
.content #row2 #boxR #box{
height:300px;
float:left;
margin:2px;
width:630px;
border-radius:5px;
border:1px solid #cccccc;
background:#EBEBEB;

}
.content #row2 #boxR #box #head{
width:auto;
height:30px ;
background:#cccccc;
}
.content #row2 #boxR #box #head #title{
	padding:5px;
	text-align:center;
}
.content #row2 #boxR  #box #body{
width:auto;
height:310px;
background:#ffffff;

}
#tabHr1{
height:250px;
}
#pie1{
 top: -10px;
  left: -20px;
}
#pie11{
 top: -10px;
  left: -20px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
/*###  pie start ###*/

var pieChart= function(id_param,data_param,text_palam,summ_param){
	//var summ = summ_param; 
		$(id_param).kendoChart({
		 theme: $(document).data("kendoSkin") || "metro",
			title: {
				 text:text_palam
			},
			legend: {
                            position: "bottom"
            },
			chartArea: {
			width: 310,
			height: 230,
			background: ""
			},
			series: [{
                            type: "pie",
                            data:[data_param]
                        }],
                        tooltip: {
                            visible: true,
                            //format: "{0}%"
							template:"#= templateFormat(value,summ)#"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%",
					
				}
			}
	
			
		});
}


/*###  pie end ###*/

/* Using PieChart*/

pieChart("#pie_emp_by_center",{ category: "ส2.",value: 20 },{ category: "ส3.",value: 20 },"","100");
/* Using PieChart*/





/* Tab2 Start*/

	



$("#tabHr1.ui-tabs-panel ").css({"padding":"0px"});
$("#tabHr1.ui-widget-content").css({"border":"0px"});


/*Tab2 End*/
/*### Config Tab End ###*/
});

//define function extenal jquery
function templateFormat(value,summ) {
   var value1 = Math.floor(value);
   var value2 = Math.floor((value/summ)*100);
   return value1 + " , " + value2 + " %";
}


</script>
<div class="content">
	<div id="row1">

				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานแยกตามศูนย์
							</div>
						</div>
						<div id="body">
									<div id="pie_emp_by_center"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามประเภทการจ้าง
							</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_employ_type"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
							<div class="title">
							สัดส่วนพนักงานตามระดับการศึกษา
							</div>
						</div>
						<div id="body">
							<div id="pie_emp_by_education_level_group"></div>
						</div>
				</div>
				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามกลุ่มตำแหน่ง
								</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_job_family"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนพนักงานตามหน้าที่
								</div>
						</div>
						<div id="body">
								<div id="pie_emp_by_function_type"></div>
						</div>
				</div>

				<div class="box">
						<div id="head">
								<div class="title">
								สัดส่วนค่าใช้จ่ายบุคลากร
								</div>
						</div>
						<div id="body">
								<div id="pie_hr_expense"></div>
						</div>
				</div>
	</div>
	
</div>

</ul>
<br style="clear:both">

