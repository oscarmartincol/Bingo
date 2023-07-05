package com.sofka.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Column;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.GenerationType;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "gamer")
public class Gamer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * Variable que representa el id del jugador en MySQL
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_gamer")
    private Long id;

    /**
     * Variable que representa el nombre de usuario
     */
    @Column(name = "username")
    private String username;

    @ManyToMany
    @JoinTable(name = "gamer_has_game"
        ,joinColumns = @JoinColumn(name = "id_gamer")
        ,inverseJoinColumns = @JoinColumn(name = "id_game"))
    private Set<Game> games;

}
