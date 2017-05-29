<%@ page import="com.lazy.web.pojo.User" %><%--
  Coding......
  User: D.SR
  Date: 2017/2/9
  Time: 21:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>方正集团创新大赛</title>
    <%@include file="/WEB-INF/page/public/header.jsp" %>
    <meta name="Keywords" content="创启未来，创业大赛，北大创业，科技创业，创业投资"/>
    <meta name="Description"
          content="方正创新大赛，是由方正集团总部发起，以“创新驱动”国家战略为方向，“世界在变，创新不变”为宗旨，旨在“激活方正创新基因，营造方正创新文化”，充分唤起全集团三万五千名员工的创新意识，致力于持续提供卓越的产品与服务，为人们创造更智能、更健康、更富足的生活。本届大赛，所有方正员工均可组团参赛，将分为技术、管理、运营、模式等维度进行评比，最终角逐年度创新、创业大奖。"/>


    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link rel="stylesheet" href="${ctx}/static/css/bit_common.css">
    <link rel="stylesheet" href="${ctx}/static/css/global.css">
    <link rel="stylesheet" href="${ctx}/static/css/reset.css">
    <link rel="stylesheet" href="${ctx}/static/css/pages.css">
    <link rel="stylesheet" href="${ctx}/static/css/newcasa.css">


    <script language="javascript" src="${ctx}/static/plugins/jquery/jquery.SuperSlide.2.1.1.js"></script>
    <script language="javascript" src="${ctx}/static/js/bit_js.js"></script>
    <!--css -->
    <link type="text/css" href="${ctx}/static/plugins/MoreImageScrollJs/css/pop.css" rel="stylesheet"/>
    <!--js -->
    <script language="javascript" src="${ctx}/static/plugins/MoreImageScrollJs/js/pop.js"></script>


    <script src='${ctx}/static/plugins/jquery/jquery.queryParser.js' type="text/javascript"></script>
    <script src='${ctx}/static/plugins/jquery/jquery.depend.js' type="text/javascript"></script>
    <script src='${ctx}/static/plugins/jquery/jquery.cookie.js' type="text/javascript"></script>
    <script src='${ctx}/static/plugins/jquery/jquery.storageapi.js' type="text/javascript"></script>
    <script src='${ctx}/static/plugins/assist/Math.uuid.js' type="text/javascript"></script>
    <script src='${ctx}/static/plugins/bitech/bitech.analysis.js' type="text/javascript"></script>


</head>
<body>


<div class="bi_head">
    <div class="bi_head_con wm">
        <a class="fl" href="http://www.founder.com/" target="_blank"><img
                src="${ctx}/static/images/logo-cqwl.png?v=1.0"/></a>
        <%--<img class="fl" src="${ctx}/static/images/logo003.png"/>--%>
        <%--<a class="fl" href="${ctx}"><img src="${ctx}/static/images/logo002.png"/></a>--%>


        <ul class="bi_nav fl clearfix">
            <li><a class="home" href="${ctx}/">大赛首页</a></li>
            <li><a class="dsjj" href="${ctx}/home/page/contestIntroduction">大赛简介</a></li>
            <li><a class="xwzx" href="#">LOGO大赛</a></li>
            <li><a class="pwds" href="#">创新课堂</a></li>
            <li><a class="hzjg" href="#">新闻资讯</a></li>
            <%--<li><a class="wjds" href="${ctx}/ReviewSelectionYear.aspx">往届大赛</a></li>--%>
        </ul>


        <%--<span class="loginRegister fl"><a class="login_a" href="${ctx}/user/page/login">登录</a><a class="register_a"--%>
        <%--href="${ctx}/user/page/regist">注册</a></span>--%>
        <%
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
        %>
        <span class='loginRegister fr '><a class='login_a' href='${ctx}/user/page/login'>登录</a><a
                class='register_a' href='${ctx}/user/page/regist'>注册</a> </span>
        <%
        } else {
        %>
        <span class='loginRegister fr'><a class='login_a' href='${ctx}/user/page/index'>${user.name}</a><a
                class='register_a' href='javascript:ajaxLogout()'>退出</a> </span>
        <%
            }
        %>

    </div>
