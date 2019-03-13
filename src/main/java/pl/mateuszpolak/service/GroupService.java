package pl.mateuszpolak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mateuszpolak.model.OrgGroup;
import pl.mateuszpolak.repository.GroupRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class GroupService {

    @Autowired
    GroupRepository groupRepository;

    public void save(OrgGroup group) {
        groupRepository.save(group);
    }

    public OrgGroup find(Long id) {
        return groupRepository.findOne(id);
    }

    public List<OrgGroup> findAll() {
        return groupRepository.findAll();
    }

    public void delete(Long id) {
        groupRepository.delete(id);
    }
}