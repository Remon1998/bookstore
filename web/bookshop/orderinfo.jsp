<%@ page contentType="text/html; charset=gb2312"%>
<%@ page session="true"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.equals("")) {
        response.sendRedirect("login.jsp?msg=nologin");
    }
%>
<%@ page import="netshop.book.service.manage_buybook"%>
<%@ page import="netshop.book.bean.order"%>
<jsp:useBean id="my_order" scope="page"
             class="netshop.book.service.manage_buybook" />

<%
    String mesg = "";
    String Uid = (String) session.getAttribute("userid");
    long uid = 0;
    try {
        uid = Long.parseLong(Uid);
    } catch (Exception e) {
        uid = 0;
        mesg = "Unpredictable errors!";
    }
    if (!my_order.getOrder(uid)) {
        mesg = "You haven't bought books at this station.";
    }
%>
<script language="javascript">
    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
</script>
<%@include file="/bookshop/inc/head.html"%>
<%@include file="/bookshop/inc/sub.html"%>
<table width="1080px" style='text-align:center;'>
    <td align="center">
        <p>
            <br>
            <font color="#33FFCC"><b><font style="font-size:35px;font-family:inherit;color:#666666;">Your order information</font>
            </b>
            </font>
        </p>
        <%if (!mesg.equals("")) {
                out.println("<p><font color=red>" + mesg + "</font></p>");
            } else {   %>
        <table width="100%" border="1" cellspacing="2" cellpadding="1"
               bordercolor="white" style='margin-top:40px;'>
            <tr align="center" bgcolor="#DEF3CE">
                <td style="font-size:20px;">
                    Order number
                </td>
                <td style="font-size:20px;">
                    Time of submission
                </td>
                <td style="font-size:20px;">
                    Total amount
                </td>
                <td style="font-size:20px;">
                    Payment
                </td>
                <td style="font-size:20px;">
                    Deliver goods
                </td>
                <td style="font-size:20px;">
                    Details
                </td>
            </tr>
            <%for (int i = 0; i < my_order.getAllorder().size(); i++) {
                    order order = (order) my_order.getAllorder().elementAt(i);
            %>
            <tr>
                <td>
                    <font color=red><%=order.getOrderId()%></font>
                </td>
                <td align="center"><%= order.getSubmitTime()%></td>
                <td align="center"><%= order.getTotalPrice()%></td>
                <td align="center">
                    <% if (order.getIsPayoff()) {
                            out.print("Paid off");
                        } else {
                            out.print("Unpaid");
                        }
                    %>
                </td>
                <td align="center">
                    <% if (order.getIsSales()) {
                            out.print("Already shipped");
                        } else {
                            out.print("Unshipped delivery");
                        }
                    %>
                </td>
                <td align="center">
                    <a href="#"
                       onclick="openScript('order.jsp?id=<%= order.getId()%>&orderno=<%=order.getOrderId()%>', 'indentlist', 1060,400);">View</a>
                </td>
            </tr>
            <%}%>
        </table>
        <%}%>
        <p>&nbsp;</p>
    </td>
</table>
<div style="margin-left: -228px;">
    <%@include file="/bookshop/inc/authenticate.html"%>
</div>