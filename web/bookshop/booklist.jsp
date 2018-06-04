<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="netshop.book.bean.bookclass"%>
<%@ page session="true"%>
<%@ page import="netshop.book.bean.book"%>
<jsp:useBean id="book" scope="page" class="netshop.book.bean.book" />
<script language="javascript">
    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height
                + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
</script>
<%@include file="/bookshop/inc/head.html" %>
<%@include file="/bookshop/inc/sub.html"%>
<div style="position: fixed;margin-left: 10px;">
    <%@include file="/bookshop/inc/left.html"%>
</div>
<div style="width: 1080px; height: 97.5%;overflow: scroll; ">
    <table width="900" style="margin-left: 80px;">
        <tr>
            <td width="150" valign="top" align="left">

            </td>
            <td width="600" valign="top">
                <p align="center">
                    <b><font color="#0000FF" size="3">Online</font><font color="#0000FF" size="3"> Bookstore Books<%=classname%>list</font>
                    </b>
                </p>
                <%
                    if (!keyword.equals("")) {
                        out.println("<p ><font color=#ff0000>You want to find out about &nbsp;" + keyword
                                + "&nbsp;following books</font></p>");
                    }
                %>
                <table width="100%" border="1" cellspacing="1" cellpadding="1"
                       bordercolor="black">
                    <tr align="center" bgcolor="#DEF3CE">
                        <td>
                            Book Name
                        </td>
                        <td>
                            Author
                        </td>
                        <td>
                            Book Category
                        </td>
                        <td>
                            Press
                        </td>
                        <td>
                            Unit Price
                        </td>
                        <td width=110>
                            Choice
                        </td>
                    </tr>
                    <%
                        if (book_list.book_search(request)) {
                            if (book_list.getBooklist().size() > 0) {
                                for (int i = 0; i < book_list.getBooklist().size(); i++) {
                                    book bk = (book) book_list.getBooklist().elementAt(i);
                    %>
                    <tr>
                        <td style="color: darkblue;"><%=bk.getBookName()%></td>
                        <td align="center"><%=bk.getAuthor()%></td>
                        <td align="center" style="color: #4a4744;"><%=bk.getClassname()%></td>
                        <td align="center" style="color: #4a4744;"><%=bk.getPublish()%></td>
                        <td align="center" style="color: red;"><%=bk.getPrince()%>£¤
                        </td>
                        <td align="center">
                            <a href="#"
                               onclick="openScript('buybook.jsp?bookid=<%=bk.getId()%>', 'show', 1036, 486)">Purchase</a>&nbsp;
                            <a href="#"
                               onclick="openScript('bookdetail.jsp?bookid=<%=bk.getId()%>', 'show', 1920, 1080)">Detail</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                            if (keyword.equals("")) {
                                out
                                        .println("<tr><td align='center' colspan=6>&nbsp;There are no such books for the time being</td></tr>");
                            } else {
                                out
                                        .println("<tr><td align='center' colspan=6>&nbsp;No you want to find the &nbsp;"
                                                + keyword + "&nbsp;relevant books</td></tr>");
                            }
                        }
                    } else {
                    %>
                    <tr>
                        <td align="center" colspan=6>
                            &nbsp;This kind of book does not exist
                        </td>

                    </tr>
                    <%
                        }
                    %>

                </table>
                <table width="90%" border="0" cellspacing="1" cellpadding="1">
                    <tr>
                        <td align="center">
                            Total results <%=book_list.getRecordCount()%> strip£¬current <%=book_list.getPage()%> page
                            <a href="booklist.jsp?classid=<%=classid%>&keyword=<%=keyword%>">Homepage</a>&nbsp;
                            <%
                                if (book_list.getPage() > 1) {
                            %>
                            <a
                                href="booklist.jsp?page=<%=book_list.getPage() - 1%>&classid=<%=classid%>&keyword=<%=keyword%>">Previouspage</a>&nbsp;
                            <%
                                }
                            %>
                            <%
                                if (book_list.getPage() < book_list.getPageCount() - 1) {
                            %>
                            <a
                                href="booklist.jsp?page=<%=book_list.getPage() + 1%>&classid=<%=classid%>&keyword=<%=keyword%>">Nextpage</a>&nbsp;
                            <%
                                }
                            %>
                            <a
                                href="booklist.jsp?page=<%=book_list.getPageCount()%>&classid=<%=classid%>&keyword=<%=keyword%>">Last</a>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
</div>
<%
    int pages = 1;
    String mesg = "";
    if (request.getParameter("page") != null
            && !request.getParameter("page").equals("")) {
        String requestpage = request.getParameter("page");
        try {
            pages = Integer.parseInt(requestpage);
        } catch (Exception e) {
            mesg = "The number of pages you are looking for is wrong!";
        }
        book_list.setPage(pages);
    }
%>
<%@include file="/bookshop/inc/authenticate.html"%>
