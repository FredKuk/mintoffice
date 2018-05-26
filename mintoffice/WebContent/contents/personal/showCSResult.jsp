<%@page import="vo.Schedule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[    
<c:forEach items="${requestScope.result}" var="item" varStatus="status">
 <c:if test="${status.index > 0}">,</c:if>
{

"id":"${item.schedule_no}",
"title":"${item.schedule_title}",
"place":"${item.schedule_place}",
"start":"${item.schedule_start}",
"end":"${item.schedule_end}",
"contents":"${item.schedule_contents}",
"backgroundColor":"#1e90ff",
"borderColor":"#c0c0c0",
"kind":"${item.schedule_kind}"
}
</c:forEach>
]