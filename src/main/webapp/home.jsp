<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>易居住房信息平台</title>

    <link type="text/css" href="../css/css.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery2.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>

    <%--轮播图--%>
    <script type="text/javascript">
        var picsArr = new Array();
        picsArr[0] = "images/lunbotu/fang1.jpg";
        picsArr[1] = "images/lunbotu/fang2.jpg";
        picsArr[2] = "images/lunbotu/fang3.jpg";
        var index = 0;
        var timer = 0;
        window.onload = showPic;

        function showNext() {
            clearTimeout(timer)
            showPic();
        }

        function showPic() {
            if (index < (picsArr.length - 1)) {
                index++;
            } else {
                index = 0;
            }
            document.getElementById("pic").src = picsArr[index]
            timer = setTimeout("showPic()", 3000);
        }

        function showPre() {
            showPrePic();
        }

        function showPrePic() {
            if (index > 0) {
                index--;
            } else {
                index = picsArr.length - 1;
            }
            document.getElementById("pic").src = picsArr[index]
        }
    </script>

    <%--轮播图的CSS--%>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        li {
            list-style: none;
        }

        #adv {
            width: 1190px;
            position: relative;
        }

        #adv li {
            display: none;
        }

        #next, #prev {
            position: absolute;
            top: 45%;
            cursor: pointer;
            transition: all .5s;
            opacity: .7;
        }

        #next:hover, #prev:hover {
            transform: scale(1.1);
            opacity: 1;
        }

        #prev {
            left: 10px;
            height: 15%;
        }

        #next {
            right: 10px;
            height: 15%;
        }
    </style>

</head>
<body>
<jsp:include page="/pages/basehead.jsp"></jsp:include>
<!--广告轮播栏-->
<div class="width1190">
    <ul id="adv">
        <li style="display: block;"><img src="../images/lunbotu/fang1.jpg" alt="" id="pic"></li>
        <img src="../images/lunbotu/l.png" id="prev" alt="" onclick="showPre()">
        <img src="../images/lunbotu/r.png" id="next" alt="" onclick="showNext()">
    </ul>
</div>

<%--主页推荐栏--%>
<div class="content">
    <div class="width1190">

        <%--新房推荐--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>新房推荐<a
                href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=0">更多&gt;&gt;</a></h2>
        <div class="index-fang-list">
            <%--FIXME 这里使用Foreach循环，从数据库读取房屋信息 --%>
            <c:forEach items="${newHouse}" var="nh">
                <dl>
                    <dt><a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${nh.houseId}"><img
                            src="http://image.cxhit.com/${nh.houseHeadimg}" width="286"
                            height="188"/></a></dt>
                    <dd>
                        <h3>
                            <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${nh.houseId}">${nh.houseTitle}</a>
                        </h3>
                        <div class="hui">${nh.houseLayout} | ${nh.houseArea} | ${nh.houseDecorate}</div>
                    </dd>
                </dl>
            </c:forEach>

            <div class="clears"></div>
        </div>

        <%--旧房推荐--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>二手房推荐 <a
                href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1">更多&gt;&gt;</a></h2>
        <div class="index-fang-list">
            <c:forEach items="${oldHouse}" var="oh">
                <dl>
                    <dt><a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${oh.houseId}"><img
                            src="http://image.cxhit.com/${oh.houseHeadimg}" width="286" height="188"/></a></dt>
                    <dd>
                        <h3>
                            <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${oh.houseId}">${oh.houseTitle}</a>
                        </h3>
                        <div class="hui">${oh.houseLayout} | ${oh.houseArea} | ${oh.houseDecorate}</div>
                    </dd>
                </dl>
            </c:forEach>
            <div class="clears"></div>
        </div>

        <%--租房推荐--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>租房推荐 <a
                href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=2">更多&gt;&gt;</a></h2>
        <div class="index-ershou">

            <%--左侧栏--%>
            <div class="in-er-left">
                <a href="#"><img src="../images/fangt1.jpg" width="380" height="285"/></a>

                <div class="in-er-left-text"><strong class="fl">测试</strong><strong>
                    class="fr alignRight">¥2841</strong></div>
            </div>

            <%--右侧栏--%>
            <div class="in-er-right">
                <c:forEach items="${rentHouse}" var="rh">
                    <dl>
                        <dt>
                            <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${rh.houseId}"><img
                                    src="http://image.cxhit.com/${rh.houseHeadimg}"
                                    style="width: 150px; height: 115px;" width="150" height="115"/></a></dt>
                        <dd>
                            <h3>
                                <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${rh.houseId}">${rh.houseTitle}</a>
                            </h3>
                            <br>
                            <div class="in-er-right-text">
                                    ${rh.houseAddress}
                            </div>
                            <div class="price">¥<strong>${rh.housePrice}${rh.priceUnit}</strong></div>
                        </dd>
                        <div class="clears"></div>

                    </dl>
                </c:forEach>

                <div class="clears"></div>

            </div>
            <div class="clears"></div>
        </div>

    </div>
</div>

<jsp:include page="pages/basefoot.jsp"></jsp:include>

</body>
</html>
