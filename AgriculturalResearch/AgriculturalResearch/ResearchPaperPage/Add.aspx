<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AgriculturalResearch.ResearchPaperPage.Add" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加论文</title>
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>添加科研论文</h4>
    </div>
    <form id="form_demo" runat="server">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="border-top: none">论文标题：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="PaperTitle" runat="server"></asp:TextBox>

                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入论文标题" ControlToValidate="PaperTitle"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">发表期刊：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="KName" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="请输入发表期刊" ControlToValidate="KName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                             <tr>
                                <td>期刊类型：</td>
                                <td style="text-align: left">
                                    <asp:DropDownList ID="KType" runat="server">
                                        <asp:ListItem Value="综合性社科期刊"></asp:ListItem>
                                        <asp:ListItem Value="专业性人文期刊"></asp:ListItem>
                                        <asp:ListItem Value="高校综合性社科学报"></asp:ListItem>
                                        <asp:ListItem Value="其他期刊"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">检索单位：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="DanWei" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入检索单位" ControlToValidate="DanWei"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <asp:Panel ID="Panel2" runat="server">
                                <tr>
                                    <td style="border-top: none">相关材料：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <a href="<%=PageModel.UpFile %>">
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