</div>
<!--头部 结束-->
<script type="text/javascript">
    //    $(function () {
    //        $.ajax({
    //            type: "get",
    //            url: '/ashx/Login.ashx?ram=' + Math.random() + "&url=" + window.location.href,
    //            success: function (htm) {
    //                $(".loginRegister").html(htm);
    //            }
    //        });
    //    });
</script>


<!--内页大图 开始-->
<div class="con_img_mod">
    <div class="con_nav_mod wm">
        <%--<a class="home">首页 &gt; </a>--%>
        <%--<br/>--%>
        <%--<a class="cur">大赛简介</a>--%>
    </div>
</div>
<!--内页大图 结束-->
<!--body start-->
<div class="bi_con_body" style="width: 100%;">
    <!--大赛介绍tab 开始-->
    <div style="height: 69px">
        <div class="dsjsTab clearfix " style="padding-left: 100px;">
            <a class="tab01 on" gomao="ssjs_p">赛事介绍</a>
            <%--<a class="tab02" gomao="ssfb_p">赛事分布</a>--%>
            <a class="tab03" gomao="scsz_p">赛程设置</a>
            <a class="tab04" gomao="csgz_p">参赛规则</a>
            <a class="tab05" gomao="psbz_p">评审标准</a>
            <a class="tab06" gomao="sjld_p">赛季亮点</a>
        </div>
    </div>

    <script>
        $(function () {
            if (!$(".bi_con_body").hasClass("smallContainer")) {
//            if (false) {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 0 && $(this).scrollTop() < 506) {
                        $(".dsjsTab .tab01").addClass("on").siblings().removeClass("on");
                    }
//                    else if ($(this).scrollTop() > 426 && $(this).scrollTop() < 670) {
//                        $(".dsjsTab .tab02").addClass("on").siblings().removeClass("on");
//                    }
                    else if ($(this).scrollTop() > 506 && $(this).scrollTop() < 946) {
                        $(".dsjsTab .tab03").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 946 && $(this).scrollTop() < 1500) {
                        $(".dsjsTab .tab04").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 1500 && $(this).scrollTop() < 2086) {
                        $(".dsjsTab .tab05").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 2086 && $(this).scrollTop() < 2386) {
                        $(".dsjsTab .tab06").addClass("on").siblings().removeClass("on");
                    }
                });
            }
            else {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 0 && $(this).scrollTop() < 506) {
                        $(".dsjsTab .tab01").addClass("on").siblings().removeClass("on");
                    }
