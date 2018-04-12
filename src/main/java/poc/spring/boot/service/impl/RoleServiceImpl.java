package poc.spring.boot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import poc.spring.boot.domain.model.Role;
import poc.spring.boot.domain.repository.RoleRepository;
import poc.spring.boot.service.RoleService;
 
@Service("roleService")
@Profile("springdatajpa")
public class RoleServiceImpl extends CRUDServiceImpl<Role> implements RoleService {
 
	@Autowired
    private RoleRepository roleRepository;
 
	@Override
	protected CrudRepository<Role,Integer> getRepository() {
		return roleRepository;
	}
 
}