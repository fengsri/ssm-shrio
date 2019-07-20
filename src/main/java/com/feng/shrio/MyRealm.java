package com.feng.shrio;

import com.feng.enums.ErrorCodeEnum;
import com.feng.exception.BusinessException;
import com.feng.pojo.User;
import com.feng.service.UserSerice;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description 自定义realm
 * @Author fengwen
 * @Date 2019/7/19 22:00
 * @Version V1.0
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    UserSerice userSerice;

    @Override
    public String getName() {
        return "myRealm";
    }

    /**
     * 身份检验
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("======身份检验=====");
        /**
         * 获取用户名
         */
        String username = (String)authenticationToken.getPrincipal();

        /**
         * 假设通过用户名从数据库获取用户密码
         */
        User user = userSerice.findByUserName(username);
        if(user==null){
            throw new BusinessException(ErrorCodeEnum.LOGIN_ERROR);    // 抛出异常，可以不用关心
        }
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user,user.getUserPassword(), ByteSource.Util.bytes(user.getUserSalt()),getName());
        return simpleAuthenticationInfo;
    }


    /**
     * 授权
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        /**
         * 获取用户名
         */
        User user =(User)principalCollection.getPrimaryPrincipal();

        /**
         * 获取该用户对应的权限
         */
        List<String> listRole = new ArrayList<String>();
        listRole.add("user");
        listRole.add("admin");

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        for (String role:listRole) {
            authorizationInfo.addRole(role);
        }


        List<String> listPermssion = new ArrayList<String>();
        listPermssion.add("user:add");
        listPermssion.add("user:update");
        for (String permssion:listPermssion) {
            authorizationInfo.addStringPermission(permssion);
        }
        return authorizationInfo;
    }

    /**
     * 清楚缓存
     * @param principals
     */
    @Override
    protected void clearCache(PrincipalCollection principals) {
        Subject subject = SecurityUtils.getSubject();
        super.clearCache(subject.getPrincipals());
    }
}
