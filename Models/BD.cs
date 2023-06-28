using System.Data.SqlClient;
using Dapper;

namespace TP6_Elecciones;
public class BD
{
    private static string _connectionString=@"Server=BD;DataBase=ELecciones2023;Trusted_Connection=True";
    private static List<Partido>_ListaPartido = new List<Partido>();
    private static List<Candidato>_ListaCandidato = new List<Candidato>();
    public static void AgregarCandidato(Candidato can)
    {
        string sql ="INSERT INTO Candidato(IdCandidato,IdPartido,Apellido,Nombre,FechaNaciemiento,Foto,Postulacion)VALUES(@cIdCandidato,@cIdPartido,@cApellido,@cNombre,@cFechaNaciemiento,@cFoto,@cPostulacion)";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(SQL, new {cIdCandidato = can.IdCandidato,cIdPartido = can.IdPartido,cApellido = can.Apellido, cNombre = can.Nombre, cFechaNaciemiento = can.FechaNaciemiento, cFoto = can.Foto, cPostulacion = can.Postulacion});
        }
    }
    public static void EliminarCandidato(int idCandidato)
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
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT Candidato FROM Partido WHERE Candidato = @pPartido";
            MiPartido= db.QueryFirstOrDefault<Partido>(sql,new {pPartido =Partido});
            }
        return Partido;
    }
    public static Candidato VerInfoCandidato(int idCandidato)
    {
         using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT Partido FROM Candidato WHERE Partido = @cCandidato";
            MiCandidato= db.QueryFirstOrDefault<Candidato>(sql,new {cCandidato =Candidato});
            }
        return Candidato;
    }
    public static List<Partido> ListarPartidos()
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Partido";
            _ListaPartido = db.Query<Partido>(sql).ToList();
        }
        return _ListaPartido;
    }
    public static List<Candidato> ListarCandidatos(int idPartidos)
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Candidato";
            _ListaCandidato = db.Query<Candidato>(sql).ToList();
        }
        return _ListaCandidato;
    }
}