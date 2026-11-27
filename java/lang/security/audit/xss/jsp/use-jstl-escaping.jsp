<!-- ruleid: use-jstl-escaping -->
<input value="${param.foo}" />
<!-- ok: use-jstl-escaping -->
<c:out value="${param.foo}" />
<!-- ok: use-jstl-escaping -->
<li> item <c:out value="${param.foo}"></li>
<!-- ok: use-jstl-escaping -->
<li> <c:out value="${param.foo}" /> </li>
<!-- ruleid: use-jstl-escaping -->
<li> ${param.foo} </li>
<!-- ruleid: use-jstl-escaping -->
<li> ${param.foo} <c:out value="${param.bar}" /> </li>

<div>
    <!-- this is the reason use-escapexml is the preferred rule. JSP allows dangling EL expressions -->
    ${param.foo}
</div>
