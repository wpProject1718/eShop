<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.userid != null}">
        <c:choose>
            <c:when test="${sessionScope.type == 3}">
                <c:import url="../jsp/header_admin.jsp"/>
            </c:when>
            <c:when test="${sessionScope.type == 2}">
                <c:import url="../jsp/header_seller.jsp"/>
            </c:when>
            <c:when test="${sessionScope.type == 1}">
                <c:import url="../jsp/header_member.jsp"/>
            </c:when>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:import url="../jsp/header.jsp"/>
    </c:otherwise>
</c:choose>
