package com.sofka.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
@Entity
@Table(name = "bingo_card")
public class BingoCard implements Serializable {

    /**
     * Variable que representa el id del carton de bingo.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_card")
    private long idCard;

    /**
     * Relación muchos a uno entre la tabla de jugadores y la de cartones de bingo.
     */
    @ManyToOne
    @JoinColumn(name = "id_gamer")
    private Gamer gamer;

    /**
     * Relación muchos a uno entre la tabla de juegos y la de cartones de bingo.
     */
    @ManyToOne
    @JoinColumn(name = "id_game")
    private Game game;

    /**
     * Números para la columna de la letra B
     */
    @Column(name = "num_b1")
    private Integer b1;

    @Column(name = "num_b2")
    private Integer b2;

    @Column(name = "num_b3")
    private Integer b3;

    @Column(name = "num_b4")
    private Integer b4;

    @Column(name = "num_b5")
    private Integer b5;

    /**
     * Números para la columna de la letra I
     */
    @Column(name = "num_i1")
    private Integer i1;

    @Column(name = "num_i2")
    private Integer i2;

    @Column(name = "num_i3")
    private Integer i3;

    @Column(name = "num_i4")
    private Integer i4;

    @Column(name = "num_i5")
    private Integer i5;

    /**
     * Números para la columna de la letra N
     */
    @Column(name = "num_n1")
    private Integer n1;

    @Column(name = "num_n2")
    private Integer n2;

    @Column(name = "num_n3")
    private Integer n3;

    @Column(name = "num_n4")
    private Integer n4;

    /**
     * Números para la columna de la letra G
     */
    @Column(name = "num_g1")
    private Integer g1;

    @Column(name = "num_g2")
    private Integer g2;

    @Column(name = "num_g3")
    private Integer g3;

    @Column(name = "num_g4")
    private Integer g4;

    @Column(name = "num_g5")
    private Integer g5;

    /**
     * Números para la columna de la letra O
     */
    @Column(name = "num_o1")
    private Integer o1;

    @Column(name = "num_o2")
    private Integer o2;

    @Column(name = "num_o3")
    private Integer o3;

    @Column(name = "num_o4")
    private Integer o4;

    @Column(name = "num_o5")
    private Integer o5;

}
