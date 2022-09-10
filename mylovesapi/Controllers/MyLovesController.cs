using Microsoft.AspNetCore.Mvc;
using mylovesapi.models;
using mylovesapi.repositories;

namespace mylovesapi.Controllers;

[ApiController]
[Route("[controller]")]
public class MyLovesController : ControllerBase
{
    public const string UnspecifiedStringValue = "Unspecified";

    public const string DefaultLastName = "Smith";

    [Route("dbconnectionstring", Name = "GetDbConnectionString")]
    [HttpGet]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]

    public string GetDbConnectionString() {
        return MyLovesRepository.dbConnectionString;
    }

    [Route("foodloves", Name = "GetFoodLoves")]
    [HttpGet]
    [ProducesResponseType(typeof(List<FoodLoveModel>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(string), StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> GetFoodLoves(string userLastName = DefaultLastName) {
        var myLovesRepository = new MyLovesRepository();
        var result =  await myLovesRepository.LoadFoodLoves(userLastName);

        return Ok(result);
    }

    [Route("foodloves", Name = "InsertFoodLoves")]
    [HttpPost]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(string), StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> InsertFoodLove(string foodName, string foodDetails, string foodUrl = UnspecifiedStringValue, string foodVendor = UnspecifiedStringValue, string foodVendorUrl = UnspecifiedStringValue) {
        var resultText = "Success";

        var foodLoveModel = new FoodLoveModel(foodName, foodDetails);
        foodLoveModel.foodUrl = foodUrl;
        foodLoveModel.foodVendor = foodVendor;
        foodLoveModel.foodVendorUrl = foodVendorUrl;

        var myLovesRepository = new MyLovesRepository();
        var rowsInserted = await myLovesRepository.AddFoodLove(foodLoveModel);

        return Ok(resultText);
    }
}
