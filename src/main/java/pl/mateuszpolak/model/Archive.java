package pl.mateuszpolak.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity(name = "archive")
public class Archive {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User from;

    @ManyToOne
    private Organization to;

    private LocalDateTime send;

    private LocalDateTime delivery;

    private Long bags;
}