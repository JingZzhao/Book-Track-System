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
 		    document.getElementById("return_book").style.display ="none";

     	}
    	function back() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		    document.getElementById("button").style.display = "";
 		    document.getElementById("return_book").style.display ="none";
 	}
    	function refill() {  
 		   	document.getElementById("refill").style.display = "";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		   document.getElementById("button").style.display = "none";
 		  document.getElementById("return_book").style.display ="none";
 		}
    	function List() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "";
 		   	document.getElementById("button").style.display = "none";
 		  	document.getElementById("return_book").style.display ="none";
 		  
 		 	document.getElementById("bookname").style.display ="none";
 			document.getElementById("bookisbn").style.display ="none";
 			document.getElementById("booksgn").style.display ="none";  
 		}
    	function show_search() {
    	    var x = document.getElementById("cd-dropdown0").value;
    	    if(x == "SEARCH_BOOK"){
    	    	document.getElementById("bookname").style.display ="";
     			document.getElementById("bookisbn").style.display ="";
     			document.getElementById("booksgn").style.display =""; 
    	    }
    	    else{
    	    	document.getElementById("bookname").style.display ="none";
     			document.getElementById("bookisbn").style.display ="none";
     			document.getElementById("booksgn").style.display ="none";  
    	    }
    	}
    	function checkout() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "";
 		    document.getElementById("list").style.display = "none";
 		   	document.getElementById("button").style.display = "none";
 		   document.getElementById("return_book").style.display ="none";
 		}
    	function return_book() {  
 		   	document.getElementById("refill").style.display = "none";
		    document.getElementById("modify").style.display = "none";   
		    document.getElementById("info").style.display = "none";
 		    document.getElementById("checkout").style.display = "none";
 		    document.getElementById("list").style.display = "none";
 		   	document.getElementById("button").style.display = "none";
 		   document.getElementById("return_book").style.display ="";
 		}
	    function delcfm() { 
	        if (!confirm("Are You Sure to Modify ??")) { 
	            window.event.returnValue = false; 
	        } 
	    } 
	    function delcfm1() { 
	        if (!confirm("Are You Sure to Add ??")) { 
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
	    function delcfm4() { 
	        if (!confirm("Are You Sure to ReturnBook ??")) { 
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
	    function Juge5(myform){
	    	var checked = document.getElementsByName('SGN_2');   
	    	var temp_sex = false;   
	    	for(var i = 0; i < checked.length; i ++){   
		    	if(checked[i].checked){   
		    		temp_sex = true;   
		    		break;   
		    	}   
	    	}   
	    	if(temp_sex == false){   
	    		alert('Please Choose to Return!');  
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
	    	if (myform.ISBN.value==""||myform.name.value==""){
	    		alert("Please Complete All Blanks !!");
	    		myform.ISBN.focus();
	    		return false;
	    	}
	    	 alert("Successfful!!");
	    }
	</script>
    <body>
    	
        <div class="container">
				<h1 style="text-align:center;clear:both;">The Staff MainPage</h1>
				<a href="login.jsp" style="text-decoration:none;color:black;"><button style="width:200px;height:30px;">Logout</button></a>	
				
			<div style="text-align:center;clear:both;">
				<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="/follow.js" type="text/javascript"></script>
			</div>
	
			<center id = "info" style="font-family:Arial">
				<table style="text-align:center" class= "company"  width="50%" border="1" align="center">
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
   			</center>
   			
   			
   			<div id="button">
	   			<button type="button" onClick ="modify()" style="width:200px;height:30px;">Modify</button><br>
	   			<button type="button" onClick ="refill()"style="width:200px;height:30px;">RefillBook</button><br>
			    <form action="postBill.do" method="post">
			    		<input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
			    		<button type="submit" class="submit_button" onClick ="delcfm2()"style="width:200px;height:30px;">PostBill</button><br>
			    </form>   			
			    <button type="button" onClick ="List()"style="width:200px;height:30px;">List</button><br>
			    <button type="button" onClick ="checkout()"style="width:200px;height:30px;">Checkout</button><br>
			    <button type="button" onClick ="return_book()"style="width:200px;height:30px;">Return_Book</button><br>
   			</div>
   			
					
				
				<div id="modify" style ="display:none">
		            <h1 style="font-family:Arial">Information Modification</h1>
		            <form action="modifyStaffAccount.do" method="post" onsubmit="return Juge(this)">
		                <input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
		                <input type="text" name="staffPhone" class="staffPhone" placeholder="Phone"style="width:200px;height:20px;"><br>
		                <br>
		                <button type="submit" class="submit_button" onClick ="delcfm()" style="width:200px;height:30px;">Modify</button><br>
		            </form>
   		     		<button onClick="back()" style="width:200px;height:30px;">Back</button></a>             
        		</div>
        		
       		<div id="refill" style="display:none">
	            <h1 style="font-family:Times New Roman">REFILL BOOK</h1>
	            <form action="refillBook.do" method="post" onsubmit="return Juge4(this)">
	            <input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
	                <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
	                <input id='book_isbn' type="text" name="ISBN" class="ISBN" placeholder="ISBN" style="width:200px;height:20px;"><br>
	                <input id='book_name'type="text" name="name" class="name" placeholder="Name" style="width:200px;height:20px;"><br>
	                <button type="submit" class="submit_button" onClick ="delcfm1()" style="width:200px;height:30px;">Add</button><br>
	            </form>
             		<button onClick="back()" style="width:200px;height:30px;">Back</button><br>           
	           	<hr>
	            <h1 style="font-family:Times New Roman">SEARCH BOOK ON GOOGLE</h1>
	            <input id ="search" placeholder = "title or author" style="width:200px;height:20px;"><br>
				<button id ="zhu" type ="button" style="width:200px;height:30px;">Search</button>
				<center id = "booksearch_results"></center>
       		</div>
        		
        	<center id = "checkout" style="display:none">	
       			<form action="staffCheckOutBook.do" method="post" onsubmit="return Juge2(this)">
       				<input type="text" name="userId" class="userId" value = "${staffPage.getUserId()}"placeholder="${staffPage.getUserId()}" style="display:none;">
		            <input type="text" name="Id" class="Id" value ="${staffPage.getId()}" placeholder="${staffPage.getId()}"style="display:none;">
					<script>
					var array4 = new Array();
					<c:forEach items="${staffPageStudentInfo}" var="temp">   
					array4.push("${temp}");
					</c:forEach>
					var size_2 ="${staffPageStudentInfo.size()}";					
					document.write("<select id='cd-dropdown2' class='cd-select' name='studentUserId' style='width:200px;height:30px;'>");
					document.write('<option value ="-1" selected>Please Choose UserId....</option>');
					for(var j = 1; j< size_2; j++){
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
						<c:forEach items="${staffPageCheckOutInfo}" var="temp">   
						array0.push("${temp[0]}");
						array1.push("${temp[1]}");
						array2.push("${temp[2]}");
						array3.push("${temp[3]}");
						</c:forEach>
						var size="${staffPageCheckOutInfo.size()}";
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
					
					<button type="submit" value="Checkout" onClick="delcfm3()" style="width:200px;height:30px;">CheckOut</button>				
			</form>
			   		     		<button onClick="back()" style="width:200px;height:30px;">Back</button></a>             
			
			</center>
			
			<center id = "return_book" style="display:none">	
       			<form action="staffReturnBook.do" method="post" onsubmit="return Juge5(this)">
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
						<td>SELECT_TO_RETURN</td>
						
					</tr>
					<script>
					var array0 = new Array();
					var array1 = new Array();
					var array2 = new Array();
					var array3 = new Array();
					var array4 = new Array();
					var array5 = new Array();
					var array6 = new Array();
						<c:forEach items="${staffPageReturnInfo}" var="temp">   
						array0.push("${temp[0]}");
						array1.push("${temp[1]}");
						array2.push("${temp[2]}");
						array3.push("${temp[3]}");
						array4.push("${temp[4]}");
						array5.push("${temp[5]}");
						array6.push("${temp[6]}");
						</c:forEach>
						var size="${staffPageReturnInfo.size()}";
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
									document.write("<td><input type ='radio' name='SGN_2' value ="+array1[i]+"></td>");
									document.write("</tr>");

								}
	
						</script>
					</table>
					<button type="submit" value="return_book" onClick="delcfm4()" style="width:200px;height:30px;">Return_Book</button>				
			</form>
			   		     		<button onClick="back()" style="width:200px;height:30px;">Back</button></a>             
			
			</center>
			
			
			
			<div id="list" style="display:none">
			<button onClick="back()" style="width:200px;height:30px;">Back</button></a>      
	
			<form action="staffList.do" method="post" onsubmit="return Juge3(this)">
					<select id="cd-dropdown0" class="cd-select" name="listtype" onchange="show_search()">
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
	                
					<button type="submit" value="List" style="width:200px;height:30px;">List</button>
					<br>       
					<input id = "bookname" type="text" name="bookname" class="bookname" placeholder="bookname"><br>
	                <input id = "bookisbn" type="text" name="ISBN" class="ISBN" placeholder="ISBN"><br>
	                <input id = "booksgn" type="text" name="SGN" class="SGN" placeholder="SGN"><br>
			</form>
			</div>	
			</div>
		<script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.dropdown.js"></script>
		<script type="text/javascript">
			$( function() {
				$( '#cd-dropdown' ).dropdown( {
					gutter : 50,
					delay : 10000,
					random : false
				} );
			});
			$( function() {
				$( '#cd-dropdown2' ).dropdown( {
					gutter : 50,
					delay : 10000,
					random : false
				} );
			});
	
		</script>		
		
		
		
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 --><script>
function bookSearch(){
	var search = document.getElementById('search').value
	$.ajax({
		url: "https://www.googleapis.com/books/v1/volumes?q=" + search,
		dataType: "json",

		success: function(data){
				var row =""
				document.getElementById('booksearch_results').innerHTML = ""
				row += "<table id = 'book' class= 'company'width='50%' border='1' align='center'>"
				row +="<tr>"
				row +="<td>ISBN</td>"
				row +="<td>BOOK_NAME</td>"
				row +="<td>Image</td>"
				row +="<td>Select_To_Add</td>"
				row +="</tr>"
			for(i = 0; i < Math.min(data.items.length,5); i++){
					row +="<tr>"
					row += "<td>" + data.items[i].volumeInfo.industryIdentifiers[0].identifier + "</td>"
					row += "<td>" + data.items[i].volumeInfo.title + "</td>"
					row += "<td><img src='"+data.items[i].volumeInfo.imageLinks.thumbnail+"'height='100' width='70'></td>"
					row += "<td><input type ='radio' name='sz' value ='"+data.items[i].volumeInfo.title+"' onClick='c1("+i+")'></td>"
					row +="</tr>"
						
			}
			row +="</table>"
			booksearch_results.innerHTML = row
			/*  */
		},

		type: 'Get'
	});
}

document.getElementById('zhu').addEventListener('click',bookSearch,false);
</script> 
<script>
function c1(obj) {
	var index = obj + 1;
	var tb=document.getElementById("book");
	document.getElementById("book_isbn").value = tb.rows[index].cells[0].innerHTML;
	document.getElementById("book_name").value = tb.rows[index].cells[1].innerHTML;
}

</script>
	
				</body>
				</html>