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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/icheck/minimal/red.css">


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

</head>

<body>

<!-- Start Wrapper -->
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
    
        <!-- Start Carousel -->

        <!-- End Carousel -->

        <!-- End Projects -->

        <!-- Start Info Blocks -->

        <!-- End Info Blocks -->

<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
               <div class="talk_main">
				    <div class="talk_left">
				    	<ul>
				    		<c:forEach var="userx" items="${users}">
				    			<li>
				    				<a href="${pageContext.request.contextPath}/user/getSoldByUid?uid=${userx.uid}" class="myTalks">${userx.name}</a>
				    			</li>
				    		</c:forEach>
				    	</ul>
				    </div>
				    <div class="talk_right">
					    <div class="talk_top" style="text-align:center;">
					    	<h2>客服中心</h2>
					    </div>
						<div class="talk_con">
							<div id="my">
						        <div class="talk_show" id="words">
						        	<c:forEach var="talk" items="${talks}">	
						        		<c:if test="${talk.status==0}">	        	
								            <div class="atalk">	
								            	<p>${talk.soldUser.name}&nbsp;${talk.createTime}</p>
								           	 	<span id="asay">${talk.content}</span>
								            </div>
							            </c:if>
							            <c:if test="${talk.status==1}">	  
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
					            <input type="hidden" value="${buyUser.uid}" name="buyId" id="buyId">
					            <input type="hidden" value="${sold.uid}" name="soldId" id="soldId">
					            <input type="button" value="发送" class="talk_sub" id="talksub">
					        </div>
					        </div>
				    </div>
				</div>
        </fieldset>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <span id="mytime" style="font-size:10px;"></span>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/icheck/icheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/dw.js"></script>
<script>
	var showContent = $(".talk_show");
	showContent[0].scrollTop = showContent[0].scrollHeight;
</script>
<script>
	$("#talksub").bind('click',function(){
	    var soldId = $(this).prev().val();  
	    var buyId = $(this).prev().prev().val();
	    var content = $(this).prev().prev().prev().val();
	    $.ajax( {
	          url:"/SecondBook/talk/insertTalkAdmin",
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
	          url:"/SecondBook/talk/getTalkAdmin",
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
	    	 	alert("wrong");
	          console.log(e);
	     }
	    });
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