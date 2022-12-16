<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑</title>
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
        <p>编辑</p>
    </div>
    <div class="page-header">
        <h3>
            <small>编辑</small>
        </h3>
        <img src="/gallery/Controller/getImg.go?id=${gallery.id}" style="display: block; width: 600px;margin: 0 auto" alt=""/>
    </div>
    <form class="form-horizontal" action="/gallery/Controller/galleryUpdate.go" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称 ：</label>
            <div class="col-sm-8">
                <input name="name" class="form-control" id="name" value="${gallery.name}">
                <input type="hidden" name="id" class="form-control" id="id" value="${gallery.id}">
            </div>
        </div>
        <div class="form-group">
            <label for="categoryId" class="col-sm-2 control-label">分类 ：</label>
            <select id="categoryId" name="categoryId" class="col-sm-8 form-control" style="width: auto">
                <c:forEach items="${categories}" var="category">
                    <c:if test="${category.name == gallery.category.name}">
                        <option id="${category.id}" value="${category.id}" selected="selected">${category.name}</option>
                        no
                    </c:if>
                    ok
                    <option id="${category.id}" value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="price" class="col-sm-2 control-label">价格 ：</label>
            <div class="col-sm-8">
                <input name="price" type="number" class="form-control" id="price" value="${gallery.price}">
            </div>
        </div>
        <div class="form-group">
            <label for="smallImg" class="col-sm-2 control-label">图片 ：</label>
            <div class="col-sm-8">
                <input type="hidden" name="noChangeImg" value="noChangeImg">
                <input id="smallImg" name="smallImg" class="file-loading"
                       type="file" multiple accept=".jpg,.jpeg,.png" data-min-file-count="1"
                       data-show-preview="true" value="">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">描述 ：</label>
            <div class="col-sm-8">
                <input name="description" type="text" class="form-control" id="description"
                       value="${gallery.descroption}">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">详情 ：</label>
            <div class="col-sm-8">
                <textarea name="details"  class="form-control" id="details" cols="30" rows="5">${gallery.details}</textarea>
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