//                    else if ($(this).scrollTop() > 426 && $(this).scrollTop() < 670) {
//                        $(".dsjsTab .tab02").addClass("on").siblings().removeClass("on");
//                    }
                    else if ($(this).scrollTop() > 506 && $(this).scrollTop() < 946) {
                        $(".dsjsTab .tab03").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 946 && $(this).scrollTop() < 1500) {
                        $(".dsjsTab .tab04").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 1500 && $(this).scrollTop() < 2086) {
                        $(".dsjsTab .tab05").addClass("on").siblings().removeClass("on");
                    }
                    else if ($(this).scrollTop() > 2086 && $(this).scrollTop() < 2386) {
                        $(".dsjsTab .tab06").addClass("on").siblings().removeClass("on");
                    }
                });
            }
        });
    </script>
    <!--大赛介绍tab 结束-->
    <!--内容文字 开始-->
    <div class="ssjs_p">
    </div>
    <div class="ssjs_p_detail">

    </div>
    <%--<div class="ssfb_p">--%>
    <%--</div>--%>
    <%--<div class="ssfb_p02" style="height: 557px; background: url(${ctx}/static/images/dsjs_11.gif) no-repeat scroll center 0 transparent">--%>
    <%--<div style="position: relative; height: 557px" class="wm">--%>
    <%--<div style="padding-left: 15px;">--%>
    <%--<img src="${ctx}/static/images/dsjs_11_on.png" border="0" usemap="#Map"/>--%>
    <%--<a class="com_a bjzsc" onmouseover="openWindow('openWindows01','750','77')"--%>
    <%--onmouseout="hideopenWin('openWindows01')">北京赛场</a>--%>
    <%--<a class="com_a tssc" onmouseover="openWindow('openWindows12','745','107')"--%>
    <%--onmouseout="hideopenWin('openWindows12')">唐山赛场</a>--%>
    <%--<a class="com_a tjzsc" onmouseover="openWindow('openWindows02','750','107')"--%>
    <%--onmouseout="hideopenWin('openWindows02')">天津赛场</a>--%>
    <%--<a class="com_a jhsc" onmouseover="openWindow('openWindows03','750','140')"--%>
    <%--onmouseout="hideopenWin('openWindows03')">金华赛场</a>--%>
    <%--<a class="com_a szsc" onmouseover="openWindow('openWindows04','750','170')"--%>
    <%--onmouseout="hideopenWin('openWindows04')">深圳赛场</a>--%>
    <%--<a class="com_a btsc" onmouseover="openWindow('openWindows05','600','50')"--%>
    <%--onmouseout="hideopenWin('openWindows05')">包头赛场</a>--%>
    <%--<a class="com_a sjzsc" onmouseover="openWindow('openWindows08','550','110')"--%>
    <%--onmouseout="hideopenWin('openWindows08')">石家庄赛场</a>--%>
    <%--<a class="com_a zzsc" onmouseover="openWindow('openWindows11','550','145')"--%>
    <%--onmouseout="hideopenWin('openWindows11')">郑州赛场</a>--%>
    <%--<a class="com_a xasc" onmouseover="openWindow('openWindows10','550','180')"--%>
    <%--onmouseout="hideopenWin('openWindows10')">西安赛场</a>--%>
    <%--<a class="com_a ggsc" onmouseover="openWindow('openWindows06','10','124')"--%>
    <%--onmouseout="hideopenWin('openWindows06')">硅谷赛场</a>--%>
    <%--<a class="com_a xytsc" onmouseover="openWindow('openWindows09','-33','45')"--%>
    <%--onmouseout="hideopenWin('openWindows09')">西雅图赛场</a>--%>
    <%--<a class="com_a bsdsc" onmouseover="openWindow('openWindows07','127','155')"--%>
    <%--onmouseout="hideopenWin('openWindows07')">波士顿赛场</a>--%>
    <%--</div>--%>
    <%--<!--弹出框内容 开始-->--%>
    <%--<div id="openWindows01" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_10.jpg"/>--%>
    <%--<p class="title01">北京城市赛</p>--%>
    <%--<p class="title02"><span class="title03">擂台赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Beijing</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows12" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_tangshan.jpg"/>--%>
    <%--<p class="title01">唐山城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：10月1日-11月10日</p>--%>
    <%--<p class="palce">Tangshan</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows02" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_14.jpg"/>--%>
    <%--<p class="title01">天津城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Tianjin</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows03" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_07.jpg"/>--%>
    <%--<p class="title01">金华城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Jinhua</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows04" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_22.jpg"/>--%>
    <%--<p class="title01">深圳城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Shenzhen</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows05" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_30.jpg"/>--%>
    <%--<p class="title01">包头城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Baotou</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows06" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_26.jpg"/>--%>
    <%--<p class="title01">硅谷城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Silicon Valley</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows07" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_18.jpg"/>--%>
    <%--<p class="title01">波士顿城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Boston</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows08" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_03.jpg"/>--%>
    <%--<p class="title01">石家庄城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Shijiazhuang</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows11" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_zhengzhou.jpg"/>--%>
    <%--<p class="title01">郑州城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Zhengzhou</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows10" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_xian.jpg"/>--%>
    <%--<p class="title01">西安城市赛</p>--%>
    <%--<p class="title02"><span class="title03">擂台赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">XiAn</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div id="openWindows09" class="openWindows">--%>
    <%--<h1><a class="fr"></a></h1>--%>
    <%--<div class="content">--%>
    <%--<img class="img_show fl" src="${ctx}/static/images/ssfb_sc_img_syt.jpg"/>--%>
    <%--<p class="title01">西雅图城市赛</p>--%>
    <%--<p class="title02"><span class="title03">晋级赛</span></p>--%>
    <%--<p class="gray">报名时间：5月1日-7月31日</p>--%>
    <%--<p class="palce">Seattle</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<script>--%>
    <%--$(function () {--%>
    <%--$(".openWindows .p_close").click(function () {--%>
    <%--$(".openWindows").hide()--%>
    <%--})--%>
    <%--})--%>
    <%--function hideopenWin(openWindows01) {--%>
    <%--$("#" + openWindows01).hide();--%>
    <%--}--%>
    <%--function openWindow(openWindows01, left, top) {--%>
    <%--$("#" + openWindows01).show().css("left", left + "px").css("top", top + "px");--%>
    <%--}--%>
    <%--</script>--%>
    <%--<!--弹出框内容 结束-->--%>
    <%--</div>--%>
    <%--</div>--%>
    <div class="scsz_p">
    </div>
    <div class="csgz_p">
    </div>
    <div class="psbz_p">
    </div>
    <div style="margin-bottom: 100px; height: 684px;" class="sjld_p">
    </div>
    <!--内容文字 结束-->
    <script type="text/javascript">
        $(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 200) {/*200的值为user_biaoge与顶端的距离*/
                    $(".dsjsTab").addClass("cg_fixed");
                } else {
                    $(".dsjsTab").removeClass("cg_fixed");
                }
            });
        })
    </script>
