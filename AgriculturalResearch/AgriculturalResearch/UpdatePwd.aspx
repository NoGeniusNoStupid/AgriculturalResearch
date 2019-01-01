<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePwd.aspx.cs" Inherits="AgriculturalResearch.UpdatePwd" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加科研人员</title>
    <link href="/css/tail.css" rel="stylesheet" type="text/css" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>密码修改</h4>
    </div>
    <form id="form_demo" runat="server">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>                            
                            <tr>
                                <td style="border-top: none">原密码：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox TextMode="Password" ID="OldPwd" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="请输入原密码" ControlToValidate="OldPwd"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td style="border-top: none">新密码：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox TextMode="Password" ID="Pwd" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入新密码" ControlToValidate="Pwd"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td style="border-top: none">确认密码：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox TextMode="Password" ID="SurePwd" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入确认密码" ControlToValidate="SurePwd"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="bot_btn">  
                <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                <button class="btn btn1"><a href="PersonManage.aspx" target="right">返回</a></button>
            </div>
        </div>
    </form>
</body>
</html>
