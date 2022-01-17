<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LandmarkTechnologies- Home Page</title>
<link href="images/mylandmarklogo.png" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to Landmark Software Solutions, Virginia, USA Office. PRIVATE-WEB-APP.</h1>
 
<!--ISMAILA ADDED CSS STYLE CODE-->
<h2 style="color: blue;">We are developing and supporting quality  Software Solutions to millions of clients.
        We offer  Training for DevOps with Linux and Cloud equipping IT Engineers for best performance.
        We have a Demo class on DEVOPS with Linux and AWS on Saturday Jan 9,2021 at 11am, Devops is good
        JESUS IS LORD.I AM BLESSES.</h2>

<hr>
<br>
  
<!--ISMAILA ADDED CSS STYLE CODE-->

<p style="color: black; font-family:cursive;font-weight:bold;font-size:
12pt">CSS STYLE CODE ADDED BY :: ISMAILA. &#128525;&#128515;&#129321;<br>

<p style="color: red; font-family:cursive;font-weight:bold;font-size:
13pt">Server Side IP Address. <br>

<!--ISMAILA ADDED CSS STYLE CODE-->

<br>

<%
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName());
%>
<br>
<%out.println("Server IP Address :: "+ip);%>

</p>
</h2>

<hr>
<div style="text-align: center;">
        <span>
                <img src="images/mylandmarklogo.png" alt="" width="150">
        </span>
        <span style="font-weight: bold;">
                Landmark Technology,
                Toronto, Ontario, Canada
                +1 437 215 2483,
                mylandmarktech@gmail.com
                <br>
                <a href="mailto:mylandmarktech@gmail.com">Mail to Landmark Technologies</a>
        </span>
</div>
<hr>
        <p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>Landmark Technologies - Consultant, Training and Software Development</p>
<p align=center><small>Copyrights 2021 by <a href="http://mylandmarktech.com/">Landmark Technologies</a> </small></p>

</body>
</html>
