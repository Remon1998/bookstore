<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    } %>
<%@ page import="netshop.book.bean.*" %>
<jsp:useBean id="book_list" scope="page" class="netshop.book.service.manage_book" />
<%
    int pages = 1;
    String mesg = "";

    if (request.getParameter("action") != null && request.getParameter("action").equals("del")) {
        try {
            int delid = Integer.parseInt(request.getParameter("id"));
            if (book_list.delete(delid)) {
                mesg = "Delete Successfully！";
            } else {
                mesg = "Delete error！";
            }
        } catch (Exception e) {
            mesg = "Sorry, the parameters you submitted are wrong!";
        }
    }

    if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
        String requestpage = request.getParameter("page");
        try {
            pages = Integer.parseInt(requestpage);
        } catch (Exception e) {
            mesg = "The page number you are looking for is wrong!";
        }
    }


%>
<script language="javascript">
    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
</script>

<%@include file="/bookshop/inc/adm_head.html"%>
<div align="center" width="77%" style="margin-top: -20px; background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
    <p align="center" style="font-size:20px; color:red">Bookstore Online Book Information</p>
    <tr>
    <table width="778" border="1" cellspacing="2" bgcolor="#E4EDFB"  bordercolor="white" align="center">

        <tr align="center" bgcolor="#DEF3CE"> 
            <td>BookNo</td>
            <td>BookName</td>
            <td>Author</td>
            <td>Category</td>
            <td>Price</td>
            <td>Total Amount</td>
            <td>Remaining Amount</td>
            <td>Action</td>
        </tr>
        <% if (book_list.book_search(request)) {
                for (int i = 0; i < book_list.getBooklist().size(); i++) {
                    book bk = (book) book_list.getBooklist().elementAt(i);
        %>
        <tr> 
            <td align="center"><%=bk.getId()%></td>
            <td><a href="#" onclick="openScript('book_detail.jsp?bookid=<%= bk.getId()%>', 'sbook', 450, 500);"><span style="color: black;"><%= bk.getBookName()%></span></a></td>
            <td align="center"><%= bk.getAuthor()%></td>
            <td align="center"><%= bk.getClassname()%></td>
            <td align="center"><span style="color:red"><%= bk.getPrince()%></span></td>
            <td align="center"><%= bk.getAmount()%></td>
            <td align="center"><%= bk.getLeav_number()%></td>
            <td align="center"><a href="book_modify.jsp?id=<%= bk.getId()%>"><u>Edit</u></a>&nbsp;&nbsp;<a href="adm_book.jsp?action=del&page=<%= pages%>&id=<%= bk.getId()%>" onclick="return(confirm('Really want to delete'))"><u>Delete</u></a></td>
        </tr>
        <% }
        } else {%>
        <tr> 
            <td align="center" colspan=8>&nbsp;网站正在维护中，请稍后......</td>

        </tr>
        <% }%>
    </table>

    <table width="778" border="0" cellspacing="1" cellpadding="1" bgcolor="#E4EDFB" align="center">
        <tr>
            <td align="right">CurrentPage 第<%= book_list.getPage()%>Page　<a href="adm_book.jsp">HomePage</a>&nbsp;
                <% if (book_list.getPage() > 1) {%><a href="adm_book.jsp?page=<%= book_list.getPage() - 1%>">PreviousPage</a>&nbsp;<% } %>
                <% if (book_list.getPage() < book_list.getPageCount() - 1) {%><a href="adm_book.jsp?page=<%= book_list.getPage() + 1%>">NextPage</a>&nbsp;<% }%>
                <a href="adm_book.jsp?page=<%= book_list.getPageCount()%>">LastPage</a>&nbsp;</td>
        </tr>
    </table>

</div>
<%@include file="/bookshop/inc/adm_authenticate.html"%>