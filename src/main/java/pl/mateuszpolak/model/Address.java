package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "addresses")
class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String street;

    @NotBlank
    private String number;

    @NotBlank
    private String code;

    @NotBlank
    private String city;

    private String telnum;
}