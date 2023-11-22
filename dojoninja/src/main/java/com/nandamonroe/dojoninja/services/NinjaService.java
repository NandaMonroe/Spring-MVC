package com.nandamonroe.dojoninja.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandamonroe.dojoninja.models.Ninja;
import com.nandamonroe.dojoninja.repositories.NinjaRepository;

@Service
public class NinjaService {
    
    @Autowired
    NinjaRepository ninjaRepository;

    public List<Ninja> allNinjas(){
        return ninjaRepository.findAll();
    }

    public Ninja createNinja(Ninja ninja){
        return ninjaRepository.save(ninja);
    }

    public Ninja findNinja(Long id) {
        Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
        if(optionalNinja.isPresent()) {
            return optionalNinja.get();
        } else {
            return null;
        }
    }
}
