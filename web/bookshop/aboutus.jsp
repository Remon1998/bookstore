<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page session="true"%>
<%@ page import="netshop.book.util.*"%>
<%--<%@include file="/bookshop/inc/head.inc"%>--%>
<div style="margin-left: 228px;">
    <%@include file="/bookshop/inc/head.html" %>
</div>
<style type="text/css">
    *{margin: 0;padding: 0;}
    body{overflow:hidden;background: url(images/bg.jpg);background-size: cover;}
    .container{
        width:100%;
        height: 100%;
    }
    .photowall{
        position: relative;
        height: 100%; width: 100%;
        display: -webkit-box; /*使用CSS3的盒模型之流式布局*/
        display: -moz-box;
        display: box;

        -webkit-box-pack:center; /*定义盒模型内部元素在水平方向上居于中间位置*/
        -moz-box-pack:center;
        -o-box-pack:center;
        -ms-box-pack:center;
        box-pack:center;

        -webkit-box-align:center; /*定义盒模型内部元素在垂直方向上居于中间位置*/
        -moz-box-align:center;
        -o-box-align:center;
        -ms-box-align:center;
        box-align:center;
    }

    .photoview{
        position: relative;
        background-color:#f2eada;
        margin: 5px;padding:10px 10px 20px 10px;
        text-align: center;
        font-size:20px;
        box-shadow:.2em .2em .8em #130c0e; /*给照片添加阴影效果，富有立体感*/
    }

    .photoview p{
        margin-top:5px;  /*设置照片内显示文字段落的外上边距*/
    }

    .photo01{
        -weikit-transform-origin:right bottom; /*设置右下角为旋转基准点 */
        -moz-transform-origin:right bottom;
        -o-transform-origin:right bottom;
        -ms-transform-origin:right bottom;
        transform-origin:right bottom;

        transform:rotate(10deg); /*以右下角为基准点顺时针旋转10°*/
        -webkit-transform:rotate(10deg);
        -moz-transform:rotate(10deg);
        -o-transform:rotate(10deg);
        -ms-transform:rotate(10deg);
    }
    .photo02{
        -weikit-transform-origin:right bottom; /*设置右下角为旋转基准点 */
        -moz-transform-origin:right bottom;
        -o-transform-origin:right bottom;
        -ms-transform-origin:right bottom;
        transform-origin:right bottom;
        transform:rotate(-20deg); /*以右下角为基准点逆时针旋转20°*/
        -webkit-transform:rotate(-20deg);
        -moz-transform:rotate(-20deg);
        -o-transform:rotate(-20deg);
        -ms-transform:rotate(-20deg);
    }

    .photo03{
        -weikit-transform-origin:left top; /*设置左上角为旋转基准点 */
        -moz-transform-origin:left top;
        -o-transform-origin:left top;
        -ms-transform-origin:left top;
        transform-origin:left top;

        transform:rotate(20deg); /*以左上角为基准点顺时针旋转20°*/
        -webkit-transform:rotate(20deg);
        -moz-transform:rotate(20deg);
        -o-transform:rotate(20deg);
        -ms-transform:rotate(20deg);
    }
    .photo04{
        -weikit-transform-origin:left bottom; /*设置左下角为旋转基准点 */
        -moz-transform-origin:left bottom;
        -o-transform-origin:left bottom;
        -ms-transform-origin:left bottom;
        transform-origin:left bottom;
        transform:rotate(-20deg); /*以左下角为基准点逆时针旋转20°*/
        -webkit-transform:rotate(-20deg);
        -moz-transform:rotate(-20deg);
        -o-transform:rotate(-20deg);
        -ms-transform:rotate(-20deg);
    }
</style>
<div  align=center style="background-image:url('images/loginbg.png');width: 1080px;height: 70%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">

    <div class="container">
        <div class="photowall">

            <div class="photo01">
                <div class="photoview" >
                    <img src="images/1.jpg" width="300" height="220">
                    <p>Designer</p>
                    <p>Marin</p>
                </div>
            </div>

            <div class="photo02">
                <div class="photoview" >
                    <img src="images/2.jpg" width="300" height="220">
                    <p>Font-end Engineer</p>
                    <p>Alfred</p>
                </div>
            </div>

            <div class="photo03">
                <div class="photoview" >
                    <img src="images/3.jpg" width="300" height="220">
                    <p>Code Engineer</p>
                    <p>Remon</p>
                </div>
            </div>

            <div class="photo04">
                <div class="photoview" >
                    <img src="images/4.jpg" width="300" height="220">
                    <p>Post-audit</p>
                    <p>Jesse</p>
                </div>
            </div>

        </div>
    </div>

</div>

<%--<%@include file="/bookshop/inc/authenticate.inc"%>--%>
<%@include file="/bookshop/inc/authenticate.html"%>