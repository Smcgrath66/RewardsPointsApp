<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report</title>
</head>
<body>
<h1 align=center><font color="#15cf22">Monthly Reward Points Report</font></h1>
<table border=1 align=center>
<tr><th><font color="000000" size=5>Customer ID</font></th>
<th><font color="000000" size=5>Month</font></th>
<th><font color="000000" size=5>Rewards Points</font></th>
</tr>

<c:forEach items="${customerRewardsReport}" var="report">
<tr>
<td><center><font color="#4863A0" size=4>${report[0]}</font></center></td>
<td><center><font color="#4863A0" size=4>${report[1]}</font></center></td>
<td><center><font color="#4863A0" size=4>${report[2]}</font></center></td>
</tr>
</c:forEach>
</table>
<br/>
<br/>
<br/>
<h1 align=center><font color="#15cf22">Total Reward Points Report</font></h1>
<table border=1 align=center>
<tr><th><font color="000000" size=5>Customer ID</font></th>
<th><font color="000000" size=5>Total Rewards Points</font></th>
</tr>
<c:forEach items="${totalRewardsPoints}" var="totalRewards">
<tr>
<td><center><font color="#4863A0" size=4>${totalRewards[0]}</font></center></td>
<td><center><font color="#4863A0" size=4>${totalRewards[1]}</font></center></td>
</tr>
</c:forEach>
</table>
<a href="index.html">Home Page</a><br/><br/>
</body>
</html>