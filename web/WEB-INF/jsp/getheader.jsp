<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' type='text/css' href='css/thumbnail.css' >
</head>
<c:choose>
    <c:when test="${sessionScope.userid != null}">
        <c:choose>
            <c:when test="${sessionScope.usertype == admin}">
                <c:import url="../html/header_admin.html"/>
            </c:when>
            <c:otherwise>
                <c:import url="../html/header_member.html"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:import url="../html/header.html"/>
    </c:otherwise>
</c:choose>
