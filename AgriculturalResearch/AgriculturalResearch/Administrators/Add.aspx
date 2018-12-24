<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AgriculturalResearch.Administrators.Add" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加管理员</title>
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>添加管理员</h4>
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
                                <td style="border-top: none">联系电话：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Tel" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入联系电话" ControlToValidate="Tel"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="bot_btn">  
                <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                <button class="btn btn1"><a href="/Manage.aspx" target="right">返回</a></button>
            </div>
        </div>
    </form>
</body>
</html>
