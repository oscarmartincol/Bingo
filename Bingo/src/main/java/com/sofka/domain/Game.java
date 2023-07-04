package com.sofka.domain;

import jakarta.persistence.Column;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "game")
public class Game implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * Variable que representa el id del juego en MySQL
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_game")
    private long id;

    /**
     * Relación uno a muchos para el ganador de la partida
     */
    @ManyToOne
    @JoinColumn(name = "id_gamer")
    private Gamer winner;

    @ManyToOne
    @JoinColumn(name = "id_state")
    private Status status;


    @Column(name = "created")
    private String creationDate;


}
