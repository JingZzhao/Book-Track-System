<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8" >
        <title style="font-family:Arial">WELCOME TO WEB APP</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=GB18030">


        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->

    </head>

	<script>
	    function Juge(myform){
	    	if (myform.userId.value==""){
	    		alert("Please Input UserId������");
	    		myform.userId.focus();
	    		return false;
	    	}
	    	if (myform.Id.value==""){
	    		alert("Please Input Id������");
	    		myform.Id.focus();
	    		return false;
	    	}
	    	alert("Login Successfully !");
	    }
	</script>
    <body>
		
		<script>
		var a="${error}";
		if(a=="error"){
			alert("Not Correct !!");
		}
		</script>
        <div class="page-container">
            <h1 style="font-family:Arial">Book Tracking System</h1>
            <form action="login.do" method="post" onsubmit="return Juge(this)" onsubmit="alert()">
                <input type="text" name="userId" class="userID" placeholder="userID">
                <input type="password" name="Id" class="ID" placeholder="ID">
                <button type="submit" class="submit_button">Login</button>
                <a href="signup.jsp"><input type="button" value="signUp"></input></a>
             
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js" ></script>
        <script src="assets/js/supersized.3.2.7.min.js" ></script>
        <script src="assets/js/supersized-init.js" ></script>
        <script src="assets/js/scripts.js" ></script>

    </body>
<div style="text-align:center;">
</div>
</html>

