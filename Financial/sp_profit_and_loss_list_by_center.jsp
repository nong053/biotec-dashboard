<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ include file="../config.jsp"%>
<!--- Tab2 -->
<%
	String paramYear= request.getParameter("paramYear");
	String paramMonth= request.getParameter("paramMonth");
//	String paramYear= "2012";
//	String paramMonth= "11";
	String paramMonthPerv= "";
	String paramMonthCurent= "";
	String paramOrg=request.getParameter("paramOrg");
//	String paramOrg="สวทช.";

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
	Query="CALL sp_profit_and_loss_list_by_center_per_level("+paramYear+","+paramMonth+",'"+paramOrg+"',4,null);";
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
		dataDefault+="account_name:\""+rs.getString("account_name")+"\",";
		dataDefault+="account_key:"+rs.getString("account_key")+",";
		dataDefault+="Field1:\"<div class='textL level"+rs.getString("level") +" parent_key"+rs.getString("parent_key")+"'  id='account_key"+rs.getString("account_key")+" '>"+rs.getString("account_name")+" </div>\",";
		dataDefault+="Field2:\"<div class='textR'>"+rs.getString("pMonthAmt")+"</div>\",";
		dataDefault+="Field3:\"<div class='textR'>"+rs.getString("currentAmt")+"</div>\",";
		dataDefault+="Field5:\"<div class='textR'>0%</div>\",";
		dataDefault+="Field6:\"<div class='textR'>"+rs.getString("pYearAmt")+"</div>\"";
		dataDefault+="}" ;
		}else{
		dataDefault+=",{" ;
		dataDefault+="account_name:\""+rs.getString("account_name")+"\",";
		dataDefault+="account_key:"+rs.getString("account_key")+",";
		dataDefault+="Field1:\"<div class='textL level"+rs.getString("level") +" parent_key"+rs.getString("parent_key")+"'  id='account_key"+rs.getString("account_key")+" '>"+rs.getString("account_name")+" </div>\",";
		dataDefault+="Field2:\"<div class='textR'>"+rs.getString("pMonthAmt")+"</div>\",";
		dataDefault+="Field3:\"<div class='textR'>"+rs.getString("currentAmt")+"</div>\",";
		dataDefault+="Field5:\"<div class='textR'>0%</div>\",";
		dataDefault+="Field6:\"<div class='textR'>"+rs.getString("pYearAmt")+"</div>\"";
		dataDefault+="}" ;
		}
i++;
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



%>

<!-- ####################################### Content tab2 Start ###################################-->

	<style type="text/css">
	#pieChart{
	padding:5px;
	}
	#pie5{
	padding:5px;
	}
	#pie6{
	padding:5px;
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
	.content{
	width:100%
	}
	.content #table_content{
	float:left;
	width:100%
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
	background:#CFCFCF;
	border-radius:10px;
	width:99%;
	color:black;
	margin:2px;
	}
	#table_title  #title{

padding:15px;
padding-top:20px;
font-weight:bold;
font-size:16px;

	}
	.textR{
	/*background:red;*/
	text-align:right;
	padding-right:0px;
	}
	.textL{
	/*background:red;*/
	text-align:left;
	padding-left:5px;
	}
	#kpiN{
	background:#CCCCCC;
	padding:5px;
	display:inline;
	border-radius:5px;
	margin:2px;
	}
	.inlinesparkline{
	cursor:pointer;
	}

	.boxContent{
	width:100%;
	height:550px;
/*	background:#cccccc;*/
	
	}
	.boxContent #boxL{
	/*background:#ffccff;*/
	width:74.5%;
	height:385px;
	float:left;
	}
	.boxContent #boxR{
	width:25%;
	height:350px;
	float:right;
	border:1px solid #cccccc;
	border-radius:5px;
	}
	.boxContent #boxB{
	/*background:yellow;*/
	width:100%;
	height:auto;
	clear:both;
	position:center;
	
	}
	.fontTitle{
	color:white;
	font-weight:bold;
	}

	</style>
	<!--<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/kendo.all.min.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
    <link href="styles/kendo.common.min.css" rel="stylesheet">
    <link href="styles/kendo.default.min.css" rel="stylesheet">
	<link href="jqueryUI/css/smoothness/jquery-ui-1.8.20.custom.css" rel="stylesheet">
	<script type="text/javascript" src="jqueryUI/js/jquery-ui-1.8.20.custom.min.js"></script>--> 
	<script type="text/javascript">
	$(document).ready(function(){




	var setFont = function(){
		/*Config font*/
		//alert("hello");
		$(".k-draghandle").css({"font-size":"50%"}); 
		//$(".k-grid td").css({"padding":"0px"});
		$(".k-grid td").css({"padding-top":"0px","padding-bottom":"0px"});
		/*Config font*/

}
	//#######################Graph Program Start#######################01

var barChart = function(title){
			$("#chart").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			height:300,
			width:550
			},
			title: {
				 text: title
			},
			legend: {
                            position: "bottom"
            },
			series: [
				 { 
						 name: "Last Year", data: [6500, 6500, 6500, 6500,6500,6500,6500,6500,6500,6500,6500,6500],
						color: "BLUE"
						
						
				 } ,
				 {
                            name: "This Year",
                            data: [6100, 5200, 6300, 7200,4100,7800,6100,7000,5300,7300,6200,7100]
						
						

                   }, 
				
				 {
                            type: "line",
                            data: [0.5, 0.5, 0.5, 0.5, 0.5,0.5, 0.5, 0.5, 0.5, 0.5,0.5,0.5],
                            name: "Target",
                            color: "GREEN",
							axis:"Variance"
							
							
                  }
			],
			valueAxis: [{
                            title: { text: "YOY" },
                            min: 0,
                            max: 8000
                        }, {
                            name: "Variance",
                            title: { text: "%Variance" },
                            min: 0,
                            max: 5
                        }],

			categoryAxis:{
			categories: [ "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep" ],
			axisCrossingValue: [0,100]
			}
		});
}//function line chart end



