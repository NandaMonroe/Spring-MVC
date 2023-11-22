package com.nandamonroe.burgertracker.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.nandamonroe.burgertracker.models.Burger;
import com.nandamonroe.burgertracker.services.BurgerService;

import jakarta.validation.Valid;

@Controller
public class BurgerController {
    
    @Autowired
    BurgerService burgerService;
    

    @GetMapping("/")
    public String index(Model model, @ModelAttribute Burger burger) {
        List<Burger> burgers = burgerService.getAllBurgers();
        model.addAttribute("burgers", burgers);
        return "index.jsp";
    }

    @PostMapping("/burgers/adding")
    public String addBurger(@Valid @ModelAttribute Burger burger, BindingResult result, Model model) {
        if(result.hasErrors()){
            List<Burger> burgers = burgerService.getAllBurgers();
            model.addAttribute("burgers", burgers);
            return "index.jsp";
        } else {
            burgerService.addBurger(burger);
        }
        return "redirect:/";
    }
}
