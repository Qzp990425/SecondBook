<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Basic CSS Style (other styles are included in this file) -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/buttons.css"/>

<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="css/ie8.css" media="all" />
<![endif]-->

<!-- JavaScript Files -->
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery.carouFredSel-5.5.5-packed.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/mosaic.1.0.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/custom.js"></script>

<script type="text/javascript">

$(window).load(function() {

    // Equal Column Height

    var biggestHeight = 0;

    $('ul.image-grid li').each(function(){
        if($(this).height() > biggestHeight){
            biggestHeight = $(this).height();
        }
    });
    
    $('ul.image-grid li').height(biggestHeight);
});

$(document).ready(function() {

    // Image Overlays

    $('.lower-panel').mosaic({
        animation: 'slide'
    });

    $('.upper-panel').mosaic({
        animation: 'slide',
        anchor_y: 'top'
    });

    $('.zoom').mosaic({
        opacity: 0.7
    });

    $('.play').mosaic({
        opacity: 0.7
    });

    // prettyPhoto

    $("#filter a[rel^='prettyPhoto']").prettyPhoto({
        theme: 'light_square', // or "dark_square" for dark style
        animation_speed: 'fast',
        overlay_gallery: false
    });

    // Circle

    $('.multi').cycle({
        fx: 'scrollVert',
        speed: 500,
        timeout: 0,
        next: '#down',
        prev: '#up'
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
                <div class="social">
                    <ul>
	
                    </ul>
                </div>
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
    <div id="content" style="padding-bottom:0px;">

        <!-- Start Topbar -->
        <div class="topbar">
            <div class="left"><h1>书籍 / <em>${book.name}</em></h1></div>

            <!-- Start Portfolio Categories -->
            <!-- End Portfolio Categories -->

        </div>
        <!-- End Topbar -->

        <!-- Start Portfolio -->
        <div class="fullwidth" style="height:550px;">
            <div class="complex one" style="height:550px;">

            <!-- Start Full Description Portfolio -->
            <ul id="filter" class="image-grid one-column mosaic-large" style="height:550px;" >

                <!-- Start Portfolio Item -->
               <li id="id-1" class="graphic" style="height:550px;">
                    <div class="imagebox left" style="height:550px;">
                        <div class="mosaic-block zoom" style="height:550px;width:450px;">                                        
                            <div class="mosaic-backdrop"><img src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" alt="" style="width:500px;height:500px;"/></div>
                        </div>
                    </div>
                    <div class="project-info right">
                        <h3>${book.name}</h3>
                        <p>简介:${book.introduction}</p>
                        <div class="project-details">
                            <span><strong>书籍类型:</strong>${book.bookType.tname}</span>
                            <span><strong>现价:</strong>${book.nowPrice}</span>
                            <span><strong>提供商家:</strong>${book.soldUser.name}</span>
                            <p><a class="blue-button" style="width:78px;" href="${pageContext.request.contextPath}/user/getUserByUid?uid=${book.uid}">联系商家</a></p>
                            <p><a class="blue-button" style="width:78px;" href="${pageContext.request.contextPath}/shopCar/addBookIndex?bid=${book.bid}">加入购物车</a></p>
                            
                        </div>
                    </div>
                </li>
                <!-- End Portfolio Item -->

            </ul>
            <!-- End Full Description Portfolio -->

            </div>
        </div>
        <!-- End Portfolio -->

    <div class="horizon-line"></div>
    </div>
    <!-- End Content -->

</div>
<!-- End Wrapper -->

<!-- Start Footer -->

    <!-- End Footer Blocks -->

    <!-- Start Bottom Panel -->
   
    <!-- End Bottom Panel -->

<!-- End Footer -->
<input type="hidden" id="uid" value="${user.uid}">
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
	<script>
		$(".blue-button").click(function(){
			if($("#uid").val() == "") {			
				alert("您还未登录，请先登录");
				window.location.href="/SecondBook/user/login.jsp";
				return false;			
			}
		})
	</script>
</html>