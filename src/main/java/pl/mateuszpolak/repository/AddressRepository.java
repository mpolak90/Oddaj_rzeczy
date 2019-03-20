package pl.mateuszpolak.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.mateuszpolak.model.Address;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Long> {

}
