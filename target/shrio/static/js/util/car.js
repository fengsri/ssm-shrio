/*
*@Name: 母婴商城
*@Author: xuzhiwen
*@Copyright:layui.com
*/

layui.define(['layer'],function(exports){
	var layer = layui.layer;

	
var car = {
  init : function(){
  		var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
  		var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
      var checkAll = document.getElementsByClassName('check-all'); //全选框
      var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
      var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
      var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
      //计算
      function getTotal(){
          var seleted = 0,price = 0;
          for(var i = 0; i < uls.length;i++){
        			if(uls[i].getElementsByTagName('input')[0].checked){
                seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
              }
      		}
          SelectedPieces.innerHTML = seleted;
          piecesTotal.innerHTML = '￥' + price.toFixed(2);
      }

      function fn1(){
        alert(1)
      }
      // 小计
      function getSubTotal(ul){
        var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
        var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
        var SubTotal = parseFloat(unitprice*count)
        ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
      }

      for(var i = 0;i < checkInputs.length;i++){
        checkInputs[i].onclick = function(){
          if(this.className === 'check-all check'){
            for(var j = 0;j < checkInputs.length; j++){
              checkInputs[j].checked = this.checked;
            }
          }
          if(this.checked == false){
            for(var k = 0;k < checkAll.length;k++){
              checkAll[k].checked = false;
            }
          }
          getTotal()
        }
      }

      for(var i = 0; i < uls.length;i++){
        uls[i].onclick = function(e){
          e = e || window.event;
          var el = e.srcElement;
          var cls = el.className;
          var input = this.getElementsByClassName('Quantity-input')[0];
          var less = this.getElementsByClassName('less')[0];
          var val = parseInt(input.value);
          var that = this;
          switch(cls){
            case 'add layui-btn':

                (function (){

                    $.ajax(
                        {
                            type:"post",
                            url:"http://localhost:8081/ShoppingCart/add",
                            data:{id:input.getAttribute("id")},
                            dataType:"json",
                            success:function (data) {
                                layer.msg(data.msg,{icon:6,time:500},function () {
                                    window.location.reload();
                                });

                            }
                        }
                    )
                })();

              // input.value = val + 1;
              getSubTotal(this)
              break;
            case 'less layui-btn':
              if(val > 1){
                  (function (){

                      $.ajax(
                          {
                              type:"post",
                              url:"http://localhost:8081/ShoppingCart/less",
                              data:{id:input.getAttribute("id")},
                              dataType:"json",
                              success:function (data) {
                                  layer.msg(data.msg, {icon: 6, time: 500}, function () {
                                      window.location.reload();
                                  });
                              }
                          }
                      )
                  })();

              }
              getSubTotal(this)
              break;
            case 'dele-btn':
              layer.confirm('你确定要删除吗',{
                yes:function(index,layero){
                    $.ajax({
                        type:"post",
                        url:"http://localhost:8081/ShoppingCart/delete",
                        data:{id:uls[index-1].getAttribute("id")},
                        dataType:"json",
                        success:function (data) {
                            layer.msg(data.msg,{icon:6,time:1000});
                            window.location.reload();
                        }
                    })
                   // layer.close(index);
                   //  that.parentNode.removeChild(that);
                }
              })

          }
          getTotal()
        }
      }
      batchdeletion.onclick = function(){
        if(SelectedPieces.innerHTML != 0){
          layer.confirm('你确定要删除所选吗',{
            yes:function(index,layero){

              var ids=new Array();
              for(var i = 0;i < uls.length;i++){
                var input = uls[i].getElementsByTagName('input')[0];
                if(input.checked){
                  ids[i]=uls[i].getAttribute("id");
                }

              }
                $.ajax({
                    url:"http://localhost:8081/ShoppingCart/deleteAll",
                    data:{ids:ids.toString()},
                    dataType:"json",
                    success:function (data) {
                        layer.msg(data.msg,{icon:1,time:1000});
                         window.location.reload();
                    }
                })
              getTotal() 
            }

          })
        }else{
          layer.msg('请选择商品')
        }
        
      }
        checkAll[0].checked = true;
        checkAll[0].onclick();
  	  }  	

  }


  exports('car',car)
}); 