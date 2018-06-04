<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="netshop.book.util.*" %>
<%@ page session="true" %>
<!--<link rel="stylesheet" type="text/css" href="css/register.css" />-->
<jsp:useBean id="user" scope="page" class="netshop.book.service.manage_user" />
<script language="javascript">
    function isPoneAvailable($poneInput) {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test($poneInput.val())) {
            return false;
        } else {
            return true;
        }
    }
    function openScript(url, name, width, height) {
        var Win = window.open(url, name, 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
    function checkform() {
        if (document.form1.username.value == "") {
            alert("The username can not be empty");
            document.form1.username.focus();
            return false;
        }
        if (document.form1.passwd.value == "") {
            alert("User password cannot be empty");
            document.form1.passwd.focus();
            return false;
        }
        if (document.form1.passwd.value != document.form1.passconfirm.value) {
            alert("Confirmation password does not match！");
            document.form1.passconfirm.focus();
            return false;
        }
        if (document.form1.names == "") {
            alert("True name cannot be empty");
            document.form1.passconfirm.focus();
            return false;
        }
        if (document.form1.address == "") {
            alert("Address cannot be empty");
            document.form1.passconfirm.focus();
            return false;
        }
        if (document.form1.post == "") {
            alert("Post cannot be empty");
            document.form1.passconfirm.focus();
            return false;
        }
        if (document.form1.phone == "") {
            alert("Phone cannot be empty");
            document.form1.passconfirm.focus();
            return false;
        }
        if (isPoneAvailable(document.form1.phone)) {
            alert("Phone format is error");
            document.form1.passconfirm.focus();
            return false;
        }
        return true;
    }
</script>
<style>
</style>
<%@include file="/bookshop/inc/head.html" %>
<div class="box" style="font-size: 35px; margin-left: 228px;width: 1080px;height: 70%;background-image:url('images/loginbg.png');background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
    <div style="width: 1080px;text-align: center;">
        <br>
        <font size="5">
        User Login
        </font>
    </div>
    <form name="form1" method="post" action="<%=request.getContextPath()%>/userreg">
        <font size="36px;">
        <table width="450" border="0" cellspacing="1" cellpadding="1" align=center style="margin-left: 270px;margin-top: -40px;">
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">UserName：</td>
                <td width="272"> 
                    <input type="text" style=" font-size: 20px;" name="username" maxlength="20" size="14" >
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Passwrod：</td>
                <td width="272">
                    <input type="password" style=" font-size: 20px;" name="passwd" maxlength="20" size="14">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Confirm：</td>
                <td width="272">
                    <input type="password" style=" font-size: 20px;" name="passconfirm" maxlength="20" size="14">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">TrueName：</td>
                <td width="272">
                    <input type="text" style=" font-size: 20px;" name="names" maxlength="20" size="14">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Sex：</td>
                <td width="272" style=" font-size: 20px;">
                    <select name="sex">
                        <option>F</option>
                        <option>M</option>
                    </select>
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Address：</td>
                <td width="272">
                    <input type="text" style=" font-size: 20px;" name="address" maxlength="150" size="40">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Post：</td>
                <td width="272">
                    <input type="text" style=" font-size: 20px;" name="post" maxlength="8" size="8">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Phone：</td>
                <td width="272">
                    <input type="text" style=" font-size: 20px;" name="phone" maxlength="25" size="16">
                </td>
            </tr>
            <tr> 
                <td width="171" align="right" style=" font-size: 20px;">Email：</td>
                <td width="272">
                    <input type="text" style=" font-size: 20px;" name="email" maxlength="50" size="25">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;font-size: 20px;"> Although You Have Account,<a href="login.jsp">Login</a>
                    <br></td>
            </tr>
            <tr>
                <td width="171" align="right">&nbsp;
                </td>
                <td width="272">
                    <input type="submit" style=" font-size: 20px;" name="Submit" value="Register" onclick="javascript:return(checkform());">
                    <input type="reset" style=" font-size: 20px;" name="reset" value="Cancel">
                </td>
            </tr>
        </table>  
        </font>
    </form>
</div>
<!--    <table width="450" border="0" cellspacing="1" cellpadding="1" align=center>
        <tr></tr>
        <tr> 
            <td colspan="2" align="center"><b><font color="#0000FF">用户注册</font></b></td>
        </tr>
        <tr></tr>
        <tr> 
            <td width="171" align="right">用户名：</td>
            <td width="272"> 
                <input type="text" name="username" maxlength="20" size="14" >
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">密码：</td>
            <td width="272">
                <input type="password" name="passwd" maxlength="20" size="14">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">确认密码：</td>
            <td width="272">
                <input type="password" name="passconfirm" maxlength="20" size="14">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">真实姓名：</td>
            <td width="272">
                <input type="text" name="names" maxlength="20" size="14">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">性别：</td>
            <td width="272">
                <select name="sex">
                    <option>男</option>
                    <option>女</option>
                </select>
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">联系地址：</td>
            <td width="272">
                <input type="text" name="address" maxlength="150" size="40">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">联系邮编：</td>
            <td width="272">
                <input type="text" name="post" maxlength="8" size="8">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">联系电话：</td>
            <td width="272">
                <input type="text" name="phone" maxlength="25" size="16">
            </td>
        </tr>
        <tr> 
            <td width="171" align="right">电子邮件：</td>
            <td width="272">
                <input type="text" name="email" maxlength="50" size="25">
            </td>
        </tr>
        <tr>
            <td width="171" align="right">&nbsp; </td>
            <td width="272">
                <input type="submit" name="Submit" value="注册" onclick="javascript:return(checkform());">
                <input type="reset" name="reset" value="取消">
            </td>
        </tr>
    </table>  -->
<%@include file="/bookshop/inc/authenticate.html"%>
