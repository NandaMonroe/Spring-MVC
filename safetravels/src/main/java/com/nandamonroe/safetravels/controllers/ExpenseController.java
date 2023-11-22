package com.nandamonroe.safetravels.controllers;

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

import com.nandamonroe.safetravels.models.Expense;
import com.nandamonroe.safetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
    
    @Autowired
    ExpenseService expenseService;

    // CREATE
    @PostMapping("/expenses/adding")
    public String addExpense(@Valid @ModelAttribute Expense expense, BindingResult result, Model model) {
        if(result.hasErrors()){
            System.out.println("THIS IS FROM ERROR CONDITION");
            System.out.println(expense);
            List<Expense> expenses = expenseService.getAllExpenses();
            model.addAttribute("expenses", expenses);
            return "index.jsp";
        } else {
            System.out.println("THIS IS FROM ELSE STATEMENT");
            System.out.println(expense);
            expenseService.addExpense(expense);
        }
        return "redirect:/expenses";
    }

    // READ ALL
    @GetMapping("/expenses")
    public String index(Model model, @ModelAttribute Expense expense) {
        List<Expense> expenses = expenseService.getAllExpenses();
        model.addAttribute("expenses", expenses);
        return "index.jsp";
    }
    
    // READ ONE
    @GetMapping("/expenses/show/{id}")
    public String show(@PathVariable Long id, Model model ) {
        Expense expense = expenseService.getOneExpense(id);
        model.addAttribute("expense", expense);
        return "show.jsp";
    }

    // UPDATE
    @GetMapping("expenses/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Expense expense = expenseService.getOneExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }

    @PutMapping("/expenses/update/{id}")
    public String update(@Valid @ModelAttribute Expense expense, BindingResult result, Model model) {
        if(result.hasErrors()){
            System.out.println("THIS IS FROM ERROR CONDITION");
            System.out.println(expense);
            List<Expense> expenses = expenseService.getAllExpenses();
            model.addAttribute("expenses", expenses);
            return "redirect:/expenses/edit/{id}";
        } else {
            System.out.println("THIS IS FROM ELSE STATEMENT");
            System.out.println(expense);
            expenseService.updateExpense(expense);
        }
        return "redirect:/expenses";
    }

    // DELETE
    @DeleteMapping("/expenses/delete/{id}")
    public String delete(@PathVariable Long id) {
        expenseService.deleteExpense(id);
        return "redirect:/";
    }
}
