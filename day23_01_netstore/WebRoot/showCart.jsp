<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@include file="/header.jsp"%>
	<c:if test="${empty sessionScope.cart.items}">
	<h3>您没够买任何物品</h3>  
	</c:if>
    
    <c:if test="${!empty sessionScope.cart.items }">
    
    <h3>您购买的商品如下:</h3>
      <table border="1" width="438"  align="center">
         <th>书名</th>
         <th>数量</th>
         <th>单价</th>
         <th>小计</th>
         <th>操作</th>
         
          <c:forEach items="${sessionScope.cart.items}" var="me" varStatus="vs">
           <tr class="${vs.index%2==0?'odd':'even' }">
	     	<td>${me.value.book.name}</td>
	         <td><input type="type" id="quantity" value="${me.value.quantity}" size="2" onchange="changeNum(this,${me.value.quantity},'${me.value.book.id }')"/> </td>
	         <td>${me.value.book.price}</td>
	         <td>${me.value.money}</td>
	         <td>
   				<a href="javascript:delOneItem('${me.key}')">删除</a>
			</td>
     		</tr>
     </c:forEach>
         <tr>
           <td colspan="5">
             <a href="javascript:delAllItems()">清空购物车</a>
		             总数量是:${sessionScope.cart.totalQuantity}
		             应付款:${sessionScope.cart.totalMoney}
		       <a href="${pageContext.request.contextPath}/client/ClientServlet?op=genOrder">去结算</a>
           </td>
         </tr> 
      </table>
    
    
    </c:if>
    <script type="text/javascript">
    function delAllItems(){
      	var sure = window.confirm("确定删除该项吗?");
        if(sure){
          window.location.href="${pageContext.request.contextPath}/client/ClientServlet?op=delAllItems";
        }
      
    }
    
    
    function delOneItem(bookId){
       var sure = window.confirm("确定删除该项吗?");
        if(sure){
          window.location.href="${pageContext.request.contextPath}/client/ClientServlet?op=delOneItem&bookId="+bookId;
        }
    }
    
    
    function changeNum(inputObj,oldNum,bookId){
     var sure= window.confirm("确定要修该数量吗?");
     if(sure){
     	//修改新数量
     	 var num= inputObj.value;
     	   //验证:用户输入的必须是自然数
     		if(!/^[1-9][0-9]*$/.test(num)){
     		  alert("请输入正确的数量");
     		  return;
     		}
     		//提交给该服务器，修改该项的数量
     		window.location.href="${pageContext.request.contextPath}/client/ClientServlet?op=changeNum&num="+num+"&bookId="+bookId;
     		
        }else{
       //显示原来值
        inputObj.value=oldNum;
     
      	
       }    
      }
    
    
    </script>
    
    
  </body>
</html>
