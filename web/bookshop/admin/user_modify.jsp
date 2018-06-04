<%@ page contentType="text/html; charset=gb2312" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null || session.getAttribute("admin") == "") {
        response.sendRedirect("error.html");
    } %>
<%@ page import="netshop.book.bean.*" %>
<jsp:useBean id="user" scope="page" class="netshop.book.service.manage_user" />
<%
    long userid = 0;
    String mesg = "";

    String submit = request.getParameter("submit");
    if (submit != null && !submit.equals("")) {
        if (user.update(request)) {
            mesg = "User profile modification successful.£¡";
        } else {
            mesg = "Sorry, the parameters you submitted are wrong.!" + user.getMessage();;
        }
    }

    if (request.getParameter("userid") != null && !request.getParameter("userid").equals("")) {
        try {
            userid = Long.parseLong(request.getParameter("userid"));
            if (!user.getUserinfo(userid)) {
                mesg = "The user information to be modified does not exist.";
            }
        } catch (Exception e) {
            mesg = "The user number does not exist.!";
        }
    }
%>

<html>
    <head>
        <title>Online bookstore management system - modify user data.</title>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <link rel="stylesheet" href="books.css" type="text/css">
        <script language="javascript">

            function checkform() {
                if (document.form1.username.value == "") {
                    alert("The user name cannot be empty.");
                    document.form1.username.focus();
                    return false;
                }
                if (document.form1.passwd.value == "") {
                    alert("The user password cannot be empty.");
                    document.form1.passwd.focus();
                    return false;
                }
                if (document.form1.passwd.value != document.form1.passconfirm.value) {
                    alert("Confirm password does not match!");
                    document.form1.passconfirm.focus();
                    return false;
                }

                return true;
            }

        </script>
        <style type="text/css">

            body {
                background-color:#B0C4DE;
            }


        </style></head>

    <body text="#000000">
        <div align="center" >
            <p>Modify user information:</p>
            <% if (!mesg.equals("")) {
                    out.println("<font color=red>" + mesg + "</font><br><br>");
                } else {
                    user userinfo = (user) user.getUserlist().elementAt(0);
            %>
            <table width="35%" border="1" cellspacing="2" cellpadding="2" bordercolor="#2DAE2D">
                <FORM name="form1" METHOD=POST ACTION="user_modify.jsp">
                    <tr><td align=right width=100>Name:</td>
                        <td><input type="text" name="username" maxlength="20" size="14" value="<%= userinfo.getUserName()%>" ></td></tr> 
                    <tr><td align=right width=100>Password:</td>
                        <td><input type="password" name="passwd" maxlength="20" size="14" value="<%= userinfo.getPassWord()%>" ></td></tr> 
                    <tr><td align=right width=100>Comfired:</td>
                        <td><input type="password" name="passconfirm" maxlength="20" size="14" value="<%= userinfo.getPassWord()%>" ></td></tr> 
                    <tr><td align=right width=100>True Name</td>
                        <td> <input type="text" name="names" maxlength="20" size="14" value="<%= userinfo.getNames()%>" ></td></tr>
                    <tr><td align=right width=100>Sex</td>
                        <td><select name="sex">
                                <option <% if (userinfo.getSex().equals("MAN")) {
                                        out.print("selected");
                                    } %> >F</option>
                                <option <% if (userinfo.getSex().equals("WOMEN")) {
                                        out.print("selected");
                                    }%> >M</option>
                            </select>
                        </td></tr> 
                    <tr><td align=right width=100>Adress</td>
                        <td><input type="text" name="address" maxlength="150" size="40" value="<%= userinfo.getAddress()%>" ></td></tr> 
                    <tr><td align=right width=100>TEL</td>
                        <td><input type="text" name="phone" maxlength="25" size="16" value="<%= userinfo.getPhone()%>" ></td></tr> 
                    <tr><td align=right width=100>Zip code</td>
                        <td><input type="text" name="post" maxlength="8" size="8" value="<%= userinfo.getPost()%>" ></td></tr> 
                    <tr><td align=right width=100>Email</td>
                        <td><input type="text" name="email" maxlength="50" size="25" value="<%= userinfo.getEmail()%>" ></td></tr> 
                    <tr><td align=right width=100>&nbsp;</td>
                        <td><INPUT TYPE="hidden" name="userid" value="<%= userinfo.getId()%>">
                            <INPUT TYPE="submit" name="submit" value="Submit" onClick="return(checkform());">
                            <INPUT TYPE="reset" name="reset" value="Cancel"></td></tr> 
                </FORM>
            </table>
            <br>
            <%}%>
            <br><p><a href="javascript:window.close()">Close Window</a></p>

        </div>
    </body>
</html>
