package pl.mateuszpolak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mateuszpolak.model.Address;
import pl.mateuszpolak.model.User;
import pl.mateuszpolak.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    UserRepository userRepository;

    public void save(User user) {
        userRepository.save(user);
    }

    public User find(Long id) {
        return userRepository.findOne(id);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public List<User> findAllAdmins() {
        return userRepository.findAllByAdmin(true);
    }

    public void delete(Long id) {
        userRepository.delete(id);
    }

    public List<User> findByEmail(String email) { return userRepository.findAllByEmail(email); }

    public User findByAddress(Address address) { return userRepository.findByAddress(address); }
}
