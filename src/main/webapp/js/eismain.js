var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function getthedate(){
	    var mydate=new Date();
	    var year=mydate.getFullYear();
	    /*if (year > 1000)
	        year+=1900;*/
	    var day=mydate.getDay();
	    var month=mydate.getMonth();
	    var daym=mydate.getDate();
	    if (daym<10)
	        daym="0"+daym;
	    var hours=mydate.getHours();
	    var minutes=mydate.getMinutes();
	    var seconds=mydate.getSeconds();
	    var dn="AM";
	    if (hours>=12)
	        dn="PM";
	    if (hours>12){
	        hours=hours-12;
	    }
	    if (hours==0)
	        hours=12;
	    if (minutes<=9)
	        minutes="0"+minutes;
	    if (seconds<=9)
	    seconds="0"+seconds;
	    var cdate=""+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+" "+hours+":"+minutes+":"+seconds+" "+dn;
	    if (document.all)
	        document.all.clock.innerHTML=cdate;
	    else if (document.getElementById)
	        document.getElementById("clock").innerHTML=cdate;
	    else
	        document.write(cdate);
	}

	function goforit(){
	    if (document.all||document.getElementById)
	        setInterval("getthedate()",1000);
	    //initializeSpan();
	}

	function SwitchMenu(obj) {
		if (document.getElementById) {
			var el = document.getElementById(obj);
			var ar = document.getElementById("masterdiv").getElementsByTagName(
					"span");
			if (el.style.display != "block") { 
				for ( var i = 0; i < ar.length; i++) {
					if (ar[i].className == "submenu") 
						ar[i].style.display = "none";
				}
				el.style.display = "block";
			} else {
				el.style.display = "none";
			}
		}
	}
	
	function initializeSpan()
	{
		var ar = document.getElementById("menu").getElementsByTagName("a");
		for ( var i = 0; i < ar.length; i++) {
			ar[i].className = 'nonActiveVid';
				
		}
	}
	
	function showimage(txtId)
	{
	if (document.getElementById(txtId).style.display=='none')
	document.getElementById(txtId).style.display='inline';
	else
	document.getElementById(txtId).style.display='none';
	}

	function openWindow(url)
	{
	window.open("redirect.htm?url="
	+url,"Power_Productivity_Measurement","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=yes,copyhistory=0");
	} 