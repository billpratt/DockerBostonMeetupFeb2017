#!bin/bash
set -e
dotnet restore
dotnet test test/WebApp.Test/project.json
rm -rf $(pwd)/publish/WebApp
dotnet publish src/WebApp/project.json -c release -o $(pwd)/publish/WebApp