<%@ page contentType="text/html; charset=gb2312"%>
<%@ page session="true"%>
<%@ page import="netshop.book.bean.book"%>
<%@ page import="netshop.book.util.dataFormat"%>
<jsp:useBean id="book" scope="page"
             class="netshop.book.service.manage_book" />
<%
    String mesg = "";
    int Id = 0;
    if (request.getParameter("bookid") == null
            || request.getParameter("bookid").equals("")) {
        mesg = "The books you want to view do not exist！";
    } else {
        try {
            Id = Integer.parseInt(request.getParameter("bookid"));
            if (!book.getOnebook(Id)) {
                mesg = "The books you want to view do not exist！";
            }
        } catch (Exception e) {
            mesg = "The books you want to view do not exist！";
        }
    }
%>

<html>
    <head>
        <title>Bookstore online check books </title>
        <link rel="stylesheet" type="text/css" href="css/bbcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <script language="javascript">
            function check()
            {
                if (document.form1.amount.value < 1) {
                    alert("There is a problem with the number of your purchases ");
                    document.form1.amount.focus();
                    return false;
                }
                return true;
            }

        </script>
        <link rel="stylesheet" href="books.css" type="text/css">
    </head>
    <body>
        <%@include file="/bookshop/inc/head.html" %>
        <div style="overflow: scroll;height:700px;" id="b1"  align="center">
            <p id="p1">
                The online bookstore welcomes you
                <font color="#CC0066">Choose and buy books</font>！
            </p>
            <%
                if (!mesg.equals("")) {
                    out.println(mesg);
                } else {
                    book bk = (book) book.getBooklist().elementAt(0);
            %>

            <table width="85%" border="0" >
                <form name="form1" method="post" action="buybook.jsp">
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Book name ：
                            </span>
                        </td>
                        <td><%=bk.getBookName()%></td>
                    </tr>
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Author：
                            </span>
                        </td>
                        <td><%=bk.getAuthor()%></td>
                    </tr>
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Category：
                            </span>

                        </td>
                        <td><%=bk.getClassname()%></td>
                    </tr>
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Press：
                            </span>

                        </td>
                        <td><%=bk.getPublish()%></td>
                    </tr>
                    <tr>
                        <td align="right" width="120">
                            <span class="right1">
                                Book number：
                            </span>

                        </td>
                        <td><%=bk.getBookNo()%></td>
                    </tr>
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Book prices：
                            </span>

                        </td>
                        <td><%=bk.getPrince()%></td>
                    </tr>
                    <tr>
                        <td  align="right" width="120">
                            <span class="right1">
                                Cover：
                            </span>

                        </td>
                        <td>
                            <img src="<%=bk.getPicture()%>" width="140" height="170">
                        </td>
                    </tr>
                    <tr>
                        <td  align="right" width="120" valign="top">
                            <span class="right1">
                                Content introduction：
                            </span>

                        </td>
                        <td width="400"><%=dataFormat.toHtml(bk.getContent())%></td>
                    </tr>
                    <tr>
                        <td align="right" width="120" valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="margin-top: 10px;">
                        <td align="right" width="80">
                            &nbsp;
                        </td>
                        <td align="center" width="120" >
                            purchase：
                            <input type="text" name="amount" value="1" id="text1">
                            book
                        </td>
                    </tr>
                    <tr style="margin-top: 10px;">
                        <td align="right" width="120" valign="top">
                            &nbsp;
                        </td>
                        <td align="center">
                            <input type="hidden"  name="bookid" value="<%=Id%>">
                            <input type="submit" class="button1" name="Submit" value="purchase"
                                   onClick="return(check());">
                            <input type="reset" class="button1" name="reset" value="cancel">
                        </td>
                    </tr>
                </form>
            </table>
            <%
                }
            %>
            <p align="center" style="margin-top: 20px; font-size: 20px;">
                <a href="javascript:window.close()">close window</a>
            </p>
        </div>
        <br><br>
        <%@include file="/bookshop/inc/authenticate.html"%>
    </body>
</html>
