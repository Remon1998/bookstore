<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    } %>
<%@ page import="netshop.book.bean.*"%>
<jsp:useBean id="classlist" scope="page" class="netshop.book.service.manage_bookclass" />
<jsp:useBean id="book" scope="page" class="netshop.book.service.manage_book" />
<%
    String mesg = "";
    String submit = request.getParameter("Submit");
    if (submit != null && !submit.equals("")) {
        if (book.getRequest(request)) {
            if (book.insert()) {
                mesg = "New book information submitted successfully£¡";
            } else {
                mesg = "Database operation failed";
            }
        } else {
            mesg = "Sorry, the parameters you submitted are wrong";
        }
    }
%>
<script language="javascript">
    function checkform() {
        if (document.form1.bookname.value == "") {
            document.form1.bookname.focus();
            alert("Book name is empty!");
            return false;
        }
        if (document.form1.author.value == "") {
            alert("Author name is empty!");
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
<div align="center" width="77%" style="margin-top: -12px; background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left: 228px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;"> 
    <div style='margin-top:0px;'>
        <p><br>
            <font style="font-size:35px;color:#0A0A0A;font-family:inherit;"><b>Add new book information</b></font></p>
            <% if (!mesg.equals("")) {
                    out.println(mesg);
                }%>
    </div>
    <div style='margin-top:-20px;margin-left:-60px;background-color:rgba(52, 52, 52, .4);width:650px;text-align: left;'>
        <form name="form1" method="post" action="adm_addbook.jsp" style="width: 100%;height: 64%;margin-left: -20px;">
            <table width="90%" border="0" cellspacing="1" cellpadding="1" style="margin-top: -30px;">
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>BookName£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="bookname" maxlength="40" size="30">
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Author£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="author" maxlength="25" size="20">
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Publisher£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="publish" size="40" maxlength="150">
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Category£º</td>
                    <td width="65%"> 
                        <select name="bookclass">
                            <% if (classlist.seachBookClass()) {
                                    for (int i = 0; i < classlist.getClasslist().size(); i++) {
                                        bookclass bc = (bookclass) classlist.getClasslist().elementAt(i);%>
                            <option value="<%= bc.getId()%>"><%= bc.getClassName()%></option>
                            <%		}
                                }%>	

                        </select>
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>BookNo£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="bookno" size="20" maxlength="30">
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Price£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="price" size="8" maxlength="10">
                        <font color="white">£¤</font></td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Total amount£º</td>
                    <td width="65%"> 
                        <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="amount" size="8" maxlength="10">
                        <font color="white">Pc</font></td>
                </tr>
                <tr> 
                    <td align="right" width="35%" style='font-size:20px;color:#FFFFFF'>Book cover£º</td>
                    <td width="65%"> 
                        <input type="File" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" name="picture" class=box>
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%" valign="top" style='font-size:20px;color:#FFFFFF'>Description£º</td>
                    <td width="65%"> 
                        <textarea name="content" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;" cols="40" rows="6"></textarea>
                    </td>
                </tr>
                <tr> 
                    <td align="right" width="35%">&nbsp;</td>
                    <td width="65%"> 
                        <input type="submit" class="button1" name="Submit" value="Submit" onclick="return(checkform());">
                        <input type="reset" class="button1" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <p>&nbsp;</p>
</div>
<%@include file="/bookshop/inc/adm_authenticate.html"%>