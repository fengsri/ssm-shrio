package com.feng.web.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/20 2:12
 * @Version V1.0
 */
@Controller
@RequestMapping(value = "index")
public class IndexController {

    @RequestMapping(value = "toIndex")
    @RequiresRoles(value = "feng")
    public String toIndex(){
        return "commodity";
    }

    @RequestMapping(value = "toUnauthorized")
    @RequiresRoles(value = "user")
    public String toUnauthorized(){
        return "unauthorized";
    }

}
