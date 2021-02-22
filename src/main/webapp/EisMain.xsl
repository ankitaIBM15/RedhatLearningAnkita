<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/XSL/Format/1.0">

	<xsl:template match="/">
		<HTML>
			<HEAD>
				<TITLE>Locomotive Executive Information System (Locomotive EIS)</TITLE>
				<link href="styles/Main.css" type="text/css" rel="stylesheet" />
				
				<link type="text/css" rel="stylesheet" href="styles/AnimatedCollapsiblePanel.css" />
				<script language="javascript" type="text/javascript" src="js/AnimatedCollapsiblePanel.js"></script>
				<script type="text/javascript" src="js/eismain.js"></script>
			  <style type="text/css">			  	
				.submenu{display: none;}
			  </style>
				
			</HEAD>

			<BODY bottommargin="0" rightmargin="0" leftmargin="0" topmargin="0"
				onload="goforit();">
				<xsl:variable name="env" select="/Report/env" />
				<xsl:variable  name="envColor" >
					<xsl:choose>
					<xsl:when test="$env='prod'">
						<xsl:value-of select="'#345068'"/> 
					</xsl:when>
					<xsl:otherwise>
							<xsl:value-of select="'red'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<div>
					<table cellspacing="0" cellpadding="0" width="100%">
						<tbody>
							<!-- tr height="38" style="background-image: url(styles/icons/gradient_blue.png);background-repeat: repeat-x;padding: -10px;"-->
							<tr height="38" style="background-color: {$envColor};background-repeat: repeat-x;padding: -10px;">
								<td width="15%" valign="top"
									style="border-bottom: 2px solid rgb(255, 102, 0); " rowspan="2">
									&#160;
									<img src="styles/icons/NSlogo.gif" style="border-style: none;" alt="NS logo" align="left"></img>
								</td>
								<td width="60%" valign="top"
									style="border-bottom: 2px solid rgb(255, 102, 0); font-size: 8pt; color: White; font-family: verdana; text-decoration: none;"
									rowspan="3">
									&#160;
									<h3>Locomotive Executive Information System (Locomotive EIS)</h3>
									<span style="font-size: 8pt; color: White; font-family: verdana; text-decoration: none;">Environment:&#160;<xsl:value-of select = "$env"/></span>
								</td>
								<td width="25%" valign="top"
									style="border-bottom: 2px solid rgb(255, 102, 0); " rowspan="2">
									&#160;
									<span
										style="font-size: 8pt; color: White; font-family: verdana; text-decoration: none;"
										id="clock"></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<em style="font-size: 8pt; color: Black; font-family: verdana; text-decoration: none;">
					&#160;For application support, please call NSS at 7-529-1527 and ask them to
					create a ticket
					for the AppDevA-ENAA group.
				</em>
				<hr />				
									
					<table>
					  <tr>
						<td>
						<div style="width:600px;height:125px;">
						    <div class="squarebox"><div id="first"
						     class="squareboxgradientcaption"
						     style="height:20px; cursor: pointer;"
						     onclick="togglePannelAnimatedStatus(this.nextSibling,50,50)"><div
						         style="float: left"><b>Train Monitoring System</b></div><div
						         style="float: right; vertical-align: middle"><img
						         src="styles/icons/collapse.gif" 
						         width="13" height="14" border="0"
						         alt="Show/Hide" title="Show/Hide" /></div>
						        </div><div class="squareboxcontentsmall">
						            <ul>   
									   <li>
										   <a>
											   <xsl:attribute name = "href">
											   <xsl:value-of select = "/Report/tmsurl"/>/tms/index.html</xsl:attribute>
											   TMS
										   </a>
									   </li>									   
									   <li>
										   	<a href="TMSManual.htm">TMS User Manual
										   	</a>
									   </li>								   
									   <li>
										   <a>
											   <xsl:attribute name = "href">
											   <xsl:value-of select = "/Report/tmsurl"/>/tms/TrainListLogin</xsl:attribute>
											   TMS Train List Maintenance
										   </a>
									   </li>									   
									</ul>
						        </div>
						    </div>
						    <img width="600" height="20" alt="" src="styles/icons/shadow.gif" />
						</div>
						
						<div style="width:600px;height:85px;">
						    <div class="squarebox"><div id="second"
						     class="squareboxgradientcaption"
						     style="height:20px; cursor: pointer;"
						     onclick="togglePannelAnimatedStatus(this.nextSibling,50,50)"><div
						         style="float: left"><b>Tonnage Ratings</b></div><div
						         style="float: right; vertical-align: middle"><img
						         src="styles/icons/collapse.gif" 
						         width="13" height="14" border="0" 
						         alt="Show/Hide" title="Show/Hide" /></div>
						        </div><div class="squareboxcontentsmall" style="height:65px;">
						            <ul>
							            <li>
										   <a>
											   <xsl:attribute name = "href">
											   <xsl:value-of select = "/Report/tonurl"/>/TRSeg.cgi</xsl:attribute>
											   Calculate Tonnage Rating for a Route
										   </a>
										</li>
									 </ul>
						        </div>
						    </div>
						    <img width="600" height="20" alt="" src="styles/icons/shadow.gif" />
						</div>
					
						<div style="width:600px; height:210px;">
						    <div class="squarebox"><div id="third"
						     class="squareboxgradientcaption"
						     style="height:20px; cursor: pointer;"
						     onclick="togglePannelAnimatedStatus(this.nextSibling,50,50)"><div
						         style="float: left"><b>High and Wide Equipment Reports</b></div><div
						         style="float: right; vertical-align: middle"><img
						         src="styles/icons/collapse.gif" 
						         width="13" height="14" border="0" 
						         alt="Show/Hide" title="Show/Hide" /></div>
						        </div><div class="squareboxcontent" style="height:190px;">
									<ul>
										   <li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CurrentForm.jsp</xsl:attribute>
												   Currently Moving High and Wide Equipment Report
											   </a>
										   </li>
										   <li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarTripsForm.html</xsl:attribute>
												   Completed High and Wide Trips of Individual Cars 
											   </a>
										   </li>
										   <li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarTripsTransitForm.html</xsl:attribute>
												   Completed High and Wide Trips of Individual Cars (With Transit Time constraint)
											   </a>
										   </li>
										   <li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarSummaryForm.jsp</xsl:attribute>
												   Completed High and Wide Car Trips Summary Report
											   </a>
											</li>
											<li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/GraphAvgForm.jsp</xsl:attribute>
												   Graph of Average Transit Times for the System (Based on completed High and Wide Car Trips)
											   </a>
											</li>
											<li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarSummaryByCustomerForm.jsp</xsl:attribute>
												   Completed High and Wide Car Trips Summary By Customer
											   </a>
											</li>
											<li>
											   <a>
												   <xsl:attribute name = "href">
												   <xsl:value-of select = "/Report/wlurl"/>/HighWide/ExcludeLogin.jsp</xsl:attribute>
												   High and Wide Exclusion List- Edit
											   </a>
											</li>
										</ul>
						        </div>
						    </div>
						    <img width="600" height="20" alt="" src="styles/icons/shadow.gif" />
						</div>
						<div style="width:600px; height:85px;">
						    <div class="squarebox"><div id="forth"
						     class="squareboxgradientcaption"
						     style="height:20px; cursor: pointer;"
						     onclick="togglePannelAnimatedStatus(this.nextSibling,50,50)"><div
						         style="float: left"><b>Locomotive Reports</b></div><div
						         style="float: right; vertical-align: middle"><img
						         src="styles/icons/collapse.gif" 
						         width="13" height="14" border="0" 
						         alt="Show/Hide" title="Show/Hide" /></div>
						        </div><div class="squareboxcontent" style="height:65px;">
						             <ul>
						               <li>
										   <a>
											   <xsl:attribute name = "href">
											   <xsl:value-of select = "/Report/ieorurl"/>:8180/utilDB2/index.html</xsl:attribute>
											   Utilization Report
										   </a>
									   </li>
									</ul>
									<br/>
								</div>
							</div>
						    <img width="600" height="20" alt="" src="styles/icons/shadow.gif" />
						</div>
					</td>
						
						
						
					  </tr>
					  
					</table>
				
				<!--  -->
				
			</BODY>
		</HTML>
	</xsl:template>
</xsl:stylesheet>
