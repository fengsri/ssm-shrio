package com.feng.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Description
 * @Author fengwen
 * @Date 2019/7/19 23:27
 * @Version V1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User extends BasePojo implements Serializable {

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String userPassword;

    /**
     * 盐值
     */
    private String userSalt;

}
