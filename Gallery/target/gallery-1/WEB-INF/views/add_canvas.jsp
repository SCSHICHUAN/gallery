<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新建</title>
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
        <h1>Hello,admin!</h1>
        <p>新增记录</p>
    </div>
    <div class="page-header">
        <h3>
            <small>新建</small>
        </h3>
    </div>

    <form action="/gallery/Controller/toCategory.go" method="post">
        <button type="submit">新建类</button>
    </form>

    <form class="form-horizontal" action="/gallery/Controller/add.go" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称 ：</label>
            <div class="col-sm-8">
                <input name="name" class="form-control" id="name" value="Name">
            </div>
        </div>
        <div class="form-group">
            <label for="sourceType" class="col-sm-2 control-label">资源类型 ：</label>
            <select id="sourceType" name="sourceType" class="col-sm-8 form-control" style="width: auto">
                <option id="sourceType1" value="img">img</option>
                <option id="sourceType2" value="audio">audio</option>
                <option id="sourceType3" value="video">video</option>
            </select>
        </div>
        <div class="form-group">
            <label for="categoryId" class="col-sm-2 control-label">分类 ：</label>
            <select id="categoryId" name="categoryId" class="col-sm-8 form-control" style="width: auto">
                <c:forEach items="${categories}" var="category">
                <option id="${category.id}" value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="price" class="col-sm-2 control-label">价格 ：</label>
            <div class="col-sm-8">
                <input name="price" type="number" class="form-control" id="price" value="1">
            </div>
        </div>
        <div class="form-group">
            <label for="smallImg" class="col-sm-2 control-label">图片 ：</label>
            <div class="col-sm-8">
                <input id="smallImg" name="smallImg" class="file-loading"
                       type="file" multiple  data-min-file-count="1"
                       data-show-preview="true">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">描述 ：</label>
            <div class="col-sm-8">
                <input name="description" type="text" class="form-control" id="description" value="Description">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">详情 ：</label>
            <div class="col-sm-8">
                <input name="details" type="text" class="form-control" id="details" value="default">
            </div>
        </div>




        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<footer class="text-center">
    <p><span>M-GALLARY</span>©2019 POWERED BY STANSERVER.CN</p>
</footer>
</body>
</html>
