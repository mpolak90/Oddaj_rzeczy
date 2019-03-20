package pl.mateuszpolak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.Organization;
import pl.mateuszpolak.repository.OrganizationRepository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    public Organization findByAddress(Address address) {
        return organizationRepository.findByAddress(address);
    }

    public void delete(Long id) {
        organizationRepository.delete(id);
    }

    public List<String> cities() {
        List<Organization> all = findAll();
        List<Address> addresses = new ArrayList<>();
        List<String> cities = new ArrayList<>();
        Set<String> control = new HashSet<>();

        for (Organization org : all) {
            addresses.add(org.getAddress());
        }

        for (Address address : addresses) {
            control.add(address.getCity());
        }

        cities.addAll(control);
        return cities;
    }
}