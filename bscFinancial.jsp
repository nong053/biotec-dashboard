<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	<title>Financial treeview</title> </head>
<%@ page contentType="text/html; charset=UTF-8" %>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<META HTTP-EQUIV="EXPIRES" CONTENT="-1" />


<link type="text/css" href="<%=request.getContextPath()%>/chartLib/css/customchart.css" rel="stylesheet"/> 
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/runBigMixChart.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.js"></script>
<link type="text/css" href="<%=request.getContextPath()%>/chartLib/css/jquery.treeTable.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/chartLib/js/jquery.sparkline.js"></script>

<body>

<%
String KPIWidth = new String("43%");
String InfoWidth = new String ("20px");
String WeightWidth = new String ("6%");
String FreqWidth = new String ("4%");
String TargetWidth = new String ("7%");
String ActualWidth = new String ("7%");
String PerTargetWidth = new String ("10%");
String TrendWidth = new String ("5%");
String ETLWidth = new String ("12%");

String SRC=request.getContextPath()+"/chartLib/images/question_shield.ico";
String ImgWidth = new String("20px");
String ImgHeight = new String("20px"); 

int popupLeft = 400;
String popupTop  = new String("400");
%>


<table id="FinancialTree" width="100%" height="20"  border="1">

	
			<tr height="5" align="center">
				<td width="<% out.println(KPIWidth);%>" class="tdsubheader">KPI</td>
				<td width="<% out.println(InfoWidth);%>" class="tdsubheader"></td>	
				<td width="<% out.println(WeightWidth);%>" class="tdsubheader">O. Weight</td>
				<td width="<% out.println(WeightWidth);%>" class="tdsubheader">P. Weight</td>
				<td width="<% out.println(FreqWidth);%>" class="tdsubheader">Freq</td>		
				<td width="<% out.println(TargetWidth);%>%" class="tdsubheader">Target</td> 
				<td width="<% out.println(ActualWidth);%>%" class="tdsubheader">Actual</td>		
				<td width="<% out.println(PerTargetWidth);%>%" class="tdsubheader">% Target</td>	
				<td width="<% out.println(TrendWidth);%>%" class="tdsubheader">Trend</td>
				<td width="<% out.println(TrendWidth);%>%" class="tdsubheader">Score</td>
				<td width="<% out.println(ETLWidth);%>%"	class="tdsubheader" >Last Updated</td>
			</tr>

			<tr id="FinancialNode-F1-1" height="5">
				<td width="<% out.println(KPIWidth); %>" style="padding-left: 20px;">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Overall'" +",'ifrmgr1')"); %> >
				Sale growth(%) : Overall </a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Sale growth : Overall" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">75%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">75%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">14.45</td>		<td width="7%" align="right">10.89</td>		
				<td width="7%"	align="center"><span class="targetFinancialNode-1" title="38%">50,38,60,40,20</span></td>		
				<td width="5%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>

			<tr id="FinancialNode-F1-1-1" class="child-of-FinancialNode-F1-1" > 
				<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "SnP%20Restaurant%20n%20Bakery'" +",'ifrmgr1')"); %> >
				Sale growth(%) : S&P Restaurant & Bakery</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Sale growth : SnP Restaurant and Bakery" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">65%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">65%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>	
				<td width="7%"  align="right">14.50</td>		<td width="7%" align="right">9.50</td>		
				<td width="7%" align="center" ><span class="targetFinancialNode-2" title="27%">50,27,60,40,20</span></td>	
				<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
					<tr id="FinancialNode-F1-1-1-1" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Same%20Store'" +",'ifrmgr1')"); %> >
								Sale growth(%) : Same Store</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Sale growth : Same Store" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">44%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">44%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">10.50</td>		<td width="7%" align="right">4.60</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="21.9%">50,21.9,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-1-1-2" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20outlets'" +",'ifrmgr1')"); %> >
								Sale growth(%) : New outlets</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Sale growth : New outlets" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">87%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">87%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">9.80</td>		<td width="7%" align="right">8.60</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="43%">50,43,60,40,20</span></td>		
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
								<tr id="FinancialNode-F1-1-1-1-1" class="child-of-FinancialNode-F1-1-1-2">
										<td width="<% out.println(KPIWidth); %>">
										<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20store%20successful%20rate'" +",'ifrmgr1')"); %> >
										New store successful rate</a></td>
										
										<td width="<% out.println(InfoWidth);%>"  align="right">
										<a href="bscKPIDetail.jsp?head=New store successful rate" rel="facebox"> 
										<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
										</td>

										<td width="<% out.println(WeightWidth);%>"  align="right">53%</td>
										<td width="<% out.println(WeightWidth);%>"  align="right">53%</td>
										<td width="<% out.println(FreqWidth); %>" align="right">M</td>
										<td width="7%"  align="right">36.00</td>		<td width="7%" align="right">19.00</td>		
										<td width="7%" align="center"><span class="targetFinancialNode-2" title="26%">50,26,60,40,20</span></td>	
										<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
										<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
										<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
								</tr>
					<tr id="FinancialNode-F1-1-1-3" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20products'" +",'ifrmgr1')"); %> >
								Sale growth(%) : New products</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Sale growth : New products" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">86%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">86%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">5.00</td>			<td width="7%" align="right">5.80</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="43%">50,43,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>		
								<tr id="FinancialNode-F1-1-1-3-1" class="child-of-FinancialNode-F1-1-1-3">
										<td width="<% out.println(KPIWidth); %>">
										<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "NPD%20successful%20rate'" +",'ifrmgr1')"); %> >
										NPD successful rate</a></td>

										<td width="<% out.println(InfoWidth);%>"  align="right">
										<a href="bscKPIDetail.jsp?head=NPD successful rate" rel="facebox">
										<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
										</td>

										<td width="<% out.println(WeightWidth);%>"  align="right">78%</td>
										<td width="<% out.println(WeightWidth);%>"  align="right">78%</td>
										<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
										<td width="7%"  align="right">68.00</td>			<td width="7%" align="right">9.00</td>		
										<td width="7%" align="center"><span class="targetFinancialNode-2" title="7%">50,7,60,40,20</span></td>		
										<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
										<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
										<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
								</tr>
			
					<tr id="FinancialNode-F1-1-1-4" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Average%20check'" +",'ifrmgr1')"); %> >
								Average check</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Average check" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">90%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">90%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">162.00</td>		<td width="7%" align="right">159.00</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="45%">50,45,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-1-1-5" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Ticket%20Count'" +",'ifrmgr1')"); %> >
								Ticket Count</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Ticket Count" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">94%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">94%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">1.68</td>			<td width="7%" align="right">1.70</td>		
								<td width="7%"  align="center"><span class="targetFinancialNode-2" title="47%">50,47,60,40,20</span></td>	
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-1-1-6" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Seat-turn'" +",'ifrmgr1')"); %> >
								Seat-turn</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Seat-turn" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">2.00</td>			<td width="7%" align="right">1.70</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="42%">50,42,60,40,20</span></td>		
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-1-1-7" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Campaign%20sales(Bath)'" +",'ifrmgr1')"); %> >
								Campaign sales(Bath)</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Campaign sales(Bath)" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">37%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">37%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">248.80</td>		<td width="7%" align="right">92.80</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="18%">50,18,60,40,20</span></td>		
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-1-1-8" class="child-of-FinancialNode-F1-1-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "SKU%20rationalization%20(Percent%20completion)'" +",'ifrmgr1')"); %> >
								SKU rationalization (% completion)</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=SKU rationalization (percent completion)" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">24%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">24%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">325.00</td>			<td width="7%" align="right">79.00</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="12%">50,12,60,40,20</span></td>	
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>

			<tr id="FinancialNode-F1-1-2" class="child-of-FinancialNode-F1-1">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Trading'" +",'ifrmgr1')"); %> >
				Sale growth(%) : Trading</a>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Sale growth : Trading" rel="facebox"> 
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">96%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">96%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">18.80</td>			<td width="7%" align="right">18.60</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="48%">50,48,60,40,20</span></td>		
				<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
			<tr id="FinancialNode-F1-1-3" class="child-of-FinancialNode-F1-1">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Specialty'" +",'ifrmgr1')"); %> >
				Sale growth(%) : Specialty</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Sale growth : Specialty" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">25%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">25%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">10.90</td>		<td width="7%" align="right">21.90</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="25%">50,25,60,40,20</span></td>		
				<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
			<tr id="FinancialNode-F1-1-4" class="child-of-FinancialNode-F1-1">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Global'" +",'ifrmgr1')"); %> >
				Sale growth(%) : Global	</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Sale growth : Global" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>
				<td width="7%"  align="right">100.00</td>		<td width="7%" align="right">85.00</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="42%">50,42,60,40,20</span></td>		
				<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
			<tr id="FinancialNode-F1-1-5" class="child-of-FinancialNode-F1-1">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Brand%20equity%20and%20Brand%20awareness'" +",'ifrmgr1')"); %> >
				Brand equity & Brand awareness	</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Brand equity and Brand awareness" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">N/A</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">N/A</td>
				<td width="<% out.println(FreqWidth); %>" align="right">Y</td>		
				<td width="7%"  align="right">N/A</td>		<td width="7%" align="right">N/A</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="45%">50,45,60,40,20</span></td>		
				<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
