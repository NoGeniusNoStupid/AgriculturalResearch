<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AgriculturalResearch.Default" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<title>登录</title>
<link href="css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<body> 
<div class="div_top">OA日常办公管理系统</div>
<div class="login">
    <div class="message">用户登录</div>
    <div id="darkbannerwrap"></div>
   
    <form method="post" runat="server">
		<input name="action" value="login" type="hidden">
		
        <asp:TextBox ID="user" name="username" placeholder="用户名"  runat="server"></asp:TextBox>
		<hr class="hr15">
        <asp:TextBox ID="pass" TextMode="Password" name="password" placeholder="密码"  runat="server"></asp:TextBox>
		<hr class="hr15">
        <asp:Button ID="login_btn"  runat="server" Text="登录" OnClick="login_btn_Click" />
		<hr class="hr20">
		  <a onClick="alert('请联系管理员')">忘记密码</a>
	</form>

	
</div>

<div class="copyright">版权所有@<span style="color:#f77118">2017 </span>杭州天夏科技股份集团有限公司</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script >
    $(function () {
        $("#login_btn").click(function () {

            var selectuser = $("#user").val();
            var pword = $("#pass").val();

            if (selectuser == "" || selectuser.length < 1) {
                alert("用户名不能为空");
                $("#user").focus();
                return false;
            }
            if (pword == "" || pword.length < 1) {
                alert("密码不能为空");
                $("#pass").focus();
                return false;
            }
            getUserDep(selectuser, pword);


        });

        function getUserDep(v1, v2) {
            $.ajax({
                type: "post",
                url: "LoginServlet",
                data: { adid: v1, mima: v2 },
                success: function (message) {
                    if (message == "1") {
                        window.location.href = 'index.html';
                    }
                    else {
                        alter("密码错误");
                    }
                }

            });
        }
    });

</script>
</body>
</html>
