<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="netshop.book.bean.*"%>
<%@ page import="netshop.book.service.manage_book" %>
<%@ page import="netshop.book.service.manage_buybook" %>
<jsp:useBean id="book_list" scope="page" class="netshop.book.service.manage_book" />
<jsp:useBean id="classlist" scope="page" class="netshop.book.service.manage_bookclass" />
<jsp:useBean id="shopcart" scope="page" class="netshop.book.service.manage_shopcart" />
<jsp:useBean id="shop" scope="page" class="netshop.book.service.manage_buybook" />
<%
    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        userid = "";
    }
    String modi = request.getParameter("modi");
    String del = request.getParameter("del");
    String payoutCar = request.getParameter("payout");
    String clearCar = request.getParameter("clear");
    String mesg = "";
    if (modi != null && !modi.equals("")) {
        if (!shopcart.modiShoper(request)) {
            if (shopcart.getIsEmpty()) {
                mesg = "The number of books you want to modify is not enough for your purchase!";
            } else {
                mesg = "Amend the number of purchases has made a mistake£¡";
            }
        } else {
            mesg = "Amend success!";
        }

    } else if (del != null && !del.equals("")) {
        if (!shopcart.delShoper(request)) {
            mesg = "Error in deleting books in the list£¡";
        }
    } else if (payoutCar != null && !payoutCar.equals("")) {
        if (shopcart.payout(request)) {
            mesg = "The items in your shopping cart have been submitted to our store. Your order number is " + shopcart.getOrderId() + "<br>Please pay in time so that we can deliver the goods!";
            session.removeAttribute("shopcart");
        } else {
            if (!shopcart.getIsLogin()) {
                mesg = "You haven't logged in yet,please<a href=login.jsp>login</a>and submit later!";
            } else {
                mesg = "I'm sorry to have made a mistake. Please try again later";
            }
        }
    } else if (clearCar != null && !clearCar.equals("")) {
        session.removeAttribute("shopcart");
        mesg = "The list of items in the shopping cart has been emptied";
    }
%>
<script language="javascript">
    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
    function checklogin() {
        if (document.payout.userid.value == "")
        {
            alert("You are not logged in, please log in and submit the shopping list.");
            return false;
        }
        return true;
    }
    function check()
    {
        if (document.change.amount.value < 1) {
            alert("There is a problem with the number of your purchases.");
            document.change.amount.focus();
            return false;
        }
        return true;
    }

</script>
<link rel="stylesheet" type="text/css" href="css/bbcss.css" />
<div style="margin-left: 15px;">
<%@include file="/bookshop/inc/head.html"%>
</div>
<%@include file="/bookshop/inc/sub.html"%>

<table width="1080px" style='text-align:center;margin-top: 20px;overflow: scroll;'>
    <tr>
        <!--td width="150" align="center">
        <!--%@include file="/bookshop/inc/left.inc"%-->
        <td width="600">
            <p><b><font style="font-family:inherit;font-size:35px;color:#666666;">My shopping cart list</font></b></p>
                    <%
                        if (!mesg.equals("")) {
                            out.println("<p ><font color=#ff0000>" + mesg + "</font></p>");
                        }

                        Vector shoplist = (Vector) session.getAttribute("shopcart");
                        if (shoplist == null || shoplist.size() < 0) {
                            if (mesg.equals("")) {
                                out.println("<br><br><br><br><br>");
                                out.println("<p><font style='font-size:30px;color:#ff0000;'>You haven't chosen to buy books yet! Please buy it first!</font></p>");
                            }
                        } else {
                    %>
            <div style="overflow: scroll;height: 220px;">
                <table width="100%" border="1" bordercolor="white" style='margin-top:10px;'>
                    <tr align="center" bgcolor="#DEF3CE"> 
                        <td style="font-size:20px;">Book name</td>
                        <td style="font-size:20px;">Author</td>
                        <td style="font-size:20px;">Book category</td>
                        <td style="font-size:20px;">Unit Price</td>
                        <td style="font-size:20px;">Number</td>
                        <td style="font-size:20px;"colspan =2>Choice</td>
                    </tr>
                    <%
                        float totalprice = 0;
                        int totalamount = 0;
                        for (int i = 0; i < shoplist.size(); i++) {
                            allorder iList = (allorder) shoplist.elementAt(i);
                            if (book_list.getOnebook((int) iList.getBookNo())) {
                                book bk = (book) book_list.getBooklist().elementAt(0);
                                totalprice = totalprice + bk.getPrince() * iList.getAmount();
                                totalamount = totalamount + iList.getAmount();
                    %>
                    <tr>
                        <td><%= bk.getBookName()%></td>
                        <td align="center"><%= bk.getAuthor()%></td>
                        <td align="center"><%= bk.getClassname()%></td>
                        <td align="center"><%= bk.getPrince()%></td>
                    <form name="change" method="post" action="shopcar.jsp">
                        <td align="center">
                            <input type="text" name="amount" maxlength="4" size="3" value="<%= iList.getAmount()%>" >			  
                        </td>
                        <td align="center" width=55 >
                            <input type="hidden" name="bookid" value="<%= iList.getBookNo()%>" >
                            <input type="submit" name="modi" value="Modify" onclick="return(check());"></td>
                    </form>
                    <form name="del" method="post" action="shopcar.jsp">
                        <input type="hidden" name="bookid" value="<%= iList.getBookNo()%>" >
                        <td align=center width=55> <input type="submit" name="del" value="Delete">
                        </td>
                    </form>
                    </tr>
                    <% }
                        }%>  <tr><td colspan=7 align="right"><br>The total amount of the books you choose:<%= totalprice%>£¤&nbsp;&nbsp;Total quantity£º<%= totalamount%>Book&nbsp;</td></tr>
                </table>
            </div>
            <form name="payout" method="post" action="shopcar.jsp">
                <table width="90%" border="0" cellspacing="1" cellpadding="1" style="text-align: center;margin-top: -45px;">
                    <tr> 
                        <td  align="right" valign="bottom"> <a href="booklist.jsp" style="font-size:30px;color:#00CD00;margin-right:-180px;">Continue Buy</a>; 
                            <input type="hidden" name="userid" value="<%= userid%>">
                            <input type="hidden" name="totalprice" value="<%= totalprice%>">
                            <TEXTAREA NAME="content" ROWS="3" COLS="20" style="margin-right:520px;font-size:18px;">An accompanying statement£º</TEXTAREA><br>
				<input style="font-size:20px;width: 300px;" type="submit" class="button1" name="payout" value="Submit my shopping cart" onclick="javascript:return(checklogin());">&nbsp;
         </td>
			  <td valign="bottom">&nbsp;
                <input style="font-size:20px;width: 350px;" type="submit" class="button1" name="clear" value="Emptying my shopping cart">
              </td>
            </tr>
          </table>
        </form>
            <% }%>
      </td>
    </tr>
  </table>
<div style="margin-left: -228px;">
    <%@include file="/bookshop/inc/authenticate.html"%>   
</div>

 