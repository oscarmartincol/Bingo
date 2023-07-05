package com.sofka.dao;

import com.sofka.domain.Status;
import org.springframework.data.repository.CrudRepository;

public interface StatusDao extends CrudRepository<Status, Long> {
}
