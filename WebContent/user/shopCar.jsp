<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的账单</title>
<meta name="robots" content="index, follow" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<!-- Basic CSS Style (other styles are included in this file) -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/buttons.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/bootstrap.min.css"/>


<!-- JavaScript Files -->
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery.carouFredSel-5.5.5-packed.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/mosaic.1.0.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/custom.js"></script>

<script type="text/javascript">

// Nivo Slider

$(window).load(function() {
    $('#nivoSlider').nivoSlider({
        effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
        animSpeed: 500, // Slide transition speed
        pauseTime: 5000, // How long each slide will show
        startSlide: 0, // Set starting Slide (0 index)
        captionOpacity: 0.8 // Universal caption opacity
    });
});

// Image Overlays

$(document).ready(function() {

    $('.plus').mosaic({
        opacity: 0.7
    });

// var $whatever        = $('.grandchild');
// var ending_right     = window.innerWidth - $whatever.offset().left + $whatever.outerWidth();
// alert(ending_right);

});

// Carousel

$(window).load(function() {
    $('#carousel ul').carouFredSel({
        items: 4,
        scroll: {
        items: 4,
        // pauseDuration: 5000, // uncomment this line when "auto" option is true
        duration: 1000
        },
        auto: false,
        prev: '#prev',
        next: '#next'
    });
});

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
    	<form action="${pageContext.request.contextPath}/orderRecord/insertOrder">
		<table class="table">
			<tr>
				<th>商品名称</th>
				<th>商品图片</th>
				<th>提供商家</th>
				<th>原价</th>
				<th>现价</th>
				<th>购买数量</th>
				<th>库存数量</th>
				<th>总计</th>
				<th>操作</th>
			</tr>
			
			<c:forEach var="shopCar" items="${shopCars}">
				<input type="hidden" value="${shopCar.book.uid}" name="soldId">
				<input type="hidden" value="${shopCar.sid}" name="sid">
				<input type="hidden" value="${shopCar.book.bid}" name="bid">
				<tr>					
					<td>${shopCar.book.name}</td>
					<td><img src="${pageContext.request.contextPath}/bookImg/${shopCar.book.uuid}.jpg" style="width:100px;height:100px;"/></td>
					<td>${shopCar.book.soldUser.name}</td>
					<td>${shopCar.book.price}元</td>
					<td>${shopCar.book.nowPrice}元</td>
					<td><input type="hidden" value="${shopCar.book.number}"><input type="hidden" value="${shopCar.book.nowPrice}"><input class="myNum" type="number" value="1" name="number" style="width:50px;">本</td>
					<td>${shopCar.book.number}本</td>
					<td>${shopCar.book.nowPrice}元</td>
					<td><a class="blue-button" href="${pageContext.request.contextPath}/shopCar/deleteById?sid=${shopCar.sid}">删除</a></td>
				</tr>
				<input type="hidden" value="${shopCar.book.nowPrice}" name="price">
			</c:forEach>
		</table>
       
    <div class="horizon-line"></div>
      	<c:if test="${addresses==null}">
  			<script>
  				alert("您还没有填入收货地址，请到个人中心填写");
				window.location.href="/SecondBook/orderRecord/getOrderByUid";
  			</script>
  		</c:if>
    	<p style="padding-left:750px;">
  		选择收货地址
  		<select name="name">
	  		<c:forEach var="address" items="${addresses}">
	  			<option value="${address.name}">${address.name}</option>
	  		</c:forEach>
  		</select>
  		</p>
  		<input type="submit" class="blue-button" style="width:78px;float:right;" value="立即支付">
  		</form>
    </div>
    <!-- End Content -->
    <!-- End Content -->

</div>
<!-- End Wrapper -->

<!-- Start Footer -->
<div id="footer" style="height:100px;">
    
    <div class="footer-shadow"></div>
    <div class="horizon-line"></div>

    <!-- Start Footer Blocks -->
    <div class="footer-bg">
    <div class="into-footer">

        <!-- Start Subscribe -->

        <!-- End Subscribe -->

        <!-- Start Recent Posts -->

        <!-- End Recent Posts -->

        <!-- Start Get in Touch -->

        <!-- End Get in Touch -->

    </div>
    </div>
    <!-- End Footer Blocks -->

    <!-- Start Bottom Panel -->
    <div id="bottom">
        <div class="into-bottom">
            <span class="left">Casework &copy; 2013. All Rights Reserved.</span>            <div class="backtop" id="toTop" title="Back to Top"></div>
        </div>
    </div>
    <!-- End Bottom Panel -->

</div>
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

		function changeCode(){	

	         var src = "getVerifyCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
	 
	    		$('#security_code').attr("src",src);                  //jQuery写法
		     
		}
	</script>
	
	<script>
		$(".myNum").change(function(){
			var num = $(this).val();
			var allNum = $(this).prev().prev().val();
			if(allNum*1 >= num*1) {
				var price = $(this).prev().val();
				var total = price*1*num*1;
				$(this).parent().next().next().text(total+"元");
				$(this).parent().parent().next().val(total);
			} else {
				alert("超出库存");
				$(this).val(1);
				var price = $(this).prev().val();
				$(this).parent().next().next().text(price+"元");
				$(this).parent().parent().next().val(price);
			}
		})
		
	</script>
</body>
</html>