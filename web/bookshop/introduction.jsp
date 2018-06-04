<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page session="true"%>
<%@ page import="netshop.book.util.*"%>
<%--<%@include file="/bookshop/inc/head.inc"%>--%>
<%@include file="/bookshop/inc/head.html" %>
<script language="javascript">
    function checkform() {
        if (document.myform.username.value == "" || document.myform.passwd.value == "") {
            alert("Username or Password is null！");
            return false;
        }
        return true;
    }
</script>
<div  align=center style="background-image:url('images/loginbg.png');width: 1080px;height: 71.5%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;border:  1px solid;">
    <div id="main">
        <br>
        <br>
        <div align=left style="text-align: left;background-color:rgba(52, 52, 52, .2); height: 55%">
            <font size="4" >
            <marquee>“Everyone imagines heaven in his own way; I have conceived it as a library since childhood.” -Jorge Louis Borges </marquee><hr>
            <br>
            <br>
            <p1 style="text-indent:2em;text-align: left;float: left;color: blue;">This is a shopaholic bookstore. The bookstore reading space created by readers for the elements of architecture, religious sentiments, and humanities care has attracted a large number of readers both at home and abroad, making it an important cultural landmark in Nanjing.
            </p1><br><br><p1 style="text-indent:2em;text-align: left;float: left;color: blue;">Bookstore is the crystallization of the collective will of the people. It is not only a pioneering style of humanistic brand, but also a spiritual character and ideological quality of the people.
            </p1>
            </font>
        </div>
    </div>
</div>

<%--<%@include file="/bookshop/inc/authenticate.inc"%>--%>
<%@include file="/bookshop/inc/authenticate.html"%>