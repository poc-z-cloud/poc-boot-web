package poc.spring.boot.domain.repository;

import org.springframework.data.repository.CrudRepository;

import poc.spring.boot.domain.model.Role;

public interface RoleRepository extends CrudRepository<Role, Integer>{
}