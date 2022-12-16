<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>详情</title>
    <link rel="stylesheet" type="text/css" href="/gallery//style/common.css" />
    <link rel="stylesheet" type="text/css" href="/gallery//style/detail.css" />
<!--<link rel="stylesheet" type="text/css" href="style/reset.css" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />-->
</head>
<body class="bgf8">
    <div class="header">
        <div class="logo f1">
            <%--<img src="img/logo.png">--%>
        </div>

    </div>
    <div class="content">
        <div class="section" style="margin-top:20px;">
            <div class="width1200">
                <div class="fl"><img src="/gallery/Controller/getImg.go?id=${calloryItem.id}" width="730px" alt="${calloryItem.name}"/></div>
                <div class="fl sec_intru_bg">
                    <dl>
                        <td></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${gallery.updateTime}"/></td>
                        <dt>${calloryItem.name}</dt>
                        <dd>
                            <p>发布人：<span>${calloryItem.creater}</span></p>
                            <p>发布时间：<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${calloryItem.createTime}"/></span></p>
                            <p>修改时间：<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${calloryItem.updateTime}"/></span></p>
                        </dd>
                    </dl>
                    <ul>
                        <li>售价：<br/><span class="price">${calloryItem.price}</span>元</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="secion_words">
            <div class="width1200">
                <div class="secion_wordsCon">
                    <p style="font-size: 25px;color: black">${calloryItem.descroption}</p>
                    <p style="color: black">${calloryItem.details}</p>
                            </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p><span>M-GALLARY</span>©2019 POWERED BY STANSERVER.CN</p>
            </div>
        </div> 
    </body>
    </html>
