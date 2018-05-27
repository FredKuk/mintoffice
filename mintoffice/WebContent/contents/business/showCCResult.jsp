<%@page import="vo.Commute"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[    
<c:forEach items="${requestScope.result}" var="item" varStatus="status">
 <c:if test="${status.index > 0}">,</c:if>
{

"id":"${item.com_no}",
"com_late":"${item.com_late}",
"com_sick":"${item.com_sick}",
"start":"${item.com_start}",
"end":"${item.com_end}",
"sTime":"${item.com_sTime}",
"eTime":"${item.com_eTime}",
<c:choose>
	<c:when test="${item.com_sick eq '1'}">
		"title":"Illness",
		"backgroundColor":"#C0C0C0",
	</c:when>
	<c:when test="${item.com_early eq '1'}">
		"title":"Leave early",
		"backgroundColor":"#ffff4d",
	</c:when>
	<c:when test="${item.com_late eq '0'}">
		"title":"Good",
		"backgroundColor":"#00BFFF",
	</c:when>
	<c:when test="${item.com_late eq '1'}">	
		"title":"Late",
		"backgroundColor":"#FF3399",
	</c:when>
</c:choose>
"borderColor":"#c0c0c0"
}
</c:forEach>
]

<%-- 
<%@page import="vo.Commute"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[    
<c:forEach items="${requestScope.result}" var="item" varStatus="status">
 <c:if test="${status.index > 0}">,</c:if>
{

"id":"${item.com_no}",
"title":"commute",
"com_late":"${item.com_late}",
"com_sick":"${item.com_sick}",
"start":"${item.com_start}",
"end":"${item.com_end}",
"sTime":"${item.com_sTime}",
"eTime":"${item.com_eTime}",
"backgroundColor":"#00BFFF",
"borderColor":"#c0c0c0"
}
</c:forEach>
] --%>