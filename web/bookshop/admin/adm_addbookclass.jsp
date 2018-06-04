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
        if (classlist.getRequest(request)) {
            if (classlist.insert()) {
                mesg = "New book classname submitted successfully£¡";
            } else {
                mesg = "Database operation failed";
            }
        } else {
            mesg = "Sorry, the parameters you submitted are wrong";
        }
    }
    if (request.getParameter("action") != null && request.getParameter("action").equals("del")) {
        try {
            int delid = Integer.parseInt(request.getParameter("id"));
            if (classlist.delete(delid)) {
                mesg = "Delete Successfully£¡";
            } else {
                mesg = "Delete error£¡";
            }
        } catch (Exception e) {
            mesg = "The object you want to delete is wrong!";
        }
    }
%>

<script language="javascript">
    function checkform() {
        if (document.form1.bookclassname.value == "") {
            document.form1.bookname.focus();
            alert("Book classname is empty!");
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
<div style="background-image:url('../images/first.png');width: 1080px;height: 72%;margin-left: 220px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
    <div align="center"><font style="font-family:inherit;font-size:35px;height: 100px">Existing book classification</font>
        <br>
        <% if (classlist.seachBookClass()) {
                for (int i = 0; i < classlist.getClasslist().size(); i++) {
                    bookclass bc = (bookclass) classlist.getClasslist().elementAt(i);%>
        <div align="left" style="margin-left:0px;margin-top:5px;color:#FFFFFF;background-color:rgba(52, 52, 52, .4);width:500px;"> &nbsp;&nbsp;&nbsp;&nbsp;Category Name£º<%= bc.getClassName()%>&nbsp;<a href="adm_addbookclass.jsp?id=<%= bc.getId()%>&action=del" style="">Delete</a></div>
        <%		}
            }%>

        <div align="center" width="1080px" heght="20px"> 
            <div align="left" style=" margin-left: 448px;">
                <p><br>

                    <font style="font-size:25px;"><b>Add a new book category</b></font></p>
                    <% if (!mesg.equals("")) {
                            out.println(mesg);
                        }%>
            </div>
            <form name="form1" method="post" action="adm_addbookclass.jsp" style="height: 23px">
                <table width="55%" border="0" cellspacing="1" cellpadding="1" style="margin-top: -65px;">
                    <tr> 
                        <td align="right" width="35%" style="font-size: 20px;color:#FFFFFF">Classification£º</td>
                        <td width="65%"> 
                            <input type="text" style="border-radius: 30px;text-align:center;background-color:#E6E6FA;height: 30px"  name="bookclassname" maxlength="40" size="30">
                        </td>
                    </tr>            
                    <tr > 
                        <td align="right" width="35%"><input type="submit" class="button1" name="Submit" value="Submit" onclick="return(checkform());"></td>
                        <td width="65%"> 
                            <input class="button1" type="reset" name="reset" value="Reset">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div style="margin-left: -8px;">
    <%@include file="/bookshop/inc/adm_authenticate.html"%>
</div>