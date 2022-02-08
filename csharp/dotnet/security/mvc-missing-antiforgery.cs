using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MvcMovie.Models;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    //ruleid: mvc-missing-antiforgery
    [HttpPost]
    public IActionResult CreateBad(User user){
      CreateUser(user);
    }

    //ruleid: mvc-missing-antiforgery
    [HttpDelete]
    public IActionResult DeleteBad(User user){
      DeleteUser(user);
    }

    //ok: mvc-missing-antiforgery
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult CreateGood(User user){
      CreateUser(user);
    }
  
    //ok: mvc-missing-antiforgery
    [HttpPost]
    //strict type checking enforces CORS preflight for non-simple HTTP requests
    [Consumes("application/json")]
    public IActionResult CreateGood(User user){
      CreateUser(user);
    }

    //ok: mvc-missing-antiforgery
    [ValidateAntiForgeryToken]
    [HttpDelete]
    public IActionResult DeleteGood(User user){
      CreateUser(user);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
