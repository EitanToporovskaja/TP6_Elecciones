using System.Data.SqlClient;
using Dapper;

namespace TP6_Elecciones;
public class BD
{
    private static string _connectionString=@"Server=localhost;DataBase=Elecciones2023;Trusted_Connection=True";
    private static List<Partido>_ListarPartido = new List<Partido>();
    private static List<Candidato>_ListarCandidato = new List<Candidato>();
    public static void AgregarCandidato(Candidato can)
    {
        string sql ="INSERT INTO Candidato(IdCandidato,IdPartido,Apellido,Nombre,FechaNaciemiento,Foto,Postulacion)VALUES(@cIdCandidato,@cIdPartido,@cApellido,@cNombre,@cFechaNaciemiento,@cFoto,@cPostulacion)";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {cIdCandidato = can.IdCandidato,cIdPartido = can.IdPartido,cApellido = can.Apellido, cNombre = can.Nombre, cFechaNaciemiento = can.FechaNacimiento, cFoto = can.Foto, cPostulacion = can.Postulacion});
        }
    }
    public static int EliminarCandidato(int idCandidato)
    {
        int RegistrosEliminados = 0;
        string sql ="DELETE FROM Candidato WHERE Partido =@Candidato";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            RegistrosEliminados = db.Execute(sql, new {Candidato=idCandidato});
        }
        return RegistrosEliminados;
    }
    public static Partido VerInfoPartido(int idPartido)
    {
        Partido MiPartido;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT Candidato FROM Partido WHERE Candidato = @pPartido";
            MiPartido= db.QueryFirstOrDefault<Partido>(sql,new {pPartido =idPartido});
            }
        return MiPartido;
    }
    public static Candidato VerInfoCandidato(int idCandidato)
    {
        Candidato MiCandidato;
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT Partido FROM Candidato WHERE Partido = @cCandidato";
            MiCandidato= db.QueryFirstOrDefault<Candidato>(sql,new {cCandidato =idCandidato});
            }
        return MiCandidato;
    }
    public static List<Partido> ListarPartido()
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Partido";
            _ListarPartido = db.Query<Partido>(sql).ToList();
        }
        return _ListarPartido;
    }
    public static List<Candidato> ListarCandidatos(int idPartido)
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Candidato";
            _ListarCandidato = db.Query<Candidato>(sql).ToList();
        }
        return _ListarCandidato;
    }
}