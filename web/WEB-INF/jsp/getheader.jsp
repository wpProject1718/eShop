<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='css/thumbnail.css' >
</head>
<c:choose>
    <c:when test="${sessionScope.userid != null}">
        <c:choose>
            <c:when test="${sessionScope.type == 3}">
                <c:import url="../html/header_admin.html"/>
            </c:when>
            <c:when test="${sessionScope.type == 2}">
                <c:import url="../html/header_seller.html"/>
            </c:when>
            <c:when test="${sessionScope.type == 1}">
                <c:import url="../html/header_member.html"/>
            </c:when>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:import url="../html/header.html"/>
    </c:otherwise>
</c:choose>
