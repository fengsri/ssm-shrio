package com.feng.web.controller;

import com.feng.service.UserSerice;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/19 23:50
 * @Version V1.0
 */
public abstract class BaseController {
    /**
     * 统一管理service
     */

    @Autowired
    UserSerice userSerice;
}
