using MySql.Data.MySqlClient;
using JeffExtensions;
using mylovesapi.models;

namespace mylovesapi.repositories;

public class MyLovesRepository
{
    // A connection string when running this service locally
    public static string localhostDbConnectionString = "Server=127.0.0.1;Port=3306;Database=myloves;Uid=root;Pwd=supersecret";

    // This connection string works when running as part of a container. The server name is "db" because that is what it is set to in docker-compose.yml.
    public static string dbConnectionString = "Server=db;Port=3306;Database=myloves;Uid=root;Pwd=supersecret";
    // host.docker.internal from https://stackoverflow.com/questions/53576485/system-net-sockets-socketexception-on-postgres-connection
    // Also 

    private const string ParamNameUserLastName = "@UserLastName";

    private const int ValueUserId = 1;

    private string SelectCommandFoodLoves = $@"
SELECT foodName, foodDetails, foodUrl, foodVendor, foodVendorUrl 
FROM userFoodLove ufl ";
    //INNER JOIN user u on u.userId = ufl.userId and u.lastName = {ParamNameUserLastName}";

    private string InsertCommandFoodLoves = $@"
INSERT INTO userFoodLove
(userId, foodName, foodDetails, foodUrl, foodVendor, foodVendorUrl)
VALUES
(@userId, @foodName, @foodDetails, @foodUrl, @foodVendor, @foodVendorUrl)
";

    public async Task<int> AddFoodLove(FoodLoveModel foodLoveModel) 
    {
        var result = 0;

        // create a SQL connection
        using (var connection = new MySqlConnection(dbConnectionString))
        {
            connection.Open();

            // run a SQL command on the open connection
            using (MySqlCommand sqlCommand = new MySqlCommand(InsertCommandFoodLoves, connection))
            {
                sqlCommand.CommandType = System.Data.CommandType.Text;

                sqlCommand.Parameters.AddWithValue("@userId", ValueUserId);
                sqlCommand.Parameters.AddWithValue("@foodName", foodLoveModel.foodName);
                sqlCommand.Parameters.AddWithValue("@foodDetails", foodLoveModel.foodDetails);
                sqlCommand.Parameters.AddWithValue("@foodUrl", foodLoveModel.foodUrl);
                sqlCommand.Parameters.AddWithValue("@foodVendor", foodLoveModel.foodVendor);
                sqlCommand.Parameters.AddWithValue("@foodVendorUrl", foodLoveModel.foodVendorUrl);

                result = sqlCommand.ExecuteNonQuery();
            }
        }

        return result;
    }

    public async Task<List<FoodLoveModel>> LoadFoodLoves(string userLastName)
    {
        var result = new List<FoodLoveModel>();

        // create a SQL connection
        using (var connection = new MySqlConnection(dbConnectionString))
        {
            connection.Open();

            // run a SQL command on the open connection
            using (MySqlCommand sqlCommand = new MySqlCommand(SelectCommandFoodLoves, connection))
            {
                //sqlCommand.Parameters.AddWithValue(ParamNameUserLastName, userLastName);

                using (var reader = await sqlCommand.ExecuteReaderAsync())
                {
                    while (reader.Read())
                    {
                        var foodLoveModel = new FoodLoveModel((string)reader.GetString(0), (string)reader.GetString(1));

                        foodLoveModel.foodUrl = reader.SafeGetString(2);
                        foodLoveModel.foodVendor = reader.SafeGetString(3);
                        foodLoveModel.foodVendorUrl = reader.SafeGetString(4);

                        result.Add(foodLoveModel);
                    }
                }
            }
        }

        return result;
    }

    private async Task<List<FoodLoveModel>> ReturnMockFoodLoves()
    {
        var result = new List<FoodLoveModel> ();
        
        var foodLoveModel = new FoodLoveModel("Choo Chee Salmon", "This is a delicious Yellow Curry Thai food dish with Salmon");
        foodLoveModel.foodVendor = "Thai Thani in Norwood, MA";
        foodLoveModel.foodUrl = "https://travelfoodatlas.com/choo-chee-curry-recipe";
        foodLoveModel.foodVendorUrl = "http://www.thaithanifood.com/";
        result.Add(foodLoveModel);

        return result;
    }
}