<%--
  Coding......
  User: D.SR
  Date: 2017/3/2
  Time: 22:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>方正集团创新大赛</title>
    <link href="${pageContext.request.contextPath}/static/css/404.css" rel="stylesheet">
</head>

<body>
<div class="container" style=" margin-top:8%;">
    <div class="panel margin-big-top">
        <div class="text-center">
            <br>
            <h2 class="padding-top"> <stong>404错误！抱歉您要找的页面不存在</stong> </h2>
            <div style="visibility: hidden" class="">
                <div class="float-left">
                    <img src="${pageContext.request.contextPath}/static/images/404/404-1.gif">
                    <div class="alert"> 卧槽！页面不见了！ </div>
                </div>
                <div class="float-right">
                    <img src="${pageContext.request.contextPath}/static/images/404/404-2.png" width="260">
                </div>
            </div>
            <div class="padding-big">
                <a href="${pageContext.request.contextPath}/" class="button bg-yellow">返回首页</a>
                <a href="javascript:history.go(-1);location.reload();" class="button">返回前一页</a>
            </div>
        </div>
    </div>
</div>


</body></html>