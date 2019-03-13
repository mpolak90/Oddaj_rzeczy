package pl.mateuszpolak.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mateuszpolak.model.Organization;

public interface OrganizationRepository extends JpaRepository<Organization, Long> {
}
