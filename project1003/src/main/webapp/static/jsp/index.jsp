<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-1.12.4.js"></script>
</head>
<body>
    <form method="post" action="/index">
     <span style="margin-left: 300px">类型：<select name="status">
        <option value="3">全部</option>
         <option value="0">已申报</option>
         <option value="1">审核中</option>
         <option value="2">已审核</option>
     </select>&nbsp;&nbsp;&nbsp;</span>
        <input type="submit" value="查询">
    </form>
    <center>
    <table border="1px" width="800px">
        <tr align="center"><td colspan="6"><h1>申报项目列表</h1></td></tr>
        <tr style="text-align: center" id="shou">
            <td>项目编号</td>
            <td>项目名称</td>
            <td>申报开始日期</td>
            <td>申报结束日期</td>
            <td>申报状态</td>
            <td>操作</td>
        </tr>
        <c:if test="${pageInfo.list.size()>0}">
            <c:forEach items="${pageInfo.list}" var="item2">
        <form action="/shenhe" method="post">
                <tr style="text-align: center">
                    <td><input hidden value="${item2.id}" name="id">${item2.id}</td>
                    <td><input hidden value="${item2.projectname}" name="projectname">${item2.projectname}</td>
                    <td><input hidden value="<fmt:formatDate pattern="yyyy-MM-dd" value="${item2.startdate}" type="both"/>" name="startdate"><fmt:formatDate pattern="yyyy-MM-dd" value="${item2.startdate}" type="both"/></td>
                    <td><input hidden value="<fmt:formatDate pattern="yyyy-MM-dd" value="${item2.enddate}" type="both"/>" name="enddate"><fmt:formatDate pattern="yyyy-MM-dd" value="${item2.enddate}" type="both"/></td>
                    <td>
                    <c:if test="${item2.status==0}">
                        <input hidden value="已申报" name="status">已申报
                    </c:if>
                    <c:if test="${item2.status==1}">
                        <input hidden value="审核中" name="status">审核中
                    </c:if>
                    <c:if test="${item2.status==2}">
                        <input hidden value="已审核" name="status">已审核
                    </c:if>
                    </td>
                    <td>
                        <c:if test="${item2.status==0}">
                            <input type="submit" value="审核">
                        </c:if>
                        <c:if test="${item2.status==1}">
                            <input type="submit" value="审核">
                        </c:if>
                        <c:if test="${item2.status==2}">

                        </c:if>
                    </td>
                </tr>
        </form>
            </c:forEach>
        </c:if>

    </table>
        <div style="margin-left:250px;margin-top: 10px;">
            <a href="/?pageNum=${pageInfo.firstPage}">首页</a>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a href="/?pageNum=${pageInfo.prePage}">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a href="/?pageNum=${pageInfo.nextPage}">下一页</a>
            </c:if>
            <a href="/?pageNum=${pageInfo.lastPage}">末页</a>
            <span>第${pageInfo.pageNum}页/共${pageInfo.pages}页</span>
        </div>
</center>
</body>
</html>
