namespace mylovesapi.models;

public class FoodLoveModel
{
    public FoodLoveModel(string foodName, string foodDetails) {
        this.foodName = foodName;
        this.foodDetails = foodDetails;
    }

    public string foodName { get; set; }
    public string foodDetails { get; set; }
    public string? foodUrl { get; set; }
    public string? foodVendor { get; set; }
    public string? foodVendorUrl { get; set; }

    //override public string ToString() => $"{foodName}, {foodDetails}";
}