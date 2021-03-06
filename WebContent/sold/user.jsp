<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/icheck/minimal/red.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">商城后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">        
		       ${sold.name}
        </a>
      </li>
    </ul>
  </div>
  
   <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/sold/index.jsp">首页</a></li>
        <li class="layui-nav-item">
          <a class="" href="javascript:;">商品管理</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/book/getAllBookOfMe">全部商品</a></dd>
            <c:forEach var="type" items="${types}">
           	 	<dd><a href="${pageContext.request.contextPath}/book/getAllBookByTypeOfMe?type=${type.tid}">${type.tname}</a></dd>
            </c:forEach>
            <dd><a href="${pageContext.request.contextPath}/sold/addBook.jsp">商品添加</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">订单管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/orderRecord/getAllOrder">订单列表</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:;">类型管理</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/type/getAllType">类型列表</a></dd>
                <dd><a href="${pageContext.request.contextPath}/admin/addType.jsp">类型增加</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:;">客服中心</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/talk/getBuyUser">查看信息</a></dd>
               
            </dl>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:;">商家信息</a>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/sold/soldMsg.jsp">商家信息</a></dd>
               
            </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>用户管理 - 用户列表</legend>
            <div class="layui-field-box">
              <hr>
              <table class="layui-table">
                  <thead>
                      <tr>                    
                      	<th>用户id</th>
                      	<th>用户电话</th>
                      	<th>学号</th>
                      	<th>用户真实姓名</th>
                      </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${pageInfo.list}" var="user">
                      <tr>                     
                      	<td>${user.uid}</td>
                      	<td>${user.tel}</td>
                      	<td>${user.sno}</td>
                      	<td>${user.name}</td>
                      </tr>        
                    </c:forEach>             
                  </tbody>
                  	  <tr style="text-align:center">
                  	  	<td colspan="3">
         	  			   <c:if test="${pageInfo.prePage!=0}">
                               <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageInfo.prePage}" class="layui-btn layui-btn-normal">上一页</a>
                           </c:if>
                           <c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
                               <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageNum.index}" class="layui-btn layui-btn-normal">${pageNum.index}</a>							
					      </c:forEach>
					      <c:if test="${pageInfo.nextPage!=0}">
						       <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageInfo.nextPage}"  class="layui-btn layui-btn-normal">下一页</a>			
                          </c:if>
                  	  	</td>
                  	  </tr>
              </table>
            </div>
        </fieldset>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <span id="mytime" style="font-size:10px;"></span>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/icheck/icheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/dw.js"></script>

<script type="text/javascript">
	function showTime() {
		nowtime = new Date();
		year = nowtime.getFullYear();
		month = nowtime.getMonth() + 1;
		date = nowtime.getDate();
		document.getElementById("mytime").innerText = year + "年" + month + "月" + date + "日" + nowtime.toLocaleTimeString();
	}
	setInterval("showTime()", 1000);
</script>

</body>
</html>