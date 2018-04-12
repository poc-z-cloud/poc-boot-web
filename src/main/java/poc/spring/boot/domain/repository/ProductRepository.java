package poc.spring.boot.domain.repository;

import org.springframework.data.repository.CrudRepository;

import poc.spring.boot.domain.model.Product;

public interface ProductRepository extends CrudRepository<Product, Integer>{
}