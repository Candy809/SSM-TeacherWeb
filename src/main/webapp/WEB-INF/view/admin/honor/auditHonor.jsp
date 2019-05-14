<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.slxy.edu.model.Condition" %>
<%@ page import="com.slxy.edu.model.Honor" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>荣誉审核</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/bootstrap.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxPatentData.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/commonUse.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/JS/ajax/ajaxSelect.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/style.css">
</head>
<body>
<%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    List<Honor> honors = pageInfo.getList();
    Condition condition = (Condition) request.getAttribute("condition");
%>
<div class="table-main col-md-12">
    <div class="col-md-4" >
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">审核</a></li>
            <li class="active">荣誉审核</li>
        </ol>
    </div>
    <div class="row">
        <div class="col-md-11 col-md-offset-1 ">
            <table border="1" id="table" class="table table-striped table-bordered table-hover table-condensed">
                <tr class="info">
                    <th>编号</th>
                    <th>名称</th>
                    <th>第一完成人</th>
                    <th>第一完成单位</th>
                    <th>时间</th>
                    <th>授奖单位</th>
                    <th>等级</th>
                    <th>附件</th>
                </tr>
                <c:forEach items="${honors}" var="honors">
                    <tr>
                        <td><a href="${pageContext.request.contextPath}/honor/goDetail.do?hsn=${honors.hsn}">${honors.hsn}</a></td>
                        <td>${honors.hname}</td>
                        <td>${honors.tname}</td>
                        <td>${honors.department}</td>
                        <td>${honors.hdate}</td>
                        <td>${honors.hcompany}</td>
                        <td>${honors.hgrad}</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/file/download.do?model=honor&majorkey=${honors.hsn}&name=${honors.hname}" class="Download">查看附件</a>
                            <input type="hidden" class="accessoryPath" value="${honors.haccessory}"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <!--显示分页信息-->
            <div class="row">
                <!--点击分页-->
                <div>
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/honor/audit.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">首页</a></li>
                        <!--上一页-->
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/honor/audit.do?pn=${pageInfo.pageNum-1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </c:if>
                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/honor/audit.do?pn=1&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/honor/audit.do?pn=${page_num}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">${page_num}</a></li>
                            </c:if>
                        </c:forEach>
                        <!--下一页-->
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/honor/audit.do?pn=${pageInfo.pageNum+1}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </c:if>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/honor/audit.do?pn=${pageInfo.pages}&cname=<%=condition.getCname()%>
                            &dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>">尾页</a></li>
                    </ul>
                    <!--文字信息-->
                    <div class="form-group pull-right">
                        <span>当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页</span>
                        <input type="text" class="pageVal" style="width:100px;margin-top: 25px;">
                        <button type="submit" class="btn btn-default" style="margin-right: 20px" id="skipPage">GO</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //跳转到指定页码
    $(document).on("click","#skipPage",function () {
        //页码输入框输入的数
        var pageVal = $('.pageVal').val();
        //总页数
        var totalPage = $('#totalPage').val();
        if(pageVal > totalPage){
            alert('请输入正确的页码！');
            return
        }
        if(pageVal == ""){
            alert('页码不能为空！');
            return
        }
        if(!isNaN(pageVal)){
            window.location.href = "${pageContext.request.contextPath}/honor/audit.do?pn=" + pageVal + "&cname=<%=condition.getCname()%>\n" +
                "&dname=<%=condition.getDname()%>&starttime=<%=condition.getStarttime()%>&endtime=<%=condition.getEndtime()%>&tname=<%=condition.gettname()%>";
        }else {
            alert('请输入数字！')
        }
    })
</script>
</body>
</html>
