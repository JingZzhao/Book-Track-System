<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>

    	<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>Filter Functionality with CSS3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Filter Functionality with CSS3" />
        <meta name="keywords" content="filter, css3, portfolio, functionality" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/style3.css" />
		<script type="text/javascript" src="assets/js/modernizr.custom.29473.js"></script>
    </head>
	
    <body>
    	
        <div class="container">
			<header>
				<h1>The Student MainPage</h1>
			</header>
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
				<div id = "info" style="font-family:Arial">
				
				<table width="50%" border="1" align="center">
				<script>
				var array0 = new Array();
				var array1 = new Array();
				var array2 = new Array();
				var array3 = new Array();
					<c:forEach items="${book}" var="temp">   
					array0.push("${temp[0]}");
					array1.push("${temp[1]}");
					array2.push("${temp[2]}");
					array3.push("${temp[3]}");
					</c:forEach>
					var size="${book.size()}";
					for(var i=0;i<size;i++){
						var num=i+1;
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array3[i]+"</td>");
								document.write("</tr>");
							}

					</script>
					</table>
				
		    <a href="login.jsp" style="text-decoration:none;color:black;"><button>Logout</button></a>	
				</body>
				</html>