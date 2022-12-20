<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
    <head>
        <title>新建</title>
        <link rel="stylesheet" href="/gallery//css/bootstrap.min.css">
        <link rel="stylesheet" href="/gallery//css/add.css">
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
                <p>新建类</p>
            </div>
            <div class="page-header">
                <h3><small>新建</small></h3>
            </div>
            <form class="form-horizontal" action="/gallery/Controller/createCategory.go" method="post">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">名称 ：</label>
                    <div class="col-sm-8">
                        <input name="name" class="form-control" id="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">描述 ：</label>
                    <div class="col-sm-8">
                        <input type="text" name="description" class="form-control" id="description">
                        <input type="hidden" id="createname" name="createname" value="#">
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
