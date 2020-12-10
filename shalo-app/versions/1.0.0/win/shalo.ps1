#Requires -RunAsAdministrator
$instalarionPath = "$Env:Programfiles\Shalo"
New-Item -ItemType Directory -Path $instalarionPath -Force -Verbose
Set-Location -Path $instalarionPath
Get-ChildItem * -Recurse | Remove-Item
Invoke-WebRequest -Uri "https://salomonvargas.github.io/shalo-universe/shalo-app/shalo-app/versions/1.0.0/win/shalo.exe" -OutFile "$instalarionPath\shalo.exe"

if(! $env:Path -like "*$instalarionPath*"){
    $env:Path += ";$instalarionPath" 
}