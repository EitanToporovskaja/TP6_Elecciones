using Microsoft.AspNetCore.Mvc;

namespace TP6_Elecciones.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
