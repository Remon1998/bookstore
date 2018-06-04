<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    } %>
<%@ page import="netshop.book.bean.*" %>
<%@ page import="netshop.book.util.*" %>
<jsp:useBean id="myIndentlist" scope="page" class="netshop.book.service.manage_buybook" />
<jsp:useBean id="mybook" scope="page" class="netshop.book.service.manage_book" />
<jsp:useBean id="user" scope="page" class="netshop.book.service.manage_user" />

<%
    String mesg = "";
    long Id = 0;
    String submit = request.getParameter("submit");
    if (submit != null && !submit.equals("")) {
        if (myIndentlist.update(request)) {
            mesg = "Update order status is successful!";
        } else {
            mesg = "Update order status error!";
        }
    }
    String order_id = request.getParameter("indentid");
//out.print(order_id);
    if (order_id == null || order_id.equals("")) {
        mesg = "The list of orders you want to view does not exist!";
    } else {
        try {
            if (!myIndentlist.getSinggleOrder(order_id) || !myIndentlist.getAllorder(order_id)) {
                mesg = "The list of orders you want to view does not exist!";
            }
        } catch (Exception e) {
            mesg = "The list of orders you want to view does not exist!";
        }
    }


%>
<script language="javascript">

    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
</script>
<html>
    <head>
        <title>Online Bookstore Management System         View Order Details</title>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
            <!--
            body {
                background-color: #FFFFFF;
            }
            -->
        </style><body text="#000000" >
        <% if (!mesg.equals("")) {
                out.println(mesg);
            } else {
                //out.print(order_id);
                order Ident = (order) myIndentlist.getAllorder().elementAt(0);
                //out.print(Ident.size());
                out.println(mesg);
        %>
        <p>Book order number:&nbsp;&nbsp;<%= Ident.getOrderId()%>&nbsp;&nbsp;&nbsp;&nbsp;List:</p>
        <table width="95%" border="1" cellspacing="1" cellpadding="1" bordercolor="#2DAE2D">
            <tr align="center"> 
                <td>Book name</td>
                <td>The author</td>
                <td>Book category</td>
                <td>Unit price (yuan)</td>
                <td>Quantity</td>
            </tr>
            <%

                float totalprice = 0;
                int totalamount = 0;
                for (int i = 0; i < myIndentlist.getOrder_list().size(); i++) {
                    out.println(mesg);
                    allorder idList = (allorder) myIndentlist.getOrder_list().elementAt(i);
                    if (mybook.getOnebook((int) idList.getBookNo())) {
                        book bk = (book) mybook.getBooklist().elementAt(0);
            %>	  
            <tr align="center"> 
                <td><%= bk.getBookName()%></td>
                <td><%= bk.getAuthor()%></td>
                <td><%= bk.getClassname()%></td>
                <td><%= bk.getPrince()%></td>
                <td><%= idList.getAmount()%></td>
            </tr>
            <%	totalprice = totalprice + bk.getPrince() * idList.getAmount();
                totalamount = totalamount + idList.getAmount();
            } %>

            <%   }%><tr align="center"> 
                <td colspan=5 >The total amount of purchase is:<%= totalprice%>Yuan, the total quantity is£º<%= totalamount%></td> </tr>
        </table>
        <br>
        <table width="95%" border="1" cellspacing="2" cellpadding="1" bordercolor="#2DAE2D" >
            <tr> 
                <td width="40%" align="right">Order users:</td>
                <td width="60%"><%
          if (user.getUserinfo(Ident.getUserId())) {
              user userinfo = (user) user.getUserlist().elementAt(0);%>
                    <a href="#" onClick="openScript('user_detail.jsp?userid=<%= Ident.getUserId()%>', 'showuser', 450, 500)"><%= userinfo.getUserName()%></a>
                    <%} else {
                            out.println("This user has been deleted");
                        }
                    %></td>
            </tr>
            <tr> 
                <td width="40%" align="right">order time:</td>
                <td width="60%"><%= Ident.getSubmitTime()%></td>
            </tr>
            <tr> 
                <td width="40%" align="right">Delivery time:</td>
                <td width="60%"><%= Ident.getConsignmentTime()%>&nbsp;</td>
            </tr>
            <tr> 
                <td width="40%" align="right">Total amount:</td>
                <td width="60%"><%= Ident.getTotalPrice()%>&nbsp;</td>
            </tr>
            <tr> 
                <td width="40%" align="right">IP when ordering:</td>
                <td width="60%"><%= Ident.getIPAddress()%>&nbsp;</td>
            </tr>
            <tr> 
                <td width="40%" align="right">User comments:</td>
                <td width="60%"><%= dataFormat.toHtml(Ident.getContent())%>&nbsp;</td>
            </tr>
            <form name="form1" method="post" action="order_detail.jsp" >
                <tr> 
                    <td width="40%" align="right">Whether to pay:</td>
                    <td width="60%"> 
                        <input type="radio" name="payoff" value="1" <%if (!Ident.getIsPayoff()) {
                out.print("checked");
            } %>>
                        No<input type="radio" name="payoff" value="2" <%if (Ident.getIsPayoff()) {
                out.print("checked");
            } %>>
                        Yes</td>
                </tr>
                <tr> 
                    <td width="40%" align="right">Delivery:</td>
                    <td width="60%"> 
                        <input type="radio" name="sales" value="1" <%if (!Ident.getIsSales()) {
                out.print("checked");
            } %>>
                        Yes<input type="radio" name="sales" value="2" <%if (Ident.getIsSales()) {
                out.print("checked");
            }%>>
                        No</td>
                </tr>
                <tr>
                    <td width="40%" align="right">&nbsp;</td>
                    <td width="60%">
                        <input type="hidden" name="indentid" value="<%= order_id%>">
                        <input type="submit" name="submit" value="Update">
                    </td>
                </tr>
            </form>
        </table>
        <% }%>     

        <br><input style="align-content: center;margin-left: 700px;width: 150px;height: 50px" type="button" onclick="javascript:window.close()" value="Close The Window">

    </body>
</html>