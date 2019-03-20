package pl.mateuszpolak.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity(name = "orgGroups")
public class OrgGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String name;

    public OrgGroup() {
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
}