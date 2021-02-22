<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/XSL/Format/1.0">

 <xsl:template match="/">
   <HTML>
    <HEAD><TITLE>Locomotive Executive Information System (Locomotive EIS)</TITLE>
	<script language="Javascript">
	
	    function showimage(txtId) 
         {
            if (document.getElementById(txtId).style.display=='none')
               document.getElementById(txtId).style.display='inline';
            else
               document.getElementById(txtId).style.display='none';
         }
         
         function openWindow(url) 
         {                              
           window.open("redirect.htm?url=" +url,"Power_Productivity_Measurement","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=yes,copyhistory=0");       
        }       
     
    </script>
   </HEAD>
   
   <BODY>
   <img src="logo-g.gif" alt="NS logo" align = "left"></img>   
   <br/>
   <br/>
   <br/>
   <h2> Locomotive Executive Information System (Locomotive EIS)</h2>
   <br/>
   <em>
       For application support, please call NSS at 7-529-1527 and ask them to create a ticket
       for the ECOM/APSUP group. For urgent requests, ask NSS to page the eComm PSS on-call 
       support personnel.
   </em>
   <hr/>
   <br/>
   <b><em>Management Reports</em></b>
   <br/>
   <br/>
   <br/>
   <em>Locomotive Reports</em>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/OnlineOffline/TlsMaintLogin
   </xsl:attribute>
   Online Offline Reports
   </a>
   </li>
   </ul>


   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/ieorurl"/>/cgi-bin/eis/FRASearch.pl
   </xsl:attribute>
   FRA Due Report
   </a>
   </li>
   </ul>
   
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/url"/>/OutOfShop/servlet/BFRMreport
   </xsl:attribute>
   Out of Shop Report
   </a>
   </li>
   </ul>
   

   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/Idleloco/IdleSummary
   </xsl:attribute>
   Idle Locomotive Report
   </a>
   </li>
   </ul>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/eis002/PLogin.html
   </xsl:attribute>
   Plugged Train Report
   </a>
   <ul><li><a href="PlugTrainManual.htm">Plug Train Manual</a></li></ul>
   <ul><li><a href="PlugTrainManualNoPics.htm">Plug Train Manual (printable 
   version without pictures) </a></li></ul>
   
   </li>
   </ul>

	<ul><li>
	<a>
	<xsl:attribute name="href">
		javascript:showimage('tyes1');
	</xsl:attribute>
             Assigned Yard/Local Locomotives - Current Location/FRA dates
	</a>
      	
	<div id="tyes1" style="display:none">
         <ul>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/alabama.html">Alabama</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/central.html">Central</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/dearborn.html">Dearborn</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/dbu.html">Delmarva Business Unit</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/ecbu.html">East Carolina Business Unit</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/georgia.html">Georgia</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/harrisburg.html">Harrisburg</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/illinois.html">Illinois</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/lake.html">Lake</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/piedmont.html">Piedmont</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/pittsburgh.html">Pittsburgh</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/pocahontas.html">Pocahontas</a></li>
            <li><a href="disPlay.jsp?FileName=/apps/LocoSpreadWeb/virginia.html">Virginia</a></li>

         </ul>
	</div> 

	</li></ul>

   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/locoCHAR
   </xsl:attribute>
   Locomotive Characteristics Report
   </a>
   </li>
   </ul>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/FRADue/index.html
   </xsl:attribute>
   FRA Due Calendar Report
   </a>
   </li>
   </ul>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/ieorurl"/>:8180/utilDB2/index.html
   </xsl:attribute>
   Utilization Report
   </a>
   </li>
   </ul>

   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/fuelurl"/>
   </xsl:attribute>
   <xsl:attribute name = "onMouseOver">
   status=' ';return true
   </xsl:attribute>   
   Crew Call
   </a>
   </li>
   </ul>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   javascript:openWindow('<xsl:value-of select = "/Report/powerurl"/>');
   </xsl:attribute>
   <xsl:attribute name = "onMouseOver">
   status=' ';return true
   </xsl:attribute>      
   Power Productivity Measurement
   </a>
   </li>
   </ul>
      
   <em>High and Wide Equipment Reports</em>
   
   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CurrentForm.jsp
   </xsl:attribute>
   Currently Moving High and Wide Equipment Report
   </a>
   </li>
   
   <br />
   <br />
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarTripsForm.html
   </xsl:attribute>
   Completed High and Wide Trips of Individual Cars 
   </a>
   </li>
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarTripsTransitForm.html
   </xsl:attribute>
   Completed High and Wide Trips of Individual Cars (With Transit Time constraint)
   </a>
   </li>
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarSummaryForm.jsp
   </xsl:attribute>
   Completed High and Wide Car Trips Summary Report
   </a>
   </li>
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/GraphAvgForm.jsp
   </xsl:attribute>
   Graph of Average Transit Times for the System (Based on completed High and Wide Car Trips)
   </a>
   </li>
   
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/CarSummaryByCustomerForm.jsp
   </xsl:attribute>
   Completed High and Wide Car Trips Summary By Customer
   </a>
   </li>
   
   <br />
   <br />
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/HighWide/ExcludeLogin.jsp
   </xsl:attribute>
   High and Wide Exclusion List- Edit
   </a>
   </li>
   
   </ul>
   
   <b><em>Train Monitoring System</em></b>
   <ul>
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/tmsDB2/index.html
   </xsl:attribute>
   TMS
   </a>
   </li>
   
   <li><a href="TMSManual.htm">TMS User Manual</a></li>
   
   
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/wlurl"/>/tmsDB2/TrainListLogin
   </xsl:attribute>
   TMS Train List Maintenance
   </a>
   </li>
   
   </ul>
   
   <br />
   <b><em>Terminal Locomotive Plans</em></b>
   <ul><li><a href="http://locoeisprod.atldc.nscorp.com/TOP_Plan/top_links.html">
   TOP
   </a></li></ul>


   <ul>
   <li>
   <a>
   <xsl:attribute name = "href">
   <xsl:value-of select = "/Report/tonurl"/>/TRSeg.cgi
   </xsl:attribute>
   Calculate Tonnage Rating for a Route
   </a>
   </li>
   </ul>
   
   
   

   <br />
   <b><em>Current Locomotive Operations Data</em></b>
   <ul><li><a href="yardAssign.html">
   Allocation of Yard Engines to Terminals
   </a>
   <ul><li><a href="divSummary.html"> Division Summary </a></li></ul>
   <ul><li><a href="divtotals.html"> Division Totals </a></li></ul>
   </li></ul>
   <ul><li><a href="yard_crew_assignments.html">Yard and Local Crew Assignments</a></li></ul>
   
   
  </BODY>  
  </HTML>
 </xsl:template>
</xsl:stylesheet>
