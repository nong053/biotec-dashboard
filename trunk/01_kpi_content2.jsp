<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
<head><title>Test</title>

<style type="text/css">
	body{
	font-size:12px;
	}
	#head{
	width:1500px;
	height:30px;
	font-size:18px;
	font-weight:bold;
	padding-top:10px;
	padding-left:10px;
	/*background:#E3E3E3;*/
	}
	#content_lr{
	width:1500px;
	/*background:#cccccc;*/
	}
	#content_lr #content_l{
	width:1095px;
	float:left;
	border:1px solid;
	}
	#content_lr #content_r{
	width:400px;
	float:right;
	border:1px solid;
	}
	table#titlte_table1 tr td{
	padding:5px;
	}
	table#titlte_table1 #veiw{
	
	padding:5px;
	}
				
</style>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert("hello jquery");
   //alert($("table#titlte_table1 tr:eq(0)").length);
   $("table#titlte_table1 tr:eq(0)").css({"background-color":"#E3E3E3","background-image":"url('images/highlight.png')","font-size":"15px","font-weight":"bold"});
   $("table#titlte_table1 tr:odd").css({"background-color":"#f5f5f5"});

});
</script>
</head>
<body>

<table border="0" width="1000">
	<tr>
		<td>
		<div id="head">
		ตัวชี้วัดเชิงกลยุทธ์
		</div>
		</td>
	</tr>

</table>
<div id="content_lr">
	<div id="content_l">
	<table border="0" width="100%" id="titlte_table1" >
		
			<tr>
				<td width="60">
				<div id="veiw">
				มุมมอง
				</div>
				</td>
				<td width="250">
				<div id="2">
				ค่าชี้วัด
				</div>
				</td>
				<td width="100">
				<div id="3">
				เป้าหมาย
				</div>
				</td>
				<td width="100">
				<div id="4">
				หน่วยนับ
				<div>
				</td>
				<td width="100">
				<div id="5">
				น้ำหนัก
				</div>
				</td>
				<td width="150">
				<div id="6">
				ผลการดำเนินงาน
				</div>
				</td>
				<td width="100">
				<div id="7">
				%เทียบแผน
				</div>
				</td>
				<td width="100">
				<div id="8">
				ข้อมูลล่าสุด
				</div>
				</td>
			</tr>
		
			<tr>
				<td>
				Lead1 
				</td>
				<td>
				สัดส่วนโครงการ RDDE/TT ที่มีประเมินผลกระทบจาก ผลงานวิจัยต่อโครงการ RDDE/TT ที่ดำเนินการทั้งหมด
				</td>
				<td>
				 0.12 
				</td>
				<td>
				-
				</td>
				
				<td>
				20
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				
			</tr>
			<tr>
				<td>&nbsp;
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				
			</tr>
			<tr>
				<td>&nbsp;
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				
			</tr>
			<tr>
				<td>&nbsp;
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				
			</tr>
			<tr>
				<td>&nbsp;
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				
			</tr>
		
		
	</table>
	
	</div>

	<div id="content_r">
	
	<table border="0" width="100%">
			<tr>
				<td>แนวโน้ม</td>
			</tr>
		
			<tr>
				<td>Picture</td>
			</tr>
		
	</table>

	</div>
	<br style="clear:both;">
</div>

</body>
</html>



           

