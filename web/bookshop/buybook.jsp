<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%@ page import="netshop.book.bean.book" %>
<jsp:useBean id="book" scope="page" class="netshop.book.service.manage_book" />
<jsp:useBean id="shop" scope="page" class="netshop.book.service.manage_shopcart" />
<%
    String mesg = "";
    String submits = request.getParameter("Submit");
    int Id = 0;
    if (submits != null && !submits.equals("")) {
        if (shop.addnew(request)) {
            mesg = "The books you want have been put into your shopping cart! Thank you!";
        } else if (shop.getIsEmpty()) {
            mesg = "The number of the book in stock is insufficient! Only left" + shop.getLeaveBook();
        } else {
            mesg = "You can't buy it now£¡";
        }
    } else {
        if (request.getParameter("bookid") == null || request.getParameter("bookid").equals("")) {
            mesg = "The books you want to buy do not exist£¡";
        } else {
            try {
                Id = Integer.parseInt(request.getParameter("bookid"));
                if (!book.getOnebook(Id)) {
                    mesg = "The books you want to buy do not exist£¡";
                }
            } catch (Exception e) {
                mesg = "The books you want to buy do not exist£¡";
            }
        }
    }
%>
<html>
    <head>
        <title>Online bookstore management system purchase books</title>
        <link rel="stylesheet" type="text/css" href="css/bbcss.css" />

        <script language="javascript">

            function openScript(url, name, width, height) {
                var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
            }
            function check()
            {
                if (document.form1.amount.value < 1) {
                    alert("There is a problem with the number of your purchases!");
                    document.form1.amount.focus();
                    return false;
                }
                return true;
            }

        </script>
        <link rel="stylesheet" href="books.css" type="text/css">
    </head>
    <body text="#000000" style="text-align:center;" onLoad="javascript:window.focus();">
        <div  align="center" id="b1">
            <p id="p1">The online bookstore welcomes you<font color="#CC0066">Choose and buy books</font>£¡</p>
                <% if (!mesg.equals("")) {
                        out.println(mesg);
                    } else {
                        book bk = (book) book.getBooklist().elementAt(0);
                %>
            <table  width="90%" border="0" cellspacing="2" id="table1" align="center" cellpadding="1">
                <form name="form1" style="text-align:center;" method="post" action="buybook.jsp">
                    <tr style="text-align:center;"> 
                        <td align="center" style="padding-top: 6px;"><span id="p2" > Book name£º</span><span > <%= bk.getBookName()%></span></td>
                    </tr>
                    <tr align="center" style="text-align:center;"> 
                        <td>The number you want£º 
                            <input type="text"  name="amount" id="text1" value="1"> book</td>
                    </tr>
                    <tr align="center" style="text-align:center;"> 
                        <td>
                            <input type="hidden" name="bookid" value="<%=Id%>">
                            <input type="submit" name="Submit" class="button1" value="Purchase" onClick="return(check());">
                            <input type="reset" name="Reset" class="button1" value="Cancel">
                        </td>
                    </tr>
                    <tr align="center"> 
                        <td><a href="#" onClick="openScript('bookdetail.jsp?bookid=<%= Id%>', 'show', 400, 450)" >Look at the details</a> </td>
                    </tr>
                </form>
            </table>
            <% }%>
            <p style="margin-top: 10px;font-size: 20px;" align="center"><a href="javascript:window.close()">close window</a></p>
        </div>
    </body>
</html>
