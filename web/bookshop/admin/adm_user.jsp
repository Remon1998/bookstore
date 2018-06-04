<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    } %>
<%@ page import="netshop.book.bean.*" %>
<jsp:useBean id="user" scope="page" class="netshop.book.service.manage_user" />
<%
    int pages = 1;
    String mesg = "";

    if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
        String requestpage = request.getParameter("page");
        try {
            pages = Integer.parseInt(requestpage);
        } catch (Exception e) {
            mesg = "你要找的页码错误!";
        }
        user.setPage(pages);
    }

    if (request.getParameter("action") != null && request.getParameter("action").equals("del")) {
        try {
            long id = Long.parseLong(request.getParameter("userid"));
            if (user.delete(id)) {
                mesg = "删除操作成功";
            } else {
                mesg = "删除操作出错";
            }
        } catch (Exception e) {
            mesg = "你要删除的用户号错误";
        }
    }

%>
<script language="javascript">
<!--
    function checkform() {
        if (document.form1.username.value == "" || document.form1.passwd.value == "") {
            alert("用户名或密码为空！");
            return false;
        }
        returntrue;

    }

    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
-->
</script>
    <%@include file="/bookshop/inc/adm_head.html"%>
    <div align="center" style="background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left:228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;margin-top: -36px;"> 
        <p style="margin-left:0px;font-size:35px;align:center;font-family:inherit;color:">All users of the online bookstore</p>          
        <table width="778" style="font-size:9pt" border="1" cellpadding="2" cellspacing="1"  bgcolor="#E4EDFB" bordercolor="white" align="center">
            <tr align="center" bgcolor="#DEF3CE"> 
                <td style="font-size:15px;">Userid</td>
                <td style="font-size:15px;">Username</td>
                <td style="font-size:15px;">True name</td>
                <td style="font-size:15px;">Address</td>
                <td style="font-size:15px;">Tel</td>
                <td style="font-size:15px;">Email</td>
                <td style="font-size:15px;">View</td>
            </tr>
            <%    if (user.get_alluser()) {
                    for (int i = 0; i < user.getUserlist().size(); i++) {
                        user userinfo = (user) user.getUserlist().elementAt(i);
            %>
            <tr>
                <td align=center><%= userinfo.getId()%></td>
                <td><%= userinfo.getUserName()%></td>
                <td><%= userinfo.getNames()%></td>
                <td><%= userinfo.getAddress()%></td>
                <td><%= userinfo.getPhone()%></td>
                <td><%= userinfo.getEmail()%></td>
                <td align=center><a href="#" onclick="openScript('user_detail.jsp?userid=<%= userinfo.getId()%>', 'showuser', 450, 500)">Detail</a>&nbsp;<a href="#" onclick="openScript('user_modify.jsp?userid=<%= userinfo.getId()%>', 'modis', 450, 500)">Modify</a>&nbsp;<a href="adm_user.jsp?userid=<%= userinfo.getId()%>&page=<%= user.getPage()%>&action=del" onclick="return(confirm('你真的要删除这个用户?'))">Delete</a></td>
            </tr>
            <%	}
                }%>
        </table>
        <table align="center" width="778" border="0" cellspacing="1" cellpadding="1"  bgcolor="#E4EDFB">
            <tr>
                <td align="right">current<%= user.getPage()%>page <a href="adm_user.jsp" style="font-size:10px;">Home page</a>&nbsp; 
                    <% if (user.getPage() > 1) {%>
                    <a href="adm_user.jsp?page=<%= user.getPage() - 1%>" style="font-size:10px;">Previous page</a>&nbsp; 
                    <% } %>
                    <% if (user.getPage() < user.getPageCount() - 1) {%>
                    <a href="adm_user.jsp?page=<%= user.getPage() + 1%>" style="font-size:10px;">next page</a>&nbsp; 
                    <% }%>
                    <a href="adm_user.jsp?page=<%= user.getPageCount()%>" style="font-size:10px;">last page</a>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="margin-right:0px;">
        <%@include file="/bookshop/inc/adm_authenticate.html"%>
    </div>