package com.sofka.dao;

import com.sofka.domain.Gamer;
import org.springframework.data.repository.CrudRepository;

public interface GamerDao extends CrudRepository<Gamer,Long> {

}
