<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonIndex.aspx.cs" Inherits="AgriculturalResearch.PersonIndex" %>

<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/base.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.dialog.css" />
<link rel="stylesheet" href="/css/index.css" />
    <style>
        .layui-layer-title{background:url(images/righttitlebig.png) repeat-x;font-weight:bold;color:#46647e; border:1px solid #c1d3de;height: 33px;line-height: 33px;}
    </style>
<title>农业科研项目管理系统</title>
</head>
<body>
<div id="container">
	<div id="hd">
    	<div class="hd-wrap ue-clear">
        	<div class="top-light"></div>
            <h1 class="logo"></h1>
            <div class="login-info ue-clear">
                <div class="welcome ue-clear"><span>欢迎您,<%=PageModel.Name %></span><a href="javascript:void(0)" class="user-name">科研人员</a></div>
                
            </div>
            <div class="toolbar ue-clear">
                <a href="/PersonHome.aspx" class="home-btn" target="right">首页</a>
                <a href="/UpdatePwd.aspx" class="home-btn1" target="right" onclick="openlayer()">修改密码</a>
                <a href="#" class="quit-btn exit home-btn">退出</a>
            </div>
        </div>
    </div>
    <div id="bd">
    	<div class="wrap ue-clear">
        	<div class="sidebar">
            	<h2 class="sidebar-header"><p>功能导航</p></h2>
             
                  <ul class="nav">
                	<li class="office current"><div class="nav-header">
                        <a href="/PersonHome.aspx" target="right" class="ue-clear">
                        <span>首页</span><i class="icon"></i></a></div></li>
                    <li class="dossier"><div class="nav-header"><a href="JavaScript:;" class="ue-clear" ><span>个人信息管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                           <li><a href="/PersonPage/PersonAdd.aspx?type=1&id=<%=Session["PersonId"] %>" target="right">完善个人信息</a></li>
                           <li><a href="/UpdatePwd.aspx" target="right">修改密码</a></li>
                        </ul>
                    </li>

                    <li class="list_m"><div class="nav-header"><a href="JavaScript:;" target="right" class="ue-clear" ><span>科研项目管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="/ResearchItemPage/Add.aspx" target="right">项目申报</a></li>
                            <li><a href="/ResearchItemPage/Manage.aspx" target="right">申报管理</a></li>
                            <li><a href="/ResearchItemPage/PersonManage.aspx" target="right">参与项目</a></li>
                        </ul>
                    </li>
                    <li class="email"><div class="nav-header"><a href="JavaScript:;" target="right" class="ue-clear" ><span>科研论文管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="/ResearchPaperPage/Add.aspx" target="right">添加论文</a></li>
                            <li><a href="/ResearchPaperPage/Manage.aspx" target="right">我的论文</a></li>
                        </ul>
                    </li>
                    <li class="news_m"><div class="nav-header"><a href="JavaScript:;" target="right" class="ue-clear" ><span>科研成果管理</span><i class="icon hasChild"></i></a></div>
                        <ul class="subnav">
                            <li><a href="/AchievementsPage/Add.aspx" target="right">添加成果</a></li>
                            <li><a href="/AchievementsPage/Manage.aspx" target="right">我的成果</a></li>
                        </ul>
                    </li>
               
                </ul>
            </div>
            <div class="content">
            	<iframe src="PersonHome.aspx" id="iframe" width="100%" height="100%" frameborder="0" name="right" style="min-width: 1100px"></iframe>
            </div>
        </div>
    </div>
    <div id="ft" class="foot_div">

            <span>xxxxxx</span>
            <em>Office&nbsp;System</em>

     
    </div>
</div>
<div class="exitDialog">
	<div class="dialog-content">
    	<div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
        	<p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
            
            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定" />
                <input type="button" class="button long2 normal" value="取消" />
            </div>
        </div>
        
    </div>
</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script src="/js/layer_v2.1/layer/layer.js"></script>

</html>
