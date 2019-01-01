<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="AgriculturalResearch.ResearchItemPage.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/base.css" />
    <link rel="stylesheet" href="../css/info-mgt.css" />
    <link href="../css/tail.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
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
    <title>科研项目管理</title>
</head>
<body onload="Recodeload()">
    <div class="title">
        <h4>科研项目详细内容</h4>
    </div>
    <div class="query">
        <div>
            <label>项目名称：<%=PageModel.ItemName %></label><br />
            <br />
            <label>项目类型：<%=PageModel.ItemType %></label><br />
            <br />
            <label>项目单位：<%=PageModel.ItemCompany %></label><br />
            <br />
            <label>负责人：<%=PageModel.MajorPerson %></label><br />
            <br />
            <label>联系方式：<%=PageModel.Tel %></label><br />
            <br />
            <label>项目经费：<%=PageModel.Funds %></label><br />
            <br />
            <label>项目年限：<%=PageModel.ExeYear %></label><br />
            <br />
            <label>详细内容： <a href="<%=PageModel.UpFile %>"><%=PageModel.FileName %></a></label><br />
            <br />
            <label>审批意见：<%=PageModel.Approval %></label><br />
            <br />
            <label>审批结果：<%=PageModel.State %></label><br />
            <br />
            <label>审批时间：<%=PageModel.ApprovalTime %></label><br />
            <br />
            <% 
                string link = @"<a href=/PersonPage/PersonAdd.aspx?type=1&read=0&id={0}>{1}</a>";
                string itemPersonnel = string.Empty;
                foreach (var item in PageModel.ItemPersonnel)
                {
                    itemPersonnel += string.Format(link, item.Person.Id, item.Person.Name) + "、";
                }
                itemPersonnel = itemPersonnel.Trim('、');
            %>
            <label>参与人员：<%=itemPersonnel %></label><br />
            <br />
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server">
         <form id="form_demo" runat="server">
        <div class="top">
            <div>
                <div class="top_out">
                    <table class="table">
                        <tbody>
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                            <tr>
                                <td style="border-top: none">参与人员：<i class="i_start"></i></td>
                                <td style="text-align: left; border-top: none">
                                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="bot_btn">
                <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                <asp:Button CssClass="btn btn-danger" ID="Button2" runat="server" Text="删除" OnClick="Button2_Click" />
                <button class="btn btn1"><a  href="#" onclick="self.location=document.referrer;" target="right">返回</a></button>
            </div>
        </div>
    </form>
    </asp:Panel>
   
   
 
    
</body>
</html>
