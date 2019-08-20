<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
<head>
    <title>房源详情页</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="../images/favicon.ico"/>
    <scrip src="../js/jquery-2.1.1.min.js"></scrip>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<!--头部最上方的框-->
<jsp:include page="../pages/basehead.jsp"></jsp:include>


<div class="content">
    <div class="width1190">
        <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ 房源详情</p>
    </div>
</div>

<%--显示房屋详情--%>
<div class="content">
    <div class="width1190" style="width:1000px;">
        <div class="proImg fl">
            <img src="http://image.cxhit.com/${houseView.houseHeadimg}"/>
        </div>
        <div style="width:535px;margin:30px 0;float: right;">
            <h3 class="proTitle">${houseView.houseTitle} </h3>

            <div class="proText1">

                <table width="90%" align="left" cellspacing="5" cellpadding="5" style="font-size: 130%">
                    <tr>
                        <td>房屋编号：<a name="house_id">${houseView.houseId}</a></td>
                        <td>房屋性质：${houseView.houseNature}</td>
                    </tr>
                    <tr>
                        <td>装　　修：${houseView.houseDecorate}</td>
                        <td>售　　价：${houseView.housePrice} ${houseView.priceUnit}</td>
                    </tr>
                    <tr>
                        <td>面　　积：${houseView.houseArea}㎡</td>
                        <td>户　　型：${houseView.houseLayout}</td>
                    </tr>
                    <tr>
                        <td>朝　　向：${houseView.houseTurn}</td>
                        <td>配套电梯：
                            有
                        </td>
                    </tr>
                    <tr>
                        <td>房屋类型：${houseView.houseModel}</td>
                        <td>楼　　层：${houseView.houseFloor}层/${houseView.floorAll}层</td>
                    </tr>
                    <tr>
                        <td>建造年份：${houseView.houseYear}</td>
                        <td>居住期限：${houseView.houseValid}</td>
                    </tr>
                    <tr>
                        <td colspan="2">所在小区：${houseView.houseAddress}</td>
                    </tr>
                </table>
            </div>
            <div class="xun-car">
                <input class="pricebutton" type="button" value="￥ ${houseView.housePrice} ${houseView.priceUnit}">
                <input class="collectbutton" type="button" value="关注房源">
            </div>

        </div>
        <div class="clears"></div>
    </div>

    <%--下面是房源详情页--%>
    <div class="proBox" style="width:1000px;margin:10px auto;">
        <div class="proEq">
            <ul class="fl">
                <li class="proEqCur">房源图片</li>
                <li>小区介绍</li>
                <li>用户评价</li>
            </ul>
            <div class="clears"></div>
        </div>

        <div class="proList">
            <h2 class="title"><a style="color:#F1323B"> </a>房源平面图</h2>
            <br>
            <c:if test="${!empty houseView.housePlanimg1}">
                <img src="http://image.cxhit.com/${houseView.housePlanimg1}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.housePlanimg2}">
                <img src="http://image.cxhit.com/${houseView.housePlanimg2}" style="width: 286px;height: 188px"/>
            </c:if>
            <h2 class="title"><a style="color:#F1323B"> </a>房源内饰图</h2>
            <br>
            <c:if test="${!empty houseView.houseImg1}">
                <img src="http://image.cxhit.com/${houseView.houseImg1}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.houseImg2}">
                <img src="http://image.cxhit.com/${houseView.houseImg2}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.houseImg3}">
                <img src="http://image.cxhit.com/${houseView.houseImg3}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.houseImg4}">
                <img src="http://image.cxhit.com/${houseView.houseImg4}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.houseImg5}">
                <img src="http://image.cxhit.com/${houseView.houseImg5}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseView.houseImg6}">
                <img src="http://image.cxhit.com/${houseView.houseImg6}" style="width: 286px;height: 188px"/>
            </c:if>

        </div>
        <div class="proList">
            暂无信息...
        </div>
        <div class="proList">
            暂无评论……
        </div>
    </div>
</div>

<%--引入页脚--%>
<iframe src="../pages/basefoot.jsp" frameborder="0" scrolling="no" height="263px" width="100%"></iframe>

</body>
</html>
