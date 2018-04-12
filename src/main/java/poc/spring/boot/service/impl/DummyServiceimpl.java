package poc.spring.boot.service.impl;

import org.springframework.stereotype.Service;

import poc.spring.boot.service.DummyService;

@Service
public class DummyServiceimpl implements DummyService{

	@Override
	public String sayHelloTo(String name) {
		return "Hello "+name;
	}

}
