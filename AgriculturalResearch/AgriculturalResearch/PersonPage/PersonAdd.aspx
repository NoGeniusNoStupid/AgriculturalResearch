﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonAdd.aspx.cs" Inherits="AgriculturalResearch.PersonPage.PersonAdd" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加科研人员</title>
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>添加科研人员</h4>
    </div>
    <form id="form_demo" runat="server">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="border-top: none">账号：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Account" runat="server"></asp:TextBox>

                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入账号" ControlToValidate="Account"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">姓名：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入姓名" ControlToValidate="Name"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>性别：</td>
                                <td style="text-align: left">
                                    <asp:DropDownList ID="Sex" runat="server">
                                        <asp:ListItem Value="男"></asp:ListItem>
                                        <asp:ListItem Value="女"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">年龄：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Age" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="请输入年龄" ControlToValidate="Age"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">联系电话：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Tel" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入联系电话" ControlToValidate="Tel"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">职称：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Title" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入职称" ControlToValidate="Title"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">专业：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="major" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="请输入专业" ControlToValidate="major"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">学院：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="College" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="请输入学院" ControlToValidate="College"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <asp:Panel ID="Panel1" runat="server">
                <div class="bot_btn">
                    <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                    <button class="btn btn1"><a href="PersonManage.aspx" target="right">返回</a></button>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

