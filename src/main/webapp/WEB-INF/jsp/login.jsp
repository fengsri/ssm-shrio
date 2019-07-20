<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/static/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/static/res/layui/css/layui.css">
  <script type="text/javascript" src="/static/res/layui/layui.js"></script>
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <%--<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login">
          <a href="${pageContext.request.contextPath }/user1/toLogin2">登陆</a>&nbsp;
          <a href="${pageContext.request.contextPath }/user1/toRegister">注册</a>
        </div>
      </div>
    </div>
  </div>--%>


<%--

  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
            <img src="/static/res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>
--%>


  <div class="content content-nav-base  login-content">
    <%--<div class="main-nav">--%>
      <%--<div class="inner-cont0">--%>
        <%--<div class="inner-cont1 w1200">--%>
          <%--&lt;%&ndash;<div class="inner-cont2">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="commodity.html" class="active">所有商品</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="buytoday.html">今日团购</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="information.html">母婴资讯</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="about.html">关于我们</a>&ndash;%&gt;--%>
          <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form" action="${pageContext.request.contextPath}/user/login" method="post">
            <legend>用户登录</legend>
            <div class="layui-form-item">
              <div class="layui-inline iphone">
                <div class="layui-input-inline">
                  <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                  <input type="tel" name="username" id="userName"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline iphone">
                <div class="layui-input-inline">
                  <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                  <input type="password" id="password" name="password" id="userPassword" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline veri-code">
                <div class="layui-input-inline" style="display: flex;justify-content: space-between;align-items: flex-end">
                  <img id="imageCode" src="${pageContext.request.contextPath}/image/code" style="height: 38px;width: 100px">
                  <input id="pnum" type="text" name="code" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                <input value="登录" class="layui-btn"  style="width:100%;" type="submit">
               <%-- <button class="layui-btn" lay-submit="" lay-filter="demo1" id="loginBottom">登录</button>--%>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <%--<div class="mod_help w1200">
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">母婴资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>--%>
  </div>
  <script type="text/javascript">


  /* layui.config({
      base: '../res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','form'],function(){
          var $ = layui.$,form = layui.form;


       $("#imageCode").click(function () {
           $("#imageCode").attr("src","${pageContext.request.contextPath}/image/code?"+Math.random()*100000);
       })

      /!* layui.use('form', function(){
           var form = layui.form;
           // layer.msg('玩命卖萌中', function(){
           //   //关闭后的操作
           //   });
           //监听提交
           form.on('submit(login)', function(data){

               var userName = $("#userName").val();
               if(userName.length<3 || userName.length>10 || userName==""){
                   layer.msg("用户名在3-10位");
                   return false;
               }
               var password = $("#password").val();
               if(password==""){
                   layer.msg("密码不能为空");
                   return false;
               }

               var code = $("#pnum").val();
               if(code==""){
                   layer.msg("输入正确的验证码");
                   return false;
               }

              /!* $.ajax({
                   type: "post",// 提交表单的方法
                   url:"${pageContext.request.contextPath}/user/login",// 对应登陆接口的路径
                   data: {"username":userName,"password":password,"code":code},// 提交的数据
                   dataType: "json",// 服务端返回的数据类型
                   success:function (data) {// 服务器返回数据之后的回调函数
                       layer.msg(data.msg,function(){
                           if(data.code == 0000){
                              // location.href='${pageContext.request.contextPath}/index/toIndex';
                               console.log("aaaa");
                           }
                       });
                   }
               });*!/
               return false;
           });
       });*!/




        var countdown=60; 
        function settime(obj) { 
        if (countdown == 0) { 
            obj.removeAttribute("disabled"); 
            obj.classList.remove("layui-btn-disabled")
            obj.value="获取验证码"; 
            countdown = 60; 
            return;
        } else {
            obj.value="重新发送(" + countdown + ")"; 
            countdown--; 
        } 
        setTimeout(function() { 
            settime(obj) }
            ,1000) 
        }
    })*/
  </script>

</body>
</html>