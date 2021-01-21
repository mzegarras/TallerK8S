

brew install --cask dotnet-sdk
dotnet --info



dotnet new webapi -o CustomerApi
cd CustomerApi
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.InMemory
code -r ../CustomerApi


https://localhost:5001/swagger/index.html