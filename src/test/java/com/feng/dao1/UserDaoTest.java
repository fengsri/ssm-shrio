package com.feng.dao1;

import com.feng.dao.UserDao;
import com.feng.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/19 23:11
 * @Version V1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-dao.xml")
public class UserDaoTest {

    @Autowired
    private UserDao userDao;
    @Test
    public void findByUserName(){
        User user = userDao.findByUserName("feng");
        System.out.println(user);
    }


}
