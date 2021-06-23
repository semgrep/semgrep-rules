<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- ruleid: spring-jsp-eval -->
<spring:eval expression="${param.lang}" var="lang" />
<!-- ruleid: spring-jsp-eval -->
<spring:eval  var="languageIsFrench" expression="'${param.lang}'=='fr'"/>
<!-- ok: spring-jsp-eval -->
<c:set var="languageIsFrench" value="${param.lang == 'fr'}"/>
