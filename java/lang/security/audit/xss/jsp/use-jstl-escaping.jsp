<!-- ruleid: use-jstl-escaping -->
<input value="${param.foo}" />
<!-- ok: use-jstl-escaping -->
<c:out value="${param.foo}" />

<div>
    <!-- this is the reason use-escapexml is the preferred rule. JSP allows dangling EL expressions -->
    ${param.foo}
</div>
