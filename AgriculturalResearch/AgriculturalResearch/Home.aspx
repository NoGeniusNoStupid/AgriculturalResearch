﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AgriculturalResearch.Home" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/home.css" />
    <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
    <link href="/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <title>移动办公自动化系统</title>
</head>

<body>

    <div class="article half notice">
        <div class="wrap-l">
            <div class="title ue-clear">
                <h2>系统资料统计</h2>
                <a href="notice.html" class="more" target="right">更多</a>
            </div>
            <div class="content" style="height:300px">
                <h2>管理员：<%=AdminCount %>名</h2>
                <br />
                <h2>科研人员：<%=PersonCount %>名</h2>
                <br />
                <h2>申请项目：<%=AppItemCount %>  个</h2>
                <br />
                <h2>发表论文：<%=PaperCount %>  个</h2>
                <br />
                <h2>获得成果：<%=AchievementsCount %>  个</h2>
            </div>
        </div>
    </div>


    <div style="clear: both"></div>
    <%--<div class="article half duty">
	<div class="wrap-l">
        <div class="title ue-clear">
            <h2>我的任务</h2>
            <a href="myrecode.html" class="more" target="right">更多</a>
        </div>
        <div class="content">
            <table id="table" class="table_style"></table>
        	<!--<table>-->
            	<!--<thead>-->
                	<!--<tr>-->
                    	<!--<th class="date">日期</th>-->
                        <!--<th class="week">星期</th>-->
                        <!--<th class="leader">值班领导</th>-->
                        <!--<th class="contact">联系方式</th>-->
                        <!--<th class="remark">备注</th>-->
                    <!--</tr>-->
                <!--</thead>-->
                <!--<tbody>-->
                	<!--<tr>-->
                    	<!--<td class="date">05-08</td>-->
                        <!--<td class="week">星期一</td>-->
                        <!--<td class="leader">刘秀全</td>-->
                        <!--<td class="contact">139039409876</td>-->
                        <!--<td class="remark"></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    	<!--<td class="date">05-09</td>-->
                        <!--<td class="week">星期一</td>-->
                        <!--<td class="leader">刘秀全</td>-->
                        <!--<td class="contact">139039409876</td>-->
                        <!--<td class="remark"></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    	<!--<td class="date">05-10</td>-->
                        <!--<td class="week">星期一</td>-->
                        <!--<td class="leader">刘秀全</td>-->
                        <!--<td class="contact">139039409876</td>-->
                        <!--<td class="remark"></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    	<!--<td class="date">05-08</td>-->
                        <!--<td class="week">星期一</td>-->
                        <!--<td class="leader">刘秀全</td>-->
                        <!--<td class="contact">139039409876</td>-->
                        <!--<td class="remark"></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    	<!--<td class="date">05-08</td>-->
                        <!--<td class="week">星期一</td>-->
                        <!--<td class="leader">刘秀全</td>-->
                        <!--<td class="contact">139039409876</td>-->
                        <!--<td class="remark"></td>-->
                    <!--</tr>-->
                <!--</tbody>-->
            <!--</table>-->
        </div>
    </div>
</div>--%>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-table.js"></script>
<script src="/js/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(function () {
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "json/person.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    title: "任务名称",
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '完成日期',
                    field: 'sex',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '发布人',
                    field: 'type',
                    align: 'center'
                },

                {
                    title: '备注',
                    field: 'class',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" onclick="openlayer(\'' + row.id + '\')">查看</a> ';
                        return e;
                    }
                }
            ]
        });
    })
</script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
    $(".title-list ul").on("click", "li", function () {
        var aIndex = $(this).index();
        $(this).addClass("current").siblings().removeClass("current");
        $(".matter-content").removeClass("current").eq(aIndex).addClass("current");
    });

    $(".duty").find("tbody").find("tr:even").css("backgroundColor", "#eff6fa");
</script>
<script src="js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
    function openlayer(id) {
        layer.open({
            type: 2,
            title: '万年历',
            shadeClose: true,
            shade: 0.5,
            skin: 'layui-layer-rim',
            //            maxmin: true,
            closeBtn: 2,
            area: ['80%', '75%'],
            shadeClose: true,
            closeBtn: 2,
            content: 'calendar.html'
            //iframe的url
        });
    }
</script>
</html>
