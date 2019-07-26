<%@ page language="java" contentType="text/html; charset=UTF-8"  
         pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML>  
<html>  
    <head>  
        <title>${param.title}</title>  

        <!-- debut template nav --> 
        
        <!-- Fin template nav --> 
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>  
    <body>  
        <jsp:include page="header.jsp"/>  

        <jsp:include page="${param.content}.jsp"/>  
        
        
        
        
        
        
        <jsp:include page="footer.jsp"/>  



    </body>  
</html>  