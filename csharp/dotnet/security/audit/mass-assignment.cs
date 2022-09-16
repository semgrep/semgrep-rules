using Microsoft.AspNetCore.Mvc;

public IActionResult Create(UserModel model)
{
    context.SaveChanges();
    // ruleid: mass-assignment
    return View("Index", model);
}

public IActionResult Create([Bind(nameof(UserModel.Name))] UserModel model)
{
    context.SaveChanges();
    // ok: mass-assignment
    return View("Index", model);
}

[HttpGet("/")]
public IActionResult Index()
{
    // ok: mass-assignment
    return NoContent();
}
