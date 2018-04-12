package poc.spring.boot.service.impl;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poc.spring.boot.service.EncryptionService;

@Service("encryptionService")
public class EncryptionServiceImpl implements EncryptionService {

	@Autowired
    private StrongPasswordEncryptor strongEncryptor;

    public String encryptString(String input){
        return strongEncryptor.encryptPassword(input);
    }

    public boolean checkPassword(String plainPassword, String encryptedPassword){
        return strongEncryptor.checkPassword(plainPassword, encryptedPassword);
    }
}