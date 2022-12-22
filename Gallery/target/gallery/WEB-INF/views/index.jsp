<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>画廊</title>
    <link rel="stylesheet" type="text/css" href="/gallery/style/common.css"/>
    <link rel="stylesheet" type="text/css" href="/gallery/style/index.css"/>
</head>
<body>
<div class="header">
    <div class="logo f1">
        <%--<img src="/img/IMG_5807.jpeg">--%>
    </div>
    <div class="auth fr">
        <ul>
            <li><a href="/gallery/Controller/admin.go">登录</a></li>
            <%--<li><a href="#">注册</a></li>--%>
        </ul>
    </div>
</div>
<div class="content">
    <div class="banner" style="height: 550px">
        <div class="banner-text">未来世界画廊</div>
        <img class="banner-img" src="/gallery/img/屏幕快照 2019-01-02 下午12.11.14.png" width="732px" height="837" alt="图片描述">
    </div>

    <div class="img-content">
        <ul>
            <c:forEach items="${pageInfo.list}" var="gallery">
                <li style="overflow: hidden">

                    <c:choose>

                        <c:when test="${gallery.sourceType == 'video'}">
                            <video controls class="img-li-fix" src="${gallery.imgPath}"
                                   style="display: block; height: 250px;width: auto;margin: 0 auto;"></video>
                        </c:when>
                        <c:when test="${gallery.sourceType == 'audio'}">
                            <audio controls class="img-li-fix" src="${gallery.imgPath}"></audio>
                        </c:when>
                        <c:otherwise>
                            <img class="img-li-fix" src="${gallery.imgPath}"
                                 style="display: block; height: 250px;width: auto;margin: 0 auto;" alt=""/>
                        </c:otherwise>

                    </c:choose>


                    <div class="info">
                        <h3 class="img_title">${gallery.name}</h3>
                        <p style="font-size: 20px">
                                ${gallery.descroption}
                        </p>
                        <div class="btn">
                            <a href="/gallery/Controller/ditle.go?id=${gallery.id}" class="edit" style="font-size: 20px;width: 100px">详情</a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="page-nav">
        <ul>
            共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
            <li><a href="/gallery/Controller/galleryShow.go?pageNum=1">首页</a></li>
            <li><a href="/gallery/Controller/galleryShow.go?pageNum=${pageInfo.pageNum-1}">上一页</a></li>


            <%

                PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
                int totlPge = pageInfo.getPages();
                int currenPage = pageInfo.getPageNum();
            %>

            <%if(currenPage-3>0){
                %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage-3%>"><%=currenPage -3%>
            </a></li>
            <%
            }%>
            <%if(currenPage-2>0){
            %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage-2%>"><%=currenPage-2%>
            </a></li>
            <%
                }%>
            <%if(currenPage-1>0){
            %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage-1%>"><%=currenPage -1%>
            </a></li>
            <%
                }%>


            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage%>"><%=currenPage%>
            </a></li>

            <%if(currenPage+1<=totlPge){
            %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage+1%>"><%=currenPage+1%>
            </a></li>
            <%
                }%>
            <%if(currenPage+2<=totlPge){
            %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage+2%>"><%=currenPage +2%>
            </a></li>
            <%
                }%>
            <%if(currenPage+3<=totlPge){
            %>

            <li><a href="/gallery/Controller/galleryShow.go?pageNum=<%=currenPage+3%>"><%=currenPage+3%>
            </a></li>
            <%
                }%>
            <li><a href="/gallery/Controller/galleryShow.go?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
            <li><a href="/gallery/Controller/galleryShow.go?pageNum=999">尾页</a></li>
        </ul>
    </div>
</div>

<div class="footer">
    <p><span>M-GALLARY</span>©2019 POWERED BY STANSERVER.CN</p>
</div>
</body>
</html>