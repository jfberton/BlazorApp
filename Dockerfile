# Usar una imagen base de .NET 8 SDK para construir la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build

# Establecer el directorio de trabajo
WORKDIR /src

# Copiar el archivo de proyecto y restaurar las dependencias
COPY BlazorApp.csproj ./
RUN dotnet restore

# Copiar el resto de los archivos y construir la aplicación
COPY . ./
RUN dotnet publish -c Release -o /app/out

# Usar una imagen base de .NET 8 ASP.NET Core runtime para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Exponer el puerto 80
EXPOSE 80

# Definir el comando de inicio
ENTRYPOINT ["dotnet", "BlazorApp.dll"]
