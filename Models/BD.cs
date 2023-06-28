using System.Data.SqlClient;
using Dapper;

namespace TP6_Elecciones;
public class BD
{
    public static void AgregarCandidato(Candidato can)
    {
        
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
        
        return Partido;
    }
    public static Candidato VerInfoCandidato(int idCandidato)
    {
        return Candidato;
    }
    public static List<Partido> ListarPartidos()
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Partidos";
            _ListaPartidos = db.Query<Partido>(sql).ToList();
        }
        return;
    }
    public static List<Candidato> ListarCandidatos(int idPartidos)
    {
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="SELECT * FROM Candidato";
            _ListaPartidos = db.Query<Candidato>(sql).ToList();
        }
        return;
    }
}