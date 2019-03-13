package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.pl.NIP;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity(name = "organizations")
public class Organization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String name;

    @OneToOne
    private Address address;

    @NIP
    private String nip;

    private String description;

    @ManyToOne
    private OrgGroup orgGroup;

    private boolean active;
}