package poc.spring.boot.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import poc.spring.boot.service.CRUDService;

public abstract class CRUDServiceImpl<T> implements CRUDService<T>{

	@Override
	public List<?> listAll() {
        List<T> list = new ArrayList<>();
        list.addAll((Collection<? extends T>) getRepository().findAll());
        return list;
	}

	@Override
	public T getById(Integer id) {
		return getRepository().findOne(id);
	}

	@Override
	public T saveOrUpdate(T domainObject) {
		return getRepository().save(domainObject);
	}

	@Override
	public void delete(Integer id) {
		getRepository().delete(id);
		
	}

	abstract protected CrudRepository<T,Integer> getRepository();
}
