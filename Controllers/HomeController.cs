﻿using Microsoft.AspNetCore.Mvc;

namespace TP6_Elecciones.Controllers;

public class HomeController : Controller
{
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
    public IActionResult VerDetalleCandidato(int idCandidato)
    {
        ViewBag.InfoCandidato = BD.VerInfoCandidato(idCandidato);
        return View();
    }
    public IActionResult AgregarCandidato(int idPartido)
    {
        ViewBag.IdPartido = idPartido;
        return View("AgregarCandidato", new Candidato{IdPartido=idPartido});
    }
    [HttpPost] IActionResult GuardarCandidato(Candidato can)
    {
        BD.AgregarCandidato(can);
        ViewBag.Partido = BD.VerInfoPartido(can.IdPartido);
        ViewBag.ListarCandidatos = BD.ListarCandidatos(can.IdPartido);
        return View("VerDetallePartido");
    }
    public IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        ViewBag.EliminarCandidato=BD.EliminarCandidato(idCandidato);
        return RedirectToAction("VerDetallePartido", new { idPartido=idPartido});
    }
    public IActionResult Elecciones()
    {
        return View();
    }
    public IActionResult Creditos()
    {
        return View();
    }
}
