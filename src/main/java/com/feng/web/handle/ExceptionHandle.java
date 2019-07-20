package com.feng.web.handle;

import com.feng.comment.ResultUtil;
import com.feng.comment.ResultVo;
import com.feng.enums.ErrorCodeEnum;
import com.feng.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description 全局异常处理器
 * @Author chenlinghong
 * @Date 2019/4/21 21:17
 * @Version V1.0
 */
@Slf4j
@ControllerAdvice
public class ExceptionHandle {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResultVo handle(Exception e) {
        if (e instanceof BusinessException) {
            BusinessException baseException = (BusinessException) e;
            System.out.println("====="+e.getMessage());
            return ResultUtil.error(baseException.getCode(), baseException.getMessage());
        }else if(e instanceof AuthorizationException){
            //如果没有权限，捕获错误
            System.out.println("====="+e.getMessage());
            return ResultUtil.error(ErrorCodeEnum.NOT_HAVE_ERROR);
        } else {
            log.error("【系统异常】{}", e);
            return ResultUtil.error(ErrorCodeEnum.UNKOWN_ERROR);
        }
    }
}
