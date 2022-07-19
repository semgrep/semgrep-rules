using Microsoft.AspNetCore.Mvc;

// ruleid: mass-assignment
public IActionResult Create(UserModel model)
{
    context.SaveChanges();
    return View("Index", model);
}

// ok: mass-assignment
public IActionResult Create([Bind(nameof(UserModel.Name))] UserModel model)
{
    context.SaveChanges();
    return View("Index", model);
}