function onSeriesClick(e) {
    alert("Clicked value: " + e.value);
}
function checkBarType(e){

	barChart("เงินอุดหนุนจากรัฐบาล");

	$("#boxB").dialog({
	title:"",
	width:650,
	buttons:{
		"OK":function(){
			$(this).dialog("close");
			$(".contentMain").css("opacity","1");
		}
	},
	regend:{
	position:"botom"
	}
	});
}

/*### Pie Start  ###*/		
//$("#pieChart").onSeriesClick();
var pieChart = function(paramValue,titleText){
		$("#pieChart").kendoChart({
			theme:$(document).data("kendoSkin") || "metro",
			chartArea:{
			width:230,
			height:300
			},
			title: {
				 text:titleText['title']
			},
			legend: {
                            position: "bottom"
            },
			series: [{
                            type: "pie",
                            data: paramValue
                        }],
                        tooltip: {
                            visible: true,
                           // format: "{0}%"
						   template :"#= tootipFormat(value,900) #"

                        },
			
			seriesDefaults: {
				labels: {
					visible: false,
					format: "{0}%"
				}
			},
			seriesClick:checkBarType
			
		});


		
		
}
//pieChart();
/*### Pie End  ###*/




		//#######################Graph Program End#######################01



	//alert("hello jquery");
	// TITLE BY JSON START
	/*########## Table Content Start ##########*/
	var $titleJ =[
              {
                  field: "Field1",
				   width: 150
              },
              {
                  field: "Field2",
				  width: 70
			 },
              {
                  field: "Field3",
				  width: 80
			 },
         
              {
                  field: "Field5",
				  width: 70
			 }, 
              {
                  field: "Field6",
				  width: 70
			 } ];


