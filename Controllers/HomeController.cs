using Microsoft.AspNetCore.Mvc;

namespace TP6_Elecciones.Controllers;

public class HomeController : Controller
{
    public void CargarViewBags()
    {
        ViewBag.ListarCandidatos=BD.ListarCandidatos;
        ViewBag.ListarPartidos=BD.ListarPartidos;        
    }
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult VerDetallePartido(int idPartido)
    {
        ViewBag.InfoPartido=BD.VerInfoPartido(idPartido);
        return View();
    }
    IActionResult VerDetalleCandidato(int idCandidato)
    {
        ViewBag.InfoCandidato = BD.VerInfoCandidato(idCandidato);
        return View();
    }
    IActionResult AgregarCandidato(int idPartido)
    {
        ViewBag.AgregarCandidato=BD.AgregarCandidato(idPartido);
        return View();
    }
    [HttpPost] IActionResult GuardarCandidato(Candidato can)
    {
        BD.ListarCandidatos(can);
        return View();
    }
    IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        ViewBag.EliminarCandidato=BD.EliminarCandidato(idCandidato);
        return View();
    }
    IActionResult Elecciones()
    {
        return View();
    }
    IActionResult Creditos()
    {
        return View();
    }
}
