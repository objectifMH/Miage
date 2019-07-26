<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>  
<!DOCTYPE HTML> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <script type="text/javascript">
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    <head>  
        <title>Book Form</title>  
    </head>  

    <body>  

        <!-- ///////////////////////// -->


        <div id="editEmployeeModal" class="container">
            <div class="container">
                <div class="container">
                    <form>

                        <form method="post" action="${pageContext.request.contextPath}/book">  
                            <fieldset>  
                                <legend>  
                                    <c:choose>  
                                        <c:when test="${not empty book.id }">  
                                            Updating Book  
                                        </c:when>  
                                        <c:otherwise>  
                                            Adding Book  
                                        </c:otherwise>  
                                    </c:choose>  
                                </legend>  


                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input type="text" name="title"  class="form-control"
                                               id="title" value="${book.title}" required/>
                                    </div>

                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" id="description" rows="2" cols="60" class="form-control">  
                                            ${book.description}  
                                        </textarea> 
                                    </div>



                                    <div class="form-group">  
                                        <label for="price">Price $</label>   
                                        <input name="price" id="price" type="number"  class="form-control" 
                                               value="${book.price}" required/>  
                                    </div>  

                                    <div class="form-group">  
                                        <label for="pubDate">Publication Date</label>   
                                        <input type="text" name="pubDate" id="pubDate"   class="form-control"
                                                value="${book.pubDate}" required/>
                                    </div>  

                                    <c:if test="${not empty book.id}">  
                                        <input type="hidden" name="id" value="${book.id}"  class="form-control" />  
                                    </c:if>  
                                </div>
                            </fieldset>  


                            <div class="modal-footer">
                                <div class="button-row">  
                                    <button class="btn btn-info" type="button">
                                        <a href="${pageContext.request.contextPath}/book/">Cancel</a> 
                                    </button>
                                    <input type="submit" class="btn btn-info" value="Submit">
                                </div>  

                            </div>



                        </form>
                </div>
            </div>
        </div>

        <!-- ///////////////////////// -->

    </body>  
</html> 