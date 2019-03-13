package pl.mateuszpolak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mateuszpolak.model.Organization;
import pl.mateuszpolak.repository.OrganizationRepository;
import java.util.List;

@Service
public class OrganizationService {

    @Autowired
    OrganizationRepository organizationRepository;

    public void save(Organization organization) {
        organizationRepository.save(organization);
    }

    public Organization find(Long id) {
        return organizationRepository.findOne(id);
    }

    public List<Organization> findAll() {
        return organizationRepository.findAll();
    }

    public void delete(Long id) {
        organizationRepository.delete(id);
    }
}