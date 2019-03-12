package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity(name = "users")
class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(unique = true)
    String login;

    @OneToOne
    Address address;

    @NotEmpty
    String firstName;

    @NotEmpty
    String lastName;

    @NotEmpty
    @Column(unique = true)
    String email;

    @NotEmpty
    String password;

    boolean active;

    boolean admin;
}