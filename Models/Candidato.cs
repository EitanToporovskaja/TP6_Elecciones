public class Candidato{
    public int IdCandidato {get; set;}
    public int IdPartido {get; set;}
    public string Apellido {get; set;}
    public string Nombre {get; set;}
    public DateTime FechaNacimiento {get; set;}
    public string Foto {get; set;}
    public string Postulacion {get; set;}
  public Candidato(int idpartid, string apellid, string nom, DateTime fechanacimient, string foto, string postu){
        IdPartido = idpartid;
        Apellido = apellid;
        Nombre = nom;
        FechaNacimiento = fechanacimient;
        Foto = foto;
        Postulacion = postu;
    }
}