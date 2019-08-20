<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二手房房源列表</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet"/>
    <%--导航栏的JS--%>
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <%--搜索框的css--%>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery2.min.js"></script>

</head>


<body>

<!--头部最上方的框-->
<jsp:include page="../pages/basehead.jsp"></jsp:include>

<div class="width1190">
    <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ 旧房房源 </p>
</div>

<%--</div>--%>

<%--房源列表--%>

<div class="content">
    <div class="width1190">
        <form action="#" method="get" class="pro-search">
            <div class="paixu">
                <strong>排序：</strong>
                <a href="javascript:;" class="pai-cur">默认</a>
                <a href="javascript:;">价格 &or;</a>
                <a href="javascript:;">最新 &or;</a>
            </div>
        </form>
    </div>
    <div class="width1190">
        <div class="pro-left">
            <%--房屋信息分页显示--%>
            <c:forEach var="house" items="${pageInfo.lists}">
                <dl>
                    <dt><a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${house.houseId}">
                        <img src="http://image.cxhit.com/${house.houseHeadimg}" style="width:286px;height:188px"
                             width="286" height="188"/></a></dt>
                    <dd>
                        <h3>
                            <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${house.houseId}">${house.houseTitle}</a>
                        </h3>
                        <div class="pro-wei">
                            <img src="../images/weizhi.png" width="12" height="16" style="width:12px;height:16px"/>
                            <strong class="red">${house.houseAddress}</strong>
                        </div>
                        <div class="pro-fang">${house.houseLayout} ${house.houseArea}平 ${house.houseTurn} ${house.houseFloor}层/${house.floorAll}层</div>
                        <div class="pra-fa">发布人：${house.trueName}先生 发布时间：${house.date}</div>
                    </dd>
                    <div class="price">¥ <strong>${house.housePrice}</strong><span
                            class="font12">${house.priceUnit}</span></div>
                    <div class="clears"></div>
                </dl>
            </c:forEach>

            <%--分页按钮--%>
            <div class="pull-right">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1&currentPage=1"
                           aria-label="Previous">首页</a></li>
                    <c:if test="${pageInfo.currentPage != 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1&currentPage=${pageInfo.currentPage - 1}">上一页</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${pageInfo.totalPage}" var="i">
                        <li>
                            <a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1&currentPage=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageInfo.currentPage != pageInfo.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1&currentPage=${pageInfo.currentPage + 1}">下一页</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?houseType=1&currentPage=${pageInfo.totalPage}"
                           aria-label="Next">尾页</a></li>
                </ul>
            </div><!--底部分页栏-->
        </div>

        <div class="pro-right">
            <h2 class="right-title">推荐房源</h2>
            <div class="right-pro">
                <c:forEach var="randomHouse" items="${randomHouses}">
                    <dl>
                        <dt>
                            <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${randomHouse.houseId}">
                                <img src="http://image.cxhit.com/${randomHouse.houseHeadimg}"
                                     style="width: 135px; height: 88px"/></a>
                        </dt>
                        <dd>
                            <h3>
                                <a href="${pageContext.request.contextPath}/house/searchDetail.do?houseId=${randomHouse.houseId}">${randomHouse.houseTitle}</a>
                            </h3>
                            <div class="pro-fang">
                                ${randomHouse.houseLayout} ${randomHouse.houseArea}平
                                朝${randomHouse.houseTurn}
                            </div>
                            <div class="right-price">${randomHouse.housePrice}${randomHouse.priceUnit}</div>
                        </dd>
                    </dl>
                </c:forEach>
            </div>
        </div>
        <div class="clears"></div>
    </div>
</div>

<jsp:include page="../pages/basefoot.jsp"></jsp:include>


</body>
</html>
