<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page session="true"%>
<%@ page import="netshop.book.util.*"%>
<%--<%@include file="/bookshop/inc/head.inc"%>--%>
<%@include file="/bookshop/inc/head.html" %>
<script language="javascript">
    function checkform() {
        if (document.myform.username.value == "" || document.myform.passwd.value == "") {
            alert("Username or Password is null£¡");
            return false;
        }
        return true;
    }
</script>
<div  align=center style="background-image:url('images/loginbg.png');width: 1080px;height: 71.5%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;border:  1px solid;">
    <div id="main">
        <form name="myform" method="post" action="<%=request.getContextPath()%>/loginservlet">
            <div align=center>
                <font size="4">
                User Login
                </font>
            </div>
            <p>
                <label>Name</label><input type="text" name="username" />
            </p>
            <p>
                <label>Passwd</label><input type="password" name="passwd" />
            </p>
            <p id="login">
                <input type="submit" value="Login" onclick="javascript:return(checkform());" />
            </p>

            <br><br><br><br><br><br>
            If you have no account £¬Please 
            <a href="userreg.jsp">Register</a> Click here¡£
            <br><br>
        </form>
    </div>
</div>

<%--<%@include file="/bookshop/inc/authenticate.inc"%>--%>
<%@include file="/bookshop/inc/authenticate.html"%>