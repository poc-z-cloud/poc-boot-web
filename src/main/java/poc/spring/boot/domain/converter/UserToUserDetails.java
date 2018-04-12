package poc.spring.boot.domain.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import poc.spring.boot.domain.model.Role;
import poc.spring.boot.domain.model.User;
import poc.spring.boot.domain.vo.UserDetailsImpl;

import java.util.ArrayList;
import java.util.Collection;

@Component
public class UserToUserDetails implements Converter<User, UserDetails> {
    @Override
    public UserDetails convert(User user) {
        UserDetailsImpl userDetails = new UserDetailsImpl();

        if (user != null) {
            userDetails.setUsername(user.getUsername());
            userDetails.setPassword(user.getEncryptedPassword());
            userDetails.setEnabled(user.getEnabled());
            Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
            
            for(Role role:user.getRoles()){
            	authorities.add(new SimpleGrantedAuthority(role.getRole()));
            }
            	
            userDetails.setAuthorities(authorities);
        }

        return userDetails;
    }
}