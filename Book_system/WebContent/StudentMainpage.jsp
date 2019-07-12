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
        }
    	function modify_back() {  
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "";      
    }
	    function delcfm() { 
	        if (!confirm("Are You Sure to Modify ??")) { 
	            window.event.returnValue = false; 
	        } 
	    } 
	    function Juge(myform){
	    	if (myform.userId.value==""||myform.Id.value==""||myform.fatherName.value==""||myform.fatherTel.value==""||myform.motherName.value==""||myform.motherTel.value==""){
	    		alert("Please Complete All Blanks !!");
	    		myform.fatherName.focus();
	    		return false;
	    	}
	    	 alert("Successfful!!");
	    }
	</script>
    <body>
    	
        <div class="container">
				<h1>The Student MainPage</h1>
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
				<center id = "info" style="font-family:Arial">
				<table class = "company"width="50%" border="1" align="center">
			    <tr>
			        <th>Personal Info</th>
			    </tr>
			    <tr>
			        <th>UserID:</th>
			        <td>${studentPage.getUserId()}</td>
			    </tr>
			    <tr>
			        <th>ID:</th>
			        <td>${studentPage.getId()}</td>
			    </tr>
			    <tr>
			        <th>Name:</th>
			        <td>${studentPage.getName()}</td>
			    </tr>
			    <tr>
			        <th>Type:</th>
			        <td>${studentPage.getType()}</td>
			    </tr>
			    <tr>
			        <th>State:</th>
			        <td>${studentPage.getState()}</td>
			    </tr>
			    <tr>
			        <th>Due:</th>
			        <td>${studentPage.getAmountDue()}</td>
			    </tr>
			    <tr>
			        <th>FatherName:</th>
			        <td>${studentPage.getFatherName()}</td>
			    </tr>
			    <tr>
			        <th>FatherTel:</th>
			        <td>${studentPage.getFatherTel()}</td>
			    </tr>
			    <tr>
			        <th>MontherName:</th>
			        <td>${studentPage.getMotherName()}</td>
			    </tr>
			    <tr>
			        <th>MontherTel:</th>
			        <td>${studentPage.getMotherTel()}</td>
			    </tr>
   			</table>
   			<button type="button" onClick ="modify()" style="width:100px;height:30px;">Modify</button><br>
		    <a href="login.jsp" style="text-decoration:none;color:black;"><button style="width:100px;height:30px;">Logout</button></a>	
			</center>		
				<center id="modify" style ="display:none">
		            <h1 style="font-family:Arial">Information Modification</h1>
		            <form action="modifyStudentAccount.do" method="post" onsubmit="return Juge(this)">
		                <input type="text" name="userId" class="userId" value = "${studentPage.getUserId()}"placeholder="${studentPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${studentPage.getId()}" placeholder="${studentPage.getId()}"style="display:none;">
		                <input type="text" name="fatherName" class="fatherName" placeholder="FatherName"><br>
		                <input type="text" name="fatherTel" class="fatherTel" placeholder="FatherTel"><br>
		                <input type="text" name="motherName" class="motherName" placeholder="MotherName"><br>
		                <input type="text" name="motherTel" class="motherTel" placeholder="MotherTel"><br>
		                <button type="submit" class="submit_button" onClick ="delcfm()" style="width:200px;height:30px;">Modify</button><br>
		            </form>
		            <button onClick = "modify_back()" style="width:200px;height:30px;">Back</button></a>             
		            
        		</center>
				</body>
				</html>