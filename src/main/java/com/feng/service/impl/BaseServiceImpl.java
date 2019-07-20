package com.feng.service.impl;

import com.feng.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description 统一管理dao
 * @Author fengwen
 * @Date 2019/7/19 23:47
 * @Version V1.0
 */
public abstract class BaseServiceImpl {

    @Autowired
    UserDao userDao;

}
