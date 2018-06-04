<%@ page contentType="text/html; charset=gb2312"%>
<%@ page session="true"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.equals("")) {
        response.sendRedirect("login.jsp?msg=nologin");
    }
%>
<%@ page import="netshop.book.bean.book"%>
<%@ page import="netshop.book.util.*"%>
<%@ page import="netshop.book.bean.allorder"%>
<%@ page import="netshop.book.service.manage_book"%>
<jsp:useBean id="myIndentlist" scope="page"
             class="netshop.book.service.manage_buybook" />
<jsp:useBean id="mybook" scope="page"
             class="netshop.book.service.manage_book" />
<%
    String mesg = "";
    long Id = 0;
    String indentNo = request.getParameter("orderno");
    System.out.println(indentNo);
    if ((indentNo == null) || indentNo.equals("")) {
        mesg = "The list of orders you are looking for does not exist£¡";
    } else {
        try {
            Id = Long.parseLong(request.getParameter("id"));
            if (!myIndentlist.getAllorder(indentNo)) {
                mesg = "The list of orders you are looking for does not exist£¡";
            }
        } catch (Exception e) {
            mesg = "The list of orders you are looking for does not exist£¡";
        }
    }
    System.out.println("exist");
%>
<html>
    <style type="text/css">

    </style>
    <head>
        <title>Online bookstore check order list information</title>
        <link rel="stylesheet" href="books.css" type="text/css">
    </head>
    <body text="#000000" onLoad="javascript:window.focus();">
        <div align="center">
            <%
                if (!mesg.equals("")) {
                    out.println(mesg);
                } else {
            %>
            <div style="margin-top: 30px">
                <p style="font-size:35px;font-family:inherit;color:	#008B00;">
                    Book order of online bookstore<%=indentNo%>&nbsp;Detailed list:
                </p>
            </div>
            <table width="80%" border="1" cellspacing="1" cellpadding="1"
                   bordercolor="#CC9966">
                <tr align="center">
                    <td style="font-size:20px;">
                        Book name
                    </td>
                    <td style="font-size:20px;">
                        Author
                    </td>
                    <td style="font-size:20px;">
                        Book category
                    </td>
                    <td style="font-size:20px;">
                        Unit price
                    </td>
                    <td style="font-size:20px;">
                        Number
                    </td>
                </tr>
                <%
                    for (int i = 0; i < myIndentlist.getOrder_list().size(); i++) {
                        allorder idList = (allorder) myIndentlist.getOrder_list()
                                .elementAt(i);
                        //out.print(idList.getBookNo());
                        if (mybook.getOnebook((int) idList.getBookNo())) {
                            book bk = (book) mybook.getBooklist().elementAt(0);
                %>
                <tr align="center">
                    <td><%=bk.getBookName()%></td>
                    <td><%=bk.getAuthor()%></td>
                    <td><%=bk.getClassname()%></td>
                    <td><%=bk.getPrince()%></td>
                    <td><%=idList.getAmount()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <%
                }
            %>
            <br>
            <p>
                <a href="javascript:window.close()">Close window</a>
            </p>
        </div>
    </body>
</html>