var $titleJ2 =[
              {
                  field: "Field1",
				  title:"รายการ",
				   width: 261
              },
              {
                  field: "Field2",
				   title:"MAR-12",
				    width: 104
			 },
              {
                  field: "Field3",
				   title:"Last Month",
				    width: 119
			 },
           
              {
                  field: "Field5",
				   title:"%Variance",
				    width: 104
			 },
              {
                  field: "Field6",
				   title:"YOY",
					width: 100

			
			 }


           ];
	var $titleJ3 =[
              {
                  field: "Field1",
				  title:"รายการ",
				   width: 261
              },
              {
                  field: "Field2",
				   title:"MAR-12",
				    width: 104
			 },
              {
                  field: "Field3",
				   title:"Last Month",
				    width: 119
			 },
           
              {
                  field: "Field5",
				   title:"%Variance",
				    width: 104
			 },
              {
                  field: "Field6",
				   title:"YOY",
					width: 100

			
			 }


           ];


	

	var $dataJ =<%=dataDefault%>; 		
	


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
                   
                     
                  },{
                      Field1: "รายได้ค่าบริการและขายสินค้า</div>",
					  Field2: "<div id='textR'>187.43</div>",
                      Field3: " <div id='textR'>139.17</div>",
					
                      Field5: "<div id='textR'>34.68%</div>",
					  Field6: "<div id='textR'>190.10 </div>",
                   
                     
                  },{
                      Field1: "รายได้อื่นๆ",
					  Field2: "<div id='textR'>173.28</div>",
                      Field3: " <div id='textR'>171.27 </div>",
				
                      Field5: "<div id='textR'>1.17%</div>",
					  Field6: "<div id='textR'>169.02 </div>",
                  
                     
                  }
				 
				  ]; 
		var $dataJ22 =[
                  {
                      Field1: "ค่าใช้จ่ายด้านบุคลากร",
					  Field2: "<div id='textR'>914.39</div>",
                      Field3: "<div id='textR'>786.34 </div>",
					
                      Field5: "<div id='textR'>16.28%</div>",
					  Field6: "<div id='textR'>959.32</div> ",
                  
                     
                  },{
                      Field1: "ค่าใช้จ่ายด้านดำเนินงาน",
					  Field2: "<div id='textR'>700.79</div>",
                      Field3: "<div id='textR'>559.00 </div>",
					
                      Field5: "<div id='textR'>25.36%</div>",
					  Field6: "<div id='textR'>695.2 </div>",
                  
                     
                  },{
                      Field1: "ค่าเสื่อนราคา",
					  Field2: "<div id='textR'>303.46</div>",
                      Field3: " <div id='textR'>254.5 </div>",
				
                      Field5: "<div id='textR'>19.24%</div>",
					  Field6: "<div id='textR'>294.98 </div>",
                 
                     
                  }
				 
				  ]; 
	//CONTENT BY JSON END

	$("#grid").kendoGrid({
		theme:$(document).data("kendoSkin") || "metro",
          height: 550,
		 // width:800,
	      //groupable: true,
         /* scrollable: true,
          sortable: true,
          pageable: true,*/
		  detailInit: detailInit2,

		/*   dataBound: function() {
                            this.expandRow(this.tbody.find("tr.k-master-row").first());
                        },*/

          columns: $titleJ,
          dataSource: {
              data: $dataJ,
			  pageSize: 10,
			
          }
      });
	  /*########## Table Content End ##########*/

	  //#################### Manment Pie Chart #######################

		//Step1  Call Default

var j=0;
var dataLevel1 ="";
var titleText="{\"title\":\"สัดส่วนงบรายได้ค่าใช้จ่าย\"}";
dataLevel1+="[";
	$(".level4").each(function(){
		
	//Format  [{category: "ศจ.",value: 10,color:"#6C2E9B" }]
	if(j==0){
	dataLevel1+="{";
		dataLevel1+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
		//$("body").append("<input type='text'> name='domAccount_key"+J+"' id='domAccount_key"+J+"' class='account_key' value='"+$(this).text()+"' ");
	dataLevel1+="}";
	}else{
	dataLevel1+=",{";
		dataLevel1+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
	dataLevel1+="}";	
	}
	j++;
	});
	dataLevel1+="]";
	//get is json same dataType in ajax
	var obj = eval ("(" + dataLevel1 + ")"); 
	var obj2=eval("("+titleText+")");
	console.log("obj"+obj);
	console.log("obj2"+obj2);
	pieChart(obj,obj2);
//Step1 Call Default



