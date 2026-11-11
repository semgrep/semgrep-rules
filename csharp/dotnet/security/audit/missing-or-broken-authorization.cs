using Microsoft.AspNetCore.Mvc;

// ruleid: missing-or-broken-authorization
public class AtLeast21Controller : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[AllowAnonymous]
public class AtLeast21Controller : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(Roles = "LegalAdultGroup")]
public class AtLeast21Controller : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(Policy = "AtLeast21")]
public class AtLeast21Controller : Controller
{
    public IActionResult Index() => View();
}

// Existing plain authorization must remain accepted.
// ok: missing-or-broken-authorization
[Authorize]
public class DefaultAuthorizationController : Controller
{
    public IActionResult Index() => View();
}

// Regression for #3665: the exact reported attribute and an empty controller.
// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = "Basic")]
public class ExplicitBasicSchemeController : Controller
{
}

// The rule must not require a string literal or a hard-coded scheme name.
// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme)]
public class ConstantSchemeController : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = "Cookies,Bearer")]
public class MultipleSchemesController : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = "Cookies" + "," + "Bearer")]
public class ConcatenatedSchemesController : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(
    AuthenticationSchemes = "Bearer"
)]
public class MultilineSchemeController : Controller
{
    public IActionResult Index() => View();
}

// Preserve combined role/scheme declarations in either named-argument order.
// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = "Bearer", Roles = "Reviewer")]
public class SchemeThenRolesController : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(Roles = "Reviewer", AuthenticationSchemes = "Bearer")]
public class RolesThenSchemeController : Controller
{
    public IActionResult Index() => View();
}

// Preserve combined policy/scheme declarations in either named-argument order.
// ok: missing-or-broken-authorization
[Authorize(AuthenticationSchemes = "Bearer", Policy = "AtLeast21")]
public class SchemeThenPolicyController : Controller
{
    public IActionResult Index() => View();
}

// ok: missing-or-broken-authorization
[Authorize(Policy = "AtLeast21", AuthenticationSchemes = "Bearer")]
public class PolicyThenSchemeController : Controller
{
    public IActionResult Index() => View();
}

// Method-only authorization must not exempt a controller with an unprotected action.
// ruleid: missing-or-broken-authorization
public class PartiallyAuthorizedController : Controller
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    public IActionResult Restricted() => View();

    public IActionResult Unprotected() => View();
}

// An unrelated class attribute is not authorization.
// ruleid: missing-or-broken-authorization
[Produces("application/json")]
public class ProducesOnlyController : Controller
{
    public IActionResult Index() => View();
}

// A same-named field is not an Authorize attribute argument.
// ruleid: missing-or-broken-authorization
public class SchemeFieldOnlyController : Controller
{
    public const string AuthenticationSchemes = "Bearer";
    public IActionResult Index() => View();
}

// No class-level exemption may carry over to another controller in the same file.
// ruleid: missing-or-broken-authorization
public class UnannotatedNeighborController : Controller
{
    public IActionResult Index() => View();
}
