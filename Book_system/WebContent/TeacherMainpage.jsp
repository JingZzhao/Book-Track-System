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
<style>
    
table.company{
    width: 500px;
    margin: 0 auto;
    border-collapse: separate;
    border-spacing: 0px 15px;
    font-size: 12px;
}
 
table.company th,
table.company td {
    padding: 10px;
}
 
table.company th {
    background: #295890;
    vertical-align: middle;
    text-align: left;
    width: 100px;
    overflow: visible;
    position: relative;
    color: #fff;
    font-weight: normal;
    font-size: 15px;
}
 
table.company th:after {
    left: 100%;
    top: 50%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-color: rgba(136, 183, 213, 0);
    border-left-color: #295890;
    border-width: 10px;
    margin-top: -10px;
}

@-moz-document url-prefix() { 
    table.company th::after {
        float: right;
        padding: 0;
        left: 30px;
        top: 10px;
        content: " ";
        height: 0;
        width: 0;
        position: relative;
        pointer-events: none;
        border: 10px solid transparent;
        border-left: #295890 10px solid;
        margin-top: -10px;
    }
}

table.company td {
    background: #f8f8f8;
    width: 360px;
    padding-left: 20px;
}
input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }
</style>
	<script>
    	function modify() {  
    		    document.getElementById("modify").style.display = "";   
    		    document.getElementById("info").style.display = "none";  
    		    document.getElementById("checkout").style.display = "none";      

        }
    	function modify_back() {  
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "";
		    document.getElementById("checkout").style.display = "none";      
		    document.getElementById("checkout_back").style.display = "none";      
	
   	 	}
    	function modify_checkout() {  
		    document.getElementById("info").style.display = "none";      
		    document.getElementById("checkout").style.display = "";
		    document.getElementById("checkout_back").style.display = "";
   	 }
    	
	    function delcfm() { 
	        if (!confirm("Are You Sure to Modify ??")) { 
	            window.event.returnValue = false; 
	        } 
	    } 
	    function Juge(myform){
	    	if (myform.userId.value==""||myform.Id.value==""||myform.staffPhone.value==""){
	    		alert("Please Complete All Blanks !!");
	    		myform.staffPhone.focus();
	    		return false;
	    	}
	    	 alert("Successfful!!");
	    }
	    function Juge2(myform){
	    	var checked = document.getElementsByName('SGN');   
	    	var temp_sex = false;   
	    	for(var i = 0; i < checked.length; i ++){   
		    	if(checked[i].checked){   
		    		temp_sex = true;   
		    		break;   
		    	}   
	    	}
	    	if(temp_sex == false){   
	    		alert('Please Choose to Checkout!');  
		    	return false; 
	    	}
	    	if(myform.studentUserId.value =="-1"){
	    		alert('Please Choose UserId!');
	    		return false;
	    	}
	    	alert("Successfful!!");
	    }
	</script>
    <body>
    	
        <div class="container">
			<center>
				<h1 style="text-align:center;clear:both;">The Teacher MainPage</h1>
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
				<center id = "info" style="font-family:Arial">
				<table  class = "company" width="50%" border="1" align="center">
			    <tr>
			        <th>Personal Info</th>
			    </tr>
			    <tr>
			        <th>UserID:</th>
			        <td>${teacherPage.getUserId()}</td>
			    </tr>
			    <tr>
			        <th>ID:</th>
			        <td>${teacherPage.getId()}</td>
			    </tr>
			    <tr>
			        <th>Name:</th>
			        <td>${teacherPage.getName()}</td>
			    </tr>
			    <tr>
			        <th>Type:</th>
			        <td>${teacherPage.getType()}</td>
			    </tr>
			    <tr>
			        <th>Phone:</th>
			        <td>${teacherPage.getTeacherPhone()}</td>
			    </tr>
   			</table>
   			<button type="button" onClick ="modify()" style="width:200px;height:30px;">Modify</button><br>
   			<button type="button" onClick ="modify_checkout()" style="width:200px;height:30px;">Checkout</button><br>
		    <a href="login.jsp" style="text-decoration:none;color:black;"><button style="width:200px;height:30px;">Logout</button></a>	
			</center>		
				<center id="modify" style ="display:none">
		            <h1 style="font-family:Arial">Information Modification</h1>
		            <form action="modifyTeacherAccount.do" method="post" onsubmit="return Juge(this)">
		                <input type="text" name="userId" class="userId" value = "${teacherPage.getUserId()}"placeholder="${teacherPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${teacherPage.getId()}" placeholder="${teacherPage.getId()}"style="display:none;">
		                <input type="text" name="staffPhone" class="staffPhone" placeholder="Phone"><br>
		                <button type="submit" class="submit_button" onClick ="delcfm()" style="width:200px;height:30px;">Modify</button><br>
		            </form>
		     			<button onClick = "modify_back()" style="width:200px;height:30px;">Back</button>           

        		</center>
        		
        	<center id = "checkout" style="display:none">
       		<form action="teacherCheckOutBook.do" method="post" onsubmit="return Juge2(this)">
       				<input type="text" name="userId" class="userId" value = "${teacherPage.getUserId()}"placeholder="${teacherPage.getUserId()}" style="display:none;">
		            <input type="text" name="Id" class="Id" value ="${teacherPage.getId()}" placeholder="${teacherPage.getId()}"style="display:none;">
					<script>
					var array4 = new Array();
					<c:forEach items="${staffPageStudentInfo}" var="temp">   
					array4.push("${temp}");
					</c:forEach>
					var size_2 ="${staffPageStudentInfo.size()}";					
					document.write("<select  name='studentUserId' style='width:200px;height:30px;'>");
					document.write('<option value ="-1" selected>Please Choose UserId....</option>');
					for(var j = 0; j< size_2; j++){
							document.write('<option value ="'+array4[j]+'">'+array4[j]+'</option>');
					}
					document.write("</select>");
					</script>
					<table class= "company"width="50%" border="1" align="center">
					<tr>
						<td>ISBN</td>
						<td>SGN</td>
						<td>BOOK_NAME</td>
						<td>BOOK_STATE</td>
						<td>SELECT_TO_CHECKOUT</td>
						
					</tr>
					<script>
					var array0 = new Array();
					var array1 = new Array();
					var array2 = new Array();
					var array3 = new Array();
						<c:forEach items="${teacherPageCheckOutInfo}" var="temp">   
						array0.push("${temp[0]}");
						array1.push("${temp[1]}");
						array2.push("${temp[2]}");
						array3.push("${temp[3]}");
						</c:forEach>
						var size="${teacherPageCheckOutInfo.size()}";
						for(var i=0;i<size;i++){
									document.write("<tr>");
									document.write("<td>"+array0[i]+"</td>");
									document.write("<td>"+array1[i]+"</td>");
									document.write("<td>"+array2[i]+"</td>");
									document.write("<td>"+array3[i]+"</td>");
									document.write("<td><input type ='radio' name='SGN' value ="+array1[i]+"></td>");
									document.write("</tr>");

								}
	
						</script>
					</table>
					<button type="submit" value="Checkout" onClick="delcfm3()"style="width:200px;height:30px;">Checkout</button>
					
				</form>
				</center>
	     			<button id="checkout_back" onClick = "modify_back()" style="display:none;width: 200px; height:30px">Back</button>           
	
				</body>
				</html>