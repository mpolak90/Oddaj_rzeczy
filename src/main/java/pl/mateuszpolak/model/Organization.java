package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.pl.NIP;

import javax.persistence.*;

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

    public Organization() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public OrgGroup getOrgGroup() {
        return orgGroup;
    }

    public void setOrgGroup(OrgGroup orgGroup) {
        this.orgGroup = orgGroup;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}