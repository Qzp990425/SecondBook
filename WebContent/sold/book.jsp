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
            <legend>商品管理 - 商品查询</legend>
            <div class="layui-field-box">
              <hr>
              <table class="layui-table">
                  <thead>
                      <tr>                    
                      	<th>图书编号</th>
                      	<th>图片</th>
                      	<th>图书名称</th>
                      	<th>图书原价</th>
                      	<th>图书现价</th>
                      	<th>图书数量</th>
                      	<th>图书类型</th>
                      	<th>图书状态</th>
                      	<th>图书操作</th>
                      </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${pageInfo.list}" var="book">
                      <tr>                     
                      	<td>${book.bid}</td>
                      	<td><img src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" ></td>
                      	<td>${book.name}</td>
                      	<td>￥${book.price}</td>
                      	<td>￥${book.nowPrice}</td>
                      	<td>${book.number}</td>
                      	<td><c:if test="${book.type==0}">数学</c:if>
                      		<c:if test="${book.type==1}">英语</c:if>
                      		<c:if test="${book.type==2}">政治</c:if>
                      		<c:if test="${book.type==3}">专业课</c:if>
                      	</td>
                      	<td>
                      		<c:if test="${book.status==0}">正在出售</c:if>
                      		<c:if test="${book.status==1}">已经下架</c:if>
                      	</td>
                      	<td>
                      		<c:if test="${book.status==0}"> <a href="${pageContext.request.contextPath}/book/putBook?bid=${book.bid}" class="layui-btn layui-btn-normal">下架</a></c:if>
                      		<c:if test="${book.status==1}"> <a href="${pageContext.request.contextPath}/book/pushBook?bid=${book.bid}" class="layui-btn layui-btn-normal">上架</a></c:if>
                      	</td>
                      </tr>        
                    </c:forEach>             
                  </tbody>
                  	  <tr style="text-align:center">
                  	  	<td colspan="10">
                  	  		<c:if test="${type==null}">
	         	  			   <c:if test="${pageInfo.prePage!=0}">
	                               <a href="${pageContext.request.contextPath}/book/getAllBookOfMe?pageNum=${pageInfo.prePage}" class="layui-btn layui-btn-normal">上一页</a>
	                           </c:if>
	                           <c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
	                               <a href="${pageContext.request.contextPath}/book/getAllBookOfMe?pageNum=${pageNum.index}" class="layui-btn layui-btn-normal">${pageNum.index}</a>							
						      </c:forEach>
						      <c:if test="${pageInfo.nextPage!=0}">
							       <a href="${pageContext.request.contextPath}/book/getAllBookOfMe?pageNum=${pageInfo.nextPage}"  class="layui-btn layui-btn-normal">下一页</a>			
	                          </c:if>
                          </c:if>
                           <c:if test="${type!=null}">
	         	  			   <c:if test="${pageInfo.prePage!=0}">
	                               <a href="${pageContext.request.contextPath}/book/getAllBookByTypeOfMe?pageNum=${pageInfo.prePage}&type=${type}" class="layui-btn layui-btn-normal">上一页</a>
	                           </c:if>
	                           <c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
	                               <a href="${pageContext.request.contextPath}/book/getAllBookByTypeOfMe?pageNum=${pageNum.index}&type=${type}" class="layui-btn layui-btn-normal">${pageNum.index}</a>							
						      </c:forEach>
						      <c:if test="${pageInfo.nextPage!=0}">
							       <a href="${pageContext.request.contextPath}/book/getAllBookByTypeOfMe?pageNum=${pageInfo.nextPage}&type=${type}"  class="layui-btn layui-btn-normal">下一页</a>			
	                          </c:if>
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
<input type="hidden" id="msg" value="${msg}">
    <script type="text/javascript">
		$(document).ready(function(){
		        //jQuery代码
		       var msg = $("#msg").val();
		       if(!isEmpty(msg)){
		             alert(msg);
		       }
		});
		function isEmpty(value){
		    if(value == null || value == "" || value == "undefined" || value ==  undefined || value == "null"){
		        return true;
		    }
		    else{
		        value = value.replace(/\s/g,"");
		        if(value == ""){
		            return true;
		        }
		        return false;
		    }
		}
	</script>
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