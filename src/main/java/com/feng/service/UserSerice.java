package com.feng.service;

import com.feng.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户service
 */
public interface UserSerice extends BaseService<User> {

    /**
     * 通过用户名查询用户
     * @param userName
     * @return
     */
    User findByUserName(String userName);


}
