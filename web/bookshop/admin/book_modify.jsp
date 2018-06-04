<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
//	response.sendRedirect("error.htm");
    } %>
<%@ page import="netshop.book.bean.*" %>

<jsp:useBean id="classlist" scope="page" class="netshop.book.service.manage_bookclass" />
<jsp:useBean id="book" scope="page" class="netshop.book.service.manage_book" />
<%
    String mesg = "";
    String submit = request.getParameter("Submit");
    int Id = 0;
    if (submit != null && !submit.equals("")) {
        if (book.getRequest(request)) {
            if (book.update()) {
                mesg = "Book detail edit Successfully£¡";
            } else {
                mesg = "Database operation failed";
            }
        } else {
            mesg = "Sorry, the parameters you submitted are wrong";
        }
    }
    if (request.getParameter("id") == null || request.getParameter("id").equals("")) {
        mesg = "You want to modify the data parameter error!";
    } else {
        try {
            Id = Integer.parseInt(request.getParameter("id"));
            if (!book.getOnebook(Id)) {
                mesg = "The data you want to modify does not exist.";
            }
        } catch (Exception e) {
            mesg = "You want to modify the data parameter error!";
        }
    }
%>
<script language="javascript">
    function checkform() {
        if (document.form1.id.value == "") {
            alert("The data you want to modify does not exist!");
            return false;
        }
        if (document.form1.bookname.value == "") {
            document.form1.bookname.focus();
            alert("The book is called empty!");
            return false;
        }
        if (document.form1.author.value == "") {
            alert("The author's name is blank!");
            document.form1.author.focus();
            return false;
        }

        return true;

    }
</script>
<style type="text/css">
    .button1 { width: 80px;
               height: 30px;   
               font-size: 10px;
               font-family: Î¢ÈíÑÅºÚ;
               padding-left: 12px;
               border-radius: 5px;
               border: 1px solid #2576A8;
               color:beige;
               text-shadow: 1px 1px 0.5px #22629B;
               margin-right: 30px;
               background-color: orange;
    }
    .button1:hover{
        background: -webkit-linear-gradient(top,#8DC9EF,#4E9FD1);
        background: -moz-linear-gradient(top,#8DC9EF,#4E9FD1);
        background: linear-gradient(top,#8DC9EF,#4E9FD1);
        background: -ms-linear-gradient(top,#8DC9EF,#4E9FD1);  
    }
    #b1 {                                
        background: url("images/first.png")no-repeat center center;
        background-size:100% 100%;
        text-align:center;
        padding-top: 20px;
        height: 70%;
        text-align:center;
        margin:0 auto;
        width:1080px;
        align:center;

    }  

</style>
<%@include file="/bookshop/inc/adm_head.html"%>
<div id="b1"  align="center" width="77%" style="background-image:url('../images/first.png');width: 1080px;height: 69.5%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;"> 

    <p  align="center" style="font-size:20px; color:red;margin-top: -15px;"><b>Revision of library materials</b></p>
    <% if (!mesg.equals("")) {
            out.println(mesg);
        } else {
            book modibook = (book) book.getBooklist().elementAt(0);
    %>
    <form name="form1" method="post" action="book_modify.jsp" style=" margin-top: -70px; width: 650px;margin-left: 170px;">
        <table align="center" width="100%" border="0" cellspacing="1" cellpadding="1" style="margin-top:-5px; background-color:rgba(52, 52, 52, .4);">
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">Book name:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="bookname" maxlength="40" size="60" value="<%= modibook.getBookName()%>">
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">The author:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="author" maxlength="25" size="40" value="<%= modibook.getAuthor()%>">
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">Press:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;"  name="publish" size="40" maxlength="150" value="<%= modibook.getPublish()%>">
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">Category:</td>
                <td width="65%"> 
                    <select name="bookclass">
                        <% if (classlist.seachBookClass()) {
                                for (int i = 0; i < classlist.getClasslist().size(); i++) {
                                    bookclass bc = (bookclass) classlist.getClasslist().elementAt(i);%>
                        <option value="<%= bc.getId()%>" <% if (bc.getId() == modibook.getBookClass()) {
                                out.print("selected");
                            }%>><%= bc.getClassName()%></option>
                        <%		}
                            }%>	

                    </select>
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">Call number:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="bookno" size="20" maxlength="30" value="<%= modibook.getBookNo()%>">
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">Pricing:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="price" size="8" maxlength="10" value="<%= modibook.getPrince()%>">
                    <font color="white">£¤</font></td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">The total number:</td>
                <td width="65%"> 
                    <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="amount" size="8" maxlength="10" value="<%= modibook.getAmount()%>">
                    <font color="white">Pc</font></td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%" valign="top">Book cover:</td>
                <td width="65%"> 
                    <input type="text" name="picture" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" size="25" maxlength="10" value="<%= modibook.getPicture()%>">

                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%" valign="top">Book introduction:</td>
                <td width="65%"> 
                    <textarea name="content" cols="40" rows="6"><%= modibook.getContent()%></textarea>
                </td>
            </tr>
            <tr> 
                <td style="font-size: 20px;color:white;" align="right" width="35%">&nbsp;</td>
                <td width="65%"> 
                    <input type="hidden" name="id" value="<%= Id%>">
                    <input type="submit" class="button1"  name="Submit" value="Submit" onclick="return(checkform());">
                    <input type="reset" class="button1"  name="reset" value="Reset">
                </td>
            </tr>
        </table>
    </form> 
    <% }%>
    <p>&nbsp;</p>
</div>

<%@include file="/bookshop/inc/adm_authenticate.html"%>
