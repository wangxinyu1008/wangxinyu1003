<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/9/30
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-1.12.4.js"></script>
</head>
<body>
<center>
<form action="/update" method="post">
<table border="1px" width="400px">
    <tr align="center"><td colspan="2"><h1>申报项目信息</h1></td></tr>
    <tr>
        <td width="150px">项目编号</td>
        <td><input hidden value="${id}" name="id">${id}</td>
    </tr>
    <tr>
        <td width="150px">项目名称</td>
        <td>${projectname}</td>
    </tr>
    <tr>
        <td width="150px">申报开始日期</td>
        <td>${startdate}</td>
    </tr>
    <tr>
        <td width="150px">申报结束日期</td>
        <td>${enddate}</td>
    </tr>
    <tr>
        <td width="150px">申报状态</td>
        <td><select name="status">
            <c:if test="${status.equals('已申报')}">
                <option value="0">已申报</option>
                <option value="1">审核中</option>
                <option value="2">已审核</option>
            </c:if>
            <c:if test="${status.equals('审核中')}">
                <option value="1">审核中</option>
                <option value="2">已审核</option>
            </c:if>
        </select> </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="审核" class="commit">
            <button class="fan">返回</button>
        </td>
    </tr>
</table>
</form>
</center>
<script>
    $(document).ready(function () {
        $(".fan").click(function () {
            location.href="/";
        })
    })
</script>
</body>
</html>
