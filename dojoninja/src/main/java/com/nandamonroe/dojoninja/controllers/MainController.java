package com.nandamonroe.dojoninja.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.nandamonroe.dojoninja.models.Dojo;
import com.nandamonroe.dojoninja.models.Ninja;
import com.nandamonroe.dojoninja.services.DojoService;
import com.nandamonroe.dojoninja.services.NinjaService;

import jakarta.validation.Valid;

@Controller
public class MainController {
    
    @Autowired
    DojoService dojoService;
    
    @Autowired
    NinjaService ninjaService;

    @GetMapping("/")
    public String index(){
        return "redirect:/dojos";
    }

    @GetMapping("/dojos")
    public String dojos(Model model, @ModelAttribute Dojo dojo) {

        List<Dojo> dojos = dojoService.allDojos();

        model.addAttribute("dojos", dojos);

        return "index.jsp";
    }

    @GetMapping("/ninjas")
    public String ninjas(@ModelAttribute("ninja") Ninja ninja, Model model) {
        List<Dojo> dojos = dojoService.allDojos();
        Long exampleId = (long) 3;
        Dojo exampleDojo = dojoService.findDojoById(exampleId);

        model.addAttribute("dojos", dojos);
        model.addAttribute("dojo", exampleDojo);

        return "add_ninja.jsp";
    }

    @GetMapping("/dojos/{id}")
    public String viewDojo(@PathVariable Long id, Model model) {

        Dojo dojo = dojoService.findDojoById(id);

        model.addAttribute("dojo", dojo);

        return "view_dojo.jsp";
    }

    @PostMapping("/dojos/adding")
    public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result){
        if(result.hasErrors()){
            return "index.jsp";
        } else {
            dojoService.createDojo(dojo);
            return "redirect:/dojos";
        }
    }

    @PostMapping("/ninja/adding")
    public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result){
        if(result.hasErrors()){
            return "index.jsp";
        } else {
            ninjaService.createNinja(ninja);
            return String.format("redirect:/dojos/%s", ninja.getDojo().getId());
        }
    }
}