<!-- --------------------------------- Stores Contribution --------------------------------- -->
			<tr id="FinancialNode-F1-2" height="5">
				<td width="<% out.println(KPIWidth); %>" style="padding-left: 20px;" >
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Overall'" +",'ifrmgr1')"); %> >
				Stores Contribution : Overall </a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Stores Contribution : Overall" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">75%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">75%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">14.45</td>		<td width="7%" align="right">10.89</td>		
				<td width="7%"	align="center"><span class="targetFinancialNode-1" title="38%">50,38,60,40,20</span></td>		
				<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>

			<tr id="FinancialNode-F1-2-1" class="child-of-FinancialNode-F1-2" > 
				<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "SnP%20Restaurant%20n%20Bakery'" +",'ifrmgr1')"); %> >
				Stores Contribution : S&P Restaurant & Bakery</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Stores Contribution : SnP Restaurant and Bakery" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">65%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">65%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>	
				<td width="7%"  align="right">14.50</td>		<td width="7%" align="right">9.50</td>		
				<td width="7%" align="center" ><span class="targetFinancialNode-2" title="27%">50,27,60,40,20</span></td>	
				<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>

			<tr id="FinancialNode-F1-2-1-1" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Same%20Store'" +",'ifrmgr1')"); %> >
								Stores Contribution : Same Store</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Stores Contribution : Same Store" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">44%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">44%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">10.50</td>		<td width="7%" align="right">4.60</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="21.9%">50,21.9,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-2-1-2" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20outlets'" +",'ifrmgr1')"); %> >
								Stores Contribution : New outlets</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Stores Contribution : New outlets" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">87%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">87%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">9.80</td>		<td width="7%" align="right">8.60</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="43%">50,43,60,40,20</span></td>		
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
								<tr id="FinancialNode-F1-2-1-1-1" class="child-of-FinancialNode-F1-2-1-2">
										<td width="<% out.println(KPIWidth); %>">
										<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20store%20successful%20rate'" +",'ifrmgr1')"); %> >
										New store successful rate</a></td>
										
										<td width="<% out.println(InfoWidth);%>"  align="right">
										<a href="bscKPIDetail.jsp?head=New store successful rate" rel="facebox"> 
										<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
										</td>

										<td width="<% out.println(WeightWidth);%>"  align="right">53%</td>			
										<td width="<% out.println(WeightWidth);%>"  align="right">53%</td>
										<td width="<% out.println(FreqWidth); %>" align="right">M</td>
										<td width="7%"  align="right">36.00</td>		<td width="7%" align="right">19.00</td>		
										<td width="7%" align="center"><span class="targetFinancialNode-2" title="26%">50,26,60,40,20</span></td>	
										<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
										<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
										<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
								</tr>
					<tr id="FinancialNode-F1-2-1-3" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>" style="text-indent:-5px">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "New%20products'" +",'ifrmgr1')"); %> >
								Stores Contribution : New products</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Stores Contribution : New products" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">86%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">86%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">5.00</td>			<td width="7%" align="right">5.80</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="43%">50,43,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>		
								<tr id="FinancialNode-F1-2-1-3-1" class="child-of-FinancialNode-F1-2-1-3">
										<td width="<% out.println(KPIWidth); %>">
										<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "NPD%20successful%20rate'" +",'ifrmgr1')"); %> >
										NPD successful rate</a></td>

										<td width="<% out.println(InfoWidth);%>"  align="right">
										<a href="bscKPIDetail.jsp?head=NPD successful rate" rel="facebox">
										<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
										</td>

										<td width="<% out.println(WeightWidth);%>"  align="right">78%</td>
										<td width="<% out.println(WeightWidth);%>"  align="right">78%</td>
										<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
										<td width="7%"  align="right">68.00</td>			<td width="7%" align="right">9.00</td>		
										<td width="7%" align="center"><span class="targetFinancialNode-2" title="7%">50,7,60,40,20</span></td>		
										<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
										<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
										<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
								</tr>
			
					<tr id="FinancialNode-F1-2-1-4" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Average%20check'" +",'ifrmgr1')"); %> >
								Average check</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Average check" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">90%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">90%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">162.00</td>		<td width="7%" align="right">159.00</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="45%">50,45,60,40,20</span></td>	
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-2-1-5" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Ticket%20Count'" +",'ifrmgr1')"); %> >
								Ticket Count</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Ticket Count" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">94%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">94%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">1.68</td>			<td width="7%" align="right">1.70</td>		
								<td width="7%"  align="center"><span class="targetFinancialNode-2" title="47%">50,47,60,40,20</span></td>	
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-2-1-6" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Seat-turn'" +",'ifrmgr1')"); %> >
								Seat-turn</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Seat-turn" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">2.00</td>			<td width="7%" align="right">1.70</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="42%">50,42,60,40,20</span></td>		
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-2-1-7" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Campaign%20sales(Bath)'" +",'ifrmgr1')"); %> >
								Campaign sales(Bath)</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=Campaign sales(Bath)" rel="facebox">
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">37%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">37%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">248.80</td>		<td width="7%" align="right">92.80</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="18%">50,18,60,40,20</span></td>		
								<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
					</tr>
					<tr id="FinancialNode-F1-2-1-8" class="child-of-FinancialNode-F1-2-1">
								<td width="<% out.println(KPIWidth); %>">
								<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "SKU%20rationalization%20(Percent%20completion)'" +",'ifrmgr1')"); %> >
								SKU rationalization (% completion)</a></td>

								<td width="<% out.println(InfoWidth);%>"  align="right">
								<a href="bscKPIDetail.jsp?head=SKU rationalization (percent completion)" rel="facebox"> 
								<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
								</td>

								<td width="<% out.println(WeightWidth);%>"  align="right">24%</td>
								<td width="<% out.println(WeightWidth);%>"  align="right">24%</td>
								<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
								<td width="7%"  align="right">325.00</td>			<td width="7%" align="right">79.00</td>		
								<td width="7%" align="center"><span class="targetFinancialNode-2" title="12%">50,12,60,40,20</span></td>	
								<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
								<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
								<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
					</tr>

			<tr id="FinancialNode-F1-2-2" class="child-of-FinancialNode-F1-2">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Trading'" +",'ifrmgr1')"); %> >
				Stores Contribution : Trading</a>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Stores Contribution : Trading" rel="facebox"> 
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">96%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">96%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">18.80</td>			<td width="7%" align="right">18.60</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="48%">50,48,60,40,20</span></td>		
				<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
			<tr id="FinancialNode-F1-2-3" class="child-of-FinancialNode-F1-2">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Specialty'" +",'ifrmgr1')"); %> >
				Stores Contribution : Specialty</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Stores Contribution : Specialty" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">25%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">25%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>		
				<td width="7%"  align="right">10.90</td>		<td width="7%" align="right">21.90</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="25%">50,25,60,40,20</span></td>		
				<td width="7%" align="center"><span class="trendFinancialNode-2" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
			<tr id="FinancialNode-F1-2-4" class="child-of-FinancialNode-F1-2">
				<td width="<% out.println(KPIWidth); %>">
				<a href= <% out.println("javascript:loadmetergraph('mixChart.jsp?head="+ "Global'" +",'ifrmgr1')"); %> >
				Stores Contribution : Global	</a></td>

				<td width="<% out.println(InfoWidth);%>"  align="right">
				<a href="bscKPIDetail.jsp?head=Stores Contribution : Global" rel="facebox">
				<img src="<% out.println(SRC); %>" width="<% out.println(ImgWidth); %>" BORDER ="0"/></a>
				</td>

				<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
				<td width="<% out.println(WeightWidth);%>"  align="right">85%</td>
				<td width="<% out.println(FreqWidth); %>" align="right">M</td>
				<td width="7%"  align="right">100.00</td>		<td width="7%" align="right">85.00</td>		
				<td width="7%" align="center"><span class="targetFinancialNode-2" title="42%">50,42,60,40,20</span></td>		
				<td width="7%"  align="center"><span class="trendFinancialNode-1" LineColor="red" ></span></td>
				<td width="3%" align="center"><img src="<%=request.getContextPath()%>/SNPDashBoard_New/score3.jpg"/></td>
				<td width="<% out.println(ETLWidth);%>%" align="right">20/01/2011 00:00:00</td>
			</tr>
					
	</table>






<script type="text/javascript">
// have no effect when call by ajax
// only run for this stand alone page
	//$(document).ready(function()  {

		//$('.targetFinancialNode-1').sparkline('html', {type: 'bullet', TargetColor: 'red' , width:"60px"  } );
		//$('.targetFinancialNode-2').sparkline('html', {type: 'bullet', TargetColor: 'red' , width:"60px"  } );

		//var kvalue = [1,2,3,4,5,6,7,8,9,10,11,12];
        //$('.trendFinancialNode-1').sparkline(kvalue , {barColor: 'red' , }); 
		//var kvalue = [5,9,2,9,3,9,4,9,5,9,6,9,7,9];
		//$('.trendFinancialNode-2').sparkline(kvalue , {barColor: 'red' , }); 

		//$("#FinancialTree").treeTable();
		//$("#FinancialTree2").treeTable();
	  //$('#tree').columnTreeTable();
	});

	</script>

</body>
</html>