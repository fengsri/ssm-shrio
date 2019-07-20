package com.feng.service.impl;

import com.feng.pojo.User;
import com.feng.service.UserSerice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/19 23:46
 * @Version V1.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends BaseServiceImpl implements UserSerice {

    @Override
    public User findById(Integer id) {
        return null;
    }

    @Override
    public boolean deleteById(Integer id) {
        return false;
    }

    @Override
    public boolean update(User user) {
        return false;
    }

    @Override
    public boolean insert(User user) {
        return false;
    }

    @Override
    public long count() {
        return 0;
    }

    /**
     * 通过用户进行查询用户信息
     *
     * @param userName
     * @return
     */
    @Override
    public User findByUserName(String userName) {
        User user = userDao.findByUserName(userName);
        if (user == null) {

        }
        return user;
    }
}
