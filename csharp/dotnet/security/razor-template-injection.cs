using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RazorEngine;
using RazorEngine.Templating;

    namespace RazorVulnerableApp.Controllers
{
    public class HomeController : Controller
    {
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(string inert, string razorTpl)
        {
            // WARNING This code is vulnerable on purpose: do not use in production and do not take it as an example!
            // ruleid: razor-template-injection
            ViewBag.RenderedTemplate = Razor.Parse(razorTpl);
            ViewBag.Template = razorTpl;
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(string inter, string razorTpl)
        {
            var junk = someFunction(razorTpl);
            // WARNING This code is vulnerable on purpose: do not use in production and do not take it as an example!
            // ok: razor-template-injection
            ViewBag.RenderedTemplate = Razor.Parse(junk);
            ViewBag.Template = razorTpl;
            return View();
        }
    }
}