package com.sofka.dao;

import com.sofka.domain.BingoCard;
import org.springframework.data.repository.CrudRepository;

public interface BingoCardDao extends CrudRepository<BingoCard, Long> {
}
