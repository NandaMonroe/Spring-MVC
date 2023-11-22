package com.nandamonroe.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandamonroe.safetravels.models.Expense;
import com.nandamonroe.safetravels.repositories.ExpenseRepository;

import jakarta.validation.Valid;

@Service
public class ExpenseService {
    
    @Autowired
    ExpenseRepository expenseRepository;

    public List<Expense> getAllExpenses() {
        return expenseRepository.findAll();
    }

    public void addExpense(@Valid Expense expense) {
        expenseRepository.save(expense);
    }

    public Expense getOneExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        return optionalExpense.orElse(null);
    }

    public void updateExpense(Expense expense) {
        expenseRepository.save(expense);
    }

    public void deleteExpense(Long id) {
        expenseRepository.deleteById(id);
    }

    public Expense createExpense(Expense expense) {
        return expenseRepository.save(expense);
    }

    public void updateExpenseById(Expense expense, Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()){
            Expense updateExpense = optionalExpense.get();
            updateExpense.setName(expense.getName());
            updateExpense.setVendor(expense.getVendor());
            updateExpense.setAmount(expense.getAmount());
            expenseRepository.save(updateExpense);
        } else {
            this.createExpense(expense);
        }
    }

    
}
