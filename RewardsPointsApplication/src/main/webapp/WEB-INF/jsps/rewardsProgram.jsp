<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
<script src=https://code.jquery.com/jquery-1.12.4.js></script>
<script src=https://code.jquery.com/ui/1.12.1/jquery-ui.js></script>
<script>
$(function() {
	var $j = jQuery.noConflict();
    $j("#transactionDate").datepicker({
        dateFormat: 'yy-mm-dd',
		showOn: "button",
         buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
         buttonImageOnly: true,
         buttonText: "Select date",
         minDate: new Date(2015, 1 - 1, 1),
         maxDate: 0,
         showButtonPanel: true
	});
});
</script>
<script>
 function checkValues() {
	var $j = jQuery.noConflict();
	if($j('#customerId').val() == '' || 
	   $j('#transactionAmount').val() == '' || 
	   $j('#transactionDate').val() == '' ) {
		 alert("All fields must be filled in.");
		 return false;
	} else {
		$j('#calcRewards').submit();
		}
}
</script>
<script>
$(function() {
	var $j = jQuery.noConflict();
	$j('#customerId').on('blur', function(){
		if(this.value == '') {
			$j('#customerId').css('background-color', 'red');
			$j('#customerId').focus();
		}
		else{
			$j('#customerId').css('background-color', 'white');
		}
	});
});
</script>
<script>
$(function() {
	var $j = jQuery.noConflict();	
	$j('#transactionAmount').on('blur', function(){
			if(this.value == '') {
				$j('#transactionAmount').css('background-color', 'red');
				$j('#transactionAmount').focus();
			}
			else{
				$j('#transactionAmount').css('background-color', 'white');
			}
		});	
});
</script>
<script>
$(function() {
	var $j = jQuery.noConflict();
	$j('#calcRewards').ready(function(){
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1; //Month starts with 0 have to add 1
		var year = date.getYear() + 1900; // Have to add 1900 to get the right year

		if ( month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		var today = year + "-" + month + "-" + day;
		$j('#transactionDate').attr("value", today);
		});
});
</script>
<title>Rewards program:</title>
</head>
<body>
<h2><font color="#15cf22">Rewards Calculation</font></h2>
<form id="calcRewards" action="calculateRewards" method="post">
<p>* indicates required fields</p>
Customer ID*: <input type="text" id="customerId" name="customerId" />
Transaction Amount*: <input type="text" id="transactionAmount" name="transactionAmount"/>
Transaction Date*: <input type="text" name="transactionDate" id="transactionDate"/>
<br/><br/>
<p>Please enter all required values then click "Save"</p>
<input type="button" size=15 value="Save" id="submitButton" onclick="checkValues()"/>
</form>
<br/></br><a href="index.html">Home Page</a>
</body>
</html>