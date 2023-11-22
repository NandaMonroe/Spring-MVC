package com.nandamonroe.safetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nandamonroe.safetravels.models.Expense;
import com.nandamonroe.safetravels.services.ExpenseService;

@RestController
@RequestMapping("/api")
public class ExpenseApiController {
    
    @Autowired
    ExpenseService expenseService;

    //!CREATE
    @PostMapping("/expenses")
    Expense newExpense(@RequestBody Expense expense){
        System.out.println(expense);
        return expenseService.createExpense(expense);
    }

    //!READ ALL
    @GetMapping("/expenses")
    public List<Expense> getAllExpenses() {
        return expenseService.getAllExpenses();
    }
    
    //!READ ONE
    @GetMapping("/expenses/show/{id}")
    public Expense getOneExpense(@PathVariable Long id) {
        return expenseService.getOneExpense(id);
    }

    //!UPDATE
    @PutMapping("/expenses/update/{id}")
    void updateExpense(@RequestBody Expense expense, @PathVariable Long id) {
        System.out.println(expense);
        expenseService.updateExpenseById(expense, id);
    }

    //!DELETE
    @DeleteMapping("/expenses/delete/{id}")
    public void deleteExpense(@PathVariable Long id) {
        expenseService.deleteExpense(id);
    }
}
