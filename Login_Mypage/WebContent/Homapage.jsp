<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <style>
        
    </style>
    
    <script src="https://code.jquery.com/jquery-3.4.0.min.js">
    </script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
        
        $(function()
        {
        	if( ${loginId != null } )
        	{
        		$("#mypage_btn").on("click", function()
        		{
        			location.href = "doing.mypage?"+encodeURI("page=1");
        		})
        	}
        	else
        	{
        		location.href = "Login.jsp";
        	}
        });
        
        onload = function()
        {
              
        };
    </script>
    
    
</head>
<body>
	
	<c:if test="${ loginId != null }">
		
		<input id="mypage_btn" type="button" value="마이페이지로">
	
	</c:if>
	
</body>
</html>