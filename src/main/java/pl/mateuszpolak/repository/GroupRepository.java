package pl.mateuszpolak.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.OrgGroup;

public interface GroupRepository extends JpaRepository<OrgGroup, Long> {

}
