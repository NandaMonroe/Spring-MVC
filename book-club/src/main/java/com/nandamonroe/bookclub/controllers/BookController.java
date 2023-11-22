package com.nandamonroe.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.nandamonroe.bookclub.models.Book;
import com.nandamonroe.bookclub.models.User;
import com.nandamonroe.bookclub.services.BookService;
import com.nandamonroe.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {
    
    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    //READ ALL
    @GetMapping("/books")
    public String books(Model model, HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/logout";
        } else {
            User user = userService.getOneUserById((Long)session.getAttribute("userId"));
            List<Book> books = bookService.getAllBooks();
            model.addAttribute("books", books);
            model.addAttribute("user", user);
        }
        return "books/all_books.jsp";
    }
    
    //READ ONE
    @GetMapping("books/show/{id}")
    public String showbook(@PathVariable Long id, HttpSession session, Model model){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        } else {
            Book book = bookService.getOneBookById(id);
            model.addAttribute("book", book);
        }
        return "books/show_book.jsp";
    }

    // CREATE
    @GetMapping("books/add")
    public String addbook(@ModelAttribute Book book){
        
        return "books/add_book.jsp";
    }

    @PostMapping("books/adding")
    public String createbook(@Valid @ModelAttribute Book book, BindingResult result){
        if(result.hasErrors()){
            return "books/add_book.jsp";
        } else {
            System.out.println(book);
            bookService.createBook(book);
            return "redirect:/books";
        }
    }

    // UPDATE
    @GetMapping("books/edit/{id}")
    public String editbook(@PathVariable Long id, Model model){
        Book book = bookService.getOneBookById(id);
        model.addAttribute("book", book);
        return "books/edit_book.jsp";
    }

    @PutMapping("/books/editing/{id}")
    public String editingBook(@Valid @ModelAttribute Book editbook,  BindingResult result, @PathVariable Long id, Model model){
        if (result.hasErrors()) {
            Book book = bookService.getOneBookById(id);
            model.addAttribute("book", book);
            return "books/edit_book.jsp";
        } else {
            System.out.println(editbook);
            bookService.updateBook(editbook);
            return "redirect:/books";
        }
    }

    //DELETE
    @DeleteMapping("books/delete/{id}")
    public String deletebook(@PathVariable Long id){
        bookService.deleteBook(id);
        return "redirect:/books";
    }


    //LIKE ROUTE
    @GetMapping("/books/like/{id}")
    public String like(@PathVariable Long id, HttpSession session){
        System.out.println("YOU LIKED THIS");
        Book book = bookService.getOneBookById(id);
        User user = userService.getOneUserById((Long)session.getAttribute("userId"));
        bookService.addUserLike(book, user);
        return "redirect:/books";
    }

    //DISLIKE ROUTE
    @GetMapping("books/dislike/{id}")
    public String dislike(@PathVariable Long id, HttpSession session){
        System.out.println("YOU DISLIKED THIS");
        Book book = bookService.getOneBookById(id);
        User user = userService.getOneUserById((Long)session.getAttribute("userId"));
        bookService.removeUserLike(book, user);
        return "redirect:/books";
    }


}
