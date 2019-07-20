package com.feng.web.controller;

import com.feng.comment.ResultUtil;
import com.feng.comment.ResultVo;
import com.feng.constant.SessionConstant;
import com.feng.enums.ErrorCodeEnum;
import com.feng.exception.BusinessException;
import com.feng.pojo.User;
import com.feng.service.UserSerice;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/19 23:49
 * @Version V1.0
 */
@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    UserSerice userSerice;


    @RequestMapping(value = "toLogin")
    public String toLogin(){
        return "login";
    }


    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String username, String password, String code, HttpSession session) {
        if (username == null || password == null) {
            throw new BusinessException(ErrorCodeEnum.PARAMS_IS_NULL_ERROR);    // 抛出异常，可以不用关心
        }
        String imageCode  =(String) session.getAttribute(SessionConstant.IMAGE_CODE);
        if(!imageCode.equals(code)){
            throw new BusinessException(ErrorCodeEnum.IMAGE_CODE_ERROR2);
        }
        //初始化
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        //登录，即身份校验，由通过Spring注入的UserRealm会自动校验输入的用户名和密码在数据库中是否有对应的值
       try {
            //4、登录，即身份验证
            subject.login(token);
            if(subject.isAuthenticated()){
                User user = (User)subject.getPrincipal();
                session.setAttribute(SessionConstant.USER,user);
                System.out.println("登陆成功！！！");
                return "commodity";
            }
        } catch (AuthenticationException e) {
            //5、身份验证失败
           return "login";
        }
        return "login";
    }

}
