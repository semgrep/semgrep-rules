<!-- ruleid: use-escapexml -->
<input value="${param.foo}" />
<!-- ok: use-escapexml -->
<input type="text" name="foo" value="${fn:escapeXml(param.foo)}" />

<div>
    <!-- ruleid: use-escapexml -->
    ${param.foo}
</div>
