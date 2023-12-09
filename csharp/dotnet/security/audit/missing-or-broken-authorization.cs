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