using Microsoft.AspNetCore.Mvc;

namespace TP6_Elecciones.Controllers;

public class HomeController : Controller
{
    /*hola*/
    public IActionResult Index()
    {
        ViewBag.ListarPartido = BD.ListarPartido();
        return View();
    }
    public IActionResult VerDetallePartido(int idPartido)
    {
        ViewBag.Partido = BD.VerInfoPartido(idPartido);
        ViewBag.CandidatosPartido = BD.ListarCandidatos(idPartido);
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
        ViewBag.IdPartido = idPartido;
        return View();
    }
    [HttpPost] IActionResult GuardarCandidato(Candidato can)
    {
        BD.AgregarCandidato(can);
        ViewBag.Partido = BD.VerInfoPartido(can.IdPartido);
        ViewBag.ListarCandidatos = BD.ListarCandidatos(can.IdPartido);
        return View("VerDetallePartido");
    }
    IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        ViewBag.EliminarCandidato=BD.EliminarCandidato(idCandidato);
        return View("VerDetallePartido");
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
