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
    
        <!-- Start Carousel -->

        <!-- End Carousel -->

        <!-- End Projects -->
    <div class="talk_main">

	    <div class="talk_right">
		    <div class="talk_top" style="text-align:center;">
		    	<h2>客服交流-${soldUser.name}</h2>
		    </div>
			<div class="talk_con">
				<div id="my">
			        <div class="talk_show" id="words">
			        	<c:forEach var="talk" items="${talks}">	
			        		<c:if test="${talk.status==1}">	        	
					            <div class="atalk">	
					            	<p>${talk.soldUser.name}&nbsp;${talk.createTime}</p>
					           	 	<span id="asay">${talk.content}</span>
					            </div>
				            </c:if>
				            <c:if test="${talk.status==0}">	  
					            <div class="btalk">
					            	<p style="padding-left:425px;">${talk.buyUser.name}&nbsp;${talk.createTime}</p>
					            	<span id="bsay">${talk.content}</span>
					            </div>
				            </c:if>
			            </c:forEach>
			        </div>
		        </div>
		        <div class="talk_input">
		            <input type="text" class="talk_word" id="talkwords">
		            <input type="hidden" value="${user.uid}" name="buyId" id="buyId">
		            <input type="hidden" value="${soldUser.uid}" name="soldId" id="soldId">
		            <input type="button" value="发送" class="talk_sub" id="talksub">
		        </div>
		    </div>  
	    </div>
	</div>
        <!-- Start Info Blocks -->

        <!-- End Info Blocks -->

    <div class="horizon-line"></div>  
    </div>
    <!-- End Content -->
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
	
	<script type="text/javascript">
	var showContent = $(".talk_show");
	showContent[0].scrollTop = showContent[0].scrollHeight;
	$("#talksub").bind('click',function(){
            var soldId = $(this).prev().val();  
            var buyId = $(this).prev().prev().val();
            var content = $(this).prev().prev().prev().val();
            $.ajax( {
                  url:"/SecondBook/talk/insertTalkUser",
             	  type:"get",
                  data:"soldId="+soldId+"&buyId="+buyId+"&content="+content,
                  async:false,
            	 success:function(result){
            	    $("#talksub").unbind();
            	    $("#talkwords").val("");
                    var Obj = $("<code></code>").append($(result));//包装数据                
                	var html = $(".talk_show", Obj);
               	    $("#my").html(html);
               	 var showContent = $(".talk_show");
             	showContent[0].scrollTop = showContent[0].scrollHeight;
                  },
             error:function(e){
            	 	alert("wrong");
                  console.log(e);
             }
            });
      	});
	
	</script>
	
	<script>
	window.onload = function () {
	    getApi();
	}
	function getApi() {
		setTimeout(getApi,5*1000);
		var buyId = $("#buyId").val();
		var soldId = $("#soldId").val();
		$.ajax( {
	          url:"/SecondBook/talk/getTalkUser",
	     	  type:"get",
	          data:"soldId="+soldId+"&buyId="+buyId,
	          async:false,
	    	 success:function(result){
	    	    $("#talksub").unbind();
	            var Obj = $("<code></code>").append($(result));//包装数据                
	        	var html = $(".talk_show", Obj);
	       	    $("#my").html(html);
	       	 	var showContent = $(".talk_show");
	     		showContent[0].scrollTop = showContent[0].scrollHeight;
	          },
	     error:function(e){
	          console.log(e);
	     }
	    });
	}
</script>
</body>
</html>