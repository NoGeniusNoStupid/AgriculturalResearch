﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="AgriculturalResearch.AchievementsPage.Manage" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/base.css" />
    <link rel="stylesheet" href="../css/info-mgt.css" />
    <style>
        .layui-layer-title {
            background: url(../images/righttitlebig.png) repeat-x;
            font-weight: bold;
            color: #46647e;
            border: 1px solid #c1d3de;
            height: 33px;
            line-height: 33px;
        }

        .tabe_bot label {
            width: 70px;
            text-align: right;
            font-size: 14px;
            font-weight: 900;
            color: #46647e;
        }

        .l_left {
            float: left;
        }

        .tabe_bot input, .tabe_bot select {
            width: 180px;
            height: 30px;
            border-radius: 6px;
            margin: 0 20px 0 0;
            border: none;
            border: 1px #ccc solid;
        }

        .tabe_btn {
            width: 60px;
            height: 30px;
            background-color: #68b86c;
            border: none;
            border-radius: 6px;
            color: #fff;
        }
    </style>
    <title>科研成果管理</title>
</head>

<body onload="Recodeload()">
    <div class="title">
        <h2>科研成果管理</h2>
    </div>
    <form runat="server">
        <div class="query">
            <div class="tabe_bot">
                <div class="l_left">
                    <label>成果标题：</label>
                    <asp:TextBox ID="search" placeholder="请输入成果标题" runat="server"></asp:TextBox>
                </div>
                <asp:Button CssClass="tabe_btn" ID="Button2" runat="server" Text="查询" OnClick="Button1_Click" />
            </div>
        </div>
        <div class="table-operate ue-clear">
        <a href="/AchievementsPage/Add.aspx" style="float:right" class="add" >添加</a>
    </div>
        <div>
            <asp:GridView CssClass="table table-hover" ID="GvData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GvData_PageIndexChanging"
                OnRowDeleting="GvData_RowDeleting" PageSize="5"
                Width="100%" OnRowCommand="GvData_RowCommand"  >
                <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageButtonCount="12"
                    PreviousPageText="上一页" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText="成果标题">
                        <ItemTemplate>
                            <asp:Label ID="AchTitle" runat="server" Text='<%# Bind("AchTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="成果类型">
                        <ItemTemplate>
                            <asp:Label ID="AchType" runat="server" Text='<%# Bind("AchType") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="成果内容">
                        <ItemTemplate>
                            <asp:Label ID="AchContent" runat="server" Text='<%# Bind("AchContent") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="相关材料">
                       <ItemTemplate>
                            <asp:HyperLink ID="FileName" runat="server" NavigateUrl='<%# Bind("AchFile") %>' Text='<%# Bind("FileName") %>'></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="联系方式">
                        <ItemTemplate>
                            <asp:Label ID="AchTel" runat="server" Text='<%# Bind("AchTel") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="获得荣誉">
                        <ItemTemplate>
                            <asp:Label ID="Honor" runat="server" Text='<%# Bind("Honor") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="审批状态">
                        <ItemTemplate>
                            <asp:Label ID="State" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="操作时间">
                        <ItemTemplate>
                            <asp:Label ID="OperTime" runat="server" Text='<%# Bind("OperTime") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="审核" ShowHeader="False">
                        <ItemTemplate>
                              <asp:LinkButton ID="AgreeButton"  runat="server" CausesValidation="False" CommandName="Agree" CommandArgument='<%#Eval ("Id") %>' Text="同意"></asp:LinkButton>
                             <span>|</span>
                              <asp:LinkButton ID="RefuseButton"  runat="server" CausesValidation="False" CommandName="Refuse"  CommandArgument='<%#Eval ("Id") %>' Text="拒绝"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <ItemTemplate>
                           
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#"/AchievementsPage/Add.aspx?type=1&id="+Eval("id") %>' Text="编辑"></asp:HyperLink>
                            <span>|</span>
                            <asp:LinkButton ID="LinkButton5" OnClientClick="return confirm('确定要删除该科研成果吗？')"  runat="server" CausesValidation="False" CommandArgument='<%#Eval ("Id") %>' CommandName="Delete" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerTemplate>
                    <table border="0" width="100%">
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                    Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页 </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                    CommandName="Page" Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页 </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                    Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页 </asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                    Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页 </asp:LinkButton>
                                共
                                      <asp:Label ID="LabelPageCount" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>页
                                      第
                                      <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>页
                            </td>
                            <td align="right" width="20%"></td>
                        </tr>
                    </table>
                </PagerTemplate>
            </asp:GridView>
        </div>
    </form>

</body>
</html>
