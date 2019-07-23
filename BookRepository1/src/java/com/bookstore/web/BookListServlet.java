package com.bookstore.web;  
  
import java.io.IOException;  
  
import javax.inject.Inject;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.bookstore.BookRepository;  
  
@WebServlet("/book/")  
public class BookListServlet extends HttpServlet {  
      
    @Inject   
    private BookRepository bookRepo;  
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        request.setAttribute("books", bookRepo.listBooks());  
        getServletContext().getRequestDispatcher("/book-list.jsp").forward(request, response);  
    }  
  
}  