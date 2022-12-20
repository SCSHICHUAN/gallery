<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>发型列表</title>
    <link rel="stylesheet" href="/gallery/css/index.css">
    <link rel="stylesheet" href="/gallery/css/bootstrap.min.css">
    <script type="text/javascript" src="/gallery/js/jquery-1.4.2.js"></script>
</head>

<body>
<header>
    <div class="container">
        <nav>
            <a href="#">分类一</a>
        </nav>
        <nav>
            <a href="#">分类</a>
        </nav>
        <nav>
            <a href="#">登录</a>
            <a href="#" onclick="alert('功能暂未开放');">注册</a>
        </nav>
    </div>
</header>
<section class="banner">
    <div class="container">
        <div>
            <h1>发型</h1>
            <p>发型列表</p>
        </div>
    </div>
</section>
<section class="main">
    <div class="container">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>复制</th>
                <th>名称</th>
                <th>分类</th>
                <th>价格</th>
                <th>创建时间</th>
                <th>最后修改时间</th>
                <th>描述</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody class="table-body">

            <c:forEach items="${pageInfo.list}" var="gallery">
            <tr>
                <td><button value = "${gallery.imgPath}" style="color: #2a6496">复制链接</button></td>
                <td>${gallery.name}</td>
                <td>${gallery.category.name}</td>
                <td>￥<fmt:formatNumber type="currency" pattern="#,#00.00#" value="${gallery.price}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${gallery.createTime}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${gallery.updateTime}"/></td>
                <td>${gallery.descroption}</td>
                <td><a href="/gallery/Controller/galleryEdit.go?id=${gallery.id}&&pageNum=${pageInfo.pageNum}">编辑/查看</a></td>
                <td><a href="/gallery/Controller/galleryDelete.go?id=${gallery.id}&&pageNum=${pageInfo.pageNum}">删除</a>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<div id="pagefy">
    <ul>
        <form action="/gallery/Controller/galleryList.go" method="post">
            共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
            <div class="btn-group">
                <button type="submit" name="pageNum" value="${pageInfo.pageNum-1}">
                    上一页
                </button>
                <button type="submit" name="pageNum" value="${pageInfo.pageNum+1}">
                    下一页
                </button>
            </div>
        </form>
    </ul>
</div>
<section class="page">
    <div class="container">
        <div id="fatie">
            <form action="/gallery/Controller/createCallery.go" method="post">
                <button>新建</button>
            </form>
        </div>
    </div>
</section>
<footer>
    <p><span>M-GALLARY</span>©2019 POWERED BY STANSERVER.CN</p>
</footer>
<script>


    $(".table-body").click(function (e) {
       copyVideoUrl(e);
    });

    function copyVideoUrl(event){

        var value = $(event.target).attr('value');
            value = "https://stanserver.cn" + value;
        var success;
        var $temp = $("<input>");
        $("body").append($temp);
        $temp.val(value).select();
        try{
            success = document.execCommand("copy");
        }catch (e){
            succeed = false;
        }
        if(success){
            var copySuccess = "<div class='copy-tips' style='color: red'>已复制</div>";
            $(event.target).find(".copy-tips").remove();
            $(event.target).append(copySuccess);
            $(".copy-tips").fadeOut(1000);
        }

        $temp.remove();
    }

</script>
</body>
</html>