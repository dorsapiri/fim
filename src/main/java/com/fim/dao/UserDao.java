package com.fim.dao;




import com.fim.model.User;

import java.util.List;

/**
 * Created by dorsa on 1/9/17.
 */
public interface UserDao {
    User findById(int id);

    User findBySSO(String sso);

    void save(User user);

    void deleteBySSO(String sso);

    List<User> findAllUsers();
}
