package pl.mateuszpolak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.repository.AddressRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AddressService {

    @Autowired
    AddressRepository addressRepository;

    public void save(Address address) {
        addressRepository.save(address);
    }

    public Address find(Long id) {
        return addressRepository.findOne(id);
    }

    public List<Address> findAll() {
        return addressRepository.findAll();
    }

    public void delete(Long id) {
        addressRepository.delete(id);
    }
}