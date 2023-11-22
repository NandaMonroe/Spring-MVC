package com.nandamonroe.songsmvc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nandamonroe.songsmvc.models.Song;

public interface SongRepository extends CrudRepository<Song, Long>{
    List<Song> findAll();
}
