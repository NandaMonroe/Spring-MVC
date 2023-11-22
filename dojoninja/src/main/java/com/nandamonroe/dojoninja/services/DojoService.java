package com.nandamonroe.dojoninja.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandamonroe.dojoninja.models.Dojo;
import com.nandamonroe.dojoninja.repositories.DojoRepository;

@Service
public class DojoService {
    
    @Autowired
    DojoRepository dojoRepository;

    public List<Dojo> allDojos(){
        return dojoRepository.findAll();
    }
    
    public Dojo createDojo(Dojo dojo){
        return dojoRepository.save(dojo);
    }

    public Dojo findDojo(Long id) {
        Optional<Dojo> optionalDojo = dojoRepository.findById(id);
        if(optionalDojo.isPresent()) {
            return optionalDojo.get();
        } else {
            return null;
        }
    }

    public Dojo findDojoById(Long exampleId) {
        Optional<Dojo> optionalDojo = dojoRepository.findById(exampleId);
        return optionalDojo.orElse(null);
    }

}
