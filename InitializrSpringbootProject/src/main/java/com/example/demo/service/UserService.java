package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import static org.springframework.data.jpa.domain.Specification.where;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import com.auth0.jwt.algorithms.Algorithm;
import java.io.UnsupportedEncodingException;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder encoder;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder encoder) {
        this.userRepository = userRepository;
        this.encoder = encoder;
    }

//    public Page<User> findAllUser(String search, int page, int size) {
//        Pageable sortedByCreatedDateDesc
//                = PageRequest.of(page, size, Sort.by("createdDate").descending());
//        Page<User> result = userRepository.findAll(where(UserRepository.filterByCustomerID(search)), sortedByCreatedDateDesc);
//        return result;
//    }
    public User createUser(User user) {
        Optional<User> duplicateUser = userRepository.findByCustomerID(user.getCustomerID());
        if (duplicateUser.isPresent()) {
            throw new ResponseStatusException(
                    HttpStatus.INTERNAL_SERVER_ERROR, "This account exist!");
        } else {
            user.setAdmin(false);
            user.setFullname(user.getFullname());
            user.setEmail((user.getEmail()));
            user.setAge(user.getAge());
            user.setGender(user.getGender());
            user.setPhone(user.getPhone());
            user.setAddress(user.getAddress());
            user.setPassword(encoder.encode(user.getPassword()));
            return userRepository.save(user);
        }
    }

    public User createUserManage(User user) {
        Optional<User> duplicateUser = userRepository.findByCustomerID(user.getCustomerID());
        if (duplicateUser.isPresent()) {
            throw new ResponseStatusException(
                    HttpStatus.INTERNAL_SERVER_ERROR, "This account exist!");
        } else {
            user.setAdmin(true);
            user.setFullname(user.getFullname());
            user.setEmail((user.getEmail()));
            user.setAge(user.getAge());
            user.setGender(user.getGender());
            user.setPhone(user.getPhone());
            user.setAddress(user.getAddress());
            user.setPassword(encoder.encode(user.getPassword()));
            return userRepository.save(user);
        }
    }

    public User update(int id, User user) {
        User dto = userRepository.findById(id).get();
        dto.setAddress(user.getAddress());
        dto.setAge(user.getAge());
        dto.setEmail(user.getEmail());
        dto.setFullname(user.getFullname());
        dto.setGender(user.getGender());
        dto.setPhone(user.getPhone());
        
        return userRepository.save(dto);
    }

    public User getUserByUserName(String name) {
        User user = userRepository.findByCustomerID(name).get();
        return user;
    }
//
//    public List<User> getUserByName(String name) {
//        List<User> user = (List<User>) userRepository.findCustomerID(name);
//        return user;
//
//    }

    public Optional<User> findUserById(int id) {
//         Optional<User> user = userRepository.findById(id).get();
        return userRepository.findById(id);
    }

    public Iterable<User> findAllUser() {
        return userRepository.findAll();
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public boolean checkPassword(int id, String password) {
        User dto = userRepository.findById(id).get();
        return encoder.matches(password, dto.getPassword());
    }
    public void changePassword(int id, String password) {
        User dto = userRepository.findById(id).get();
        dto.setPassword(encoder.encode(password));
        userRepository.save(dto);
    }
}
