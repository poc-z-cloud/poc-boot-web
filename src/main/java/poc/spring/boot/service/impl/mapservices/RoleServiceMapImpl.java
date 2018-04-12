package poc.spring.boot.service.impl.mapservices;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import poc.spring.boot.domain.model.Role;
import poc.spring.boot.service.RoleService;

/**
 * Created by jt on 12/18/15.
 */
@Service("roleService")
@Profile("map")
public class RoleServiceMapImpl extends AbstractMapService implements RoleService{

	@Override
	public Role getById(Integer id) {
		return (Role) super.getById(id);
	}

	@Override
	public Role saveOrUpdate(Role domainObject) {
		return (Role) super.saveOrUpdate(domainObject);
	}
}
