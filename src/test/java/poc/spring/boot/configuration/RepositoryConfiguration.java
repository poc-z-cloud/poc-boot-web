package poc.spring.boot.configuration;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableAutoConfiguration
@EntityScan(basePackages = {"poc.spring.boot.domain.model"})
@EnableJpaRepositories(basePackages = {"poc.spring.boot.domain.repository"})
@EnableTransactionManagement
public class RepositoryConfiguration {
}