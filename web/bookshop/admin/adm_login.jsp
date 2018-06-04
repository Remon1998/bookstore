<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<jsp:useBean id="alogin" scope="page" class="netshop.book.service.manage_login" />
<%
    String mesg = "";
    if (request.getParameter("username") != null && !request.getParameter("username").equals("")) {
        String username = request.getParameter("username");
        String passwd = request.getParameter("passwd");
        username = new String(username.getBytes("ISO8859-1"));
        passwd = new String(passwd.getBytes("ISO8859-1"));
        alogin.setUsername(username);
        alogin.setPasswd(passwd);
        alogin.setIsadmin(true);
        if (alogin.excute()) {
            session.setAttribute("admin", "admin");
            response.sendRedirect("adm_user.jsp");
        } else {
            mesg = "Login Failed£¡";
        }
    }
%>
<script language="javascript">
    function checkform() {
        if (document.form1.username.value == "" || document.form1.passwd.value == "") {
            alert("Name or Password is empty£¡");
            return false;
        }
        return true;
    }
</script>
<%@include file="/bookshop/inc/adm_head.html"%>
<div align="center" style="background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
    <div id="main">
        <form name="form1" method="post" action="adm_login.jsp">
            <div align=center>
                <font size="4.5" color="#FF0000">
                Online BookStore System Management
                </font>
                &nbsp;<% if (!mesg.equals("")) {
                        out.println(mesg);
                    }%>
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
            <div style="margin-top: 20px;width: 200px;"><A HREF="../index.jsp">Go Back to HomePage</A></div>
            <br>
        </form>
    </div>
</div>

<%@include file="/bookshop/inc/adm_authenticate.html"%>