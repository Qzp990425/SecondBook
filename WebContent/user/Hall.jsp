<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城首页</title>
<meta name="robots" content="index, follow" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<!-- Basic CSS Style (other styles are included in this file) -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/buttons.css"/>


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
    <div style="padding-left:1000px;">
		<form action="${pageContext.request.contextPath}/book/getBookByName" method="post">
			<input type="text" name="name">
			<input type="submit" value="查询">
		</form>
	</div>
    <!-- Start Content -->
    <div id="content">
								
        <!-- Start Slider Wrapper -->
        <div class="slider">
        <div class="top-glow"></div>
            <div class="slider-wrapper">
            <div class="top-shadow"></div>

                <!-- Start Nivo Slider -->
                <div class="theme-default">

                    <div id="nivoSlider" class="nivoSlider">
                        <img src="${pageContext.request.contextPath}/user/images/content/slider/slider_image_1.jpg" alt="" />
                        <a href="portfolio_post.html"><img src="images/content/slider/slider_image_2.jpg" alt="" title="This is an image with a link to the portfolio page." /></a>
                        <img src="${pageContext.request.contextPath}/user/images/content/slider/slider_image_3.jpg" alt="" />
                        <img src="${pageContext.request.contextPath}/user/images/content/slider/slider_image_4.jpg" alt="" title="#htmlcaption" />
                        <img src="${pageContext.request.contextPath}/user/images/content/slider/slider_image_5.jpg" alt="" />
                        <img src="${pageContext.request.contextPath}/user/images/content/slider/slider_image_6.jpg" alt="" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam consectetur semper orci eget venenatis. Donec non tellus magna." />
                    </div>

                    <div id="htmlcaption" class="nivo-html-caption">
                        <strong>This</strong> is an <em>HTML</em> caption with content about your <span style="color:#00AEFF;">services or products</span> with <a href="#">a link</a>.
                    </div>

                </div>
                <!-- End Nivo Slider -->

            <div class="bottom-shadow"></div>
            </div>
        <div class="bottom-glow"></div>
        </div>
        <!-- End Slider Wrapper -->

        <!-- Start Intro Text -->
        <div class="intro">
        <div class="horizon-line"></div>
            <div class="top-shadow"></div>
                <p>在这里你可以找到你想要的便宜的二手考研书籍</p>
            <div class="bottom-shadow"></div>
        <div class="horizon-line"></div>
        </div>
        <!-- End Intro Text -->

        <!-- Start Services -->
        <div class="services mosaic-wide">

            <!-- Start Service Box 1 -->
            <c:forEach var="book" items="${pageInfo.list}">
	            <div class="service-box one-fourth plus" style="height:490px;margin-right:30px;">
	                <div class="content" style="height:490px">
	                    <div class="mosaic-block" style="height:210px;">
	                        <a href="${pageContext.request.contextPath}/book/getBookByBId?bid=${book.bid}" class="mosaic-overlay">&nbsp;</a>
	                        <div class="mosaic-backdrop"><img src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" alt="" style="height:210px;width:210px;"/></div>
	                    </div>
	                    <div style="height:60px;display: inline-block;"><h2>${book.name}</h2></div>
	                    <div class="horizon-line"></div>
	                    <p style="padding-bottom:5px;">原价:<span class="strike">${book.price}元</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优惠价:${book.nowPrice}元</p>
	                    <p style="padding-bottom:5px;">剩余数量:${book.number}本</p>
	                    <p style="padding-bottom:5px;">商家:${book.soldUser.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/getUserByUid?uid=${book.uid}" class="myTalk">联系它</a></p>
	                    <div style="height:55px;padding-top:25px;">
	                    <a class="blue-button" style="width:78px;" href="${pageContext.request.contextPath}/book/readyBuy?bid=${book.bid}">立即购买</a>
	                    <a class="blue-button" style="width:78px;" href="${pageContext.request.contextPath}/shopCar/addBookIndex?bid=${book.bid}">加入购物车</a>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
            <!-- End Service Box 1 -->

			
        <div class="clear"></div>
        </div>
        <!-- End Services -->

        <!-- Start Projects -->
        <div class="projects">
        <div class="horizon-line"></div>
        <div>

	        <c:if test="${type!=null}">
	        	<c:if test="${pageInfo.prePage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageInfo.prePage}&type=${type}">上一页</a>
				</c:if>
				<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageNum.index}&type=${type}">${pageNum.index}</a>
				</c:forEach>
				<c:if test="${pageInfo.nextPage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageInfo.nextPage}&type=${type}">下一页</a>
				</c:if>
			</c:if>
			<c:if test="${type==null&&name==null}">
				<c:if test="${pageInfo.prePage!=0}">
	           		  <a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageInfo.prePage}">上一页</a>
	       		 </c:if>
	        	<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
	        		<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageNum.index}">${pageNum.index}</a>                               
	        	 </c:forEach>
	        	<c:if test="${pageInfo.nextPage!=0}">
	        		<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageInfo.nextPage}">下一页</a>       
	        	</c:if>
			</c:if>
			<c:if test="${type==null&&name!=null}">
				<c:if test="${pageInfo.prePage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageInfo.prePage}&name=${name}">上一页</a>
				</c:if>
				<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageNum.index}&name=${name}">${pageNum.index}</a>
				</c:forEach>
				<c:if test="${pageInfo.nextPage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageInfo.nextPage}&name=${name}">下一页</a>
				</c:if>
			</c:if>
	    </div>
        <!-- Start Carousel -->

        <!-- End Carousel -->

        <!-- End Projects -->

        <!-- Start Info Blocks -->

        <!-- End Info Blocks -->

    <div class="horizon-line"></div>  
    </div>
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
<input type="hidden" id="uid" value="${user.uid}">
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
		$(".blue-button").click(function(){
			if($("#uid").val() == "") {			
				alert("您还未登录，请先登录");
				window.location.href="/SecondBook/user/login.jsp";
				return false;			
			}
		})
		
		$(".myTalk").click(function(){
			if($("#uid").val() == "") {			
				alert("您还未登录，请先登录");
				window.location.href="/SecondBook/user/login.jsp";
				return false;			
			}
		})
	</script>
</body>
</html>