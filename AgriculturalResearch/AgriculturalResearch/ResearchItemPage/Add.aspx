<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AgriculturalResearch.ResearchItemPage.Add" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>科研项目申报</title>
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
</head>

<body style="border-radius: 8px" onload="change()">
    <div class="title">
        <h4>科研项目申报</h4>
    </div>
    <form id="form_demo" runat="server" enctype="multipart/form-data">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="border-top: none">项目名称：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="ItemName" runat="server"></asp:TextBox>

                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入项目名称" ControlToValidate="ItemName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">项目类型：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:DropDownList ID="ItemType" runat="server">
                                        <asp:ListItem Value="国家科技重大专项课题"></asp:ListItem>
                                        <asp:ListItem Value="国家863计划课题"></asp:ListItem>
                                        <asp:ListItem Value="国家农业科技成功转化资金项目"></asp:ListItem>
                                        <asp:ListItem Value="国家农业科技项目"></asp:ListItem>
                                        <asp:ListItem Value="省级农发办项目"></asp:ListItem>
                                        <asp:ListItem Value="新品种新技术展示项目"></asp:ListItem>
                                        <asp:ListItem Value="其他农业项目"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td style="border-top: none">项目单位：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="ItemCompany" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入项目单位" ControlToValidate="ItemCompany"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td style="border-top: none">负责人：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="MajorPerson" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入负责人" ControlToValidate="MajorPerson"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">电话：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Tel" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="请输入电话" ControlToValidate="Tel"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">科研经费：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="Funds" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="请输入科研经费" ControlToValidate="Funds"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">预计年限：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="ExeYear" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="预计年限" ControlToValidate="ExeYear"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <asp:Panel ID="Panel1" runat="server">
                                <tr>
                                    <td style="border-top: none">当前材料：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <a href="/UpFile/<%=PageModel.UpFile %>">
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
                            <asp:Panel ID="Panel2" runat="server">
                                <tr>
                                    <td style="border-top: none">详细材料：<i class="i_start"></i></td>
                                    <td style="text-align: left; border-top: none">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </td>
                                </tr>
                            </asp:Panel>

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
