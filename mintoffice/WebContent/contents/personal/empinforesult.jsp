<%@page import="vo.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="empsearch">
   <jsp:include page="empsearch.jsp"></jsp:include>
</div>
<table class="tbclass"
   style="margin-left: auto; margin-right: auto; width: 100%; height: 80%; overflow: auto">
   <thead style="height: 15%">
      <tr>
         <th>사번</th>
         <th>아이디</th>
         <th>이름</th>
         <th>부서명</th>
         <th>직급명</th>
         <th>대화명</th>
         <th>email</th>
         <th>입사일</th>
         <th>퇴사일</th>
      </tr>
   </thead>
<%System.out.println("1"); %>
   <c:set var="list" value="${requestScope.list}"/>
   <%System.out.println("2"); %>
   <c:if test="${empty list}">
      <%System.out.println("asdf"); %>
   </c:if>
   <c:forEach items="${list}" var="emp" >
      <tr>
         <td>${emp.emp_no}</td>
         <td>${emp.id}</td>
         <td>${emp.name}</td>
         <td>${emp.department.dep_name}</td>
         <td>${emp.position.position_name}</td>
         <td>${emp.email}</td>      <!-- 대화명 -->
         <td>${emp.join_date}</td>   <!-- 이메일 -->
         <td>${emp.retire_date}</td> <!-- 입사일 -->
         <td>${emp.msg}</td>  <!--  퇴사일 -->
      </tr>
   </c:forEach>
   </tbody>
</table>


<br>
   <table style="width: 100%">
      <tr>
         <td></td>
         <td><div
               style="display: inline-block; width: 250px; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
               <ul class="pagination">
                  <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
                  </li>
                  <li class="page-item active"><a class="page-link" href="#">1</a>
                  </li>
                  <li class=
                  "page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a>
                  </li>
               </ul>
            </div></td>
         <td></td>
      </tr>
   </table> 