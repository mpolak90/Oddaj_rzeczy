package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.pl.NIP;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity(name = "organizations")
class Organization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String name;

    @NotNull
    @OneToOne
    private Address address;

    @NotEmpty
    @NIP
    private String nip;

    private String description;

    private boolean active;

    @OneToOne
    private User admin;
}