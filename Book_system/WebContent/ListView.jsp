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

    <style>
table.dataintable {
   border: 1px solid #888888;
   border-collapse: collapse;
   font-family: Arial,Helvetica,sans-serif;
   margin-top: 10px;
   width: 100%;
}
table.dataintable th {
   background-color: #CCCCCC;
   border: 1px solid #888888;
   padding: 5px 15px 5px 5px;
   text-align: left;
   vertical-align: baseline;
}
table.dataintable td {
   background-color: #EFEFEF;
   border: 1px solid #AAAAAA;
   padding: 5px 15px 5px 5px;
   vertical-align: text-top;
}
</style>
    <body>
    	
        <div class="container">
			<header>
				<h1>The List Result</h1>
			</header>
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
				
				<table class = "dataintable"width="50%" border="1" align="center">
				<script>
				var array0 = new Array();
				var array1 = new Array();
				var array2 = new Array();
				var array3 = new Array();
				var array4 = new Array();
					<c:forEach items="${student_checked}" var="temp">   
					array0.push("${temp[0]}");
					array1.push("${temp[1]}");
					array2.push("${temp[2]}");
					array3.push("${temp[3]}");
					array4.push("${temp[4]}");
					</c:forEach>
					var size="${student_checked.size()}";
					if(size > 0){
					for(var i=-1;i<size;i++){
						if(i == -1){
							document.write("<tr>");
							document.write("<th>UserId</th>");
							document.write("<th>Id</th>");
							document.write("<th>Name</th>");
							document.write("<th>Borrow_Date</th>");
							document.write("<th>Due_Date</th>");
							document.write("</tr>");
						}
						else{		
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array3[i]+"</td>");
								document.write("<td>"+array4[i]+"</td>");
								document.write("</tr>");
						}
							}
					}
					</script>
					</table>
				
				<table class = "dataintable"width="50%" border="1" align="center">
				<script>
				var array0 = new Array();
				var array1 = new Array();
				var array2 = new Array();
				var array4 = new Array();
					<c:forEach items="${user}" var="temp">   
					array0.push("${temp[0]}");
					array1.push("${temp[1]}");
					array2.push("${temp[2]}");
					array4.push("${temp[4]}");
					</c:forEach>
					var size="${user.size()}";
					for(var i=0;i<size;i++){
						if(i == 0){
							document.write("<tr>");
							document.write("<th>"+array0[i]+"</th>");
							document.write("<th>"+array1[i]+"</th>");
							document.write("<th>"+array2[i]+"</th>");
							document.write("<th>"+array4[i]+"</th>");
							document.write("</tr>");
						}
						else{		
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array4[i]+"</td>");
								document.write("</tr>");
						}
							}

					</script>
					</table>
				<table class = "dataintable"width="50%" border="1" align="center">
				<script>
				var array0 = new Array();
				var array1 = new Array();
				var array2 = new Array();
				var array4 = new Array();
					<c:forEach items="${student}" var="temp">   
					array0.push("${temp[0]}");
					array1.push("${temp[1]}");
					array2.push("${temp[2]}");
					array4.push("${temp[4]}");
					</c:forEach>
					var size="${student.size()}";
					for(var i=0;i<size;i++){
						if(i == 0){
							document.write("<tr>");
							document.write("<th>"+array0[i]+"</th>");
							document.write("<th>"+array1[i]+"</th>");
							document.write("<th>"+array2[i]+"</th>");
							document.write("<th>"+array4[i]+"</th>");
							document.write("</tr>");
						}
						else{		
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array4[i]+"</td>");
								document.write("</tr>");
						}
							}

					</script>
					</table>
				<table class = "dataintable"width="50%" border="1" align="center">
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
						if(i == 0){
							document.write("<tr>");
							document.write("<th>"+array0[i]+"</th>");
							document.write("<th>"+array1[i]+"</th>");
							document.write("<th>"+array2[i]+"</th>");
							document.write("<th>"+array3[i]+"</th>");
							document.write("</tr>");
						}
						else{		
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array3[i]+"</td>");
								document.write("</tr>");
						}
							}

					</script>
					</table>
				<table class = "dataintable"width="50%" border="1" align="center">
				<script>
				var array0 = new Array();
				var array1 = new Array();
				var array2 = new Array();
				var array3 = new Array();
				var array4 = new Array();
				var array5 = new Array();
					<c:forEach items="${bookclass}" var="temp">   
					array0.push("${temp[0]}");
					array1.push("${temp[1]}");
					array2.push("${temp[2]}");
					array3.push("${temp[3]}");
					array4.push("${temp[4]}");
					array5.push("${temp[5]}");
					</c:forEach>
					var size="${bookclass.size()}";
					for(var i=0;i<size;i++){
						if(i == 0){
							document.write("<tr>");
							document.write("<th>"+array0[i]+"</th>");
							document.write("<th>"+array1[i]+"</th>");
							document.write("<th>"+array2[i]+"</th>");
							document.write("<th>"+array3[i]+"</th>");
							document.write("<th>"+array4[i]+"</th>");
							document.write("<th>"+array5[i]+"</th>");
							document.write("</tr>");
						}
						else{		
								document.write("<tr>");
								document.write("<td>"+array0[i]+"</td>");
								document.write("<td>"+array1[i]+"</td>");
								document.write("<td>"+array2[i]+"</td>");
								document.write("<td>"+array3[i]+"</td>");
								document.write("<td>"+array4[i]+"</td>");
								document.write("<td>"+array5[i]+"</td>");
								document.write("</tr>");
							}
					}

					</script>
					</table>
			<a href="javascript:history.back(-1)" style="text-decoration:none;color:black;"><button style="width:100px;height:30px;">Back</button></a>
		    <a href="login.jsp" style="text-decoration:none;color:black;"><button style="width:100px;height:30px;">Logout</button></a>	
				</body>
				</html>