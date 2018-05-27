<%@page import="vo.CommuteM"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach items="${requestScope.result}" var="item" varStatus="status">
	<c:if test="${status.index > 0}">,</c:if>
{
"month":${item.month},
"workDay":${item.workDay},
"goodDay":${item.goodDay},
"lateDay":${item.lateDay},
"earlyDay":${item.earlyDay},
"sickDay":${item.sickDay},
"overWork":${item.overWork}
}
</c:forEach>
]
