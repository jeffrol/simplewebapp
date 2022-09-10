using mylovesapi.repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Set the db connection string to localhost only for dev environment
if (app.Environment.IsDevelopment())
{
    MyLovesRepository.dbConnectionString = MyLovesRepository.localhostDbConnectionString;
}

// Use swagger in development and production for this simple web application
app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
