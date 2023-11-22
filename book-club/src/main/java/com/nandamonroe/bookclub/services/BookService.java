package com.nandamonroe.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandamonroe.bookclub.models.Book;
import com.nandamonroe.bookclub.models.User;
import com.nandamonroe.bookclub.repositories.BookRepository;

import jakarta.validation.Valid;

@Service
public class BookService {
    
    @Autowired
    BookRepository bookRepository;

    public void createBook(@Valid Book book) {
        bookRepository.save(book);
    }

    public List<Book> allBooks() {
        return bookRepository.findAll();
    }

    public Book getOneBookById(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.orElse(null);
    }
    
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public void updateBook(Book book) {
        bookRepository.save(book);
    }

    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }

    public Boolean addUserLike(Book book, User user) {
        System.out.println(book.getLikes());
        if(!book.getLikes().contains(user)){
            book.getLikes().add(user);
            bookRepository.save(book);
            return true;
        }
        System.out.println(book.getLikes());
        return false;
    }

    public Boolean removeUserLike(Book book, User user) {
        System.out.println(book.getLikes());
        if(book.getLikes().contains(user)){
            book.getLikes().remove(user);
            System.out.println("YOU REMOVE IT");
            bookRepository.save(book);
            return true;
        }
        System.out.println(book.getLikes());
        return false;
    }


}
