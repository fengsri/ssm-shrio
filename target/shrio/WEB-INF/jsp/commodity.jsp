<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shrio" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">

  <script type="text/javascript" src="/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login">
          <shrio:notAuthenticated>
            <a href="${pageContext.request.contextPath }/user1/toLogin2">登陆</a>&nbsp;
            <a href="${pageContext.request.contextPath }/user1/toRegister">注册</a>
          </shrio:notAuthenticated>
          <shrio:authenticated>
            <a href="${pageContext.request.contextPath}/order/orderCenter">${user.userName}</a>
          </shrio:authenticated>
        </div>
        <div class="sp-cart"><a href="${pageContext.request.contextPath }/ShoppingCart/mylist">购物车</a></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="西华农产品销售">
            <h2>西华农产品销售网</h2>
          </a>
        </h1>
        <div class="mallSearch">
          <form action="${pageContext.request.contextPath}/agriProducts/findByName" class="layui-form" novalidate>
            <input id="likeName" type="text" name="likeName" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button id="likeButton" class="layui-btn" lay-submit lay-filter="formDemo" type="submit">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base commodity-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="${pageContext.request.contextPath}/userIndex?tag=1" class="active">所有商品</a>
            <%--<a href="${pageContext.request.contextPath}/commodity/about">关于我们</a>--%>
          </div>
        </div>
      </div>
    </div>
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="left-nav">
          <div class="title">所有分类</div>
          <div class="list-box">
            <dl>
              <dt><a href="${pageContext.request.contextPath}/agriProducts/userIndex?proTypeId=2001">水果</a></dt>
            </dl>
            <dl>
              <dt><a href="${pageContext.request.contextPath}/agriProducts/userIndex?proTypeId=2002">禽畜肉蛋</a></dt>
            </dl>
            <dl>
              <dt><a href="${pageContext.request.contextPath}/agriProducts/userIndex?proTypeId=2003">水产</a></dt>
            </dl>
            <dl>
              <dt><a href="${pageContext.request.contextPath}/agriProducts/userIndex?proTypeId=2004">蔬菜</a></dt>
            </dl>
          </div>
        </div>
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="sort layui-clear">
              <a class="active" href="javascript:;" event = 'volume'>销量</a>
              <a href="javascript:;" event = 'price'>价格</a>
              <a href="javascript:;" event = 'newprod'>新品</a>
              <a href="javascript:;" event = 'collection'>收藏</a>
            </div>
            <div class="prod-number">
              <span>${agriProductsCount}个</span>
            </div>
            <div class="cont-list layui-clear" id="list-cont">
              <c:forEach var="pro" items="${list}">
              <div class="item">
                <div class="img">
                  <a href="${pageContext.request.contextPath}/prodetails?id=${pro.id}"><img style="height: 242px;width: 192px" src="${pro.proPictureUrl}"></a>
                </div>
                <div class="text">
                  <p class="title">${pro.proName}</p>
                  <p class="price">
                    <span class="pri">${pro.proSprice}</span>
                    <span class="nub">${pro.proDese}</span>
                  </p>
                </div>
              </div>
              </c:forEach>

              </div>
            <div class="page">
              <div>
              <c:if test="${empty likeName}">
                <c:if test="${pageInfo.hasPreviousPage}">
                  <a class="prev" href="${pageContext.request.contextPath}/userIndex?page=${pageInfo.prePage}">&lt;&lt;</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="p">
                  <c:if test="${pageInfo.pageNum == p}">
                    <span class="current">${p}</span>
                  </c:if>
                  <c:if test="${pageInfo.pageNum != p}">
                    <a class="num" href="${pageContext.request.contextPath}/userIndex?page=${p}">${p}</a>
                  </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                  <a class="next" href="${pageContext.request.contextPath}/userIndex?page=${pageInfo.nextPage}">&gt;&gt;</a>
                </c:if>
              </c:if>


                <c:if test="${not empty likeName}">
                  <c:if test="${pageInfo.hasPreviousPage}">
                    <a class="prev" href="${pageContext.request.contextPath}/agriProducts/findByName?page=${pageInfo.prePage}">&lt;&lt;</a>
                  </c:if>
                  <c:forEach items="${pageInfo.navigatepageNums}" var="p">
                    <c:if test="${pageInfo.pageNum == p}">
                      <span class="current">${p}</span>
                    </c:if>
                    <c:if test="${pageInfo.pageNum != p}">
                      <a class="num" href="${pageContext.request.contextPath}/agriProducts/findByName?page=${p}">${p}</a>
                    </c:if>
                  </c:forEach>
                  <c:if test="${pageInfo.hasNextPage}">
                    <a class="next" href="${pageContext.request.contextPath}/agriProducts/findByName?page=${pageInfo.nextPage}">&gt;&gt;</a>
                  </c:if>
                </c:if>
              </div>
            </div>
            </div>

            <!-- 模版引擎导入 -->
            <script type="text/html" id="demo">
              {{# layui.each(d.menu.milk.content,function(index,item){}}
                <div class="item">
                  <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                  </div>
                  <div class="text">
                    <p class="title"></p>
                    <p class="price">
                      <span class="pri">{{item.pri}}</span>
                      <span class="nub">{{item.nub}}</span>
                    </p>
                  </div>
                </div>
              {{# }); }}
            </script>
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script>

/*  $("#likeButton").click(function () {
      var likeName = $("#likeName").getAttribute("val");
      console.log(likeName)
      $.ajax({
          type: "get",// 提交表单的方法
          url:"${pageContext.request.contextPath}/agriProducts/findByName?likeName="+likeName,// 对应登陆接口的路径
          dataType: "json",// 服务端返回的数据类型
          success:function (data) {// 服务器返回数据之后的回调函数
              layer.msg(data.msg,function(){
                  if(data.code == 0000){
                      location.href='${pageContext.request.contextPath}/userIndex';
                      console.log("aaaa");
                  }
              });
          }
      });
  });*/



/*  layui.config({
    base: '//static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
      var laypage = layui.laypage,$ = layui.$,
     mm = layui.mm;
       laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });


    // 模版引擎导入
     var html = demo.innerHTML;
     var listCont = document.getElementById('list-cont');
     // console.log(layui.router("#/about.html"))
    mm.request({
        url: '../userIndex',
        success : function(res){
          console.log(res)
          listCont.innerHTML = mm.renderHtml(html,res)
        },
        error: function(res){
          console.log(res);
        }
      })

    $('.sort a').on('click',function(){
      $(this).addClass('active').siblings().removeClass('active');
    })
    $('.list-box dt').on('click',function(){
      if($(this).attr('off')){
        $(this).removeClass('active').siblings('dd').show()
        $(this).attr('off','')
      }else{
        $(this).addClass('active').siblings('dd').hide()
        $(this).attr('off',true)
      }
    })

});*/
</script>


</body>
</html>