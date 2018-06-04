<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    }
%>

<%@ page import="netshop.book.bean.*" %>
<%@ page import="netshop.book.service.manage_user" %>
<jsp:useBean id="shop" scope="page" class="netshop.book.service.manage_buybook" />
<jsp:useBean id="user" scope="page" class="netshop.book.service.manage_user" />

<%
    int pages = 1;
    String mesg = "";
    if (request.getParameter("action") != null && request.getParameter("action").equals("del")) {
        try {
            long id = Long.parseLong(request.getParameter("indentid"));
            if (shop.delete(id)) {
                mesg = "Delete order data successfully!";
            } else {
                mesg = "Error deleting order!";
            }
        } catch (Exception e) {
            mesg = "You want to delete the data parameter error!";
        }
    }

    if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
        String requestpage = request.getParameter("page");
        try {
            pages = Integer.parseInt(requestpage);
        } catch (Exception e) {
            mesg = "The page number you are looking for is wrong!";
        }
        shop.setPage(pages);
    }
%>
<script language="javascript">

    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
</script>
<%@include file="/bookshop/inc/adm_head.html"%>
<div align="center" width="77%" style="margin-top: -1px; background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
    <tr><center><td ><br><p style="font-size: 20px;color: red">Online bookstores All current orders</p></td></center></tr>
<tr></tr>
<tr>
    <% if (!mesg.equals("")) {
            out.println("<font color=red>" + mesg + "</font><br>");
        }%>
<table width="778" border="1" cellspacing="1" cellpadding="1" bgcolor="#E4EDFB"  bordercolor="white" align="center">
    <tr align="center" bgcolor="#DEF3CE"> 
        <td>Order number</td>
        <td>UserName</td>
        <td>Order Time</td>
        <td>Delivery Time</td>
        <td>Total Amount</td>
        <td>Ordering IP</td>
        <td>Payment</td>
        <td>Ship</td>
        <td>View</td>
    </tr>
    <%
        if (shop.getOrder()) {
            for (int i = 0; i < shop.getAllorder().size(); i++) {
                order Ident = (order) shop.getAllorder().elementAt(i);%>
    <tr>
        <td><%= Ident.getOrderId()%></td>
        <td align="center"><%
            if (user.getUserinfo(Ident.getUserId()) && user.getUserlist().size() > 0) {
                user userinfo = (user) user.getUserlist().elementAt(0);%>
            <a href="#" onclick="openScript('user_detail.jsp?userid=<%= Ident.getUserId()%>', 'showuser', 450, 500)"><%= userinfo.getUserName()%></a>
            <%} else {
                    out.println("This user has been deleted");
                }
            %></td>
        <td align="center"><%= Ident.getSubmitTime()%></td>
        <td align="center"><%= Ident.getConsignmentTime()%></td>
        <td align="center"><%= Ident.getTotalPrice()%></td>
        <td align="center"><%= Ident.getIPAddress()%></td>
        <td align="center">
            <% if (Ident.getIsPayoff()) {
                    out.print("Paid off");
                } else {
                    out.print("Unpaid");
                }
            %></td>
        <td align="center">
            <% if (Ident.getIsSales()) {
                    out.print("Shipped");
                } else {
                    out.print("Unshipped");
                }
            %></td>
        <td align="center"><a href="#"  onclick="openScript('order_detail.jsp?indentid=<%= Ident.getOrderId()%>', 'indent', 500, 500)" >Details</a>&nbsp;<a href="adm_order.jsp?action=del&indentid=<%= Ident.getId()%>&page=<%= shop.getPage()%>" onclick="return(confirm('Do you really want to delete it?'))">Delete</a></td>
    </tr>
    <%		}
        }

    %>

</table>
<table width="778" border="0" cellspacing="1" cellpaddings="1" bgcolor="#E4EDFB"  bordercolor=#CC0000 align="center">
    <tr>
        <td align="right">Current <%= shop.getPage()%>Page¡¡<a href="adm_order.jsp">Home Page</a>&nbsp; 
            <% if (shop.getPage() > 1) {%>
            <a href="adm_order.jsp?page=<%= shop.getPage() - 1%>">Previous</a>&nbsp; 
            <% } %>
            <% if (shop.getPage() < shop.getPageCount() - 1) {%>
            <a href="adm_order.jsp?page=<%= shop.getPage() + 1%>">Next</a>&nbsp; 
            <% }%>
            <a href="adm_order.jsp?page=<%= shop.getPageCount()%>">last</a>&nbsp;</td>
    </tr>
</table>
</tr>
</div>
<%@include file="/bookshop/inc/adm_authenticate.html"%>