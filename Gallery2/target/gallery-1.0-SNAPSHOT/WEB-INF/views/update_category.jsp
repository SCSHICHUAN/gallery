<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新</title>
    <link rel="stylesheet" href="/gallery/css/bootstrap.min.css">
    <link rel="stylesheet" href="/gallery/css/add.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                未来世界管理
            </a>
        </div>
    </div>
</nav>
<div class="container">
    <div class="jumbotron">
        <h1>Hello, admin!</h1>
        <p>跟新发型</p>
    </div>
    <div class="page-header">
        <h3><small>编辑</small></h3>
    </div>
    <form class="form-horizontal" action="#" method="post">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称 ：</label>
            <div class="col-sm-8">
                <input type="hidden" name="id" class="form-control" id="id" value="分类一">
                <input name="name" class="form-control" id="name" value="分类一">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">描述 ：</label>
            <div class="col-sm-8">
                <input type="text" name="description" class="form-control" id="description" value="描述一">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<footer class="text-center" >
    <p><span>M-GALLARY</span>©2019 POWERED BY STANSERVER.CN</p>
</footer>
</body>
</html>
