<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/style.css" media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/bootstrap.min.css">
	<style type="text/css">
		
		.talk_main{
			width:800px;
		 	margin:50px auto 0;
		 	height:600px;
		}
		
		.talk_top{
			width:600px;
			height:50px;
			border:1px solid #666;
			background:#ffffff;
		}
		
		.talk_left{
			width:150px;
			height:550px;
			border:1px solid #666;			
			background:#ffffff;
			float:left;
		}
		.talk_left ul li{
			height:40px;
			border-bottom:1px solid #666;	
		}
		.talk_right{
			float:left;
		}
        .talk_con{
            width:600px;
            height:500px;
            border:1px solid #666;
            background:#f9f9f9;
        }
        .talk_show{
            width:580px;
            height:420px;
            border:1px solid #666;
            background:#fff;
            margin:10px auto 0;
            overflow:auto;
        }
        .talk_input{
            width:580px;
        }
        .whotalk{
            width:80px;
            height:30px;
            float:left;
            outline:none;
        }
        .talk_word{
            width:500px;
            height:26px;
            padding:0px;
            float:left;
            margin-left:10px;
            outline:none;
            text-indent:10px;
        }        
        .talk_sub{
            width:56px;
            height:30px;
            float:left;
            margin-left:10px;
        }
        .atalk{
           margin:10px; 
        }
        .atalk span{
            display:inline-block;
            background:#0181cc;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
        .btalk{
            margin:10px;
            text-align:right;
        }
        .btalk span{
            display:inline-block;
            background:#ef8201;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
    </style>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="css/ie8.css" media="all" />
<![endif]-->

<!-- JavaScript Files -->
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/sdmenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/ddaccordion.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/custom.js"></script>
<script type="text/javascript">

// Sidebar Menu

var sidebarMenu;
window.onload = function() {
    sidebarMenu = new SDMenu("sidebar_menu");
    sidebarMenu.speed = 5;                     // Menu sliding speed (1 - 5 recomended)
    sidebarMenu.remember = true;               // Store menu states (expanded or collapsed) in cookie and restore later
    sidebarMenu.oneSmOnly = false;             // One expanded submenu at a time
    sidebarMenu.markCurrent = true;            // Mark current link / page (link.href == location.href)
    sidebarMenu.init();

    var firstSubmenu = sidebarMenu.submenus[0];
    sidebarMenu.expandMenu(firstSubmenu);      // Expand a submenu
};

// Tabbed Content
    
$(document).ready(function(){
    //<![CDATA[

    function createCookie(name,value,days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime()+(days*24*60*60*1000));
            var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/";
    }
    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }
    function eraseCookie(name) {
        createCookie(name,"",-1);
    }

    $('ul.tabs').each(function(i) {
        var cookie = readCookie('tabCookie'+i);
        if (cookie) $(this).find('li').eq(cookie).addClass('current').siblings().removeClass('current')
            .parents('div.tabbed-content').find('div.box').hide().eq(cookie).show();
    })

    $('ul.tabs').delegate('li:not(.current)', 'click', function() {
        $(this).addClass('current').siblings().removeClass('current')
            .parents('div.tabbed-content').find('div.box').hide().eq($(this).index()).show();
        var ulIndex = $('ul.tabs').index($(this).parents('ul.tabs'));
        eraseCookie('tabCookie'+ulIndex);
        createCookie('tabCookie'+ulIndex, $(this).index(), 365);
    })

    //]]>
});

// Toggle Panel

ddaccordion.init({
    //<![CDATA[

    headerclass: "toggle-title", 
    contentclass: "toggle-content", 
    revealtype: "click", 
    mouseoverdelay: 2000, 
    collapseprev: true, 
    defaultexpanded: [3], 
    onemustopen: true, 
    animatedefault: true,
    persiststate: true,
    toggleclass: ["close-toggle", "open-toggle"], 
    togglehtml: ["prefix", "<img src='images/minus.png' alt='' style='width:11px; height:11px; margin-top:13px; float:left;' /> ", "<img src='images/plus.png' alt='' style='width:11px; height:11px; margin-top:13px; float:left;' /> "], 
    animatespeed: "fast", 
    oninit:function(expandedindices){ 
    },
    onopenclose:function(header, index, state, isuseractivated){        
    }

    //]]>
})

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


</head>

<body>

