<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AgriculturalResearch.AchievementsPage.Add" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加成果</title>
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>添加科研成果</h4>
    </div>
    <form id="form_demo" runat="server">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="border-top: none">成果标题：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="AchTitle" runat="server"></asp:TextBox>

                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入成果标题" ControlToValidate="AchTitle"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                           
                            <tr>
                                <td>成果类型：</td>
                                <td style="text-align: left">
                                    <asp:DropDownList ID="AchType" runat="server">
                                        <asp:ListItem Value="基础理论成果"></asp:ListItem>
                                        <asp:ListItem Value="应用技术成果"></asp:ListItem>
                                        <asp:ListItem Value="软科学成果"></asp:ListItem>
                                        <asp:ListItem Value="其他成果"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">成果内容：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="AchContent" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="请输入成果内容" ControlToValidate="AchContent"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">获得荣誉：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Honor" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入获得荣誉" ControlToValidate="Honor"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <asp:Panel ID="Panel2" runat="server">
                                <tr>
                                    <td style="border-top: none">相关材料：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <a href="<%=PageModel.AchFile %>">
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top: none">重新添加：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server">
                                <tr>
                                    <td style="border-top: none">相关材料：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td style="border-top: none">联系电话：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="AchTel" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入联系电话" ControlToValidate="AchTel"></asp:RequiredFieldValidator>
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
