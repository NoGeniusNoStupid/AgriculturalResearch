<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AgriculturalResearch.ExpRecordPage.Add" %>

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
                                <td style="border-top: none">实验内容：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:TextBox ID="ExpContent" runat="server"></asp:TextBox>

                                </td>
                                <td style="text-align: left; border-top: none">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入实验内容" ControlToValidate="ExpContent"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none">详细材料：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:FileUpload ID="FileUpload3" runat="server" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="bot_btn">
                <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" />
                <button class="btn btn1"><a href="javascript:self.location=document.referrer;" target="right">返回</a></button>
            </div>
        </div>
    </form>
</body>
</html>
