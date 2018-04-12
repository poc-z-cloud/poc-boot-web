package poc.spring.boot.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import poc.spring.boot.domain.model.User;
import poc.spring.boot.domain.repository.UserRepository;
import poc.spring.boot.service.EncryptionService;
import poc.spring.boot.service.UserService;

@Service("userService")
@Profile("springdatajpa")
public class UserServiceImpl extends CRUDServiceImpl<User> implements UserService{

	@Autowired
    private UserRepository userRepository;
	@Autowired
	private EncryptionService encryptionService;

	@Override
	protected CrudRepository<User,Integer> getRepository() {
		return userRepository;
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

    @Override
    public User saveOrUpdate(User domainObject) {
        if(domainObject.getPassword() != null){
            domainObject.setEncryptedPassword(encryptionService.encryptString(domainObject.getPassword()));
        }
        return userRepository.save(domainObject);
    }
}
