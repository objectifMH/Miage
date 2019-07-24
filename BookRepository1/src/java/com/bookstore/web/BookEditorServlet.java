package com.bookstore.web;  
  
import com.bookstore.Book;  
import com.bookstore.BookRepository;  
import java.io.IOException;  
import java.text.SimpleDateFormat;  
import javax.inject.Inject;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
@WebServlet("/book")  
public class BookEditorServlet extends HttpServlet {  
  
    @Inject  
    private BookRepository bookRepo;  
    private SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");  
  
    protected void doGet(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
  
        // On récupère le paramètre id  
        String id = request.getParameter("id");  
  
        if (id != null && !id.isEmpty()) {  
            // Allons chercher le livre correspondant à l'id  
            Book book = bookRepo.lookupBookById(id);  
            // On met le livre dans la reqête  
            request.setAttribute("book", book);  
            // Et la date de publication aussi  
            request.setAttribute("bookPubDate", dateFormat.format(book.getPubDate()));  
        }  
  
        /* On appelle la JSP pour affichage du formulaire */  
        getServletContext().getRequestDispatcher("/book-form.jsp").forward(  
                request, response);  
    }  
    
    protected void doPost(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
  
        // On récupère le contenu du formulaire  
        String title = request.getParameter("title");  
        String description = request.getParameter("description");  
        String price = request.getParameter("price");  
        String pubDate = request.getParameter("pubDate");  
  
        // le champ "hidden" du formulaire qui contient l'id  
        String id = request.getParameter("id");  
          
        // Si l'id est null alors on est dans le cas d'un ajout de livre  
        if (id == null || id.isEmpty()) {  
            bookRepo.addBook(title, description, price, pubDate);  
        } else {  
            // Si l'id n'est pas nul on fait un update  
            bookRepo.updateBook(id, title, description, price, pubDate);  
        }  
  
        System.out.println("On va vers book/");
        // Enfin, on redirige vers la servlet qui affiche la liste des livres  
        response.sendRedirect(request.getContextPath() + "/book/");  
    } 
}  