//#################### Manment Pie Chart #######################
			

	
	 function detailInit2(e) {
								
							//alert(e.data.account_name);
							//alert(e.data.account_name);/
								
							$.ajax({
								url:'sp_profit_and_loss_list_by_center_level2.jsp',
								type:'get',
								dataType:'json',
								data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramArea':e.data.account_name,'paramParentKey':e.data.account_key},
								success:function(data){
									//console.log(data);
								//var $data_level2=  eval("(" + data + ")"); 
//new level2 start
										   $("<table bgcolor='#f5f5f5'><th></th></table>").kendoGrid({
											detailInit: detailInit3,
											columns: $titleJ2,
											dataSource: {
											data: data,
											pageSize: 8
											}
											}).appendTo(e.detailCell);
//new level2 end

//Step Call Level2

	var account_key = e.data.account_key;
	var account_name = e.data.account_name;
	var dataLevel2 ="";
	var j=0;
	var titleText="{\"title\":\""+account_name+"\"}";
	//alert("titleText"+titleText);
	console.log($(this).get());
	dataLevel2+="[";
	$(".parent_key"+account_key).each(function(){
		if(j==0){
			dataLevel2+="{";
				dataLevel2+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel2+="}";
		}else{
			dataLevel2+=",{";
				dataLevel2+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel2+="}";		
		}
		j++;
	});
	dataLevel2+="]";
	console.log(dataLevel2);
	var obj=eval("("+dataLevel2+")");
	var obj2=eval("("+titleText+")");
	console.log(obj2);
	pieChart(obj,obj2);

//Step Call Level2


								}//ajax
							});
								
								//pieChart();
								
						
						 

				setFont();
			// REMOVE COLUMN START
				//$("tr.k-detail-row td.k-hierarchy-cell").remove();
			// REMOVE COLUMN END
                } // End Function detailInit

			//Start detailInit3
				function detailInit3(e) {
					alert(e.data.account_name);
					alert(e.data.account_key);
						$.ajax({
								url:'sp_profit_and_loss_list_by_center_level3.jsp',
								type:'get',
								dataType:'json',
								data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramArea':e.data.account_name,'paramParentKey':e.data.account_key},
								success:function(data){
									//console.log(data);
								//var $data_level2=  eval("(" + data + ")"); 
//new level2 start
										   $("<table><th></th></table>").kendoGrid({
											detailInit: detailInit4,
											columns: $titleJ3,
											dataSource: {
											data: data,
											pageSize: 8
											}
											}).appendTo(e.detailCell);
//new level2 end
//Step Call Level3

	var account_key = e.data.account_key;
	var account_name = e.data.account_name;
	var dataLevel3 ="";
	var j=0;
	var titleText="{\"title\":\""+account_name+"\"}";
	//alert("titleText"+titleText);
	console.log($(this).get());
	dataLevel3+="[";
	$(".parent_key"+account_key).each(function(){
		if(j==0){
			dataLevel3+="{";
				dataLevel3+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel3+="}";
		}else{
			dataLevel3+=",{";
				dataLevel3+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel3+="}";		
		}
		j++;
	});
	dataLevel3+="]";
	console.log(dataLevel3);
	var obj=eval("("+dataLevel3+")");
	var obj2=eval("("+titleText+")");
	console.log(obj2);
	pieChart(obj,obj2);

//Step Call Level3

								}//success
							});//ajax
								
								//pieChart();
								
						
						 

				setFont();
			// REMOVE COLUMN START
				//$("tr.k-detail-row td.k-hierarchy-cell").remove();
			// REMOVE COLUMN END
				}//end detailInit3


				//Start detailInit4
				function detailInit4(e) {
					alert(e.data.account_name);
					alert(e.data.account_key);
						$.ajax({
								url:'sp_profit_and_loss_list_by_center_level4.jsp',
								type:'get',
								dataType:'json',
								data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramArea':e.data.account_name,'paramParentKey':e.data.account_key},
								success:function(data){
									//console.log(data);
								//var $data_level2=  eval("(" + data + ")"); 
//new level2 start
										   $("<table><th></th></table>").kendoGrid({
											detailInit: detailInit5,
											columns: $titleJ3,
											dataSource: {
											data: data,
											pageSize: 8
											}
											}).appendTo(e.detailCell);
//new level2 end
//Step Call Level4

	var account_key = e.data.account_key;
	var account_name = e.data.account_name;
	var dataLevel4 ="";
	var j=0;
	var titleText="{\"title\":\""+account_name+"\"}";
	//alert("titleText"+titleText);
	console.log($(this).get());
	dataLevel4+="[";
	$(".parent_key"+account_key).each(function(){
		if(j==0){
			dataLevel4+="{";
				dataLevel4+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel4+="}";
		}else{
			dataLevel4+=",{";
				dataLevel4+="category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
			dataLevel4+="}";		
		}
		j++;
	});
	dataLevel4+="]";
	console.log(dataLevel4);
	var obj=eval("("+dataLevel4+")");
	var obj2=eval("("+titleText+")");
	console.log(obj2);
	pieChart(obj,obj2);

//Step Call Level4

								}//success
							});//ajax
								
								//pieChart();
								
						
						 

				setFont();
			// REMOVE COLUMN START
				//$("tr.k-detail-row td.k-hierarchy-cell").remove();
			// REMOVE COLUMN END
				}//end detailInit4

				//Start detailInit5
				function detailInit5(e) {
					alert(e.data.account_name);
					alert(e.data.account_key);
						$.ajax({
								url:'sp_profit_and_loss_list_by_center_level5.jsp',
								type:'get',
								dataType:'json',
								data:{'paramYear':$('#domParamYear').val(),'paramMonth':$('#domParamMonth').val(),'paramArea':e.data.account_name,'paramParentKey':e.data.account_key},
								success:function(data){
									//console.log(data);
								//var $data_level2=  eval("(" + data + ")"); 
//new level2 start
										   $("<table><th></th></table>").kendoGrid({
											//detailInit: detailInit4,
											columns: $titleJ3,
											dataSource: {
											data: data,
											pageSize: 8
											}
											}).appendTo(e.detailCell);
//new level2 end
//Step Call Level5

	var account_key = e.data.account_key;
	var account_name = e.data.account_name;
	var dataLevel5 ="";
	var dataLevel5_Sum="";
	var j=0;
	var titleText="{\"title\":\""+account_name+"\"}";
	//alert("titleText"+titleText);
	console.log($(this).get());
	dataLevel5+="[";
	$(".parent_key"+account_key).each(function(){
		if(j==0){
			dataLevel5+="{";
				dataLevel5+="account_key:"+account_key+",category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
				dataLevel5_Sum+=parseInt($(this).parent().parent().children('td').eq(2).text());
			dataLevel5+="}";
		}else{
			dataLevel5+=",{";
				dataLevel5+="account_key:"+account_key+",category:"+"\""+$(this).text()+"\",value:"+$(this).parent().parent().children('td').eq(2).text();
				dataLevel5_Sum+=parseInt($(this).parent().parent().children('td').eq(2).text());
			dataLevel5+="}";		
		}
		j++;
	});
	dataLevel5+="]";

	console.log(dataLevel5);
	console.log(dataLevel5_Sum);

	var obj=eval("("+dataLevel5+")");
	var obj2=eval("("+titleText+")");
	console.log(obj);
	pieChart(obj,obj2);

//Step Call Level5

								}//success
							});//ajax
								
								//pieChart();
								
						
						 

				setFont();
			// REMOVE COLUMN START
				//$("tr.k-detail-row td.k-hierarchy-cell").remove();
			// REMOVE COLUMN END
				}//end detailInit5



	});

	//set add row management title year current and year perv

	//set add row management title year current and year perv


		/*################# jQuery Start #############*/

		$(".k-icon").click(function(){

	
		if($(".k-minus").length!=0){
			//$("#chart").hide();
			//$("#pieChart").hide();//pie
		//	$(".k-detail-row").remove(); //delete value pie old for add new value
		}else{
		
		//$("#chart").show();
		//$("#pieChart").show();//pie
		$(".k-detail-row").remove();//delete value pie old for add new value
		}
	
	});
		//$(". k-plus")
		/*################# jQuery End #############*/
	