</div>
<!--body end-->


<!--foot start-->
<%--<div id="page_footer" class="bi_foot footer">--%>
<%--<p align="center" style="text-align: left; width: 980px; margin: 0px auto; margin-top: 10px;">--%>
<%--<img src='${ctx}/static/banner/images/f1.jpg' class="f-2 fl"><img src='${ctx}/static/banner/images/f4.jpg'--%>
<%--class="f-1 fl">--%>
<%--<a href='/'>--%>
<%--<img src='${ctx}/static/banner/images/f2.jpg' class="f-1 fl"></a>--%>
<%--<img src='${ctx}/static/banner/images/f4.jpg' class="f-1 fl"><img src='${ctx}/static/banner/images/f3.jpg'--%>
<%--class="f-1 fl">--%>
<%--<div style="clear: both"></div>--%>
<%--</p>--%>
<%--<style>--%>
<%--.f-1 {--%>
<%--margin-left: 50px;--%>
<%--}--%>
<%--</style>--%>
<%--<p align="center" class="copy" style="text-align: left; width: 980px; margin: 0px auto; margin-top: 10px;">--%>
<%--<span class="copy_text">Copyright 2014-2015 Peking University Science Park All rights reserved</span>--%>
<%--<span class="copy_num">京ICP备05014306号&nbsp;&nbsp;&nbsp;&nbsp;京公网安备110108003491号</span> <span class="foot_a"><a--%>
<%--style="display: none;" href="${ctx}/About.aspx">关于我们</a><a href="${ctx}/static/Contact.aspx">联系我们</a>--%>
<%--<a href="${ctx}/Recruitment.aspx">常见问题</a></span>--%>
<%--</p>--%>
<%--</div>--%>
<!--foot end-->


<script defer="defer">
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?116b8dca1073a38f6136ca633be6b7ce";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>


<script>
    $(function () {
        $(".dsjj").addClass("on");
    })
</script>


<%@include file="/WEB-INF/page/public/footer.jsp" %>

</body>
</html>

