package com.nandamonroe.bookclub.services;

import java.util.Optional;
    
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.nandamonroe.bookclub.models.LoginUser;
import com.nandamonroe.bookclub.models.User;
import com.nandamonroe.bookclub.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public User register(User newUser, BindingResult result) {
        
        // Reject if email is taken (present in database)
        if(userRepository.findByEmail(newUser.getEmail()).isPresent()){
            result.rejectValue("email", "Email", "Employee email already registered!!");
        }
     
        // Reject if password doesn't match confirmation
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("password", "Password", "Passwords don't match!!");
        }
        
        // Return null if result has errors
        if(result.hasErrors()){
            return null;
        }
    
        // Hash passowrd 
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        System.out.println(hashed);
    
        // Set password
        newUser.setPassword(hashed);
        

        // Save user to database
        return userRepository.save(newUser);
    
    }

    public User login(LoginUser newLoginObject, BindingResult result) {
        // Additional validations!
        System.out.println(newLoginObject);
        
        // Find user in the DB by email
        Optional<User> user = userRepository.findByEmail(newLoginObject.getEmail());

        // Reject if NOT present
        // Reject if BCrypt password match fails
        if(!user.isPresent()){
            result.rejectValue("email", "logEmail", "invalid credentials");
        } else if (!BCrypt.checkpw(newLoginObject.getPassword(), user.get().getPassword())){
            result.rejectValue("password", "logPassword", "invalid credentials");
        }
 
        // Return null if result has errors
        if(result.hasErrors()){
            return null;
        }

        // Otherwise, return the user object
        return user.get();
    }

    public User getOneUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElse(null);
    }
}