<!-- Start Wrapper -->
<div id="wrapper">

    <!-- Start Header -->
    <div class="top-header"></div>

    <div id="header">
        <div class="into-header">

            <!-- Start Logo -->
            <div class="logo">
                <a href="${pageContext.request.contextPath}/book/getBookOnSale"><img src="${pageContext.request.contextPath}/user/images/logo.png" alt="Casework | Design Studio" title="Casework | Design Studio" /></a>
            </div>
            <!-- End Logo -->

            <!-- Start Top Menu -->
            <div class="topmenu">

                <!-- Start Dropdown Menu -->
                 <ul id="menu" class="menu-nav">

                    <li class="parent current"><a href="${pageContext.request.contextPath}/book/getBookOnSale">主页</a>
                    </li>
					<c:forEach var="type" items="${types}">
                    <li class="parent"><a href="${pageContext.request.contextPath}/book/getBookOnSaleByType?type=${type.tid}">${type.tname}</a>
                    </li>
					</c:forEach>
                    <c:if test="${user!=null}">
                    	<li><a href="${pageContext.request.contextPath}/shopCar/getShopCar">我的购物车</a></li>
                    	<li><a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid">个人中心</a></li>
                    </c:if>

					<c:if test="${user==null}">
                    	<li><a href="${pageContext.request.contextPath}/user/login.jsp">去登陆</a></li>
                    </c:if>
                    <span id="mytime" style="font-size:10px;position: absolute;top: 70px;left: 1010px;">
             		</span>
                </ul>
                <!-- End Dropdown Menu -->

                <!-- Start Social -->
                <!-- End Social -->

            </div>
            <!-- End Top Menu -->

            <div class="clear"></div>
        </div>
    </div>

    <div class="horizon-line"></div>  
    <div class="header-shadow"></div>
    <!-- End Header -->

    <!-- Start Content -->
    <div id="content">
    	<!-- Start Vertical Tabs -->
       <div class="tabbed-content vertical" style="width:1000px;">

           <ul class="tabs">
               <li class="current">首页</li>
               <li>我的账户</li>
               <li>我的收货地址</li>
               <li>订单查询</li>
           </ul>

           <div class="box visible">
               <p>欢迎您来到您的后台管理界面</p><br />
               
           </div>

           <div class="box">
					<p>学号:${user.sno}</p>
					<p>姓名:${user.name}</p>
					<p>手机号:${user.tel}</p>
					<p>创建时间:${user.createTime}</p>
                    <p>账户余额:${user.account}元</p>
                    
                            
					<p>----------------------------------------</p>
					修改密码
                    <p><label>输入您想要的新密码</label></p>
                    <form action="${pageContext.request.contextPath}/user/updatePwd">
	                    <input type="hidden" name="uid" value="${user.uid}">
	                    <input type="password" name="password"/>                        
	
	                     <input type="submit" class="blue-button" id="send_message" value="登录">
					</form>
					<p>----------------------------------------</p>
					账户充值
					<p><label>输入您想要充值的数额</label></p>
					<form action="${pageContext.request.contextPath}/user/addAccount">
						<input type="hidden" name="uid" value="${user.uid}">
	                    <input type="text" name="account">
		                <input type="submit" class="blue-button" id="send_message" value="充值">
                    </form>
           </div>

           <div class="box">
              	<table>
              		<tr>
              			<th>名称</th>
              			<th>操作</th>
              		</tr>
              		<c:forEach var="address" items="${addresses}">
	              		<tr>
	              			<td>${address.name}</td>
	              			<td>
	              				<a class="blue-button" href="${pageContext.request.contextPath}/address/deleteAddress?aid=${address.aid}">删除</a>
	              				<a class="blue-button mybtn" href="#">编辑</a>
	              				<input type="hidden" value="${address.aid}">
	              				<input type="hidden" value="${address.name}">
	              			</td>
	              		</tr>
              		</c:forEach>
              	</table>
              	<p>----------------------------------------</p>
              	<p>新增地址</p>
              	<form action="${pageContext.request.contextPath}/address/addAddress" method="post">
              		地址:<input type="text" name="name">
              		<input type="submit" value="新增" class="blue-button">
              	</form>
              	
              	<p>----------------------------------------</p>
              	<p>编辑地址</p>
              	<form action="${pageContext.request.contextPath}/address/updateAddress" method="post">
              		<input type="hidden" name="aid" id="aid">
              		地址:<input type="text" name="name" value="" id="name">
              		<input type="submit" value="修改" class="blue-button">
              	</form>
              	
           </div>

           <div class="box">
               <table class="table">
					<tr>

                      <th>订单编号</th>
                      <th>商品图片</th>
                      <th>商品名称</th>
                      <th>商家名称</th>
                      <th>商品单价</th>
                      <th>购买数量</th>
                      <th>状态</th>
                      <th>生成订单时间</th>
                      <th>商品发货时间</th>
                      <th>收货时间</th>
                      <th>操作</th>
					</tr>
					
					<c:forEach items="${pageInfo.list}" var="order">
                            <tr>
                                <td>${order.uuid}</td>
                                <td><img src="${pageContext.request.contextPath}/bookImg/${order.book.uuid}.jpg" style="width:100px;" /></td>
                                <td>${order.book.name}</td>
                                <td>${order.book.price}</td>
                                <td>${order.soldUser.name}</td>
                                <td>${order.number}</td>
                                <td><c:if test="${order.status==0}">等待卖家发货</c:if>
                                	<c:if test="${order.status==1}">等待用户收货</c:if>
                                	<c:if test="${order.status==2}">完成</c:if>
                                </td>
                                <td>${order.createTime}</td>
                                <td>${order.sendTime}</td>
                                <td>${order.doneTime}</td>
                                <td>
                                	<c:if test="${order.status==1}">
                                	<a href="${pageContext.request.contextPath}/orderRecord/doneOrder?oid=${order.oid}" class="btn btn-primary">收货</a>
                                	</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                         <tr><td colspan="10" id="btnClick" style="text-align:center;">
                        	<c:if test="${pageInfo.prePage!=0}">
                        		<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageInfo.prePage}" class="btn btn-primary">上一页</a>
                        	</c:if>
                        	<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
                        		<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageNum.index}" class="btn btn-primary">${pageNum.index}</a>					
							</c:forEach>
							<c:if test="${pageInfo.nextPage!=0}">
								<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageInfo.nextPage}" class="btn btn-primary">下一页</a>			
                     		</c:if>
                        </td></tr>
				</table>
           </div>
           
          
           	
           </div>

       
    <div class="horizon-line"></div>
    </div>
    <!-- End Content -->
    <!-- End Content -->
</div>
</div>
<!-- End Wrapper -->

<!-- Start Footer -->

<!-- End Footer -->
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
		
	<script>
		$(".mybtn").click(function(){
			var aid = $(this).next().val();
			var name = $(this).next().next().val();
			$("#aid").val(aid);
			$("#name").val(name);
			return false;
		})
	</script>
</body>
</html>