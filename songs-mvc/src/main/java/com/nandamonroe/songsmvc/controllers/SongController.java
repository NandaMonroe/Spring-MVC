package com.nandamonroe.songsmvc.controllers;

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

import com.nandamonroe.songsmvc.models.Song;
import com.nandamonroe.songsmvc.services.SongService;

import jakarta.validation.Valid;

@Controller
public class SongController {

    @Autowired
    SongService songService;

    //! CREATE
    @GetMapping("/songs/add")
    public String addSong(@ModelAttribute Song song) {
        // model.addAttribute("song", new Song());
        return "add.jsp";
    }

    @PostMapping("/songs/adding")
    public String addSong(@Valid Song song, BindingResult result, Model model) {
        if(result.hasErrors()){
            List<Song> songs = songService.getAllSongs();
            model.addAttribute("songs", songs);
            return "add.jsp";
        } else {
            songService.addSong(song);
        }
        return "redirect:/";
    }

    //! READ ALL
    @GetMapping("/")
    public String index(Model model, Song song) {
        List<Song> songs = songService.getAllSongs();
        System.out.println(songs);
        model.addAttribute("songs", songs);
        return "index.jsp";
    }

    //! READ ONE
    @GetMapping("/songs/show/{id}")
    public String show(@PathVariable Long id, Model model ) {
        Song song = songService.getOneSong(id);
        model.addAttribute("song", song);
        return "show.jsp";
    }

    //! UPDATE
    @GetMapping("songs/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Song song = songService.getOneSong(id);
        model.addAttribute("song", song);
        return "edit.jsp";
    }

    @PutMapping("/songs/update/{id}")
    public String update(Song song) {
        songService.updateSong(song);
        return "redirect:/";
    }

    //! DELETE
    @DeleteMapping("/songs/delete/{id}")
    public String delete(@PathVariable Long id) {
        songService.deleteSong(id);
        return "redirect:/";
    }
}
