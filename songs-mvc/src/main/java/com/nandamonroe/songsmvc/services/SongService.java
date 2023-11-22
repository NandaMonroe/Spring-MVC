package com.nandamonroe.songsmvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandamonroe.songsmvc.models.Song;
import com.nandamonroe.songsmvc.repositories.SongRepository;

@Service
public class SongService {
    
    @Autowired
    SongRepository songRepository;

    public List<Song> getAllSongs() {
        return songRepository.findAll();
    }

    public void addSong(Song song) {
        songRepository.save(song);
    }

    public Song getOneSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        return optionalSong.orElse(null);
    }

    public void updateSong(Song song) {
        songRepository.save(song);
    }

    public Song createSong(Song song) {
        return songRepository.save(song);
    }

    public void deleteSong(Long id) {
        songRepository.deleteById(id);
    }

    public void updateSongById(Song song, Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()){
            Song updateSong = optionalSong.get();
            updateSong.setArtist(song.getArtist());
            updateSong.setTitle(song.getTitle());
            updateSong.setRating(song.getRating());
            songRepository.save(updateSong);
        } else {
            this.createSong(song);
        }
    }



    
}
