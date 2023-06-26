using Microsoft.AspNetCore.Mvc;

namespace TP6_Elecciones.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult VerDetallePartido(int idPartido)
    {

    }
    IActionResult VerDetalleCandidato(int idCandidato)
    {

    }
    IActionResult AgregarCandidato(int idPartido)
    {

    }
    [HttpPost] IActionResult GuardarCandidato(Candidato can)
    {

    }
    IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {

    }
    IActionResult Elecciones()
    {

    }
    IActionResult Creditos()
    {
        
    }
}
