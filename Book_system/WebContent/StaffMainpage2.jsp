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
        <meta http-equiv="Content-Type" content="text/html; charset=GB18030" >
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="assets/css/style_select.css" />
		<script src="assets/js/modernizr.custom.63321.js"></script>
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
/* firefox */
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
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		    document.getElementById("button").style.display = "none";

     	}
    	function back() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		    document.getElementById("button").style.display = "";
 	}
    	function refill() {  
 		   	document.getElementById("refill").style.display = "";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		   document.getElementById("button").style.display = "none";
 		}
    	function List() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "";
 		   document.getElementById("button").style.display = "none";
 		}
    	function checkout() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "";
 		    document.getElementById("list").style.display = "none";
 		   	document.getElementById("button").style.display = "none";
 		}
	    function delcfm() { 
	        if (!confirm("Are You Sure to Modify ??")) { 
	            window.event.returnValue = false; 
	        } 
	    } 
	    function delcfm2() { 
	        if (!confirm("Are You Sure to PostBill ??")) { 
	            window.event.returnValue = false; 
	        } 
	    } 
	    function delcfm3() { 
	        if (!confirm("Are You Sure to Checkout ??")) { 
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
	    	alert("Successfful!!");
	    }
	    function Juge3(myform){
	    	if (myform.listtype.value=="-1"){
	    		alert("Please Choose One to List!");
	    		return false;
	    	}
	    	 alert("Successfful!!");
	    }
	    function Juge4(myform){
	    	if (myform.ISBN.value==""||myform.name.value==""||myform.schoolGenerateNumber.value==""){
	    		alert("Please Complete All Blanks !!");
	    		myform.ISBN.focus();
	    		return false;
	    	}
	    	 alert("Successfful!!");
	    }
	</script>
    <body>
    	
        <div class="container">
			<header class = "clearfix">
				<h1>The Staff MainPage</h1>
				<a href="login.jsp" style="text-decoration:none;color:black;"><button style="width:100px;height:30px;">Logout</button></a>	
				
			</header>
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
			<div id = "info" style="font-family:Arial">
				<table class= "company"width="50%" border="1" align="center">
			    <tr>
			        <th>Personal Info</th>
			    </tr><tr>
			        <th>UserID:</th>
			        <td>${staffPage.getUserId()}</td>
			    </tr>
			    <tr>
			        <th>ID:</th>
			        <td>${staffPage.getId()}</td>
			    </tr>
			    <tr>
			        <th>Name:</th>
			        <td>${staffPage.getName()}</td>
			    </tr>
			    <tr>
			        <th>Type:</th>
			        <td>${staffPage.getType()}</td>
			    </tr>
			    <tr>
			        <th>Phone:</th>
			        <td>${staffPage.getStaffPhone()}</td>
			    </tr>
   			</table>
   			</div>
   			
   			
   			<div id="button">
	   			<button type="button" onClick ="modify()" style="width:100px;height:30px;">Modify</button><br>
	   			<button type="button" onClick ="refill()"style="width:100px;height:30px;">RefillBook</button><br>
			    <form action="postBill.do" method="post">
			    		<input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
			    		<button type="submit" class="submit_button" onClick ="delcfm2()"style="width:100px;height:30px;">PostBill</button><br>
			    </form>   			
			    <button type="button" onClick ="List()"style="width:100px;height:30px;">List</button><br>
			    <button type="button" onClick ="checkout()"style="width:100px;height:30px;">Checkout</button><br>
   			</div>
   			
					
				
				<div id="modify" style ="display:none">
		            <h1 style="font-family:Arial">Information Modification</h1>
		            <form action="modifyStaffAccount.do" method="post" onsubmit="return Juge(this)">
		                <input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
		                <input type="text" name="staffPhone" class="staffPhone" placeholder="Phone"><br>
		                <button type="submit" class="submit_button" onClick ="delcfm()" style="width:100px;height:30px;">Modify</button><br>
		            </form>
   		     		<button onClick="back()" style="width:100px;height:30px;">Back</button></a>             
        		</div>
        		
       		<div id="refill" style="display:none">
	            <h1 style="font-family:Arial">REFILL BOOK</h1>
	            <form action="refillBook.do" method="post" onsubmit="return Juge4(this)">
	            <input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
	                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
	                <input type="text" name="ISBN" class="ISBN" placeholder="ISBN"><br>
	                <input type="text" name="name" class="name" placeholder="Name"><br>
	                <input type="text" name="schoolGenerateNumber" class="schoolGenerateNumber" placeholder="schoolGenerateNumber"><br>
	                <button type="submit" class="submit_button" onClick ="delcfm()" style="width:100px;height:30px;">Add</button><br>
	            </form>
   		     		<button onClick="back()" style="width:100px;height:30px;">Back</button></a>             
       		</div>
        		
        	<div id = "checkout" style="display:none">	
       			<form action="staffCheckOutBook.do" method="post" onsubmit="return Juge2(this)">
       				<input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		            <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
					<table class= "company"width="50%" border="1" align="center">
					<tr>
						<td>ISBN</td>
						<td>SGN</td>
						<td>BOOK_NAME</td>
						<td>BOOK_STATE</td>
						<td>USER_ID</td>
						<td>ID</td>
						<td>Student_Name</td>
						<td>SELECT_TO_CHECKOUT</td>
						
					</tr>
					<script>
					var array0 = new Array();
					var array1 = new Array();
					var array2 = new Array();
					var array3 = new Array();
					var array4 = new Array();
					var array5 = new Array();
					var array6 = new Array();
						<c:forEach items="${staffPageCheckOutInfo}" var="temp">   
						array0.push("${temp[0]}");
						array1.push("${temp[1]}");
						array2.push("${temp[2]}");
						array3.push("${temp[3]}");
						array4.push("${temp[4]}");
						array5.push("${temp[5]}");
						array6.push("${temp[6]}");
						</c:forEach>
						var size="${staffPageCheckOutInfo.size()}";
						for(var i=0;i<size;i++){
							var num=i+1;
									document.write("<tr>");
									document.write("<td>"+array0[i]+"</td>");
									document.write("<td>"+array1[i]+"</td>");
									document.write("<td>"+array2[i]+"</td>");
									document.write("<td>"+array3[i]+"</td>");
									document.write("<td>"+array4[i]+"</td>");
									document.write("<td>"+array5[i]+"</td>");
									document.write("<td>"+array6[i]+"</td>");
									document.write("<td><input type ='radio' name='SGN' value ="+array1[i]+"></td>");
									document.write("</tr>");

								}
	
						</script>
					</table>
					<button type="submit" value="Checkout" onClick="delcfm3()" style="width:100px;height:30px;">Checkout</button>				
			</form>
			   		     		<button onClick="back()" style="width:100px;height:30px;">Back</button></a>             
			
			</div>
			
			<div id="list" style="display:none">
			<form action="staffList.do" method="post" onsubmit="return Juge3(this)">
					<select id="cd-dropdown" class="cd-select" name="listtype" >
						<option value="-1" selected>PLEASE CHOOSE TO LIST</option>
						<option value="STUDENT_WITH_BOOKS_CHECKED_OUT" >STUDENT_WITH_BOOKS_CHECKED_OUT</option>
						<option value="BOOKS_CHECKED_OUT_SORTED_BY_CLASS" >BOOKS_CHECKED_OUT_SORTED_BY_CLASS</option>
						<option value="BOOKS_CHECKED_OUT_SORTED_BY_NAME" >BOOKS_CHECKED_OUT_SORTED_BY_NAME</option>
						<option value="BOOKS_CHECKED_OUT_SORTED_BY_NUMBER" >BOOKS_CHECKED_OUT_SORTED_BY_NUMBER</option>
						<option value="SEARCH_BOOK" >SEARCH_BOOK</option>
						<option value="STUDENT_ACCOUNT_INFO" >STUDENT_ACCOUNT_INFO</option>
						<option value="USER_INFO" >USER_INFO</option>
					</select>
					<br>
	                <input type="text" name="bookname" class="bookname" placeholder="bookname"><br>
	                <input type="text" name="ISBN" class="ISBN" placeholder="ISBN"><br>
	                <input type="text" name="SGN" class="SGN" placeholder="SGN"><br>
					<button type="submit" value="List" style="width:100px;height:30px;">List</button>
					
			</form>
					<button onClick="back()" style="width:100px;height:30px;">Back</button></a>             
			</div>	
			</div>
		<script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.dropdown.js"></script>
		<script type="text/javascript">

			$( function() {
				$( '#cd-dropdown' ).dropdown( {
					gutter : 50,
					delay : 10000,
					random : true
				} );
			});



		</script>		
				</body>
				</html>