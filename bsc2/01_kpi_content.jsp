<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
<head><title>Test</title>

<style type="text/css">

	#head{
	width:1000px;
	height:100px;
	background:#E3E3E3;
	}
	#content_lr{
	width:1000px;
	background:blue;
	}
	#content_lr #content_l{
	width:795px;
	float:left;
	border:1px solid;
	}
	#content_lr #content_r{
	width:200px;
	float:right;
	border:1px solid;
	}
	  #clientsDb {
                    width: 1000px;
                    height: 393px;
                    margin: 0px auto;
                    padding: 51px 4px 0 4px;
                    background: url('content/web/grid/clientsDb.png') no-repeat 0 0;
                }
				
</style>


<!-- kendo ui start-->
    <link href="content/shared/styles/examples-offline.css" rel="stylesheet">
    <link href="styles/kendo.common.min.css" rel="stylesheet">
    <link href="styles/kendo.default.min.css" rel="stylesheet">

    <script src="js/jquery.min.js"></script>
    <script src="js/kendo.web.min.js"></script>
    <script src="js/console.js"></script>
<!-- kendo ui end -->
<script type="text/javascript">
$(document).ready(function(){

});
</script>
</head>
<body>
<table border="0" width="1000">
	<tr>
		<td>
		<div id="head">
		nongddd
		</div>
		</td>
	</tr>

</table>
<div id="content_lr">
<div id="content_l">
<table border="0">
 <script src="content/shared/js/people.js"></script>

        <div id="example" class="k-content">
		<!--<div id="title">ddd</div>-->
            <div id="clientsDb">

                <div id="grid"></div>

            </div>

          
            <script>
                $(document).ready(function() {

                    $("#grid").kendoGrid({
                        dataSource: {
                            data: createRandomData(50),
                            pageSize: 10
                        },
                        height: 360,
                        groupable: true,
                        scrollable: true,
                        sortable: true,
                        pageable: true,
                        columns: [ {
                                field: "FirstName",
                                width: 90,
                                title: "มุมมอง"
                            } , {
                                field: "LastName",
                                width: 90,
                                title: "ตัวชี้วัด"
                            } , {
                                width: 100,
                                field: "City",
								title: "<b> เป้าหมาย </b>"
                            } , {
                                field: "Title",
								title: "หน่วยนับ"
                            } , {
                                field: "BirthDate",
                                title: "น้ำหนัก",
								template: '<span style="float:right">#= kendo.toString(BirthDate, "dd MMMM yyyy")#</span>'
                                /*template: '#= kendo.toString(BirthDate,"dd MMMM yyyy") #'*/
                            } , {
                                width: 150,
                                field: "Age",
								title: "ผลการดำเนินงาน"
                            }, {
                                width: 150,
                                field: "Age",
								title: "เทียบแผน"
                            }, {
                                width: 150,
                                field: "Age",
								title: "ข้อมูลล่าสุด"

                            }
                        ]

                    });
					
					
						
                });
				template: '<span style="float:right">#= kendo.toString(AwaitingAmt, "n")#</span>'
            </script>
        </div>
</div>

	<div id="content_r">
	content rigth
	</div>
</div>

</body>
</html>



           

