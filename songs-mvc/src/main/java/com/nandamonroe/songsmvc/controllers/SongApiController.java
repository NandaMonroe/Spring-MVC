package com.nandamonroe.songsmvc.controllers;

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

import com.nandamonroe.songsmvc.models.Song;
import com.nandamonroe.songsmvc.services.SongService;

@RestController
@RequestMapping("/api")
public class SongApiController {

    @Autowired
    SongService songService;

    //!CREATE
    @PostMapping("/songs")
    Song newSong(@RequestBody Song song){
        System.out.println(song);
        return songService.createSong(song);
    }

    //!READ ALL
    @GetMapping("/songs")
    public List<Song> getAllSongs() {
        return songService.getAllSongs();
    }
    
    //!READ ONE
    @GetMapping("/songs/show/{id}")
    public Song getOneSong(@PathVariable Long id) {
        return songService.getOneSong(id);
    }

    //!UPDATE
    @PutMapping("/songs/update/{id}")
    void updateSong(@RequestBody Song song, @PathVariable Long id) {
        System.out.println(song);
        songService.updateSongById(song, id);
    }

    //!DELETE
    @DeleteMapping("/songs/delete/{id}")
    public void deleteSong(@PathVariable Long id) {
        songService.deleteSong(id);
    }
}
