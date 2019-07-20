package com.feng.dao;

import com.feng.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户dao
 */
public interface UserDao extends BaseDao<User> {

    /**
     * 通过用户名查询用户
     * @param userName
     * @return
     */
    User findByUserName(@Param(value = "userName") String userName);


}