function tootipFormat(value,summ){
		var value1 = Math.floor(value);
		var value2 = Math.floor((value/summ)*100);
		return value1+" , " + value2+"%";
	}

	</script>
 <!-- Define the HTML table, with rows, columns, and data -->
<div class="boxContent">
	<div id="boxL"><!-- boxL	 Start-->
	<div id="titleTop" style="text-align:right"> หน่วย : ล้านบาท </div>
	 <div class="content"><!-- Content	 Start-->
 <div id="table_content">
 <table id="grid">
  <thead>
      <tr>
		 <!--<th class="k-hierarchy-cell k-header"></th>-->
          <th data-field="Field1" ><center><div class="fontTitle"> </div></center></th>
		  <th  data-field="Field2"><center><div class="fontTitle"><%=paramMonthPerv%> &nbsp; <%=paramCurentYear%> </div></center></th>		 
		  <th data-field="Field3"><center><div class="fontTitle"><%=paramMonthCurent%> &nbsp; <%=paramCurentYear%> </div></center></th>
		  <th data-field="Field5"><center><div class="fontTitle">%</div></center></th>
		  <th data-field="Field6"><center><div class="fontTitle"><%=paramMonthCurent%> &nbsp; <%=paramLastYear%> </div></center></th>
	  </tr>
  </thead>
  <tbody>
      <tr>
          <td></td>
          <td></td>
		  <td></td>
          <td></td>
		  <td></td>
</tr>

  </tbody>
 </table>

 </div>

</div><!-- Content	 End-->
	</div><!-- boxL	 End>-->
	<div id="boxR"><!-- boxR	 Start-->
	
	<div id="pieChart"><p></p></div>
	
	</div><!-- boxR	 End>-->
	<center>
	<div id="boxB"><!-- boxB	 Start-->
	
	<div id="chart"><p></p></div>
	
	</div><!-- boxB	 End>-->
	</center>
	<br style="clear:both">
</div>


<!-- ####################################### Content tab2 End ###################################-->